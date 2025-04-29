
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
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Host+Grotesk:ital,wght@0,300..800;1,300..800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100..900;1,100..900&family=Space+Grotesk:wght@300..700&display=swap')
	;

:root {
	--primary-color: #5c4b99;
	--primary-dark: #4a3a80;
	--white-color: #ffffff;
	--dark-text: #2c3e50;
	--medium-text: #555;
	--light-text: #777;
	--accent-color: #7e57c2;
	--card-bg: #ffffff;
	--body-bg: #f4f7fc;
	--border-light: #e0e0e0;
	--navbar-height: 70px;
	--footer-height: 60px;
	--card-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
	--card-hover-shadow: 0 8px 25px rgba(92, 75, 153, 0.15);
}

/* Basic Reset & Body Styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Roboto', sans-serif;
	background-color: var(--body-bg);
	color: var(--dark-text);
}

.admin-main {
	min-height: 100vh;
	padding-top: 90px;
	max-width: 900px;
	margin-left: 600px;
}

.admin-container {
	background-color: var(--white-color);
	border-radius: 10px;
	box-shadow: var(--card-shadow);
	padding: 30px;
}

.dashboard-title {
	font-size: 32px;
	color: var(--primary-dark);
	margin-bottom: 20px;
	font-weight: 600;
}

.welcome-message {
	font-size: 18px;
	color: var(--medium-text);
	margin-bottom: 30px;
}

.dashboard-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 30px;
}

/* User Info Card */
.dashboard-card {
	border-radius: 10px;
	padding: 25px;
	text-align: center;
}

.card-icon {
	font-size: 40px;
	color: var(--primary-dark);
	margin-bottom: 10px;
}

.card-title {
	font-size: 24px;
	color: var(--primary-dark);
	margin-bottom: 15px;
	font-weight: 500;
}

.info-list {
	list-style: none;
	padding: 0;
	margin: 0 0 20px 0;
	text-align: left;
	font-size: 16px;
	color: var(--medium-text);
	width: 100%;
	display: grid;
	grid-template-columns: repeat(2, 1fr); /* 2 equal-width columns */
	gap: 10px 20px; /* row gap 10px, column gap 20px */
	align-items: center;
	justify-content: center;
}

.info-list li {
	margin-bottom: 12px;
}

.role-badge {
	background-color: #fbbf24;
	color: var(--primary-dark);
	padding: 3px 8px;
	border-radius: 5px;
	font-weight: bold;
	font-size: 14px;
}

.card-actions {
	margin-top: 20px;
}

.action-link {
	color: var(--primary-color);
	text-decoration: none;
	font-weight: 500;
	font-size: 16px;
}

.action-link:hover {
	text-decoration: underline;
}

.action-btn {
	display: inline-block;
	padding: 10px 20px;
	margin-top: 10px;
	font-size: 16px;
	background-color: var(--primary-color);
	color: white;
	border-radius: 5px;
	text-decoration: none;
}

.action-btn:hover {
	background-color: var(--primary-dark);
}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
