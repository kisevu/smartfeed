<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>complete Account Setup</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    body {
      background-image: url('<%= request.getContextPath() %>/images/login.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      height: 100vh;
      font-family: 'Arial', sans-serif;
    }

    .jumbotron-custom {
      background: #007bff;
      color: white;
      height: 350px;
      margin-top: 3rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      margin-bottom: 3rem;
      border-radius: 10px;
    }

    .jumbotron-custom h1 {
      font-size: 3rem;
      font-weight: bold;
    }

    .jumbotron-custom hr {
      border: 0;
      height: 2px;
      background-color: #ffffff;
      width: 50%;
      margin: 20px auto;
      opacity: 0.5;
    }

    .form-container {
      background-color: white;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }

    .btn-primary:hover {
      background-color: #0056b3;
      border-color: #004085;
    }
  </style>
</head>

<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status")%>" />

<div class="container my-5">
  <div class="jumbotron-custom text-center">
    <h1>Account Set Up </h1>
    <hr>
    <p>Complete on your account set up</p>
  </div>

  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
      <div class="form-container">
        <h3 class="text-center mb-4">Update Account</h3>
        <form action="update" method="post"  novalidate>
          <div class="form-group mb-3">
            <label for="profilePic" class="form-label">upload profile</label>
            <input type="file" class="form-control" id="profilePic" name="profilePic"  required>
          </div>

          <div class="form-group mb-3">
            <label for="coverPic" class="form-label">upload profile</label>
            <input type="file" class="form-control" id="coverPic" name="coverPic"  required>
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
