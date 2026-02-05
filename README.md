
# College Bus Tracking and Management System

## 📌 Project Overview
The **College Bus Tracking and Management System** is a database-driven application developed using **Oracle SQL and PL/SQL**.  
It automates student transport management by handling bus routes, stops, transport pass allocation, fee calculation, daily transport logging, and administrative reporting — all enforced at the **database level**.

This project was developed as part of an **academic database systems project**.

---

## 🚍 Key Features
- Automatic transport pass generation on student registration
- Trigger-based fee calculation using distance and transport mode
- Seat availability validation for buses
- Daily transport logging (PICKED UP / DROPPED / ABSENT)
- Restrictions for ONEWAY vs TWOWAY transport
- Fee payment processing and renewal logic
- Admin dashboard with real-time statistics
- Entire business logic implemented using **PL/SQL**

---

## 🛠️ Technologies Used
- **Database:** Oracle  
- **Language:** SQL, PL/SQL  
- **Tool:** Oracle SQL Developer  

---

## 🗂️ Project Structure

---

## ⚙️ How to Run the Project
1. Open **Oracle SQL Developer**
2. Connect to your Oracle database
3. Run the files in this order:
   ```sql
   SET SERVEROUTPUT ON
   @database/ddl.sql
   @database/dml_demo.sql





