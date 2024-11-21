<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>complete Account Setup</title>
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
      background-image: url('<%= request.getContextPath() %>/images/login.jpg');
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
    </style>
</head>

<body>

<div class="sidebar">
  <div class="container-fluid">
    <h2 class="text-center text-white">Dashboard</h2>
    <div class="nav flex-column">
      <a class="nav-item" href="/"><i class="bi bi-house-door"></i> Dashboard</a>

      <a class="nav-item" href="#" data-bs-toggle="collapse" data-bs-target="#categoryDropdown" aria-expanded="false" aria-controls="categoryDropdown"><i class="bi bi-grid"></i> Categories</a>
      <div class="collapse" id="categoryDropdown">
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

      <a class="nav-item" href="settings.jsp"><i class="bi bi-gear"></i> Settings</a>

      <a class="nav-item active" href="update.jsp"><i class="bi bi-pencil-square"></i> Update</a>

      <a class="nav-item" href="login.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
    </div>
  </div>
</div>

<div class="container mt-5">
  <div class="row">
    <div class="col-12">
      <div class="position-relative">

        <h3 class="text-center mb-7 mt-7">Update Account</h3>
        <form action="upload" method="post"  novalidate enctype="multipart/form-data">
          <div class="form-group mb-3">
            <label for="profilePic" class="form-label">Upload profile Picture</label>
            <input type="file" class="form-control" id="profilePic" name="profilePic"  required/>
          </div>

          <div class="form-group mb-3">
            <label for="coverPic" class="form-label">Upload Cover Picture</label>
            <input type="file" class="form-control" id="coverPic" name="coverPic"  required/>
          </div>

          <div class="mb-3 text-center">
            <button type="submit" class="btn btn-primary">update</button>
          </div>
        </form>

      </div>
    </div>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>
