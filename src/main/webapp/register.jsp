<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartFeed - User Registration</title>
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
            height: 200px;
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
        <h1>Welcome to SmartFeed</h1>
        <hr>
        <p>Register your account to stay connected</p>
    </div>

    <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="form-container">
                    <h3 class="text-center mb-4">Create an Account</h3>
                    <form action="register" method="post">
                        <div class="form-group mb-3">
                            <label for="first_name" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="first_name" name="first_name" placeholder="Enter your first name" required>
                            <div class="invalid-feedback">
                                Please enter your first name.
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <label for="last_name" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Enter your last name" required>
                            <div class="invalid-feedback">
                                Please enter your last name.
                            </div>
                        </div>

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
                                Please enter a password.
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <label for="confirm_password" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm your password" required>
                            <div class="invalid-feedback">
                                Passwords must match.
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <label for="bio" class="form-label">Bio</label>
                            <textarea class="form-control" id="bio" name="bio" rows="3" placeholder="Tell us about yourself"></textarea>
                        </div>

                        <div class="mb-3 text-center">
                            <button type="submit" class="btn btn-primary">Register</button>
                        </div>

                        <div class="text-center">
                            <p>Already have an account? <a href="login.jsp">Login here</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweeralert/dist/sweetaler.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
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
