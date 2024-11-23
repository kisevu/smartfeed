<%--
  Created by IntelliJ IDEA.
  User: ameda
  Date: 20/11/2024
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Post</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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

    /* Custom style for reducing cover photo height */

    .cover-photo {
      height: 300px; /* Adjust this value as needed */
      object-fit: cover; /* Ensures the image covers the area without distortion */
    }

    /* styles for image upload section*/
    .upload-area {
      border: 2px dashed #ccc;
      padding: 20px;
      text-align: center;
      cursor: pointer;
    }
    .upload-area:hover {
      background-color: #f8f9fa;
    }

  </style>
</head>
<body>

<div class="sidebar">
  <div class="container-fluid">
    <h2 class="text-center text-white">Dashboard</h2>
    <div class="nav flex-column">
      <a class="nav-item active" href="../dashboard.jsp"><i class="bi bi-house-door"></i> Dashboard</a>

      <a class="nav-item" href="#" data-bs-toggle="collapse" data-bs-target="#categoryDropdown" aria-expanded="false" aria-controls="categoryDropdown"><i class="bi bi-grid"></i> Categories</a>
      <div class="collapse" id="categoryDropdown">
        <a class="nav-item" href="../category.jsp"><i class="bi bi-person"></i>Add Category</a>
        <a class="nav-item ms-3" href="../category.jsp?category=Technology"><i class="bi bi-tag"></i> Technology</a>
        <a class="nav-item ms-3" href="../category.jsp?category=Sports"><i class="bi bi-tag"></i> Sports</a>
        <a class="nav-item ms-3" href="../category.jsp?category=Family"><i class="bi bi-tag"></i> Family</a>
        <a class="nav-item ms-3" href="../category.jsp?category=Work"><i class="bi bi-tag"></i> Work</a>
        <div class="ms-4 mt-2">
          <a class="nav-item ms-3" href="../category.jsp?filter=family"><i class="bi bi-person"></i> Filter by Family</a>
          <a class="nav-item ms-3" href="../category.jsp?filter=friends"><i class="bi bi-person-check"></i> Filter by Friends</a>
          <a class="nav-item ms-3" href="../category.jsp?filter=work"><i class="bi bi-briefcase"></i> Filter by Work</a>
        </div>
      </div>
      <a class="nav-item" href="../profile.jsp"><i class="bi bi-person"></i> Profile</a>

      <a class="nav-item" href="settings"><i class="bi bi-gear"></i> Settings</a>
      <a class="nav-item" href="../groups.jsp"><i class="bi bi-gear"></i> Groups</a>

      <a class="nav-item" href="../update.jsp"><i class="bi bi-pencil-square"></i> Update</a>

      <a class="nav-item" href="../logout.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
    </div>
  </div>
</div>


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


  <h2>Create Post</h2>
  <form action="/secure/create-post" method="post" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="postText" class="form-label">Post Text</label>
      <textarea class="form-control" id="postText" name="postText" rows="4" required></textarea>
    </div>

    <div class="mb-3">
      <label for="media" class="form-label">Media (Optional)</label>
      <input type="file" class="form-control" id="media" name="media"/>
      <small class="form-text text-muted">You can add an image, video, or other media file.</small>
    </div>

    <div class="mb-3">
      <label for="privacySetting" class="form-label">Privacy Setting</label>
      <select class="form-select" id="privacySetting" name="privacySetting" required>
        <option value="Public">Public</option>
        <option value="Private">Private</option>
        <option value="Friends Only">Friends Only</option>
      </select>
    </div>

    <div class="mb-3">
      <label for="submitted" class="form-label">Submitted</label>
      <textarea class="form-control" id="submitted" name="submitted" rows="2" required></textarea>
      <small class="form-text text-muted">Additional information (e.g., submission date).</small>
    </div>

    <button type="submit" class="btn btn-primary">Create Post</button>
  </form>
</div>

<!-- Bootstrap JS & Dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>

