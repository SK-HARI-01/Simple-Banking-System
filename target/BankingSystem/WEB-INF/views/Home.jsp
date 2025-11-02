<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Banking System - Home</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f4f8;
        }

        .header {
            background-color: #004085;
            color: white;
            padding: 20px 40px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header h1 {
            margin: 0;
            font-size: 32px;
            letter-spacing: 1px;
        }

        .content {
            max-width: 900px;
            margin: 50px auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .content h2 {
            color: #333;
            margin-bottom: 15px;
        }

        .content p {
            font-size: 16px;
            line-height: 1.8;
            color: #555;
        }

        .buttons {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        .buttons a {
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .login-btn {
            background-color: #007bff;
            color: white;
        }

        .login-btn:hover {
            background-color: #0056b3;
        }

        .register-btn {
            background-color: #28a745;
            color: white;
        }

        .register-btn:hover {
            background-color: #1e7e34;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>SK National Bank</h1>
</div>

<div class="content">
    <h2>Welcome to SK Bank</h2>
    <p>
        SK National Bank is your reliable financial partner. We have been providing
        trustworthy, secure, and fast banking services to individuals and businesses for over two decades.
        Our advanced banking system is designed to meet your everyday needs — whether you’re transferring funds,
        checking account balances, or managing customer records.
    </p>
    <p>
        Experience seamless online banking, powerful transaction management, and complete transparency with
        SecureTrust. We're committed to protecting your data and simplifying your finances.
    </p>
    <p>Vetti selavu pannathala MANJA MAKANN..</p>

    <div class="buttons">
        <a href="/login" class="login-btn">Login</a>
        <a href="/admin/create-account" class="register-btn">Create Account</a>
    </div>
</div>

</body>
</html>
