<%--
  Created by IntelliJ IDEA.
  User: ameda
  Date: 22/11/2024
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log out Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
        }

        .logout-container {
            background-color: #fff;
            border-radius: 8px;
            padding: 40px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 400px;
        }

        .logout-container h1 {
            font-size: 30px;
            margin-bottom: 20px;
            color: #ff4d4d;
        }

        .logout-container p {
            font-size: 18px;
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
    </style>
</head>
<body>

<div class="logout-container">
    <h1>You're Logged Out</h1>
    <p>You have successfully logged out. Click below to go back to the login page.</p>

    <a href="../index.jsp" class="button">Cancel</a>
</div>

</body>
</html>
