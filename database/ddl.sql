
-- Project College Bus Tracking and Management




CREATE table students(student_id NUMBER PRIMARY key, 
        student_name VARCHAR2(50) not null, 
        class_section VARCHAR2(20) not null, 
        address VARCHAR2(100) not null,
        area VARCHAR2(50) not NULL, 
        stop_id NUMBER REFERENCES bus_stops(stop_code),
        transport_mode VARCHAR2(10) DEFAULT 'ONEWAY'
            CHECK (transport_mode IN ('ONEWAY', 'TWOWAY','oneway', 'twoway'))
);

CREATE TABLE drivers (
    driver_id NUMBER PRIMARY KEY,             -- Unique ID for each driver
    driver_name VARCHAR2(100) NOT NULL,       -- Full name of the driver
    contact_no VARCHAR2(15) NOT NULL,         -- Phone number
    age NUMBER CHECK (age >= 21),             -- Age (must be at least 21)
    salary NUMBER(10,2)                       -- Monthly salary with 2 decimal places
);

CREATE TABLE buses (
    bus_no NUMBER PRIMARY KEY,                     -- Unique Bus ID
    bus_reg_no VARCHAR2(20) NOT NULL,              -- Registration number (e.g., TN10AB1234)
    capacity NUMBER,                               -- Total number of seats
    occupancy NUMBER,                              -- Number of students currently assigned
    driver_id NUMBER REFERENCES drivers(driver_id)   -- FK to drivers
);

CREATE TABLE bus_routes (
    route_id NUMBER PRIMARY KEY,               -- Unique Route ID
    starting_area VARCHAR2(100) NOT NULL,      -- Starting location of the route
    starting_time TIMESTAMP NOT NULL,          -- When the bus leaves the starting point
    total_time INTERVAL DAY TO SECOND,         -- Total duration of the route
    total_distance NUMBER,                     -- Total distance in kilometers
    bus_no NUMBER REFERENCES buses(bus_no),    -- Link to buses table
    driver_id NUMBER REFERENCES drivers(driver_id)  -- Link to drivers table
);

CREATE TABLE bus_stops (
    stop_code NUMBER PRIMARY KEY,                   -- Unique stop ID/code
    stop_name VARCHAR2(100) NOT NULL,               -- Stop name 
    area VARCHAR2(100) not null,                             -- Area of the stop
    distance_to_school NUMBER not null,                      -- In kilometers
    pickup_time TIMESTAMP not null,                          -- Pickup time at this stop
    route_id NUMBER REFERENCES bus_routes(route_id),-- FK to route
    bus_no NUMBER REFERENCES buses(bus_no)          -- FK to bus
);

CREATE TABLE fee (
    fee_id NUMBER PRIMARY KEY,                             -- Unique fee entry ID
    student_id NUMBER REFERENCES students(student_id),     -- Who pays
    pass_id NUMBER REFERENCES transport_passes(pass_id),   -- For which pass
    route_id NUMBER REFERENCES bus_routes(route_id),       -- For which route
    amount NUMBER(10,2) NOT NULL,                          -- Fee amount
    paid_status VARCHAR2(10) CHECK (paid_status IN ('PAID', 'DUE')),  -- Payment status
    payment_date DATE                                      -- Date of payment (NULL if unpaid)
);

CREATE TABLE transport_passes (
    pass_id NUMBER PRIMARY KEY,
    student_id NUMBER REFERENCES students(student_id),
    route_id NUMBER REFERENCES bus_routes(route_id),
    stop_id NUMBER not NULL,
    bus_no NUMBER REFERENCES buses(bus_no),
    issue_date DATE DEFAULT SYSDATE,
    valid_until DATE,
    status VARCHAR2(20) DEFAULT 'ACTIVE' 
        CHECK (status IN ('ACTIVE', 'EXPIRED', 'CANCELLED')),
    transport_mode VARCHAR2(10)
        CHECK (transport_mode IN ('ONEWAY', 'TWOWAY','oneway', 'twoway'))
);

CREATE TABLE transport_log (
    log_id      NUMBER PRIMARY KEY,
    student_id  NUMBER REFERENCES students(student_id),
    pass_id     NUMBER REFERENCES transport_passes(pass_id),
    bus_no      NUMBER REFERENCES buses(bus_no),
    route_id    NUMBER REFERENCES bus_routes(route_id),
    log_date    DATE DEFAULT SYSDATE,
    status      VARCHAR2(20)  -- 'PICKED UP' or 'DROPPED'
);


