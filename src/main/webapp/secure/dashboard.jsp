<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>The SmartFeed Dashboard</title>
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
      color: black; /* Ensure text is visible on dark buttons */
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


    /* mini navbar inside the custom jumbotron */

    .jumbotron-custom {
      background-color: #007bff;
      color: black;
      height: 300px;
      margin-top: 50px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 20px;
      position: relative;
    }

    .custom-navbar {
      position: absolute;
      bottom: 10px; /* Adjust this to position navbar within the jumbotron */
      width: 100%; /* Make sure the navbar spans the full width */
    }

    .navbar-nav .nav-item {
      padding-left: 20px;
      padding-right: 20px;
    }

    .navbar-light .navbar-nav .nav-link {
      color: black;
    }

    .navbar-light .navbar-nav .nav-link:hover {
      color:black;
    }



  </style>
</head>

<body>
<div class="sidebar">
  <div class="container-fluid">
    <h2 class="text-center text-white">Dashboard</h2>
    <div class="nav flex-column">
      <a class="nav-item active" href="dashboard.jsp"><i class="bi bi-house-door"></i> Dashboard</a>

      <a class="nav-item" href="#" data-bs-toggle="collapse" data-bs-target="#categoryDropdown" aria-expanded="false" aria-controls="categoryDropdown"><i class="bi bi-grid"></i> Categories</a>
      <div class="collapse" id="categoryDropdown">
        <a class="nav-item" href="#"><i class="bi bi-person"></i>Add Category</a>
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

      <a class="nav-item" href="logout.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
    </div>
  </div>
</div>


