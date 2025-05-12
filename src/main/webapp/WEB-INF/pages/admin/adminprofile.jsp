
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.advocatediary.model.UserModel"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="sidebar.jsp"%><!DOCTYPE html>
<%
UserModel user = (UserModel) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("/advocatediary/login");
	return;
}
%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/adminprofile.css">
</head>
<body>

	<main class="admin-main">
		<div class="admin-container">
			<h1 class="dashboard-title">User Profile</h1>
			<p class="welcome-message">
				Welcome back,
				<%=user.getName()%>!
			</p>

			<div class="dashboard-grid">
				<div class="dashboard-card admin-info-card">
					<div class="card-icon">
						<i class="fas fa-id-badge"></i>
					</div>
					<h2 class="card-title">Your Information</h2>
					<ul class="info-list">
						<li><strong>Username:</strong> @<%=user.getUsername()%></li>
						<li><strong>Name:</strong> <%=user.getName()%></li>
						<li><strong>Address:</strong> <%=user.getAddress()%></li>
						<li><strong>Phone:</strong> <%=user.getPhone()%></li>
						<li><strong>Role:</strong> <span class="role-badge"> <%=(user.isAdmin() == 1) ? "Admin" : "User"%></span></li>
					</ul>
					<div class="card-actions">
						<a href="${pageContext.request.contextPath}/update-profile"
							class="action-link">Update Your Profile</a>
					</div>
				</div>
			</div>
		</div>
	</main>

</body>
</html>
