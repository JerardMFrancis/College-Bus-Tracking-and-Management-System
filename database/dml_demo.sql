

INSERT INTO drivers VALUES (1, 'Ravi Kumar', '9876543210', 40, 25000);
INSERT INTO drivers VALUES (2, 'Sunil Mehta', '9812345678', 35, 23000);
INSERT INTO drivers VALUES (3, 'Amit Roy', '9823456710', 45, 27000);
INSERT INTO drivers VALUES (4, 'Karan Patel', '9798765432', 38, 24000);
INSERT INTO drivers VALUES (5, 'Vinod Sharma', '9900123456', 42, 26000);
INSERT INTO drivers VALUES (6, 'Suresh Babu', '9845098450', 50, 28000);
INSERT INTO drivers VALUES (7, 'Manoj Das', '9731373137', 33, 22000);
INSERT INTO drivers VALUES (8, 'Rajesh Iyer', '9966996699', 44, 25500);
INSERT INTO drivers VALUES (9, 'Harish Rao', '9887888788', 39, 24500);
INSERT INTO drivers VALUES (10, 'Joseph Mathew', '9876078901', 36, 23500);

select * from drivers;

INSERT INTO buses VALUES (101, 'KL01AB1234', 40, 0, 1);
INSERT INTO buses VALUES (102, 'KL02CD5678', 35, 5, 2);
INSERT INTO buses VALUES (103, 'KL03EF9101', 50, 10, 3);
INSERT INTO buses VALUES (104, 'KL04GH2345', 45, 0, 4);
INSERT INTO buses VALUES (105, 'KL05IJ6789', 30, 15, 5);
INSERT INTO buses VALUES (106, 'KL06KL1122', 40, 0, 6);
INSERT INTO buses VALUES (107, 'KL07MN3344', 42, 7, 7);
INSERT INTO buses VALUES (108, 'KL08OP5566', 36, 19, 8);
INSERT INTO buses VALUES (109, 'KL09QR7788', 38, 4, 9);
INSERT INTO buses VALUES (110, 'KL10ST9900', 44, 25, 10);

SELECT * from buses;


INSERT INTO bus_routes VALUES (201, 'Thalassery Town',     TO_TIMESTAMP('07:10:AM', 'HH:MI:AM'), INTERVAL '00:50' HOUR TO MINUTE, 20, 101, 1);
INSERT INTO bus_routes VALUES (202, 'Payyannur Junction',  TO_TIMESTAMP('07:00:AM', 'HH:MI:AM'), INTERVAL '01:10' HOUR TO MINUTE, 30, 102, 2);
INSERT INTO bus_routes VALUES (203, 'Taliparamba Market',  TO_TIMESTAMP('06:50:AM', 'HH:MI:AM'), INTERVAL '00:45' HOUR TO MINUTE, 18, 103, 3);
INSERT INTO bus_routes VALUES (204, 'Pazhayangadi Bypass', TO_TIMESTAMP('07:20:AM', 'HH:MI:AM'), INTERVAL '01:00' HOUR TO MINUTE, 25, 104, 4);
INSERT INTO bus_routes VALUES (205, 'Kannur Railway Stn',  TO_TIMESTAMP('07:15:AM', 'HH:MI:AM'), INTERVAL '00:35' HOUR TO MINUTE, 15, 105, 5);
INSERT INTO bus_routes VALUES (206, 'Mattannur KSRTC',     TO_TIMESTAMP('06:45:AM', 'HH:MI:AM'), INTERVAL '01:15' HOUR TO MINUTE, 28, 106, 6);
INSERT INTO bus_routes VALUES (207, 'Koothuparamba Town',  TO_TIMESTAMP('07:05:AM', 'HH:MI:AM'), INTERVAL '00:40' HOUR TO MINUTE, 17, 107, 7);
INSERT INTO bus_routes VALUES (208, 'Therthally',          TO_TIMESTAMP('06:40:AM', 'HH:MI:AM'), INTERVAL '01:25' HOUR TO MINUTE, 33, 108, 8);
INSERT INTO bus_routes VALUES (209, 'Alakode',             TO_TIMESTAMP('06:30:AM', 'HH:MI:AM'), INTERVAL '01:30' HOUR TO MINUTE, 35, 109, 9);
INSERT INTO bus_routes VALUES (210, 'Cherupuzha',          TO_TIMESTAMP('06:25:AM', 'HH:MI:AM'), INTERVAL '01:40' HOUR TO MINUTE, 38, 110, 10);

