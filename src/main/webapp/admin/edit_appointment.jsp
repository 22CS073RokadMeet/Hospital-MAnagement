<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Appointment</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h3>Edit Appointment</h3>
            </div>
            
            
            
            <div class="card-body">
                <%
                    // Fetching appointment details by ID
                    int id = Integer.parseInt(request.getParameter("id"));
                    AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                    Appointment ap = dao.getAppointmentById(id);

                    if (ap == null) {
                        out.println("<h3>Appointment Not Found!</h3>");
                    } else {
                %>

                <!-- Form for editing appointment details -->
                <form action="../EditApp" method="post">
                    <input type="hidden" name="id" value="<%=ap.getId()%>">
                    
                    <div class="mb-3">
                        <label for="fullName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" value="<%=ap.getFullName()%>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="gender" class="form-label">Gender</label>
                        <input type="text" class="form-control" id="gender" name="gender" value="<%=ap.getGender()%>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="age" class="form-label">Age</label>
                        <input type="number" class="form-control" id="age" name="age" value="<%=ap.getAge()%>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="appoinDate" class="form-label">Appointment Date</label>
                        <input type="text" class="form-control" id="appoinDate" name="appoinDate" value="<%=ap.getAppoinDate()%>" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="<%=ap.getEmail()%>" required>
                    </div>

                    <div class="mb-3">
                        <label for="phNo" class="form-label">Mobile Number</label>
                        <input type="text" class="form-control" id="phNo" name="phNo" value="<%=ap.getPhNo()%>" required>
                    </div>

                    <div class="mb-3">
                        <label for="diseases" class="form-label">Diseases</label>
                        <input type="text" class="form-control" id="diseases" name="diseases" value="<%=ap.getDiseases()%>" required>
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <textarea class="form-control" id="address" name="address" required><%=ap.getAddress()%></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="status" class="form-label">Status</label>
                        <input type="text" class="form-control" id="status" name="status" value="<%=ap.getStatus()%>" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Update Appointment</button>
                </form>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
