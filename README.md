# Police Station Management System
# Description

This project is a relational database system designed for a police station to manage critical operations such as:

  1. Officer records
  2. Case tracking
  3. Criminal profiles
  4. Station details
  5. Crime types and logs

It enables structured storage, quick retrieval, and secure linking of information between cases, officers, and criminals. This system improves operational efficiency, supports investigations, and enforces data integrity through proper relational design.
🔐 User Management

User access is managed through MySQL roles and privileges:

  * Admins (DBA/IT): Full access to all tables, setup, and maintenance.

  * Duty Officers: Can log new cases and update records relevant to their role.

  * Investigators: Limited access to assigned cases and related data.

  * Each user account is managed securely using CREATE USER, GRANT, and REVOKE SQL commands.

How to Set Up

  * Ensure MySQL Server and MySQL Workbench are installed.

  * Open MySQL Workbench and connect to your local server.

  * Open the SQL script (police_station_db.sql) via File > Open SQL Script.

  * Execute the script (⚡ button) to create the database and tables.

  * The schema police_station_db will now be visible under the Schemas tab.
