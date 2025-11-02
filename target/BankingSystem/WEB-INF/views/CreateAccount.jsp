<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Account</title>
    <style>
        body {
            font-family: Arial;
            background-color: #eaf4fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .account-form {
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 0 15px rgba(0,0,0,0.15);
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            margin-top: 15px;
            background-color: #28a745;
            border: none;
            color: white;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="account-form">
    <h2>Create Customer Account</h2>
    <form action="/admin/create-account" method="post">
        <input name="name" placeholder="Customer Name" required />
        <input name="uname" placeholder="Username" required />
        <input name="password" type="password" placeholder="Password" required />
        <input name="phno" placeholder="Phone Number" required />
        <select name="acctype" required>
            <option value="">Select Account Type</option>
            <option value="SAVINGS">Savings</option>
            <option value="CURRENT">Current</option>
        </select>
        <input name="aadhaarno" placeholder="Aadhaar Number" required />
        <input name="panno" placeholder="PAN Number" required />
        <button type="submit">Create Account</button>
    </form>
</div>
</body>
</html>