<!-- Main Content Section -->
<div class="container mt-5">
  <div class="jumbotron-custom">
    <div class="row">
      <h2>Everything to do with a post</h2>
    </div>

    <!-- Navbar inside jumbotron-custom -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light custom-navbar">
      <div class="container-fluid">
        <a class="navbar-brand" href="dashboard.jsp">SmartFeed</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="../secure/posts/create-post.jsp">Upload a Post</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Search</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Notifications</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Messages</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Profile</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

  </div>

  <h2 class="text-center mb-7 mt-7">Smart Feed Automation and Personalization</h2>
  <div class="row row-cols-1 row-cols-md-3 g-4">
    <!-- Card 1 -->
    <div class="card h-100" data-card-id="1">
      <img src="https://images.unsplash.com/photo-1597075095308-0b47fc649175?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c29jaWFsJTIwbWVkaWF8ZW58MHx8MHx8fDA%3D"
           class="card-img-top"
           alt="Card image 1">
      <div class="card-body">
        <h5 class="card-title">Exciting New Feature</h5>
        <p class="card-text">Discover the latest features we have added to enhance your experience with SmartFeed.</p>
      </div>
      <div class="card-footer text-center">
        <!-- Like Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-up"></i> Like
        </a>
        <!-- Dislike Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-down"></i> Dislike
        </a>
        <!-- Comment Button -->
        <a href="#" class="btn btn-custom comment-btn">
          <i class="fas fa-comment"></i> Comment
        </a>
      </div>

      <!-- Comment Section (Hidden Initially) -->
      <div class="card-body comment-section" style="display:none;">
        <textarea class="form-control" rows="4" placeholder="Type your comment here..."></textarea>
        <div class="d-flex justify-content-between mt-2">
          <button class="btn btn-primary submit-comment-btn">Submit Comment</button>
          <button class="btn btn-secondary cancel-comment-btn">Cancel</button>
        </div>
      </div>
    </div>




    <!-- Card 2 -->
    <div class="card h-100" data-card-id="2">
      <img src="https://plus.unsplash.com/premium_photo-1684979564941-dbf8664a68fc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHNvY2lhbCUyMG1lZGlhfGVufDB8fDB8fHww"
           class="card-img-top"
           alt="Card image 1">
      <div class="card-body">
        <h5 class="card-title">Exciting New Feature</h5>
        <p class="card-text">Discover the latest features we have added to enhance your experience with SmartFeed.</p>
      </div>
      <div class="card-footer text-center">
        <!-- Like Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-up"></i> Like
        </a>
        <!-- Dislike Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-down"></i> Dislike
        </a>
        <!-- Comment Button -->
        <a href="#" class="btn btn-custom comment-btn">
          <i class="fas fa-comment"></i> Comment
        </a>
      </div>

      <!-- Comment Section (Hidden Initially) -->
      <div class="card-body comment-section" style="display:none;">
        <textarea class="form-control" rows="4" placeholder="Type your comment here..."></textarea>
        <div class="d-flex justify-content-between mt-2">
          <button class="btn btn-primary submit-comment-btn">Submit Comment</button>
          <button class="btn btn-secondary cancel-comment-btn">Cancel</button>
        </div>
      </div>
    </div>

    <!-- Repeat the same structure for other cards, changing only data-card-id attribute -->


    <!-- Card 3 -->
    <div class="card h-100" data-card-id="3">
      <img src="https://images.unsplash.com/photo-1603145733146-ae562a55031e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHNvY2lhbCUyMG1lZGlhfGVufDB8fDB8fHww"
           class="card-img-top"
           alt="Card image 1">
      <div class="card-body">
        <h5 class="card-title">Exciting New Feature</h5>
        <p class="card-text">Discover the latest features we have added to enhance your experience with SmartFeed.</p>
      </div>
      <div class="card-footer text-center">
        <!-- Like Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-up"></i> Like
        </a>
        <!-- Dislike Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-down"></i> Dislike
        </a>
        <!-- Comment Button -->
        <a href="#" class="btn btn-custom comment-btn">
          <i class="fas fa-comment"></i> Comment
        </a>
      </div>

      <!-- Comment Section (Hidden Initially) -->
      <div class="card-body comment-section" style="display:none;">
        <textarea class="form-control" rows="4" placeholder="Type your comment here..."></textarea>
        <div class="d-flex justify-content-between mt-2">
          <button class="btn btn-primary submit-comment-btn">Submit Comment</button>
          <button class="btn btn-secondary cancel-comment-btn">Cancel</button>
        </div>
      </div>
    </div>

    <!-- Repeat the same structure for other cards, changing only data-card-id attribute -->


    <div class="card h-100" data-card-id="4">
      <img src="https://media.istockphoto.com/id/2098359215/photo/digital-marketing-concept-businessman-using-laptop-with-ads-dashboard-digital-marketing.webp?a=1&b=1&s=612x612&w=0&k=20&c=bo9P4L3HQM2cipWrh8W7_HwPYNnUdHKqucWnduQLge0="
           class="card-img-top"
           alt="Card image 1">
      <div class="card-body">
        <h5 class="card-title">Exciting New Feature</h5>
        <p class="card-text">Discover the latest features we have added to enhance your experience with SmartFeed.</p>
      </div>
      <div class="card-footer text-center">
        <!-- Like Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-up"></i> Like
        </a>
        <!-- Dislike Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-down"></i> Dislike
        </a>
        <!-- Comment Button -->
        <a href="#" class="btn btn-custom comment-btn">
          <i class="fas fa-comment"></i> Comment
        </a>
      </div>

      <!-- Comment Section (Hidden Initially) -->
      <div class="card-body comment-section" style="display:none;">
        <textarea class="form-control" rows="4" placeholder="Type your comment here..."></textarea>
        <div class="d-flex justify-content-between mt-2">
          <button class="btn btn-primary submit-comment-btn">Submit Comment</button>
          <button class="btn btn-secondary cancel-comment-btn">Cancel</button>
        </div>
      </div>
    </div>

    <!-- Repeat the same structure for other cards, changing only data-card-id attribute -->


    <div class="card h-100" data-card-id="5">
      <img src="https://media.istockphoto.com/id/1557118048/photo/a-concept-that-expresses-the-hyper-connected-society-of-modern-society-by-connecting-people.webp?a=1&b=1&s=612x612&w=0&k=20&c=KKDeYnYsmUZfziILp3eIpMhMPG8_CwfkAo7MI5buI84="
           class="card-img-top"
           alt="Card image 1">
      <div class="card-body">
        <h5 class="card-title">Exciting New Feature</h5>
        <p class="card-text">Discover the latest features we have added to enhance your experience with SmartFeed.</p>
      </div>
      <div class="card-footer text-center">
        <!-- Like Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-up"></i> Like
        </a>
        <!-- Dislike Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-down"></i> Dislike
        </a>
        <!-- Comment Button -->
        <a href="#" class="btn btn-custom comment-btn">
          <i class="fas fa-comment"></i> Comment
        </a>
      </div>

      <!-- Comment Section (Hidden Initially) -->
      <div class="card-body comment-section" style="display:none;">
        <textarea class="form-control" rows="4" placeholder="Type your comment here..."></textarea>
        <div class="d-flex justify-content-between mt-2">
          <button class="btn btn-primary submit-comment-btn">Submit Comment</button>
          <button class="btn btn-secondary cancel-comment-btn">Cancel</button>
        </div>
      </div>
    </div>

    <!-- Repeat the same structure for other cards, changing only data-card-id attribute -->




    <div class="card h-100" data-card-id="6">
      <img src="https://media.istockphoto.com/id/1609592194/photo/african-american-teenage-woman-using-a-smartphone-laptop-with-icon-communication-network.webp?a=1&b=1&s=612x612&w=0&k=20&c=F76oV6t8pmDH9AWFQlkm24ou_qI5BY7G-qduu8O-ADQ="
           class="card-img-top"
           alt="Card image 1">
      <div class="card-body">
        <h5 class="card-title">Exciting New Feature</h5>
        <p class="card-text">Discover the latest features we have added to enhance your experience with SmartFeed.</p>
      </div>
      <div class="card-footer text-center">
        <!-- Like Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-up"></i> Like
        </a>
        <!-- Dislike Button -->
        <a href="#" class="btn btn-custom me-3">
          <i class="fas fa-thumbs-down"></i> Dislike
        </a>
        <!-- Comment Button -->
        <a href="#" class="btn btn-custom comment-btn">
          <i class="fas fa-comment"></i> Comment
        </a>
      </div>

      <!-- Comment Section (Hidden Initially) -->
      <div class="card-body comment-section" style="display:none;">
        <textarea class="form-control" rows="4" placeholder="Type your comment here..."></textarea>
        <div class="d-flex justify-content-between mt-2">
          <button class="btn btn-primary submit-comment-btn">Submit Comment</button>
          <button class="btn btn-secondary cancel-comment-btn">Cancel</button>
        </div>
      </div>
    </div>

    <!-- Footer has been imported over here -->
  </div>