---------------------------------------------------------------

CREATE SEQUENCE seq_pass_id
START WITH 1001
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE seq_fee_id
START WITH 2001
INCREMENT BY 1
NOCACHE;

-------------------------------------------------------




------------------------------------------------------------------

CREATE OR REPLACE TRIGGER trg_auto_assign_pass_and_fee
AFTER INSERT ON students
FOR EACH ROW
DECLARE
    v_route_id     bus_routes.route_id%TYPE;
    v_bus_no       buses.bus_no%TYPE;
    v_pass_id      NUMBER;
    v_fee_id       NUMBER;
    v_distance     NUMBER;
    v_amount       NUMBER;
    v_capacity     NUMBER;
    v_occupancy    NUMBER;
    v_mode         VARCHAR2(10);
    v_pickup_time  VARCHAR2(20);
    v_stop_name  VARCHAR2(100);
    v_bus_reg_no   buses.bus_reg_no%TYPE;
    v_driver_name  drivers.driver_name%TYPE;

BEGIN
    -- Step 1: Get route and bus from bus_stops using stop_id
    SELECT route_id, bus_no
    INTO v_route_id, v_bus_no
    FROM bus_stops
    WHERE stop_code = :NEW.stop_id;

    -- Step 2: Get bus capacity and occupancy
    SELECT capacity, occupancy
    INTO v_capacity, v_occupancy
    FROM buses
    WHERE bus_no = v_bus_no;

    -- Step 2.1: Get bus_reg_no and driver_name
    SELECT b.bus_reg_no, d.driver_name
        INTO v_bus_reg_no, v_driver_name
        FROM buses b
        JOIN drivers d ON b.driver_id = d.driver_id
        WHERE b.bus_no = v_bus_no;


    -- Step 3: Check if seat is available
    IF v_occupancy < v_capacity THEN
        -- Step 4: Generate pass_id from sequence
        v_pass_id := seq_pass_id.NEXTVAL;

        -- Step 5: Insert into transport_passes
        INSERT INTO transport_passes (
            pass_id,
            student_id,
            route_id,
            stop_id,
            bus_no,
            issue_date,
            valid_until,
            status,
            transport_mode
        ) VALUES (
            v_pass_id,
            :NEW.student_id,
            v_route_id,
            :NEW.stop_id,
            v_bus_no,
            SYSDATE,
            SYSDATE + 30,
            'ACTIVE',
            :NEW.transport_mode
        );

        DBMS_OUTPUT.PUT_LINE('Transport pass created: Pass ID = ' || v_pass_id || ', Student ID = ' || :NEW.student_id);

        -- Step 6: Update bus occupancy
        UPDATE buses
        SET occupancy = occupancy + 1
        WHERE bus_no = v_bus_no;

        -- Step 7: Get distance to school from stop
        SELECT distance_to_school
        INTO v_distance
        FROM bus_stops
        WHERE stop_code = :NEW.stop_id;

        -- Step 8: Decide fee based on mode (₹3/km/day for one-way, ₹6/km/day for two-way, for 30 days)
        v_mode := UPPER(:NEW.transport_mode);
        IF v_mode = 'TWOWAY' THEN
                v_amount := GREATEST(500, v_distance * 6 * 30);  -- ₹6/km/day × 30 days
        ELSE
            v_amount := GREATEST(500, v_distance * 3 * 30);  -- ₹3/km/day × 30 days
        END IF;


        -- Step 9: Generate fee_id from sequence
        v_fee_id := seq_fee_id.NEXTVAL;

        -- Step 10: Insert into fee table
        INSERT INTO fee (
            fee_id,
            student_id,
            pass_id,
            route_id,
            amount,
            paid_status,
            payment_date
        ) VALUES (
            v_fee_id,
            :NEW.student_id,
            v_pass_id,
            v_route_id,
            v_amount,
            'DUE',
            NULL
        );
        -- Step 11: Get pickup time and stop name
        SELECT TO_CHAR(pickup_time, 'HH:MI AM'),
            stop_name
            INTO v_pickup_time, v_stop_name
            FROM bus_stops
            WHERE stop_code = :NEW.stop_id;

        -- Final messages
        DBMS_OUTPUT.PUT_LINE(' Fee ₹' || v_amount || ' generated (' || v_mode || ', Fee ID: ' || v_fee_id || ')');
        DBMS_OUTPUT.PUT_LINE('Your bus timing is ' || v_pickup_time || ' from stop: ' || v_stop_name || '.');
        DBMS_OUTPUT.PUT_LINE('Bus No: ' || v_bus_no || ' | Reg No: ' || v_bus_reg_no);
        DBMS_OUTPUT.PUT_LINE('Driver: ' || v_driver_name);


    ELSE
        DBMS_OUTPUT.PUT_LINE('Bus ' || v_bus_no || ' is full. No pass assigned to student ' || :NEW.student_id);
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Missing stop, route, or bus info for student ' || :NEW.student_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Trigger error: ' || SQLERRM);
END;
/


