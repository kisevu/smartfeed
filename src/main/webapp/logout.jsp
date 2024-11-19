<html>
<head>
  <title>smartfeed</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    .jumbotron-custom {
      background: #007bff;
      color: white;
      height: 400px;
      margin-top: 3rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      margin-bottom: 3rem;
    }
    .jumbotron-custom hr {
      border: 0;
      height: 2px; /* Thickness of the line */
      background-color: #ffffff; /* Line color */
      width: 50%; /* Set the width of the line */
      margin: 20px auto; /* Add some space above and below the line */
      opacity: 0.5; /* Optional: make the line semi-transparent */
    }
  </style>
</head>

<body>
<div class="container">
  <%@include file="WEB-INF/jspf/header.jsp"%>

  <div class="row">
    <div class="col-md-3">
      <%@include file="WEB-INF/jspf/sidebar.jsp"%>
    </div>

    <div class="col-md-9">
      <form action="login.jsp" method="post">
        <p class="text-center text-body-secondary">Logout</p>
        <div class="form-group mb-3">
          <label for="email">Email Address</label>
          <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter your email"/>
        </div>

        <div class="form-group mb-3">
          <label for="password">Password</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Enter your Password"/>
        </div>

        <div class="form-check mb-3">
          <label for="check" class="form-check-label">Remember Me</label>
          <input type="checkbox" class="form-check-input" id="check" aria-describedby="emailHelp" placeholder="Enter your email"/>
        </div>

        <div class="mb-3">
          <button class="btn btn-primary" type="submit">Login</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%@include file="WEB-INF/jspf/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