INSERT INTO bus_routes VALUES (301,'Therthally',TO_TIMESTAMP('04:10:PM', 'HH:MI:PM'), INTERVAL '01:25' HOUR TO MINUTE, 33, 108,8);
INSERT INTO bus_routes VALUES (302,'Alakode',TO_TIMESTAMP('04:30:PM', 'HH:MI:PM'),INTERVAL '01:40' HOUR TO MINUTE,35,109,9);
INSERT INTO bus_routes VALUES (303,'Cherupuzha',TO_TIMESTAMP('05:00:PM', 'HH:MI:PM'),INTERVAL '01:55' HOUR TO MINUTE,38,110,10);
INSERT INTO bus_routes VALUES (304,'Taliparamba',TO_TIMESTAMP('04:45:PM', 'HH:MI:PM'),INTERVAL '01:30' HOUR TO MINUTE, 30,104,4);
INSERT INTO bus_routes VALUES (305,'Mattannur',TO_TIMESTAMP('04:15:PM', 'HH:MI:PM'),INTERVAL '01:20' HOUR TO MINUTE, 28,105,5);


SELECT * FROM BUS_ROUTES;


-- Route 201 - Thalassery Town
INSERT INTO bus_stops VALUES (401, 'AVK Hospital Stop',        'Thalassery', 2,  TO_TIMESTAMP('07:10 AM', 'HH:MI AM'), 201, 101);
INSERT INTO bus_stops VALUES (402, 'Kottayam Stop',            'Thalassery', 5,  TO_TIMESTAMP('07:15 AM', 'HH:MI AM'), 201, 101);
INSERT INTO bus_stops VALUES (403, 'Puthiyatheru Stop',        'Thalassery', 8,  TO_TIMESTAMP('07:20 AM', 'HH:MI AM'), 201, 101);
INSERT INTO bus_stops VALUES (404, 'Eranholi Stop',            'Thalassery', 10, TO_TIMESTAMP('07:25 AM', 'HH:MI AM'), 201, 101);
INSERT INTO bus_stops VALUES (405, 'College Gate Stop',        'Thalassery', 12, TO_TIMESTAMP('07:30 AM', 'HH:MI AM'), 201, 101);

-- Route 202 - Payyannur Junction
INSERT INTO bus_stops VALUES (406, 'New Bus Stand',            'Payyannur', 3,  TO_TIMESTAMP('07:00 AM', 'HH:MI AM'), 202, 102);
INSERT INTO bus_stops VALUES (407, 'Sreekandapuram Stop',      'Payyannur', 6,  TO_TIMESTAMP('07:05 AM', 'HH:MI AM'), 202, 102);
INSERT INTO bus_stops VALUES (408, 'Pilathara Stop',           'Payyannur', 9,  TO_TIMESTAMP('07:10 AM', 'HH:MI AM'), 202, 102);
INSERT INTO bus_stops VALUES (409, 'Vellur Stop',              'Payyannur', 12, TO_TIMESTAMP('07:15 AM', 'HH:MI AM'), 202, 102);
INSERT INTO bus_stops VALUES (410, 'Kuttiattoor Stop',         'Payyannur', 15, TO_TIMESTAMP('07:20 AM', 'HH:MI AM'), 202, 102);

-- Route 203 - Taliparamba Market
INSERT INTO bus_stops VALUES (411, 'Market Main Stop',         'Taliparamba', 2,  TO_TIMESTAMP('06:50 AM', 'HH:MI AM'), 203, 103);
INSERT INTO bus_stops VALUES (412, 'Kandamkulam Stop',         'Taliparamba', 4,  TO_TIMESTAMP('06:55 AM', 'HH:MI AM'), 203, 103);
INSERT INTO bus_stops VALUES (413, 'Kooveri Stop',             'Taliparamba', 6,  TO_TIMESTAMP('07:00 AM', 'HH:MI AM'), 203, 103);
INSERT INTO bus_stops VALUES (414, 'Paithalmala Stop',         'Taliparamba', 8,  TO_TIMESTAMP('07:05 AM', 'HH:MI AM'), 203, 103);
INSERT INTO bus_stops VALUES (415, 'Sreekandapuram Stop',      'Taliparamba', 10, TO_TIMESTAMP('07:10 AM', 'HH:MI AM'), 203, 103);

