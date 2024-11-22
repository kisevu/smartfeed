<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SmartFeed - Home</title>
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

<!-- Navbar -->
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
            <li><a class="dropdown-item" href="allCategories.jsp">All Categories</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Notifications</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/">Logout</a>
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


<div class="container mt-5">
  <h2 class="text-center mb-4">Group filters</h2>
  <div class="row row-cols-1 row-cols-md-3 g-4">
    <!-- Card 1 -->
    <div class="col">
      <div class="card h-100">
        <img src="${pageContext.request.contextPath}/images/notifications.jpg" class="card-img-top" alt="Card image 1">
        <div class="card-body">
          <h5 class="card-title">Exciting New Feature</h5>
          <p class="card-text">Discover the latest features we have added to enhance your experience with SmartFeed.</p>
        </div>
        <div class="card-footer text-center">
          <a href="#" class="btn btn-custom">Learn More</a>
        </div>
      </div>
    </div>

    <!-- Card 2 -->
    <div class="col">
      <div class="card h-100">
        <img src="${pageContext.request.contextPath}/images/plan.jpg" class="card-img-top" alt="Card image 2">
        <div class="card-body">
          <h5 class="card-title">Join the Community</h5>
          <p class="card-text">Become part of a vibrant community where you can share, learn, and grow.</p>
        </div>
        <div class="card-footer text-center">
          <a href="register.jsp" class="btn btn-custom">Sign Up</a>
        </div>
      </div>
    </div>

    <!-- Card 3 -->
    <div class="col">
      <div class="card h-100">
        <img src="${pageContext.request.contextPath}/images/stay" class="card-img-top" alt="Card image 3">
        <div class="card-body">
          <h5 class="card-title">Stay Connected</h5>
          <p class="card-text">Stay connected with your friends and family by following their feeds and updates.</p>
        </div>
        <div class="card-footer text-center">
          <a href="/" class="btn btn-custom">Login</a>
        </div>
      </div>
    </div>

    <!-- Card 4 -->
    <div class="col">
      <div class="card h-100">
        <img src="${pageContext.request.contextPath}/images/notifications.jpg" class="card-img-top" alt="Card image 4">
        <div class="card-body">
          <h5 class="card-title">Content Creators</h5>
          <p class="card-text">If you're a content creator, this is the place to showcase your talents and engage with fans.</p>
        </div>
        <div class="card-footer text-center">
          <a href="#" class="btn btn-custom">Start Creating</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Footer Section -->
<footer class="bg-light py-4 mt-5">
  <div class="container text-center">
    <p>&copy; 2024 SmartFeed. All rights reserved.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
