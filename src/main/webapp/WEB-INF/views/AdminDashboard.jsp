<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f4f8;
        }

        .header {
            background-color: #1a237e;
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .logout-btn {
            background-color: #ff4444;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .section {
            background: white;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .section h2 {
            color: #1a237e;
            margin-top: 0;
            margin-bottom: 1rem;
            border-bottom: 2px solid #e0e0e0;
            padding-bottom: 0.5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #f5f5f5;
            color: #1a237e;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f8f9fa;
        }

        .status-active {
            color: #4caf50;
            font-weight: 600;
        }

        .status-pending {
            color: #ff9800;
            font-weight: 600;
        }

        .status-inactive {
            color: #f44336;
            font-weight: 600;
        }

        .view-btn {
            background-color: #1a237e;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
        }

        .view-btn:hover {
            background-color: #283593;
        }

        .summary-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .summary-card {
            background: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .summary-card h3 {
            margin: 0;
            color: #1a237e;
            font-size: 18px;
        }

        .summary-card p {
            margin: 0.5rem 0 0;
            font-size: 24px;
            font-weight: 600;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Admin Dashboard</h1>
        <a href="/logout" class="logout-btn">Logout</a>
    </div>

    <div class="container">
        <c:if test="${not empty error}">
            <div class="alert alert-danger" style="background-color: #ffebee; color: #c62828; padding: 1rem; margin-bottom: 1rem; border-radius: 4px;">
                ${error}
            </div>
        </c:if>

        <div class="summary-cards">
            <div class="summary-card">
                <h3>Total Customers</h3>
                <p>${customerCount}</p>
            </div>
            <div class="summary-card">
                <h3>Total Transactions</h3>
                <p>${transactionCount}</p>
            </div>
        </div>

        <div class="section">
            <h2>Customer Accounts</h2>
            <table>
                <thead>
                    <tr>
                        <th>Account Number</th>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>Balance</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customers}">
                        <tr>
                            <td>${customer.accno}</td>
                            <td>${customer.name}</td>
                            <td>${customer.uname}</td>
                            <td>₹${customer.balance}</td>
                            <td>
                                <a href="/admin/customer/${customer.id}" class="view-btn">View Details</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="section">
            <h2>Recent Transactions</h2>
            <table>
                <thead>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Customer Name</th>
                        <th>Type</th>
                        <th>Details</th>
                        <th>Amount</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="transaction" items="${transactions}">
                        <tr>
                            <td>${transaction.transactionid}</td>
                            <td>${transaction.customer.name}</td>
                            <td>${transaction.type}</td>
                            <td>${transaction.detail}</td>
                            <td>₹${transaction.amount}</td>
                            <td>${transaction.date}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>