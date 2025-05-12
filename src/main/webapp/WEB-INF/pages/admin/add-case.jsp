<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.advocatediary.model.CourtModel"%>
<%@ page import="com.advocatediary.model.UserModel"%>
<%@ include file="sidebar.jsp"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Case</title>
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

input[type="text"], input[type="date"], input[type="time"], textarea,
select {
	width: 100%;
	padding: 10px 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	outline: none;
}

textarea {
	resize: vertical;
	min-height: 100px;
}

input:focus, textarea:focus, select:focus {
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
	background-color: #7a1c1c;
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
			<h1 class="dashboard-title">Add New Case</h1>

			<%
			// Display error message if any
			String error = (String) request.getAttribute("error");
			if (error != null && !error.isEmpty()) {
			%>
			<p class="error"><%=error%></p>
			<%
			}
			%>

			<form action="/advocatediary/admin/add-case" method="post">
				<div class="form-group">
					<label for="caseTitle">Case Title</label>
					<input type="text" id="caseTitle" name="caseTitle" required>
				</div>

				
				<div class="form-group">
					<label for="caseType">Case Type</label>
					<input type="text" id="caseType" name="caseType" required>
				</div>

				<div class="form-group">
					<label for="clientName">Client Name</label>
					<input type="text" id="clientName" name="clientName" required>
				</div>

				<div class="form-group">
					<label for="court">Court Name</label>
					<select id="court" name="court" required>
						<option value="">-- Select Court --</option>
						<%
						// Safe handling of the 'courts' attribute
						List<CourtModel> courts = (List<CourtModel>) request.getAttribute("courts");
						if (courts != null) {
							for (CourtModel court : courts) {
						%>
						<option value="<%=court.getId()%>"><%=court.getName()%></option>
						<%
						}
						}
						%>
					</select>
				</div>

				<div class="form-group">
					<label for="hearingDate">Last Hearing Date</label>
					<input type="date" id="lastHearing" name="last_hearing" required>
				</div>

				<div class="form-group">
					<label for="hearingTime">Next Hearing Time</label>
					<input type="date" id="nextHearing" name="next_hearing">
				</div>

				<div class="form-group">
					<label for="description">Case Description</label>
					<textarea id="description" name="description" required></textarea>
				</div>

				<div class="form-group">
					<label for="status">Case Status</label>
					<select id="status" name="status" required>
						<option value="">-- Select Status --</option>
						<option value="Active">Active</option>
						<option value="Pending">Pending</option>
						<option value="Complete">Complete</option>
						<option value="Urgent">Urgent</option>
					</select>
				</div>

				<div class="form-group">
					<label for="user">Assigned User</label>
					<select id="user" name="user" required>
						<option value="">-- Select User --</option>
						<%
						// Safe handling of the 'users' attribute
						List<UserModel> users = (List<UserModel>) request.getAttribute("users");
						if (users != null) {
							for (UserModel user : users) {
						%>
						<option value="<%=user.getId()%>"><%=user.getUsername()%></option>
						<%
						}
						}
						%>
					</select>
				</div>

				<div class="form-actions">
					<button type="submit" class="action-btn">Add Case</button>
				</div>
			</form>
		</div>
	</main>
</body>
</html>
