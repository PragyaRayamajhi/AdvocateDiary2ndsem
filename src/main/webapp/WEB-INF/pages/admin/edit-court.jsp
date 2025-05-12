<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Court</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Roboto', sans-serif;
	background-color: #f4f7fc;
	color: #2c3e50;
}

.admin-main {
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding-top: 100px;
	background-color: #f4f7fc;
	margin-left: 250px;
}

.admin-container {
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
	padding: 30px;
	max-width: 800px;
	width: 100%;
	margin: auto;
}

.dashboard-title {
	font-size: 28px;
	color: #7a1c1c;
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
	color: #555;
	font-weight: 500;
}

input[type="text"] {
	width: 100%;
	padding: 10px 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	outline: none;
}

input:focus {
	border-color: #5c4b99;
	box-shadow: 0 0 5px rgba(92, 75, 153, 0.3);
}

.action-btn {
	display: inline-block;
	background-color: #7a1c1c;
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
	background-color: #5c4b99;
}

.form-actions {
	text-align: center;
	margin-top: 30px;
}

.error {
	color: white;
	margin-top: 10px;
	text-align: center;
	background: crimson;
	padding: 10px;
	border-radius: 5px;
}
</style>
</head>
<body>

	<main class="admin-main">
		<div class="admin-container">
			<h1 class="dashboard-title">Edit Court</h1>

			<%
				String error = (String) request.getAttribute("error");
				if (error != null && !error.isEmpty()) {
			%>
			<p class="error"><%= error %></p>
			<%
				}
			%>

			<form action="${pageContext.request.contextPath}/admin/edit-court" method="post">
				<input type="hidden" name="id" value="${court.id}">

				<div class="form-group">
					<label for="name">Court Name</label>
					<input type="text" id="name" name="name" value="${court.name}" required>
				</div>

				<div class="form-group">
					<label for="location">Location</label>
					<input type="text" id="location" name="location" value="${court.location}" required>
				</div>

				<div class="form-actions">
					<button type="submit" class="action-btn">Save Changes</button>
				</div>
			</form>
		</div>
	</main>

</body>
</html>