-- Route 204 - Pazhayangadi Bypass
INSERT INTO bus_stops VALUES (416, 'Bypass North Stop',        'Pazhayangadi', 2,  TO_TIMESTAMP('07:20 AM', 'HH:MI AM'), 204, 104);
INSERT INTO bus_stops VALUES (417, 'Kandankaly Stop',          'Pazhayangadi', 4,  TO_TIMESTAMP('07:25 AM', 'HH:MI AM'), 204, 104);
INSERT INTO bus_stops VALUES (418, 'Valapattanam Stop',        'Pazhayangadi', 6,  TO_TIMESTAMP('07:30 AM', 'HH:MI AM'), 204, 104);
INSERT INTO bus_stops VALUES (419, 'Parassinikadavu Stop',     'Pazhayangadi', 8,  TO_TIMESTAMP('07:35 AM', 'HH:MI AM'), 204, 104);
INSERT INTO bus_stops VALUES (420, 'Melechovva Stop',          'Pazhayangadi', 10, TO_TIMESTAMP('07:40 AM', 'HH:MI AM'), 204, 104);

-- Route 205 - Kannur Railway Stn
INSERT INTO bus_stops VALUES (421, 'Railway Gate Stop',        'Kannur', 1,  TO_TIMESTAMP('07:15 AM', 'HH:MI AM'), 205, 105);
INSERT INTO bus_stops VALUES (422, 'Thavakkara Stop',          'Kannur', 3,  TO_TIMESTAMP('07:18 AM', 'HH:MI AM'), 205, 105);
INSERT INTO bus_stops VALUES (423, 'Caltex Stop',              'Kannur', 5,  TO_TIMESTAMP('07:21 AM', 'HH:MI AM'), 205, 105);
INSERT INTO bus_stops VALUES (424, 'Chovva Stop',              'Kannur', 7,  TO_TIMESTAMP('07:24 AM', 'HH:MI AM'), 205, 105);
INSERT INTO bus_stops VALUES (425, 'Edakkad Stop',             'Kannur', 9,  TO_TIMESTAMP('07:27 AM', 'HH:MI AM'), 205, 105);

-- Route 206 - Mattannur KSRTC
INSERT INTO bus_stops VALUES (426, 'KSRTC Stand',              'Mattannur', 2,  TO_TIMESTAMP('06:45 AM', 'HH:MI AM'), 206, 106);
INSERT INTO bus_stops VALUES (427, 'Ulikkal Stop',             'Mattannur', 5,  TO_TIMESTAMP('06:50 AM', 'HH:MI AM'), 206, 106);
INSERT INTO bus_stops VALUES (428, 'Kunnathurpadi Stop',       'Mattannur', 8,  TO_TIMESTAMP('06:55 AM', 'HH:MI AM'), 206, 106);
INSERT INTO bus_stops VALUES (429, 'Mokeri Stop',              'Mattannur', 10, TO_TIMESTAMP('07:00 AM', 'HH:MI AM'), 206, 106);
INSERT INTO bus_stops VALUES (430, 'Thazhe Chovva Stop',       'Mattannur', 13, TO_TIMESTAMP('07:05 AM', 'HH:MI AM'), 206, 106);

-- Route 207 - Koothuparamba Town
INSERT INTO bus_stops VALUES (431, 'Town Bus Stand',           'Koothuparamba', 2,  TO_TIMESTAMP('07:05 AM', 'HH:MI AM'), 207, 107);
INSERT INTO bus_stops VALUES (432, 'Munderi Stop',             'Koothuparamba', 4,  TO_TIMESTAMP('07:10 AM', 'HH:MI AM'), 207, 107);
INSERT INTO bus_stops VALUES (433, 'Kuthuparamba East',        'Koothuparamba', 6,  TO_TIMESTAMP('07:15 AM', 'HH:MI AM'), 207, 107);
INSERT INTO bus_stops VALUES (434, 'Panoor Stop',              'Koothuparamba', 8,  TO_TIMESTAMP('07:20 AM', 'HH:MI AM'), 207, 107);
INSERT INTO bus_stops VALUES (435, 'Chittariparamba Stop',     'Koothuparamba', 10, TO_TIMESTAMP('07:25 AM', 'HH:MI AM'), 207, 107);