-----------------------------------------------------


---------------------------------------

CREATE SEQUENCE seq_log_id
START WITH 3001 INCREMENT BY 1 
NOCACHE;

-------------------------------------------


------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE log_transport_status (
    p_student_id   IN students.student_id%TYPE,
    p_status       IN VARCHAR2  -- 'PICKED UP', 'DROPPED', or 'ABSENT'
) IS
    v_pass_id        transport_passes.pass_id%TYPE;
    v_bus_no         buses.bus_no%TYPE;
    v_route_id       bus_routes.route_id%TYPE;
    v_transport_mode transport_passes.transport_mode%TYPE;
    v_log_id         NUMBER;
    v_count          NUMBER;
BEGIN
    -- Step 1: If status is ABSENT, log it and block further logs for the day
    IF UPPER(p_status) = 'ABSENT' THEN
        -- Check if already marked absent today
        SELECT COUNT(*) INTO v_count
        FROM transport_log
        WHERE student_id = p_student_id
          AND status = 'ABSENT'
          AND TRUNC(log_date) = TRUNC(SYSDATE);

        IF v_count > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Student ' || p_student_id || ' already marked ABSENT today.');
            RETURN;
        END IF;

        -- Insert ABSENT log
        v_log_id := seq_log_id.NEXTVAL;

        INSERT INTO transport_log (
            log_id, student_id, pass_id, bus_no, route_id, log_date, status
        )
        VALUES (
            v_log_id, p_student_id, NULL, NULL, NULL, SYSDATE, 'ABSENT'
        );

        DBMS_OUTPUT.PUT_LINE('Student ' || p_student_id || ' marked as ABSENT (Log ID: ' || v_log_id || ')');
        RETURN;
    END IF;

    -- Step 2: Block PICKED UP / DROPPED if already marked ABSENT
    SELECT COUNT(*) INTO v_count
    FROM transport_log
    WHERE student_id = p_student_id
      AND status = 'ABSENT'
      AND TRUNC(log_date) = TRUNC(SYSDATE);

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Cannot log ' || p_status || ' — student ' || p_student_id || ' is marked ABSENT today.');
        RETURN;
    END IF;

    -- Step 3: Get active pass
    SELECT pass_id, bus_no, route_id, transport_mode
    INTO v_pass_id, v_bus_no, v_route_id, v_transport_mode
    FROM transport_passes
    WHERE student_id = p_student_id AND status = 'ACTIVE';

    -- Step 4: Block DROPPED for ONEWAY
    IF UPPER(v_transport_mode) = 'ONEWAY' AND UPPER(p_status) = 'DROPPED' THEN
        DBMS_OUTPUT.PUT_LINE('DROPPED not allowed for ONEWAY transport (Student ID: ' || p_student_id || ')');
        RETURN;
    END IF;

    -- Step 5: Prevent duplicate logs for same status today
    SELECT COUNT(*) INTO v_count
    FROM transport_log
    WHERE student_id = p_student_id
      AND status = UPPER(p_status)
      AND TRUNC(log_date) = TRUNC(SYSDATE);

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Already marked as ' || UPPER(p_status) || ' today (Student ID: ' || p_student_id || ')');
        RETURN;
    END IF;

    -- Step 6: Insert the log
    v_log_id := seq_log_id.NEXTVAL;

    INSERT INTO transport_log (
        log_id, student_id, pass_id, bus_no, route_id, log_date, status
    )
    VALUES (
        v_log_id, p_student_id, v_pass_id, v_bus_no, v_route_id, SYSDATE, UPPER(p_status)
    );

    DBMS_OUTPUT.PUT_LINE(UPPER(p_status) || ' marked for Student ' || p_student_id || ' (Log ID: ' || v_log_id || ')');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No active pass found for student ' || p_student_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

----------------------------------------------------------------------------


--------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE pay_fee (
    p_student_id IN students.student_id%TYPE
) IS
    v_fee_id     fee.fee_id%TYPE;
    v_amount     fee.amount%TYPE;
