<%-- <%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>


</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hos.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hos2.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hos3.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container p-3">
		<p class="text-center fs-2 ">Key Features of our Hospital</p>

		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<img alt="" src="img/doct.jpg">
			</div>

		</div>
	</div>

	<hr>

	<div class="container p-2">
		<p class="text-center fs-2 ">Our Team</p>
		
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doc1.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Samuani Simi</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doc2.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Siva Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doc3.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Niuise Paule</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doc4.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Mathue Samuel</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

		</div>

	</div>



<%@include file="component/footer.jsp" %>

</body>
</html> --%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Index Page</title>
    <%@include file="component/allcss.jsp"%>

    <!-- Include CSS for FontAwesome and animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Enhanced card shadow and hover animations */
        .paint-card {
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease;
            border-radius: 10px;
            background-color: #fff;
        }

        .paint-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        /* Welcome section styling */
        .welcome-section {
            background-image: url('img/hospital-bg.jpg');
            background-size: cover;
            background-position: center;
            padding: 100px 0;
            color: #fff;
            text-align: center;
            position: relative;
        }

        .welcome-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }

        .welcome-text {
            position: relative;
            z-index: 2;
        }

        .welcome-text h1 {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 20px;
            animation: fadeInDown 1s ease-in-out;
        }

        .welcome-text p {
            font-size: 1.25rem;
            animation: fadeInUp 1s ease-in-out;
        }

        .btn-explore {
            margin-top: 20px;
            padding: 10px 30px;
            font-size: 1.1rem;
            border-radius: 50px;
            background-color: #4e73df;
            color: #fff;
            transition: background-color 0.3s ease-in-out;
        }

        .btn-explore:hover {
            background-color: #375a7f;
        }

        /* Feature section with animation */
        .feature-section {
            padding: 50px 0;
            background-color: #f8f9fc;
        }

        .feature-title {
            font-size: 2rem;
            color: #4e73df;
            font-weight: bold;
            animation: fadeIn 1s ease-in;
        }

        .feature-text {
            color: #6c757d;
            animation: fadeInUp 1s ease-in-out;
        }

        /* New icons for key features */
        .feature-icon {
            font-size: 2.5rem;
            color: #4e73df;
            margin-bottom: 15px;
            animation: bounceIn 1s ease-in;
        }

        /* Team card hover effect */
        .team-card {
            transition: transform 0.3s ease;
        }

        .team-card:hover {
            transform: scale(1.05);
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes bounceIn {
            from {
                opacity: 0;
                transform: scale(0.5);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>

    <!-- Welcome Section -->
    <div class="welcome-section">
        <div class="welcome-text">
            <h1>Welcome to Our Hospital</h1>
            <p>Your health is our priority. We provide the best medical care and services with top-notch facilities.</p>
            <a href="#features" class="btn btn-explore">Explore More</a>
        </div>
    </div>

    <!-- Key Features Section with enhanced animations -->
    <div id="features" class="container feature-section">
        <p class="text-center feature-title">Key Features of Our Hospital</p>
        <div class="row">
            <div class="col-md-3 text-center">
                <div class="paint-card p-4">
                    <i class="fas fa-shield-alt feature-icon"></i>
                    <p class="fs-5">100% Safety</p>
                    <p class="feature-text">We prioritize safety with the highest standards of care for our patients.</p>
                </div>
            </div>
            <div class="col-md-3 text-center">
                <div class="paint-card p-4">
                    <i class="fas fa-leaf feature-icon"></i>
                    <p class="fs-5">Clean Environment</p>
                    <p class="feature-text">Our hospital ensures a clean, hygienic, and eco-friendly environment.</p>
                </div>
            </div>
            <div class="col-md-3 text-center">
                <div class="paint-card p-4">
                    <i class="fas fa-user-md feature-icon"></i>
                    <p class="fs-5">Friendly Doctors</p>
                    <p class="feature-text">Our team of experienced doctors is always ready to help with care.</p>
                </div>
            </div>
            <div class="col-md-3 text-center">
                <div class="paint-card p-4">
                    <i class="fas fa-flask feature-icon"></i>
                    <p class="fs-5">Medical Research</p>
                    <p class="feature-text">We lead in medical research, offering cutting-edge healthcare solutions.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Team Section with enhanced UI and animations -->
    <hr>
    <div class="container p-3">
        <p class="text-center feature-title">Our Team</p>
        <div class="row">
            <div class="col-md-3">
                <div class="team-card text-center p-4 paint-card">
                    <img src="img/doc1.jpeg" alt="Samuani Simi" class="rounded-circle" style="width: 100px; height: 100px;">
                    <p class="fw-bold fs-5 mt-3">Samuani Simi</p>
                    <p class="text-muted">(CEO & Chairman)</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="team-card text-center p-4 paint-card">
                    <img src="img/doc2.jpeg" alt="Dr.Siva Kumar" class="rounded-circle" style="width: 100px; height: 100px;">
                    <p class="fw-bold fs-5 mt-3">Dr. Siva Kumar</p>
                    <p class="text-muted">(Chief Doctor)</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="team-card text-center p-4 paint-card">
                    <img src="img/doc3.jpeg" alt="Dr. Niuise Paule" class="rounded-circle" style="width: 100px; height: 100px;">
                    <p class="fw-bold fs-5 mt-3">Dr. Niuise Paule</p>
                    <p class="text-muted">(Chief Doctor)</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="team-card text-center p-4 paint-card">
                    <img src="img/doc4.jpeg" alt="Dr. Mathue Samuel" class="rounded-circle" style="width: 100px; height: 100px;">
                    <p class="fw-bold fs-5 mt-3">Dr. Mathue Samuel</p>
                    <p class="text-muted">(Chief Doctor)</p>
                </div>
            </div>
        </div>
    </div>

    <%@include file="component/footer.jsp" %>
</body>
</html>