-- Route 208 - Therthally
INSERT INTO bus_stops VALUES (436, 'Main Town Stop',           'Therthally', 2,  TO_TIMESTAMP('06:40 AM', 'HH:MI AM'), 208, 108);
INSERT INTO bus_stops VALUES (437, 'Nadakkal Stop',            'Therthally', 5,  TO_TIMESTAMP('06:45 AM', 'HH:MI AM'), 208, 108);
INSERT INTO bus_stops VALUES (438, 'Pullurampara Stop',        'Therthally', 8,  TO_TIMESTAMP('06:50 AM', 'HH:MI AM'), 208, 108);
INSERT INTO bus_stops VALUES (439, 'Kondotty Stop',            'Therthally', 11, TO_TIMESTAMP('06:55 AM', 'HH:MI AM'), 208, 108);
INSERT INTO bus_stops VALUES (440, 'Mundakayam Stop',          'Therthally', 14, TO_TIMESTAMP('07:00 AM', 'HH:MI AM'), 208, 108);

-- Route 209 - Alakode
INSERT INTO bus_stops VALUES (441, 'Bus Stand Stop',           'Alakode', 2,  TO_TIMESTAMP('06:30 AM', 'HH:MI AM'), 209, 109);
INSERT INTO bus_stops VALUES (442, 'Eramam Stop',              'Alakode', 5,  TO_TIMESTAMP('06:35 AM', 'HH:MI AM'), 209, 109);
INSERT INTO bus_stops VALUES (443, 'Nediyenga Stop',           'Alakode', 9,  TO_TIMESTAMP('06:40 AM', 'HH:MI AM'), 209, 109);
INSERT INTO bus_stops VALUES (444, 'Kalichamaram Stop',        'Alakode', 13, TO_TIMESTAMP('06:45 AM', 'HH:MI AM'), 209, 109);
INSERT INTO bus_stops VALUES (445, 'Ayyankunnu Stop',          'Alakode', 16, TO_TIMESTAMP('06:50 AM', 'HH:MI AM'), 209, 109);

-- Route 210 - Cherupuzha
INSERT INTO bus_stops VALUES (446, 'Main Stop',                'Cherupuzha', 2,  TO_TIMESTAMP('06:25 AM', 'HH:MI AM'), 210, 110);
INSERT INTO bus_stops VALUES (447, 'Kakkayam Stop',            'Cherupuzha', 6,  TO_TIMESTAMP('06:30 AM', 'HH:MI AM'), 210, 110);
INSERT INTO bus_stops VALUES (448, 'Thalavady Stop',           'Cherupuzha', 10, TO_TIMESTAMP('06:35 AM', 'HH:MI AM'), 210, 110);
INSERT INTO bus_stops VALUES (449, 'Adur Stop',                'Cherupuzha', 13, TO_TIMESTAMP('06:40 AM', 'HH:MI AM'), 210, 110);
INSERT INTO bus_stops VALUES (450, 'Kottathala Stop',          'Cherupuzha', 17, TO_TIMESTAMP('06:45 AM', 'HH:MI AM'), 210, 110);




-- Route 301 - Therthally (Evening)
INSERT INTO bus_stops VALUES (501, 'Mundakayam Stop',     'Therthally', 14, TO_TIMESTAMP('04:10 PM', 'HH:MI PM'), 301, 108);
INSERT INTO bus_stops VALUES (502, 'Kondotty Stop',       'Therthally', 11, TO_TIMESTAMP('04:20 PM', 'HH:MI PM'), 301, 108);
INSERT INTO bus_stops VALUES (503, 'Pullurampara Stop',   'Therthally', 8,  TO_TIMESTAMP('04:30 PM', 'HH:MI PM'), 301, 108);
INSERT INTO bus_stops VALUES (504, 'Nadakkal Stop',       'Therthally', 5,  TO_TIMESTAMP('04:40 PM', 'HH:MI PM'), 301, 108);
INSERT INTO bus_stops VALUES (505, 'Main Town Stop',      'Therthally', 2,  TO_TIMESTAMP('04:50 PM', 'HH:MI PM'), 301, 108);