BEGIN
    -- Find the latest unpaid fee for the student
    SELECT fee_id, amount
    INTO v_fee_id, v_amount
    FROM fee
    WHERE student_id = p_student_id AND paid_status = 'DUE'
    ORDER BY fee_id DESC FETCH FIRST 1 ROWS ONLY;

    -- Mark the fee as paid
    UPDATE fee
    SET paid_status = 'PAID',
        payment_date = SYSDATE
    WHERE fee_id = v_fee_id;

    DBMS_OUTPUT.PUT_LINE('Fee of ₹' || v_amount || ' has been paid (Fee ID: ' || v_fee_id || ')');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No unpaid fee found for student ' || p_student_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error while processing fee: ' || SQLERRM);
END;
/


------------------------------------------


---------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE admin_dashboard IS
    v_total_students        NUMBER;
    v_total_buses           NUMBER;
    v_total_routes          NUMBER;
    v_active_passes         NUMBER;
    v_total_fee_collected   NUMBER;
    v_due_fee_count         NUMBER;
BEGIN
    -- Basic counts
    SELECT COUNT(*) INTO v_total_students FROM students;
    SELECT COUNT(*) INTO v_total_buses FROM buses;
    SELECT COUNT(*) INTO v_total_routes FROM bus_routes;
    SELECT COUNT(*) INTO v_active_passes FROM transport_passes WHERE status = 'ACTIVE';

    -- Fee stats
    SELECT NVL(SUM(amount), 0) INTO v_total_fee_collected
    FROM fee WHERE paid_status = 'PAID';

    SELECT COUNT(*) INTO v_due_fee_count
    FROM fee WHERE paid_status = 'DUE';

    -- Output summary
    DBMS_OUTPUT.PUT_LINE('=====================');
    DBMS_OUTPUT.PUT_LINE('TRANSPORT DASHBOARD');
    DBMS_OUTPUT.PUT_LINE('=====================');
    DBMS_OUTPUT.PUT_LINE('Total Students       : ' || v_total_students);
    DBMS_OUTPUT.PUT_LINE('Total Buses           : ' || v_total_buses);
    DBMS_OUTPUT.PUT_LINE('Total Routes          : ' || v_total_routes);
    DBMS_OUTPUT.PUT_LINE('Active Transport Passes: ' || v_active_passes);
    DBMS_OUTPUT.PUT_LINE('Total Fee Collected   : ₹' || v_total_fee_collected);
    DBMS_OUTPUT.PUT_LINE('Pending Fee Payments  : ' || v_due_fee_count);
    DBMS_OUTPUT.PUT_LINE('=====================');

    -- Optional: Show occupancy per bus
    DBMS_OUTPUT.PUT_LINE('BUS OCCUPANCY STATUS');
    FOR rec IN (
        SELECT bus_no, capacity, occupancy
        FROM buses
        ORDER BY bus_no
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('   Bus ' || rec.bus_no || ': ' || rec.occupancy || '/' || rec.capacity || ' occupied');
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('=====================');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Dashboard Error: ' || SQLERRM);
END;
/

------------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------

CREATE OR REPLACE PROCEDURE get_pass_details (
    p_student_id IN students.student_id%TYPE
) IS
    v_name           students.STUDENT_NAME%TYPE;
    v_bus_no         buses.bus_no%TYPE;
    v_route_id       bus_routes.route_id%TYPE;
    v_start_time     bus_routes.starting_time%TYPE;
    v_stop_name      bus_stops.stop_name%TYPE;
    v_amount         fee.amount%TYPE;
    v_status         fee.paid_status%TYPE;
    v_issue_date     transport_passes.issue_date%TYPE;
    v_valid_until    transport_passes.valid_until%TYPE;
    v_transport_mode transport_passes.transport_mode%TYPE;
BEGIN
    -- Fetch all details using JOIN-like logic (via SELECT)
    SELECT s.student_name,
           tp.bus_no,
           tp.route_id,
           br.starting_time,
           bs.stop_name,
           f.amount,
           f.paid_status,
           tp.issue_date,
           tp.valid_until,
           tp.transport_mode
    INTO
           v_name,
           v_bus_no,
           v_route_id,
           v_start_time,
           v_stop_name,
           v_amount,
           v_status,
           v_issue_date,
           v_valid_until,
           v_transport_mode
    FROM students s
    JOIN transport_passes tp ON s.student_id = tp.student_id
    JOIN bus_routes br ON tp.route_id = br.route_id
    JOIN bus_stops bs ON tp.stop_id = bs.stop_code
    JOIN fee f ON f.student_id = s.student_id
    WHERE s.student_id = p_student_id
      AND tp.status = 'ACTIVE'
      AND f.paid_status IN ('PAID', 'DUE')
      AND ROWNUM = 1;

    -- Output the result
    DBMS_OUTPUT.PUT_LINE('Transport Pass Details for Student ID: ' || p_student_id);
    DBMS_OUTPUT.PUT_LINE('Name             : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Bus No.          : ' || v_bus_no);
    DBMS_OUTPUT.PUT_LINE('Route ID         : ' || v_route_id);
    DBMS_OUTPUT.PUT_LINE('Starting Time    : ' || TO_CHAR(v_start_time, 'HH24:MI'));
    DBMS_OUTPUT.PUT_LINE('Stop Name        : ' || v_stop_name);
    DBMS_OUTPUT.PUT_LINE('Transport Mode   : ' || v_transport_mode);
    DBMS_OUTPUT.PUT_LINE('Valid From       : ' || TO_CHAR(v_issue_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Valid Until      : ' || TO_CHAR(v_valid_until, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Fee Amount       : ₹' || v_amount);
    DBMS_OUTPUT.PUT_LINE('Fee Status       : ' || v_status);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No active pass or fee record found for Student ID: ' || p_student_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


-------------------------------------------------------------------------------


---------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE renew_transport_pass (
    p_student_id IN students.student_id%TYPE
) IS
    v_pass_id        transport_passes.pass_id%TYPE;
    v_valid_until    DATE;
    v_stop_id        transport_passes.stop_id%TYPE;
    v_route_id       transport_passes.route_id%TYPE;
    v_distance       bus_stops.distance_to_school%TYPE;
    v_fee_amount     NUMBER;
    v_fee_id         fee.fee_id%TYPE;
    v_mode           transport_passes.transport_mode%TYPE;
    v_last_fee_status fee.paid_status%TYPE;
BEGIN
    -- 1. Get latest fee status for student
    SELECT paid_status
    INTO v_last_fee_status
    FROM fee
    WHERE student_id = p_student_id
    ORDER BY fee_id DESC
    FETCH FIRST 1 ROWS ONLY;

    -- 2. Check if last fee is PAID
    IF v_last_fee_status != 'PAID' THEN
        DBMS_OUTPUT.PUT_LINE('Last fee is not paid. Renewal denied for Student ID ' || p_student_id);
        RETURN;
    END IF;

    -- 3. Get active pass info
    SELECT pass_id, valid_until, stop_id, route_id, transport_mode
    INTO v_pass_id, v_valid_until, v_stop_id, v_route_id, v_mode
    FROM transport_passes
    WHERE student_id = p_student_id
      AND status = 'ACTIVE';

    -- 4. Update valid_until by 1 month
    UPDATE transport_passes
    SET valid_until = ADD_MONTHS(valid_until, 1)
    WHERE pass_id = v_pass_id;

    -- 5. Get distance to school
    SELECT distance_to_school INTO v_distance
    FROM bus_stops
    WHERE stop_code = v_stop_id;

    -- 6. Calculate fee: ₹5/km; double if TWOWAY
    IF UPPER(v_mode) = 'TWOWAY' THEN
        v_fee_amount := GREATEST(500, v_distance * 6 * 30);
    ELSE
        v_fee_amount := GREATEST(500, v_distance * 3 * 30);
    END IF;

    -- 7. Generate fee_id from sequence
    SELECT seq_fee_id.NEXTVAL INTO v_fee_id FROM dual;

    -- 8. Insert new fee row
    INSERT INTO fee (
        fee_id, student_id, pass_id, route_id, amount, paid_status, payment_date
    ) VALUES (
        v_fee_id, p_student_id, v_pass_id, v_route_id, v_fee_amount, 'DUE', NULL
    );

    -- 9. Output confirmation
    DBMS_OUTPUT.PUT_LINE('Transport pass renewed for Student ID: ' || p_student_id);
    DBMS_OUTPUT.PUT_LINE('New Valid Until : ' || TO_CHAR(ADD_MONTHS(v_valid_until, 1), 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('New Fee Amount  : ₹' || v_fee_amount);
    DBMS_OUTPUT.PUT_LINE('Transport Mode  : ' || v_mode);
    DBMS_OUTPUT.PUT_LINE('Fee ID          : ' || v_fee_id);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No active pass or fee found for Student ID ' || p_student_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


-------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

