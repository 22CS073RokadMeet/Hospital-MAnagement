<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>

</head>
<body>

<%@include file="component/navbar.jsp"%>


	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Register</p>
						
						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty errorMsg}">
							<p class="text-center text-success fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/>
						</c:if>
							
						<form action="user_register" method="post">
						
							<div class="mb-3">
								<label class="form-label">Full Name</label><input required
								name="fullname" type="name" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Email Address</label><input required
								name="email" type="email" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Password</label><input required
								name="password" type="password" class="form-control">
							</div>
							
							<button type="submit" class="btn bg-success text-white col-md-12">Register</button>
						</form>
						
						<br>Don't have an account?<a href="signup.jsp" clas="click">
						    create one</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html> --%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>

    <!-- Including CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .paint-card {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .container {
            margin-top: 5%;
        }
        .form-label {
            font-weight: bold;
        }
        .btn-register {
            background-color: #28a745;
            color: #fff;
        }
        .btn-register:hover {
            background-color: #218838;
        }
        .form-text {
            color: #6c757d;
        }
    </style>

</head>
<body>

    <!-- Include Navbar -->
    <%@include file="component/navbar.jsp"%>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="card paint-card p-4">
                    <div class="card-body">
                        <h2 class="text-center mb-4">Create an Account</h2>

                        <!-- Success and Error Messages -->
                        <c:if test="${not empty sucMsg}">
                            <div class="alert alert-success text-center">${sucMsg}</div>
                            <c:remove var="sucMsg" scope="session"/>
                        </c:if>
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger text-center">${errorMsg}</div>
                            <c:remove var="errorMsg" scope="session"/>
                        </c:if>

                        <!-- Registration Form -->
                        <form action="user_register" method="post" novalidate>
                            <div class="mb-3">
                                <label for="fullname" class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="fullname" name="fullname" required>
                                <div class="invalid-feedback">
                                    Please enter your full name.
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                                <div class="invalid-feedback">
                                    Please enter a valid email address.
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                                <div class="invalid-feedback">
                                    Please enter your password.
                                </div>
                            </div>

                            <button type="submit" class="btn btn-register w-100">Register</button>
                        </form>

                        <div class="text-center mt-3">
                            <span class="form-text">Already have an account? 
                                <a href="user_login.jsp">Login here</a>.
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JavaScript for Form Validation -->
    <script>
        (function () {
            'use strict';
            const forms = document.querySelectorAll('.needs-validation');

            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>

</body>
</html>