-- Route 302 - Alakode (Evening)
INSERT INTO bus_stops VALUES (506, 'Ayyankunnu Stop',     'Alakode', 16, TO_TIMESTAMP('04:30 PM', 'HH:MI PM'), 302, 109);
INSERT INTO bus_stops VALUES (507, 'Kalichamaram Stop',   'Alakode', 13, TO_TIMESTAMP('04:40 PM', 'HH:MI PM'), 302, 109);
INSERT INTO bus_stops VALUES (508, 'Nediyenga Stop',      'Alakode', 9,  TO_TIMESTAMP('04:50 PM', 'HH:MI PM'), 302, 109);
INSERT INTO bus_stops VALUES (509, 'Eramam Stop',         'Alakode', 5,  TO_TIMESTAMP('05:00 PM', 'HH:MI PM'), 302, 109);
INSERT INTO bus_stops VALUES (510, 'Bus Stand Stop',      'Alakode', 2,  TO_TIMESTAMP('05:10 PM', 'HH:MI PM'), 302, 109);

-- Route 303 - Cherupuzha (Evening)
INSERT INTO bus_stops VALUES (511, 'Kottathala Stop',     'Cherupuzha', 17, TO_TIMESTAMP('05:00 PM', 'HH:MI PM'), 303, 110);
INSERT INTO bus_stops VALUES (512, 'Adur Stop',           'Cherupuzha', 13, TO_TIMESTAMP('05:10 PM', 'HH:MI PM'), 303, 110);
INSERT INTO bus_stops VALUES (513, 'Thalavady Stop',      'Cherupuzha', 10, TO_TIMESTAMP('05:20 PM', 'HH:MI PM'), 303, 110);
INSERT INTO bus_stops VALUES (514, 'Kakkayam Stop',       'Cherupuzha', 6,  TO_TIMESTAMP('05:30 PM', 'HH:MI PM'), 303, 110);
INSERT INTO bus_stops VALUES (515, 'Main Stop',           'Cherupuzha', 2,  TO_TIMESTAMP('05:40 PM', 'HH:MI PM'), 303, 110);

-- Route 304 - Taliparamba (Evening)
INSERT INTO bus_stops VALUES (516, 'Sreekandapuram Stop', 'Taliparamba', 10, TO_TIMESTAMP('04:45 PM', 'HH:MI PM'), 304, 104);
INSERT INTO bus_stops VALUES (517, 'Paithalmala Stop',    'Taliparamba', 8,  TO_TIMESTAMP('04:55 PM', 'HH:MI PM'), 304, 104);
INSERT INTO bus_stops VALUES (518, 'Kooveri Stop',        'Taliparamba', 6,  TO_TIMESTAMP('05:05 PM', 'HH:MI PM'), 304, 104);
INSERT INTO bus_stops VALUES (519, 'Kandamkulam Stop',    'Taliparamba', 4,  TO_TIMESTAMP('05:15 PM', 'HH:MI PM'), 304, 104);
INSERT INTO bus_stops VALUES (520, 'Market Main Stop',    'Taliparamba', 2,  TO_TIMESTAMP('05:25 PM', 'HH:MI PM'), 304, 104);

-- Route 305 - Mattannur (Evening)
INSERT INTO bus_stops VALUES (521, 'Thazhe Chovva Stop',  'Mattannur', 13, TO_TIMESTAMP('04:15 PM', 'HH:MI PM'), 305, 105);
INSERT INTO bus_stops VALUES (522, 'Mokeri Stop',         'Mattannur', 10, TO_TIMESTAMP('04:25 PM', 'HH:MI PM'), 305, 105);
INSERT INTO bus_stops VALUES (523, 'Kunnathurpadi Stop',  'Mattannur', 8,  TO_TIMESTAMP('04:35 PM', 'HH:MI PM'), 305, 105);
INSERT INTO bus_stops VALUES (524, 'Ulikkal Stop',        'Mattannur', 5,  TO_TIMESTAMP('04:45 PM', 'HH:MI PM'), 305, 105);
INSERT INTO bus_stops VALUES (525, 'KSRTC Stand',         'Mattannur', 2,  TO_TIMESTAMP('04:55 PM', 'HH:MI PM'), 305, 105);


