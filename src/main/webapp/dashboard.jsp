<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
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

        .content {
            margin-left: 250px;
            padding: 20px;
            width: 100%;
        }

        .sidebar .nav-item .bi {
            margin-right: 10px;
        }

        .sidebar a.active {
            background-color: #0056b3;
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
    </style>
</head>

<body>
<div class="sidebar">
    <div class="container-fluid">
        <h2 class="text-center text-white">Dashboard</h2>
        <div class="nav flex-column">
            <a class="nav-item active" href="/"><i class="bi bi-house-door"></i> Dashboard</a>

            <a class="nav-item" href="#" data-bs-toggle="collapse" data-bs-target="#categoryDropdown" aria-expanded="false" aria-controls="categoryDropdown"><i class="bi bi-grid"></i> Categories</a>
            <div class="collapse" id="categoryDropdown">
                <a class="nav-item" href="category.jsp"><i class="bi bi-person"></i>Add Category</a>
                <a class="nav-item ms-3" href="category.jsp?category=Technology"><i class="bi bi-tag"></i> Technology</a>
                <a class="nav-item ms-3" href="category.jsp?category=Sports"><i class="bi bi-tag"></i> Sports</a>
                <a class="nav-item ms-3" href="category.jsp?category=Family"><i class="bi bi-tag"></i> Family</a>
                <a class="nav-item ms-3" href="category.jsp?category=Work"><i class="bi bi-tag"></i> Work</a>
                <div class="ms-4 mt-2">
                    <a class="nav-item ms-3" href="category.jsp?filter=family"><i class="bi bi-person"></i> Filter by Family</a>
                    <a class="nav-item ms-3" href="category.jsp?filter=friends"><i class="bi bi-person-check"></i> Filter by Friends</a>
                    <a class="nav-item ms-3" href="category.jsp?filter=work"><i class="bi bi-briefcase"></i> Filter by Work</a>
                </div>
            </div>
            <a class="nav-item" href="profile.jsp"><i class="bi bi-person"></i> Profile</a>

            <a class="nav-item" href="settings"><i class="bi bi-gear"></i> Settings</a>
            <a class="nav-item" href="groups.jsp"><i class="bi bi-gear"></i> Groups</a>

            <a class="nav-item" href="update.jsp"><i class="bi bi-pencil-square"></i> Update</a>

            <a class="nav-item" href="login.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </div>
    </div>
</div>
<!-- Main Content Section -->
<div class="container mt-5">
    <h2 class="text-center mb-4">Featured Cards</h2>
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
                    <a href="login.jsp" class="btn btn-custom">Login</a>
                </div>
            </div>
        </div>

        <!-- Card 4 -->
        <div class="col">
            <div class="card h-100">
                <img src="https://via.placeholder.com/300" class="card-img-top" alt="Card image 4">
                <div class="card-body">
                    <h5 class="card-title">Content Creators</h5>
                    <p class="card-text">If you're a content creator, this is the place to showcase your talents and engage with fans.</p>
                </div>
                <div class="card-footer text-center">
                    <a href="create-content.jsp" class="btn btn-custom">Start Creating</a>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>
