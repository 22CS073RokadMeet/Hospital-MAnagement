<%-- <%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reschedule Appointment</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
		Appointment ap = dao.getAppointmentById(id);
	%>

	<h2>Reschedule Appointment for <%=ap.getFullName()%></h2>
	<form action="../RescheduleAppointment" method="post">
		<input type="hidden" name="id" value="<%=ap.getId()%>">
		<label>New Time: </label>
		<input type="time" name="newTime" required>
		<button type="submit">Reschedule</button>
	</form>
</body>
</html>
 --%>
 
 <%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Reschedule Appointment</title>
    <%@include file="../component/allcss.jsp"%>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h2 {
            color: #007bff;
        }
    </style>
</head>
<body>
    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <%@include file="navbar.jsp"%>

    <div class="container">
        <div class="card">
            <div class="card-body">
                <%
                    String idParam = request.getParameter("id");
                    if (idParam != null && !idParam.isEmpty()) {
                        try {
                            int id = Integer.parseInt(idParam);
                            AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                            Appointment ap = dao.getAppointmentById(id);
                            
                            if (ap != null) {
                %>
                                <h2>Reschedule Appointment for <%= ap.getFullName() %></h2>
                                <form action="../RescheduleAppointment" method="post">
                                    <input type="hidden" name="id" value="<%= ap.getId() %>">
                                    <div class="form-group">
                                        <label for="newTime">New Time:</label>
                                        <input type="time" name="newTime" id="newTime" class="form-control" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Reschedule</button>
                                </form>
                <%
                            } else {
                %>
                                <div class="alert alert-danger">Appointment not found.</div>
                <%
                            }
                        } catch (NumberFormatException e) {
                %>
                            <div class="alert alert-danger">Invalid appointment ID.</div>
                <%
                        }
                    } else {
                %>
                        <div class="alert alert-danger">Appointment ID is missing.</div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
 