<%--
  Created by IntelliJ IDEA.
  User: ameda
  Date: 19/11/2024
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
            <a class="nav-item active" href="profile.jsp"><i class="bi bi-person"></i> Profile</a>

            <a class="nav-item" href="settings.jsp"><i class="bi bi-gear"></i> Settings</a>

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

    <!-- Profile Info Section -->
    <div class="row mt-4">
        <div class="col-md-8">
<%--            <h2>${user.firstName} ${user.lastName}</h2>--%>
            <h2> Angeline Rose </h2>
            <p><strong>Email:</strong> angelinehr@edu.care</p>
            <p><strong>Bio:</strong></p>
            <p>
               I love pets and nature.
                Feels awesome to be the change I want when it comes to matters, environment.
            </p>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    Update Profile
                </div>
                <div class="card-body" style="margin-bottom:-1rem">
                    <form action="update.jsp">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <div class="form-group mb-3">
                                    <label for="first_name" class="form-label">First Name</label>
                                    <input type="text" class="form-control" id="first_name" name="first_name" placeholder="Enter your first name" required>
                                    <div class="invalid-feedback">
                                        Please enter your first name.
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="form-group mb-3">
                                    <label for="last_name" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Enter your last name" required>
                                    <div class="invalid-feedback">
                                        Please enter your last name.
                                    </div>
                                </div>
                            </li>

                            <li class="list-group-item">
                                <div class="form-group mb-3">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                                    <div class="invalid-feedback">
                                        Please enter a valid email address.
                                    </div>
                                </div>
                            </li>

                            <li class="list-group-item">
                                <div class="form-group mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                                    <div class="invalid-feedback">
                                        Please enter a password.
                                    </div>
                                </div>
                            </li>

                            <li class="list-group-item">
                                <div class="form-group mb-3">
                                    <label for="bio" class="form-label">Bio</label>
                                    <textarea class="form-control" id="bio" name="bio" rows="3" placeholder="Tell us about yourself"></textarea>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="mb-3 text-center">
                                    <button type="submit" class="btn btn-danger">Edit Profile</button>
                                </div>
                            </li>
                        </ul>

                    </form>
                </div>
            </div>
        </div>

                                    <!-- Working on image uploads -->
        <div class="col-md-8 col-lg-6" style="margin-top: -30rem">
            <div class="form-container">
                <h3 class="text-center mb-4">Upload Media</h3>
            </div>

            <div class="mb-4">
                <h5>Cover Photo</h5>
                <div class="card">
                    <div class="card-body">
                        <form action="upload.jsp">
                            <div id="coverPhotoDropArea" class="upload-area">
                                <p>Drag & Drop your Cover Photo here or click to select</p>
                                <input type="file" id="coverPhotoInput" class="d-none" accept="image/*">
                            </div>
                            <button type="submit" class="btn btn=danger">upload</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="mb-4">
                <h5>Profile Picture</h5>
                <div class="card">
                    <div class="card-body">
                        <form action="upload.jsp">
                            <div id="profilePicDropArea" class="upload-area">
                                <p>Drag & Drop your Profile Picture here or click to select</p>
                                <input type="file" id="profilePicInput" class="d-none" accept="image/*">
                            </div>
                            <button type="submit" class="btn btn=danger">upload</button>
                        </form>
                    </div>
                </div>
            </div>


        </div>

    </div>


    <script>
        // Function to handle the file input and drag-and-drop functionality
        function handleFileUpload(dropAreaId, inputId) {
            const dropArea = document.getElementById(dropAreaId);
            const fileInput = document.getElementById(inputId);

            // When the drop area is clicked, trigger the file input
            dropArea.addEventListener('click', () => {
                fileInput.click();  // Open file picker dialog
            });

            // Handle drag-over effect
            dropArea.addEventListener('dragover', (event) => {
                event.preventDefault();
                dropArea.style.backgroundColor = '#f0f0f0';  // Highlight the drop area
            });

            // Reset background color when dragging leaves
            dropArea.addEventListener('dragleave', () => {
                dropArea.style.backgroundColor = ''; // Reset background color
            });

            // Handle drop of a file
            dropArea.addEventListener('drop', (event) => {
                event.preventDefault();
                dropArea.style.backgroundColor = ''; // Reset background color after drop

                const file = event.dataTransfer.files[0]; // Get the dropped file
                if (file) {
                    // Set the file to the input field
                    fileInput.files = event.dataTransfer.files;
                }
            });
        }

        // Call the function for Cover Photo and Profile Picture
        handleFileUpload('coverPhotoDropArea', 'coverPhotoInput');
        handleFileUpload('profilePicDropArea', 'profilePicInput');
    </script>

<!-- Bootstrap JS & Dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
