<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Customer Details</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background:#f0f4f8; margin:0; }
        .header { background:#1a237e; color:#fff; padding:1rem 2rem; display:flex; justify-content:space-between; align-items:center }
        .container { max-width:1000px; margin:2rem auto; padding:0 1rem }
        .card { background:#fff; padding:1.5rem; border-radius:8px; box-shadow:0 2px 4px rgba(0,0,0,0.08); }
        table { width:100%; border-collapse:collapse; margin-top:1rem }
        th, td { padding:10px; border-bottom:1px solid #e0e0e0; text-align:left }
        th { background:#f5f5f5; color:#1a237e }
        .back { display:inline-block; margin-bottom:1rem; background:#eee; padding:8px 12px; border-radius:4px; text-decoration:none; color:#333 }
        .label { color:#666; font-size:14px; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Customer Details</h1>
        <a href="/admin/dashboard" style="color:white; text-decoration:none">Back to Dashboard</a>
    </div>

    <div class="container">
        <c:if test="${not empty error}">
            <div style="background:#ffebee;color:#c62828;padding:1rem;margin-bottom:1rem;border-radius:4px;">${error}</div>
        </c:if>

        <div class="card">
            <h2>Account Information</h2>
            <p><span class="label">Account No: </span> ${customer.accno}</p>
            <p><span class="label">Full Name: </span> ${customer.name}</p>
            <p><span class="label">Username: </span> ${customer.uname}</p>
            <p><span class="label">Phone: </span> ${customer.phno}</p>
            <p><span class="label">Account Type: </span> ${customer.acctype}</p>
            <p><span class="label">Balance: </span> ₹${customer.balance}</p>
        </div>

        <div class="card" style="margin-top:1.5rem">
            <h2>Transactions</h2>
            <table>
                <thead>
                    <tr>
                        <th>Transaction ID</th>
                        <th>Type</th>
                        <th>Details</th>
                        <th>Amount</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="tx" items="${transactions}">
                        <tr>
                            <td>${tx.transactionid}</td>
                            <td>${tx.type}</td>
                            <td>${tx.detail}</td>
                            <td>₹${tx.amount}</td>
                            <td>${tx.date}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty transactions}">
                        <tr><td colspan="5" style="text-align:center;color:#666;padding:16px;">No transactions found for this account.</td></tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
