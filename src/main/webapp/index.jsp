<%--
  Created by IntelliJ IDEA.
  User: ameda
  Date: 20/11/2024
  Time: 12:48
  To change this template use File | Settings | File Templates.
  login page
--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartFeed - Login</title>
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
        <h1>Welcome Back to SmartFeed</h1>
        <hr>
        <p>Login to continue your journey</p>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="form-container">
                <h3 class="text-center mb-4">Login</h3>
                <form action="login" method="post" class="needs-validation" novalidate>
                    <div class="form-group mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                        <div class="invalid-feedback">
                            Please enter a valid email address.
                        </div>
                    </div>

                    <div class="form-group mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                        <div class="invalid-feedback">
                            Please enter your password.
                        </div>
                    </div>

                    <div class="form-check mb-3">
                        <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div>

                    <div class="mb-3 text-center">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>

                    <div class="text-center">
                        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
                        <p><a href="#">Forgot your password?</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script>
    // Custom JavaScript for form validation
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')

        Array.from(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
    })()

    var status = document.getElementById("status").value;
    if (status == "success") {
        swal("Congratulations!", "Account created successfully", "success");
    }
</script>

</body>

</html>
