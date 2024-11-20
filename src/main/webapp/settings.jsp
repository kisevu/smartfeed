<%--
  Created by IntelliJ IDEA.
  User: ameda
  Date: 20/11/2024
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Settings Page</title>
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

<div class="container mt-5">
  <h2 class="text-center mb-7 mt-7">Welcomed to the Settings Page</h2>
  <div class="row row-cols-1 row-cols-md-3 g-4">

    <form action="SettingsServlet" method="POST">
      <!-- Display current settings from request attributes -->
      <div class="mb-3">
        <label for="first_name" class="form-label">First Name </label>
        <input type="text" class="form-control" id="first_name" name="first_name" value="${settings.first_name}" required>
      </div>

      <div class="mb-3">
        <label for="last_name" class="form-label">Last Name</label>
        <input type="text" class="form-control" id="last_name" name="last_name" value="${settings.last_name}" required>
      </div>

      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" value="${settings.email}" required>
      </div>

      <div class="mb-3">
        <label for="theme" class="form-label">Theme</label>
        <select class="form-select" id="theme" name="theme" required>
          <option value="light" ${settings.theme == 'light' ? 'selected' : ''}>Light</option>
          <option value="dark" ${settings.theme == 'dark' ? 'selected' : ''}>Dark</option>
        </select>
      </div>

      <div class="mb-3">
        <label for="notifications" class="form-label">Enable Notifications</label>
        <input type="checkbox" id="notifications" name="notifications" ${settings.notifications ? 'checked' : ''}>
      </div>

      <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>

    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>
</body>
</html>

