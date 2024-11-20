<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories - SmartFeed</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
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

    .cover-photo {
        height: 300px; /* Adjust this value as needed */
        object-fit: cover; /* Ensures the image covers the area without distortion */
    }


</style>
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

<!-- Profile Container -->
<div class="container mt-5">
    <!-- Cover Picture Section -->
    <div class="row">
        <div class="col-12">
            <div class="position-relative">
                <!-- Cover Image (Dynamic) -->
                <%--                <img src="${user.coverPic}" class="img-fluid w-100" alt="Cover Picture">--%>
                <img src="https://plus.unsplash.com/premium_photo-1683133969990-5c76a0b66c0d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YmFja2dyb3VuZHN8ZW58MHx8MHx8fDA%3D"
                     class="img-fluid w-100 cover-photo"
                     alt="Cover Picture">
                <!-- Profile Picture (Dynamic) -->
                <div class="position-absolute top-50 start-50 translate-middle">
                    <%--                    <img src="${user.profilePic}" alt="Profile Picture" class="rounded-circle border border-5 border-light" style="width: 150px; height: 150px;">--%>
                    <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVvcGxlfGVufDB8fDB8fHww"
                         alt="Profile Picture"
                         class="rounded-circle border border-5 border-light" style="width: 150px; height: 150px;">
                </div>
            </div>
        </div>
    </div>


    <div class="row mt-4">

        <div class="col-md-8">
            <h2><strong>Add A Category</strong></h2>
            <p>Provide a category to Personalize even further</p>
        </div>

        <div class="mb-4">
            <h5>Cover Photo</h5>
            <div class="form-container">
                <h3 class="text-center mb-4">Create A Category</h3>
                <form action="add-category" method="post">
                    <div class="form-group mb-3">
                        <label for="category_name" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="category_name" name="category_name" placeholder="Enter a category name" required/>
                        <div class="invalid-feedback">
                            Enter a category name here
                        </div>
                    </div>

                    <div class="form-group mb-3">
                        <label for="category_description" class="form-label">Category Description</label>
                        <textarea class="form-control" id="category_description" name="category_description" rows="3" placeholder="Tell us about the category"></textarea>
                    </div>

                    <div class="mb-3 text-center">
                        <button type="submit" class="btn btn-primary">Add Category</button>
                    </div>

                </form>
            </div>
        </div>


    </div>

</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>

</body>
</html>
