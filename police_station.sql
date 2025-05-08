-- police_station.sql
-- Database: Police Station Management System

-- Drop tables if they already exist (to avoid conflicts when re-running)
DROP TABLE IF EXISTS Witness, Arrest, Evidence, CaseCriminal, Complaint, CaseRecord, Criminal, Officer, Asset, PoliceStation;

-- Create Police Stations
CREATE TABLE PoliceStation (
    station_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    contact_number VARCHAR(20) UNIQUE NOT NULL
);

-- Create Officers
CREATE TABLE Officer (
    officer_id INT PRIMARY KEY AUTO_INCREMENT,
    station_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    `rank` VARCHAR(50),
    badge_number VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    FOREIGN KEY (station_id) REFERENCES PoliceStation(station_id)
);


-- Create Criminals
CREATE TABLE Criminal (
    criminal_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    dob DATE,
    crime_history TEXT
);

-- Create Cases
CREATE TABLE CaseRecord (
    case_id INT PRIMARY KEY AUTO_INCREMENT,
    officer_id INT NOT NULL,
    description TEXT,
    status VARCHAR(50),
    date_filed DATE,
    FOREIGN KEY (officer_id) REFERENCES Officer(officer_id)
);

-- Complaints that may be linked to a Case
CREATE TABLE Complaint (
    complaint_id INT PRIMARY KEY AUTO_INCREMENT,
    complainant_name VARCHAR(100),
    description TEXT,
    date_reported DATE,
    case_id INT,
    FOREIGN KEY (case_id) REFERENCES CaseRecord(case_id)
);

-- Many-to-Many relationship between Cases and Criminals
CREATE TABLE CaseCriminal (
    case_id INT NOT NULL,
    criminal_id INT NOT NULL,
    PRIMARY KEY (case_id, criminal_id),
    FOREIGN KEY (case_id) REFERENCES CaseRecord(case_id),
    FOREIGN KEY (criminal_id) REFERENCES Criminal(criminal_id)
);

-- Evidences per Case
CREATE TABLE Evidence (
    evidence_id INT PRIMARY KEY AUTO_INCREMENT,
    case_id INT NOT NULL,
    description TEXT,
    collected_date DATE,
    FOREIGN KEY (case_id) REFERENCES CaseRecord(case_id)
);

-- Arrest Records
CREATE TABLE Arrest (
    arrest_id INT PRIMARY KEY AUTO_INCREMENT,
    criminal_id INT NOT NULL,
    officer_id INT NOT NULL,
    arrest_date DATE,
    charges TEXT,
    FOREIGN KEY (criminal_id) REFERENCES Criminal(criminal_id),
    FOREIGN KEY (officer_id) REFERENCES Officer(officer_id)
);

-- Witnesses linked to cases
CREATE TABLE Witness (
    witness_id INT PRIMARY KEY AUTO_INCREMENT,
    case_id INT NOT NULL,
    name VARCHAR(100),
    statement TEXT,
    contact_number VARCHAR(20),
    FOREIGN KEY (case_id) REFERENCES CaseRecord(case_id)
);

-- Station Assets
CREATE TABLE Asset (
    asset_id INT PRIMARY KEY AUTO_INCREMENT,
    station_id INT NOT NULL,
    name VARCHAR(100),
    type VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (station_id) REFERENCES PoliceStation(station_id)
);

