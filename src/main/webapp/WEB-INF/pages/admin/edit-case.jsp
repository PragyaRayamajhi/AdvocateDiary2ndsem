<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.advocatediary.model.CaseModel, com.advocatediary.model.CourtModel, com.advocatediary.model.UserModel" %>
<%@ page import="java.util.List" %>
<%@ include file="sidebar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Case</title>
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
        <h1 class="dashboard-title">Edit Case</h1>

        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
           <p class="error"><%=error%></p>
        <% } %>

        <form action="/advocatediary/admin/edit-case" method="post">
            <%
            CaseModel caseModel = (CaseModel) request.getAttribute("caseModel");
            %>
            <input type="hidden" name="caseId" value="<%=caseModel.getId()%>"/>

            <div class="form-group">
                <label>Case Title</label>
                <input type="text" name="caseTitle" value="<%=caseModel.getTitle()%>" required>
            </div>

            <div class="form-group">
                <label>Client Name</label>
                <input type="text" name="clientName" value="<%=caseModel.getClientName()%>" required>
            </div>

            <div class="form-group">
                <label>Case Type</label>
                <input type="text" name="caseType" value="<%=caseModel.getCaseType()%>" required>
            </div>

            <div class="form-group">
                <label>Status</label>
                <select name="status" required>
                    <option value="Pending" <%= "Pending".equals(caseModel.getStatus()) ? "selected" : "" %>>Pending</option>
                    <option value="Active" <%= "Active".equals(caseModel.getStatus()) ? "selected" : "" %>>Active</option>
                    <option value="Complete" <%= "Complete".equals(caseModel.getStatus()) ? "selected" : "" %>>Complete</option>
                    <option value="Urgent" <%= "Urgent".equals(caseModel.getStatus()) ? "selected" : "" %>>Urgent</option>
                </select>
            </div>

            <div class="form-group">
                <label>Last Hearing Date</label>
                <input type="date" name="last_hearing" value="<%=caseModel.getLastHearing()%>" required>
            </div>

            <div class="form-group">
                <label>Next Hearing Date</label>
                <input type="date" name="next_hearing" value="<%=caseModel.getNextHearing()%>">
            </div>

            <div class="form-group">
                <label>Description</label>
                <textarea name="description"><%=caseModel.getDescription()%></textarea>
            </div>

            <div class="form-group">
                <label>Court</label>
                <select name="court" required>
                    <%
                        List<CourtModel> courts = (List<CourtModel>) request.getAttribute("courts");
                        for (CourtModel court : courts) {
                    %>
                    <option value="<%=court.getId()%>" <%=court.getId() == caseModel.getCourtId() ? "selected" : ""%>><%=court.getName()%></option>
                    <% } %>
                </select>
            </div>

            <div class="form-group">
                <label>User</label>
                <select name="user" required>
                    <%
                        List<UserModel> users = (List<UserModel>) request.getAttribute("users");
                        for (UserModel user : users) {
                    %>
                    <option value="<%=user.getId()%>" <%=user.getId() == caseModel.getUserId() ? "selected" : ""%>><%=user.getUsername()%></option>
                    <% } %>
                </select>
            </div>

            <div class="form-actions">
                <button type="submit" class="action-btn">Update Case</button>
            </div>
        </form>
    </div>
</main>
</body>
</html>