</div>

<!-- Toggle behavior for the comments button -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>


<script>
  // Function to handle the comment toggle (show/hide the comment section)
  function toggleCommentSection(cardId) {
    var card = document.querySelector([data-card-id="${cardId}"]);
    var commentSection = card.querySelector('.comment-section');
    var commentBtn = card.querySelector('.comment-btn');

    // Toggle the comment section visibility
    if (commentSection.style.display === "none" || commentSection.style.display === "") {
      commentSection.style.display = "block"; // Show the comment section
      card.style.height = "auto"; // Allow the card to expand
      commentBtn.innerHTML = '<i class="fas fa-times"></i> Close Comment';
    } else {
      commentSection.style.display = "none"; // Hide the comment section
      card.style.height = "100%"; // Reset to original height
      commentBtn.innerHTML = '<i class="fas fa-comment"></i> Comment';
    }
  }

  // Handle comment button click (using event delegation)
  document.querySelectorAll('.comment-btn').forEach(function(commentBtn) {
    commentBtn.addEventListener('click', function(e) {
      e.preventDefault();
      var cardId = this.closest('.card').getAttribute('data-card-id'); // Get the data-card-id of the clicked card
      toggleCommentSection(cardId); // Call the function to toggle the comment section
    });
  });

  // Handle the "Submit Comment" button click (generic for all cards)
  document.querySelectorAll('.submit-comment-btn').forEach(function(submitBtn) {
    submitBtn.addEventListener('click', function() {
      alert("Comment submitted!");
      var card = this.closest('.card');
      var commentSection = card.querySelector('.comment-section');
      commentSection.style.display = "none"; // Hide comment section
      card.style.height = "100%"; // Reset to original height
      card.querySelector('.comment-btn').innerHTML = '<i class="fas fa-comment"></i> Comment';
    });
  });

  // Handle the "Cancel" button click (generic for all cards)
  document.querySelectorAll('.cancel-comment-btn').forEach(function(cancelBtn) {
    cancelBtn.addEventListener('click', function() {
      var card = this.closest('.card');
      var commentSection = card.querySelector('.comment-section');
      commentSection.style.display = "none"; // Hide comment section
      card.style.height = "100%"; // Reset to original height
      card.querySelector('.comment-btn').innerHTML = '<i class="fas fa-comment"></i> Comment';
    });
  });
</script>

</body>

</html>