<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .sign-up-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 400px;
            padding: 40px;
        }

        .sign-up-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .sign-up-header h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 8px;
        }

        .sign-up-header p {
            color: #666;
            font-size: 16px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            color: #666;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 12px 16px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-group input:focus {
            outline: none;
            border-color: #4CAF50;
        }

        .sign-up-button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 12px 24px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .sign-up-button:hover {
            background-color: #45a049;
        }

        .sign-up-footer {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }

        .sign-up-footer a {
            color: #4CAF50;
            text-decoration: none;
        }

        .sign-up-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="sign-up-container">
    <div class="sign-up-header">
        <h2>Sign Up</h2>
        <p>Create your account</p>
    </div>
    <form action="signup" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <button type="submit" class="sign-up-button">Sign Up</button>
    </form>
    <div class="sign-up-footer">
        Already have an account? <a href="login">Sign In</a>
    </div>
</div>
</body>
</html>