select * from BUS_STOPS;

INSERT INTO students VALUES (123201, 'Nisha T', '12B', '848, Cherupuzha', 'Cherupuzha', 420, 'ONEWAY');
INSERT INTO students VALUES (123202, 'Harsha P', '12A', '691, Alakode', 'Alakode', 402, 'ONEWAY');
INSERT INTO students VALUES (123203, 'Ajay K', '9A', '566, Alakode', 'Alakode', 413, 'ONEWAY');
INSERT INTO students VALUES (123204, 'Revathi V', '12B', '516, Mattannur', 'Mattannur', 419, 'ONEWAY');
INSERT INTO students VALUES (123205, 'Sneha S', '12B', '770, Kannur', 'Kannur', 417, 'ONEWAY');
INSERT INTO students VALUES (123206, 'Jishnu R', '11C', '345, Pazhayangadi', 'Pazhayangadi', 414, 'ONEWAY');
INSERT INTO students VALUES (123207, 'Diya N', '10A', '222, Taliparamba', 'Taliparamba', 415, 'ONEWAY');
INSERT INTO students VALUES (123208, 'Vishnu S', '9C', '999, Thalassery', 'Thalassery', 401, 'ONEWAY');
INSERT INTO students VALUES (123209, 'Neha B', '8B', '772, Koothuparamba', 'Koothuparamba', 407, 'ONEWAY');
INSERT INTO students VALUES (123210, 'Abin T', '12A', '122, Payyannur', 'Payyannur', 403, 'ONEWAY');
INSERT INTO students VALUES (123211, 'Gokul D', '10C', '421, Mattannur', 'Mattannur', 419, 'ONEWAY');
INSERT INTO students VALUES (123212, 'Arya J', '11A', '312, Alakode', 'Alakode', 413, 'ONEWAY');
INSERT INTO students VALUES (123213, 'Riya M', '9A', '581, Taliparamba', 'Taliparamba', 415, 'ONEWAY');
INSERT INTO students VALUES (123214, 'Kavya L', '12B', '441, Koothuparamba', 'Koothuparamba', 407, 'ONEWAY');
INSERT INTO students VALUES (123215, 'Anand P', '10B', '623, Kannur', 'Kannur', 417, 'ONEWAY');
INSERT INTO students VALUES (123216, 'Sandra K', '11C', '841, Cherupuzha', 'Cherupuzha', 420, 'ONEWAY');
INSERT INTO students VALUES (123217, 'Nandana G', '12A', '433, Alakode', 'Alakode', 402, 'ONEWAY');
INSERT INTO students VALUES (123218, 'Manu M', '9C', '118, Thalassery', 'Thalassery', 401, 'ONEWAY');
INSERT INTO students VALUES (123219, 'Jayasree T', '8A', '871, Pazhayangadi', 'Pazhayangadi', 414, 'ONEWAY');
INSERT INTO students VALUES (123220, 'Sreerag V', '11A', '569, Payyannur', 'Payyannur', 403, 'ONEWAY');
INSERT INTO students VALUES (123221, 'Dhanush K', '10B', '681, Mattannur', 'Mattannur', 419, 'ONEWAY');
INSERT INTO students VALUES (123222, 'Aryan R', '9B', '764, Koothuparamba', 'Koothuparamba', 407, 'ONEWAY');
INSERT INTO students VALUES (123223, 'Lekshmi M', '12A', '659, Kannur', 'Kannur', 417, 'ONEWAY');
INSERT INTO students VALUES (123224, 'Goutham P', '10C', '123, Taliparamba', 'Taliparamba', 415, 'ONEWAY');
INSERT INTO students VALUES (123225, 'Meera S', '11B', '342, Cherupuzha', 'Cherupuzha', 420, 'ONEWAY');




