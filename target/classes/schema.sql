-- Drop tables if they exist (in reverse order of dependencies)
-- DROP TABLE IF EXISTS transactiontable;
-- DROP TABLE IF EXISTS customerentitytable;
-- DROP TABLE IF EXISTS admin;

-- Create admin table
CREATE TABLE IF NOT EXISTS admin (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL
);

-- Create customerentitytable (matches CustomerEntity fields)
CREATE TABLE IF NOT EXISTS customerentitytable (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    uname VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    phno VARCHAR(15),
    accno VARCHAR(20) UNIQUE NOT NULL,
    acctype VARCHAR(20),
    balance DECIMAL(15,2) DEFAULT 0.00,
    aadhaarno VARCHAR(12),
    panno VARCHAR(10)
);

-- Create transaction table (references customerentitytable)
CREATE TABLE IF NOT EXISTS transactiontable (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    transactionid VARCHAR(50) UNIQUE NOT NULL,
    detail VARCHAR(255),
    type VARCHAR(20),
    amount DECIMAL(15,2),
    date DATE,
    customer_id BIGINT,
    FOREIGN KEY (customer_id) REFERENCES customerentitytable(id)
);