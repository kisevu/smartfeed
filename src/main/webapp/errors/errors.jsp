<%--
  Created by IntelliJ IDEA.
  User: ameda
  Date: 22/11/2024
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
        }

        .error-container {
            background-color: #fff;
            border-radius: 8px;
            padding: 40px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
        }

        .error-container h1 {
            font-size: 50px;
            margin-bottom: 20px;
            color: #ff4d4d;
        }

        .error-container h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 30px;
        }

        .error-container p {
            font-size: 18px;
            color: #777;
            margin-bottom: 30px;
        }

        .button {
            background-color: #007bff;
            color: white;
            font-size: 18px;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .button:focus {
            outline: none;
        }

        .button-container {
            margin-top: 20px;
    </style>
        }
    </style>
</head>
<body>

<div class="error-container">
    <h1>Oops!</h1>
    <h2>Something went wrong</h2>
    <p>We're sorry, but an error occurred while processing your request. Please try again later or contact support if the issue persists.</p>

    <div class="button-container">
        <a href="../secure/dashboard.jsp" class="button">Back to Home</a>
    </div>
</div>
</body>
</html>
