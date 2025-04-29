<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.advocatediary.model.UserModel"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="navbar.jsp"%>
<%
UserModel user = (UserModel) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("/login");
	return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Profile</title>
<style>
/* Same styles reused */
:root {
	--primary-color: #5c4b99;
	--primary-dark: #4a3a80;
	--white-color: #ffffff;
	--dark-text: #2c3e50;
	--medium-text: #555;
	--body-bg: #f4f7fc;
	--card-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
}

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
	min-height: 100vh; disply-flex;
	align-items: center;
	justify-content: center;
	padding-top: 120px;
	background-color: var(--body-bg);
}

.admin-container {
	background-color: var(--white-color);
	border-radius: 10px;
	box-shadow: var(--card-shadow);
	padding: 30px;
	max-width: 700px;
	margin: auto;
}

.dashboard-title {
	font-size: 32px;
	color: var(--primary-dark);
	margin-bottom: 20px;
	font-weight: 600;
	text-align: center;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: var(--medium-text);
	font-weight: 500;
}

input[type="text"], input[type="tel"] {
	width: 100%;
	padding: 10px 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	outline: none;
}

input[type="text"]:focus, input[type="tel"]:focus {
	border-color: var(--primary-color);
	box-shadow: 0 0 5px rgba(92, 75, 153, 0.3);
}

.action-btn {
	display: inline-block;
	background-color: var(--primary-color);
	color: white;
	padding: 12px 25px;
	font-size: 16px;
	font-weight: 500;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none;
	transition: background-color 0.3s;
}

.action-btn:hover {
	background-color: var(--primary-dark);
}

.form-actions {
	text-align: center;
	margin-top: 30px;
}

.error {
	color: white;
	margin-top: 10px;
	text-align: center;
	background: rgb(220,20,60);
	padding: 10px 5px;
	border-radius: 5px;
}
</style>
</head>
<body>

	<main class="admin-main">
		<div class="admin-container">
			<h1 class="dashboard-title">Update Profile</h1>

			<%
			String error = (String) request.getAttribute("error");
			if (error != null && !error.isEmpty()) {
			%>
			<p class="error"><%=error%></p>
			<%
			}
			%>


			<form action="/advocatediary/update-profile" method="post">

				<div class="form-group">
					<input type="hidden" id="name" name="username"
						value="<%=user.getUsername()%>" required>
				</div>
				<div class="form-group">
					<label for="name">Name</label> <input type="text" id="name"
						name="name" value="<%=user.getName()%>" required>
				</div>
				<div class="form-group">
					<label for="email">Email</label> <input type="text" id="email"
						name="email" value="<%=user.getEmail()%>" required>
				</div>

				<div class="form-group">
					<label for="address">Address</label> <input type="text"
						id="address" name="address" value="<%=user.getAddress()%>"
						required>
				</div>

				<div class="form-group">
					<label for="phone">Phone Number</label> <input type="tel"
						id="phone" name="phone" value="<%=user.getPhone()%>" required
						>
				</div>

				<div class="form-actions">
					<button type="submit" class="action-btn">Save Changes</button>
				</div>
			</form>
		</div>
	</main>

</body>
</html>
