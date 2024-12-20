<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<c:if test="${empty adminObj }">
	<c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>
	
	<div class="container p-5">
	<p class="text-center">Admin Dashboard</p>
	
		<c:if test="${not empty sucMsg}">
			<p class="text-center text-success fs-3">${sucMsg}</p>
			<c:remove var="sucMsg" scope="session" />
		</c:if>
		<c:if test="${not empty errorMsg}">
			<p class="text-center text-success fs-3">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		
		<div class="row">
		
			<div class="col-md-4">
				<div class="card paint-card ">
					<div class="card-body text-center text-success">
					<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor<br>5
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card paint-card ">
					<div class="card-body text-center text-success">
					<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							User<br>43
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card paint-card ">
					<div class="card-body text-center text-success">
					<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment<br>453
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card paint-card ">
					<div class="card-body text-center text-success">
					<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist<br>34
						</p>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>