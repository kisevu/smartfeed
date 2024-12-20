<%--
  Created by IntelliJ IDEA.
  User: ameda
  Date: 19/11/2024
  Time: 02:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Custom notifications</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    /* Custom Styles */
    .card-img-top {
      height: 200px;
      object-fit: cover;
    }

    .card-deck .card {
      margin: 10px;
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

    .btn-custom {
      background-color: #007bff;
      border: none;
    }

    .btn-custom:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #007bff">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">SmartFeed</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="category.jsp?category=Technology">Technology</a></li>
            <li><a class="dropdown-item" href="category.jsp?category=Sports">Sports</a></li>
            <li><a class="dropdown-item" href="category.jsp?category=Family">Family</a></li>
            <li><a class="dropdown-item" href="category.jsp?category=Work">Work</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">All Categories</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="notifications.jsp">Notifications</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron-custom">
  <h1>Welcome to SmartFeed</h1>
  <hr />
  <p>Your social feed, personalized.</p>
  <div class="d-flex justify-content-between w-80">
    <a href="update" class="btn btn-success">update Account</a>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
