<%-- 
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="img/doct.jpg">
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form class="row g-3" action="appAppointment" method="post">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									required type="number" class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" class="form-control" required
									name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" required type="number" class="form-control"
									name="phno">
							</div>


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									required type="text" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label> <select
									required class="form-control" name="doct">
									<option value="">--select--</option>

									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>




								</select>
							</div>

							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${empty userObj }">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp"%>

</body>
</html> --%>

<%-- <%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Appointment</title>
    <%@include file="component/allcss.jsp"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .paint-card {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        .backImg {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
            url("img/hospital.jpg");
            height: 30vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .backImg h1 {
            color: white;
            font-size: 3rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        }
        .form-control:focus {
            border-color: #4e73df;
            box-shadow: 0 0 5px rgba(78, 115, 223, 0.5);
        }
        .btn-success {
            background-color: #4e73df;
            border: none;
        }
        .btn-success:hover {
            background-color: #375a7f;
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>

    <div class="container-fluid backImg">
        <h1>User Appointment</h1>
    </div>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card paint-card p-4">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Book Your Appointment</h3>
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger text-center">${errorMsg}</div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <div class="alert alert-success text-center">${succMsg}</div>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>
                        <form action="appAppointment" method="post">

                            <input type="hidden" name="userid" value="${userObj.id}">

                            <div class="mb-3">
                                <label for="fullname" class="form-label">Full Name</label>
                                <input required type="text" class="form-control" name="fullname" id="fullname">
                            </div>

                            <div class="mb-3">
                                <label for="gender" class="form-label">Gender</label>
                                <select class="form-control" name="gender" id="gender" required>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="age" class="form-label">Age</label>
                                <input required type="number" class="form-control" name="age" id="age">
                            </div>

                            <div class="mb-3">
                                <label for="appoint_date" class="form-label">Appointment Date</label>
                                <input type="date" class="form-control" name="appoint_date" id="appoint_date" required>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input required type="email" class="form-control" name="email" id="email">
                            </div>

                            <div class="mb-3">
                                <label for="phno" class="form-label">Phone No</label>
                                <input maxlength="10" required type="number" class="form-control" name="phno" id="phno">
                            </div>

                            <div class="mb-3">
                                <label for="diseases" class="form-label">Diseases</label>
                                <input required type="text" class="form-control" name="diseases" id="diseases">
                            </div>

                            <div class="mb-3">
                                <label for="doctor" class="form-label">Doctor</label>
                                <select required class="form-control" name="doct" id="doctor">
                                    <option value="">--select--</option>
                                    <%
                                    DoctorDao dao = new DoctorDao(DBConnect.getConn());
                                    List<Doctor> list = dao.getAllDoctor();
                                    for (Doctor d : list) {
                                    %>
                                    <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="address" class="form-label">Full Address</label>
                                <textarea required name="address" class="form-control" id="address" rows="3"></textarea>
                            </div>

                            <c:if test="${empty userObj}">
                                <a href="user_login.jsp" class="btn btn-success w-100">Submit</a>
                            </c:if>

                            <c:if test="${not empty userObj}">
                                <button type="submit" class="btn btn-success w-100">Submit</button>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="mb-3">
    <label for="appoint_time" class="form-label">Appointment Time</label>
    <input type="time" class="form-control" name="appoint_time" id="appoint_time" required>
</div>

    <%@include file="component/footer.jsp"%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 --%>
 
 
 <%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h1>Book an Appointment</h1>

        <form action="appAppointment" method="post">
            <input type="hidden" name="userid" value="${userObj.id}">

            <!-- User Details -->
            <div class="mb-3">
                <label for="fullname" class="form-label">Full Name</label>
                <input required type="text" class="form-control" name="fullname" id="fullname">
            </div>

            <div class="mb-3">
                <label for="gender" class="form-label">Gender</label>
                <select required class="form-control" name="gender" id="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="age" class="form-label">Age</label>
                <input required type="text" class="form-control" name="age" id="age">
            </div>

            <!-- Appointment Date -->
            <div class="mb-3">
                <label for="appoint_date" class="form-label">Appointment Date</label>
                <input required type="date" class="form-control" name="appoint_date" id="appoint_date" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
            </div>

            <!-- Appointment Time Slot (Loaded via AJAX) -->
            <!-- Appointment Time Slot -->
<!-- <div class="mb-3">
    <label for="appoint_time" class="form-label">Appointment Time Slot</label>
    <select required class="form-control" name="appoint_time" id="appoint_time">
        <option value="">--select time slot--</option>
    </select>
</div> -->

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input required type="email" class="form-control" name="email" id="email">
            </div>

            <div class="mb-3">
                <label for="phno" class="form-label">Phone Number</label>
                <input required type="text" class="form-control" name="phno" id="phno">
            </div>

            <div class="mb-3">
                <label for="diseases" class="form-label">Diseases</label>
                <input required type="text" class="form-control" name="diseases" id="diseases">
            </div>

            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <textarea required class="form-control" name="address" id="address" rows="3"></textarea>
            </div>

            <!-- Doctor Selection -->
            <div class="mb-3">
                <label for="doctor" class="form-label">Doctor</label>
                <select required class="form-control" name="doctor_id" id="doctor">
                    <option value="">--select--</option>
                    <%
                        DoctorDao dao = new DoctorDao(DBConnect.getConn());
                        List<Doctor> doctorList = dao.getAllDoctor();
                        for (Doctor d : doctorList) {
                    %>
                    <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div class="mb-3">
    <label for="appoint_time" class="form-label">Appointment Time Slot</label>
    <select required class="form-control" name="appoint_time" id="appoint_time">
        <option value="">--select time slot--</option>
    </select>
</div>

            <button type="submit" class="btn btn-primary">Book Appointment</button>
        </form>
    </div>

    <script>
        // AJAX to load available time slots when a doctor and date are selected
        $(document).ready(function() {
            $('#appoint_date, #doctor').change(function() {
                var date = $('#appoint_date').val();
                var doctorId = $('#doctor').val();
                if (date && doctorId) {
                    $.ajax({
                        url: 'getAvailableSlot', // This will be the servlet to get available slots
                        method: 'GET',
                        data: {doctor_id: doctorId, appoint_date: date},
                        success: function(response) {
                            $('#appoint_time').html(response); // response will be the options for time slots
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
 