<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.BankingSystem.Entity.CustomerEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.BankingSystem.Entity.TransactionTable" %>

<%
    CustomerEntity customer = (CustomerEntity) session.getAttribute("loggedInUser");
    List<TransactionTable> transactions = (List<TransactionTable>) request.getAttribute("transactions");
%>

<html>
<head>
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: Arial;
            background-color: #eef5f9;
            padding: 30px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header h2 {
            margin: 0;
        }
        .logout-btn {
            font-size: 14px;
            background: red;
            color: white;
            padding: 8px 14px;
            border-radius: 5px;
            text-decoration: none;
        }

        .user-section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
            margin-bottom: 20px;
        }
        .actions {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        .actions button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 10;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fff;
            margin: 8% auto;
            padding: 20px;
            width: 40%;
            border-radius: 10px;
            position: relative;
            box-shadow: 0 0 10px #888;
        }
        .modal-content h3 {
            margin-top: 0;
        }
        .modal-content label {
            display: block;
            margin-top: 10px;
        }
        .modal-content input, .modal-content select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .modal-content button {
            margin-top: 15px;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
        }
        .close {
            color: red;
            position: absolute;
            right: 15px;
            top: 10px;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="header">
    <h2>Welcome, <%= customer.getName() %></h2>
    <a href="/customer/logout" class="logout-btn">Logout</a>
</div>

<div class="user-section">
    <p><strong>Account No:</strong> <%= customer.getAccno() %></p>
    <p><strong>Account Type:</strong> <%= customer.getAcctype() %></p>
    <p><strong>Balance:</strong> ₹<%= customer.getBalance() %></p>
    <p><strong>Phone:</strong> <%= customer.getPhno() %></p>
    <p><strong>Email:</strong> <%= customer.getUname() %></p>
</div>

<div class="actions">
    <button onclick="openModal('updateModal')">Update Details</button>
    <button onclick="openModal('transferModal')">Make Transfer</button>
    <button onclick="openModal('transactionModal')">View Transactions</button>
</div>

<!-- Update Modal -->
<div id="updateModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('updateModal')">&times;</span>
        <h3>Update Your Contact Info</h3>
        <form method="post" action="/customer/update">
            <label>Phone Number:</label>
            <input name="phno" value="<%= customer.getPhno() %>" required />
            <label>Email:</label>
            <input name="email" value="<%= customer.getUname() %>" required />
            <button type="submit">Update</button>
        </form>
    </div>
</div>

<!-- Transfer Modal -->
<div id="transferModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('transferModal')">&times;</span>
        <h3>Make a Transaction</h3>
        <form method="post" action="/customer/transfer">
            <label>Recipient Account No:</label>
            <input name="toAccno" required />
            <label>Amount (₹):</label>
            <input type="number" name="amount" min="1" step="0.01" required />
            <label>Remarks:</label>
            <input name="detail" />
            <button type="submit">Send Money</button>
        </form>
    </div>
</div>

<!-- Transaction History Modal -->
<div id="transactionModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('transactionModal')">&times;</span>
        <h3>Transaction History</h3>
        <table>
            <tr><th>ID</th><th>Date</th><th>Type</th><th>Detail</th><th>Amount (₹)</th></tr>
            <%
                if (transactions != null) {
                    for (TransactionTable txn : transactions) {
            %>
                <tr>
                    <td><%= txn.getTransactionid() %></td>
                    <td><%= txn.getDate() %></td>
                    <td><%= txn.getType() %></td>
                    <td><%= txn.getDetail() %></td>
                    <td><%= txn.getAmount() %></td>
                </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
</div>

<script>
    function openModal(id) {
        document.getElementById(id).style.display = "block";
    }
    function closeModal(id) {
        document.getElementById(id).style.display = "none";
    }

    window.onclick = function(event) {
        ['updateModal', 'transferModal', 'transactionModal'].forEach(id => {
            const modal = document.getElementById(id);
            if (event.target === modal) {
                modal.style.display = "none";
            }
        });
    }
</script>

</body>
</html>
