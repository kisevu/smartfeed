<%--
  Created by IntelliJ IDEA.
  User: ameda
  Date: 20/11/2024
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Technology</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <style>
    body {
      display: flex;
      min-height: 100vh;
      margin: 0;
      font-family: Arial, sans-serif;
    }

    .sidebar {
      width: 250px;
      background-color: #007bff;
      color: white;
      position: fixed;
      height: 100vh;
      top: 0;
      left: 0;
      padding-top: 20px;
    }

    .sidebar a {
      color: white;
      text-decoration: none;
      padding: 12px 16px;
      display: block;
      font-size: 18px;
    }

    .sidebar a:hover {
      background-color: #0056b3;
    }

    .sidebar .nav-item {
      margin-bottom: 15px;
    }

    .sidebar .nav-item .bi {
      margin-right: 10px;
    }

    .sidebar a.active {
      background-color: #0056b3;
    }

    .content {
      margin-left: 250px;
      padding: 20px;
      width: 100%;
    }

    .sidebar .nav-item .dropdown-menu {
      background-color: #0056b3;
      border: none;
    }

    /* Custom styles for the dashboard header */
    .header {
      background-color: #f8f9fa;
      padding: 20px;
      border-bottom: 1px solid #ddd;
    }

    .header h1 {
      margin: 0;
    }
    /* main content card stylings */
    .card-img-top {
      height: 200px;
      object-fit: cover;
    }

    .card-deck .card {
      margin: 15px;

    }

    .card-title {
      font-size: 1.25rem;
      font-weight: bold;
    }

    .card-text {
      font-size: 1rem;
    }

    .card-footer {
      background-color: transparent;
      border-top: none;
    }

    .jumbotron-custom {
      background-color: #007bff;
      color: white;
      height: 300px;
      margin-top: 50px;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
    }
    /* indicates all  the buttons to include the properties*/
    /* Base button style */
    .btn-custom {
      border: none;
      color: white; /* Ensure text is visible on dark buttons */
    }

    /* Like Button */
    .btn-like {
      background-color: #28a745; /* Green for Like */
    }

    .card:hover{
      .btn-like:hover {
        background-color: #218838; /* Darker green for hover */
      }
    }

    /* Dislike Button */
    .btn-dislike{
      background-color: #dc3545; /* Red for Dislike */
    }


    .card:hover{
      .btn-dislike:hover {
        background-color: #c82333; /* Darker red for hover */
      }
    }

    /* Comment Button */
    .btn-comment{
      background-color: #ffc107; /* Yellow for Comment */
    }

    .card:hover{
      .btn-comment:hover{
        background-color: #ffc107; /* Yellow for Comment */
      }
    }

    .btn-custom:hover {
      background-color: #0056b3;
    }


    /* comments styles section */

    .card-body textarea {
      margin-bottom: 10px;
      resize: none;
    }

    .card-footer {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .card-footer a {
      margin-right: 10px;
    }

    .card-body .d-flex {
      margin-top: 10px;
    }

    .card-footer {
      background-color: transparent;
      border-top: none;
    }

    .card {
      /*margin: .5rem;*/
    }
  </style>
</head>

<body>

</body>
</html>
