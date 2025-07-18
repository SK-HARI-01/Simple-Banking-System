<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>EMI Calculator Preview</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .calculator-container {
            max-width: 500px;
            margin: 30px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #2c3e50;
        }
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #2980b9;
        }
        .result-container {
            margin-top: 25px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 5px;
            text-align: center;
        }
        .result-value {
            font-size: 24px;
            font-weight: bold;
            color: #27ae60;
            margin-top: 10px;
        }
        .formula {
            font-style: italic;
            color: #7f8c8d;
            margin-top: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="calculator-container">
        <h1>EMI Calculator</h1>
        
        <div class="form-group">
            <label for="principal">Loan Amount (₹)</label>
            <input type="number" id="principal" placeholder="Enter principal amount">
        </div>
        
        <div class="form-group">
            <label for="interest">Interest Rate (% p.a.)</label>
            <input type="number" id="interest" placeholder="Enter annual interest rate">
        </div>
        
        <div class="form-group">
            <label for="tenure">Loan Tenure (years)</label>
            <input type="number" id="tenure" placeholder="Enter loan tenure">
        </div>
        
        <button id="calculate-btn">Calculate EMI</button>
        
        <div class="result-container" style="display: none;" id="result">
            <h3>Your Monthly EMI</h3>
            <div class="result-value" id="emi-result"></div>
            <div class="formula">EMI = P × r × (1 + r)^n / ((1 + r)^n - 1)</div>
        </div>
    </div>

    <script>
        document.getElementById('calculate-btn').addEventListener('click', function() {
            // Get input values
            const principal = parseFloat(document.getElementById('principal').value);
            const interest = parseFloat(document.getElementById('interest').value);
            const tenure = parseInt(document.getElementById('tenure').value);
            
            // Validate inputs
            if (isNaN(principal) || isNaN(interest) || isNaN(tenure) || tenure === 0) {
                alert('Please enter valid values for all fields');
                return;
            }
            
            // Calculate monthly interest rate
            const monthlyRate = interest / 12 / 100;
            const months = tenure * 12;
            
            // Calculate EMI
            const emi = principal * monthlyRate * Math.pow(1 + monthlyRate, months) / 
                        (Math.pow(1 + monthlyRate, months) - 1);
            
            // Display result
            document.getElementById('emi-result').textContent = '₹' + emi.toFixed(2);
            document.getElementById('result').style.display = 'block';
        });
    </script>
</body>
</html>