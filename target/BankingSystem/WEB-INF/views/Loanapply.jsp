<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.BankingSystem.Entity.CustomerEntity" %>

<%CustomerEntity customer = (CustomerEntity) session.getAttribute("loggedInUser"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Loan Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 40px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
        }

        p {
            text-align: center;
            font-size: 18px;
            color: #34495e;
        }

        form {
            max-width: 500px;
            margin: 20px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #2c3e50;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        input[readonly] {
            background-color: #eee;
            color: #777;
            cursor: not-allowed;
        }

        button {
            width: 100%;
            background-color: #27ae60;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #219150;
        }
    </style>
</head>
<body>

    <h1>Loan Application Form</h1>

    <p>Instant personal loan apply</p>

    <form action="/customer/loanapply" method="post">
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" value="<%= customer.getName() %>" readonly>

        <label for="accNo">Customer Account No:</label>
        <input type="text" id="accNo" name="accNo" value="<%= customer.getAccno() %>" readonly>

        <label for="loanAmount">Loan Amount(in thousands multiples:)</label>
        <input type="number" id="loanAmount" name="loanAmount" placeholder="Min = 10K & Max = 100K " required>

        <label for="emiPeriod">EMI Period (in months):</label>
        <input type="number" id="emiPeriod" name="emiPeriod" required>

        <label for="interest">Interest Rate (%):</label>
        <input type="text" id="interest" name="interest" value="11.5" readonly>

        <button type="submit">Submit</button>
    </form>

</body>
</html>
