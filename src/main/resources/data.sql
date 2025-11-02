-- Insert admin user
-- Insert admin user
INSERT INTO admin (username, password) VALUES ('admin', 'admin');

-- Insert sample customers into customerentitytable (fields match CustomerEntity)
INSERT INTO customerentitytable (uname, password, name, phno, accno, acctype, balance, aadhaarno, panno) 
VALUES 
('john.doe', 'password123', 'John Doe', '9876543210', '1234567890', 'Savings', 50000.00, '123456789012', 'ABCDE1234F'),
('jane.smith', 'password456', 'Jane Smith', '9876543211', '1234567891', 'Current', 75000.00, '123456789013', 'ABCDE1234G');

-- Insert sample transactions referencing customerentitytable ids
INSERT INTO transactiontable (transactionid, detail, type, amount, date, customer_id)
VALUES 
('TXN001', 'Initial deposit', 'CREDIT', 50000.00, CURRENT_DATE(), 1),
('TXN002', 'Initial deposit', 'CREDIT', 75000.00, CURRENT_DATE(), 2),
('TXN003', 'ATM withdrawal', 'DEBIT', 5000.00, CURRENT_DATE(), 1);