INSERT INTO students VALUES (123301, 'Kiran M', '9B', '725, Taliparamba', 'Taliparamba', 507, 'TWOWAY');
INSERT INTO students VALUES (123302, 'Athira K', '10A', '539, Therthally', 'Therthally', 504, 'TWOWAY');
INSERT INTO students VALUES (123303, 'Jithin N', '11A', '666, Koothuparamba', 'Koothuparamba', 511, 'TWOWAY');
INSERT INTO students VALUES (123304, 'Anjali S', '12B', '428, Kannur', 'Kannur', 512, 'TWOWAY');
INSERT INTO students VALUES (123305, 'Sandeep V', '8B', '472, Taliparamba', 'Taliparamba', 510, 'TWOWAY');
INSERT INTO students VALUES (123306, 'Rohith K', '11C', '398, Cherupuzha', 'Cherupuzha', 520, 'TWOWAY');
INSERT INTO students VALUES (123307, 'Aparna R', '9A', '281, Alakode', 'Alakode', 502, 'TWOWAY');
INSERT INTO students VALUES (123308, 'Deepak T', '10B', '659, Payyannur', 'Payyannur', 503, 'TWOWAY');
INSERT INTO students VALUES (123309, 'Krishna G', '12A', '578, Pazhayangadi', 'Pazhayangadi', 514, 'TWOWAY');
INSERT INTO students VALUES (123310, 'Haritha N', '11B', '616, Mattannur', 'Mattannur', 519, 'TWOWAY');
INSERT INTO students VALUES (123311, 'Aswin P', '8C', '721, Therthally', 'Therthally', 504, 'TWOWAY');
INSERT INTO students VALUES (123312, 'Snehal A', '10C', '464, Alakode', 'Alakode', 502, 'TWOWAY');
INSERT INTO students VALUES (123313, 'Divya J', '9A', '112, Cherupuzha', 'Cherupuzha', 520, 'TWOWAY');
INSERT INTO students VALUES (123314, 'Rahul V', '11A', '651, Kannur', 'Kannur', 512, 'TWOWAY');
INSERT INTO students VALUES (123315, 'Megha L', '12B', '528, Taliparamba', 'Taliparamba', 510, 'TWOWAY');
INSERT INTO students VALUES (123316, 'Abhiram S', '10A', '812, Mattannur', 'Mattannur', 519, 'TWOWAY');
INSERT INTO students VALUES (123317, 'Fathima H', '9B', '292, Koothuparamba', 'Koothuparamba', 511, 'TWOWAY');
INSERT INTO students VALUES (123318, 'Varsha P', '11C', '349, Alakode', 'Alakode', 502, 'TWOWAY');
INSERT INTO students VALUES (123319, 'Rakesh N', '10C', '730, Pazhayangadi', 'Pazhayangadi', 514, 'TWOWAY');
INSERT INTO students VALUES (123320, 'Anjana M', '12A', '367, Payyannur', 'Payyannur', 503, 'TWOWAY');


INSERT into STUDENTS VALUES(12310619,'Jerard M Francis','K23CH',
                'Madappamthottu(H), kannur','Kannur',421,'ONEWAY');


SELECT * FROM STUDENTS;


BEGIN
    log_transport_status(123201, 'PICKED UP');
    log_transport_status(123202, 'PICKED UP');
    log_transport_status(123203, 'PICKED UP');
    log_transport_status(123204, 'PICKED UP');
    log_transport_status(123205, 'PICKED UP');
    log_transport_status(123206, 'PICKED UP');
    log_transport_status(123207, 'PICKED UP');
    log_transport_status(123208, 'PICKED UP');
    log_transport_status(123209, 'PICKED UP');
    log_transport_status(123210, 'PICKED UP');
    log_transport_status(123211, 'PICKED UP');
    log_transport_status(123212, 'PICKED UP');
    log_transport_status(123213, 'PICKED UP');
    log_transport_status(123214, 'PICKED UP');
    log_transport_status(123215, 'PICKED UP');
    log_transport_status(123216, 'PICKED UP');
    log_transport_status(123217, 'PICKED UP');
    log_transport_status(123218, 'PICKED UP');
    log_transport_status(123219, 'PICKED UP');
    log_transport_status(123220, 'PICKED UP');
    log_transport_status(123221, 'PICKED UP');
    log_transport_status(123222, 'PICKED UP');
    log_transport_status(123223, 'PICKED UP');
    log_transport_status(123224, 'PICKED UP');
    log_transport_status(123225, 'PICKED UP');
END;
/

BEGIN
    log_transport_status(123301, 'PICKED UP');
    log_transport_status(123301, 'DROPPED');

    log_transport_status(123302, 'PICKED UP');
    log_transport_status(123302, 'DROPPED');

    log_transport_status(123303, 'PICKED UP');
    log_transport_status(123303, 'DROPPED');

    log_transport_status(123304, 'PICKED UP');
    log_transport_status(123304, 'DROPPED');

    log_transport_status(123305, 'PICKED UP');
    log_transport_status(123305, 'DROPPED');

    log_transport_status(123306, 'PICKED UP');
    log_transport_status(123306, 'DROPPED');

    log_transport_status(123307, 'PICKED UP');
    log_transport_status(123307, 'DROPPED');

    log_transport_status(123308, 'PICKED UP');
    log_transport_status(123308, 'DROPPED');

    log_transport_status(123309, 'PICKED UP');
    log_transport_status(123309, 'DROPPED');

    log_transport_status(123310, 'PICKED UP');
    log_transport_status(123310, 'DROPPED');

    log_transport_status(123311, 'PICKED UP');
    log_transport_status(123311, 'DROPPED');

    log_transport_status(123312, 'PICKED UP');
    log_transport_status(123312, 'DROPPED');

    log_transport_status(123313, 'PICKED UP');
    log_transport_status(123313, 'DROPPED');

    log_transport_status(123314, 'PICKED UP');
    log_transport_status(123314, 'DROPPED');
END;
/

BEGIN
    LOG_TRANSPORT_STATUS(12310619, 'Picked up');
END;


BEGIN
    LOG_TRANSPORT_STATUS(12310619, 'DROPPED');
END;


BEGIN
    log_transport_status(123315, 'ABSENT');
    log_transport_status(123316, 'ABSENT');
    log_transport_status(123317, 'ABSENT');
    log_transport_status(123318, 'ABSENT');
    log_transport_status(123319, 'ABSENT');
    log_transport_status(123320, 'ABSENT');
    log_transport_status(123321, 'ABSENT');
    log_transport_status(123322, 'ABSENT');
    log_transport_status(123323, 'ABSENT');
    log_transport_status(123324, 'ABSENT');
END;
/


-- pay_fee

BEGIN
    pay_fee(123301);
    pay_fee(123302);
    pay_fee(123303);
    pay_fee(123304);
    pay_fee(123305);
    pay_fee(123306);
    pay_fee(123307);
    pay_fee(123308);
    pay_fee(123309);
    pay_fee(123310);
    pay_fee(123311);
    pay_fee(123312);
    pay_fee(123313);
    pay_fee(123314);
    pay_fee(123315);
    pay_fee(123316);
    pay_fee(123317);
    pay_fee(123318);
    pay_fee(123319);
    pay_fee(123320);
END;
/

BEGIN
    PAY_FEE(12310619);
END;



BEGIN
    ADMIN_DASHBOARD;
    end;



-- get_pass_details

BEGIN
    get_pass_details(123301);
    get_pass_details(123302);
    get_pass_details(123303);
    get_pass_details(123304);
    get_pass_details(123305);
end;
/

BEGIN
   GET_PASS_DETAILS(12310619);
END;

-- renew_transport_pass
BEGIN
    renew_transport_pass(123301);
    renew_transport_pass(123302);
    renew_transport_pass(123303);
END;
/



BEGIN
   RENEW_TRANSPORT_PASS(12310619);
END;


-- TC01 Add new student


-- INSERT into STUDENTS VALUES(12310619,'Jerard M Francis','K23CH',
--                 'Madappamthottu(H), kannur','Kannur',421,'ONEWAY');
-- this is already inserted so not run this time


--TC02	Log transport status - PICKED UP


BEGIN
    LOG_TRANSPORT_STATUS(12310619, 'Picked up');
END;


-- TC03	Log transport status - ABSENT
BEGIN
    LOG_TRANSPORT_STATUS(12310619, 'Absent');
END;


-- TC04	Attempt PICKED UP after ABSENT


BEGIN
    LOG_TRANSPORT_STATUS(12310619, 'Absent');
END;


--TC05	Pay transport fee


BEGIN
    PAY_FEE(12310619);
END;

--TC07	Renew pass after fee payment


BEGIN
   RENEW_TRANSPORT_PASS(12310619);
END;
