<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="sidebar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
:root {
	--dark: #2c3e50;
	--gray: #7f8c8d;
	--light: #ecf0f1;
	--light-gray: #f9f9f9;
	--border: #e0e0e0;
	--secondary: #7a1c1c;
	--success: #2ecc71;
	--warning: #f39c12;
	--danger: #e74c3c;
}

* {
	margin: 0;
	padding: 0;
	font-family: 'Roboto', sans-serif;
}

.table-container {
	background-color: white;
	border-radius: 10px;
	padding: 1.5rem;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	margin-left: 300px;
}

.table-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 1.5rem;
}

.table-title {
	font-size: 1.25rem;
	font-weight: 600;
	color: var(--dark);
}

.filter-btn {
	display: flex;
	align-items: center;
	gap: 0.5rem;
	padding: 0.5rem 1rem;
	border: 1px solid var(--border);
	border-radius: 5px;
	background-color: var(--secondary);
	color: white;
	cursor: pointer;
	font-size: 0.9rem;
	text-decoration: none;
}

.users-table {
	width: 100%;
	border-collapse: collapse;
}

.users-table th, .users-table td {
	padding: 1rem;
	font-size: 0.9rem;
	border-bottom: 1px solid var(--border);
}

.users-table th {
	text-align: left;
	font-weight: 600;
	color: var(--gray);
}

.users-table tr:hover {
	background-color: var(--light-gray);
}

.badge {
	padding: 0.25rem 0.75rem;
	border-radius: 50px;
	font-size: 0.75rem;
	font-weight: 600;
	display: inline-block;
}

.badge-success {
	background-color: rgba(46, 204, 113, 0.1);
	color: var(--success);
}

.badge-danger {
	background-color: rgba(231, 76, 60, 0.1);
	color: var(--danger);
}

.actions {
	display: flex;
	gap: 0.5rem;
}

.action-btn {
	width: 32px;
	height: 32px;
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: var(--light-gray);
	color: var(--dark);
	cursor: pointer;
	border: none;
	transition: all 0.3s;
}

.action-btn:hover {
	background-color: var(--light);
}

.view-btn:hover {
	color: var(--secondary);
}

.edit-btn:hover {
	color: var(--warning);
}

.delete-btn:hover {
	color: var(--danger);
}
</style>
</head>
<body>

	<div class="table-container">
		<div class="table-header">
			<div class="table-title">All Attorneys</div>
			<div class="table-actions"
				style="display: flex; align-items: center; gap: 1rem;">
				<form action="${pageContext.request.contextPath}/admin/attorney"
					method="get" style="display: flex; gap: 0.5rem;">
					<input type="text" name="query"
						placeholder="Search by name, email or username"
						value="${param.query}"
						style="padding: 8px 12px; border-radius: 5px; border: 1px solid #ccc; font-size: 14px;">
					<button type="submit" class="filter-btn">
						<i class="fas fa-search"></i>
					</button>
				</form>
				<a href="${pageContext.request.contextPath}/admin/add-attorney"
					class="filter-btn"> <i class="fas fa-plus"></i> <span>Add
						Attorney</span>
				</a>
			</div>
		</div>


		<table class="users-table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Phone</th>
					<th>Email</th>
					<th>Address</th>
					<th>Username</th>
					<th>Is Admin</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}">
					<tr>
						<td>${user.id}</td>
						<td>${user.name}</td>
						<td>${user.phone}</td>
						<td>${user.email}</td>
						<td>${user.address}</td>
						<td>${user.username}</td>
						<td><c:choose>
								<c:when test="${user.isAdmin()==1}">
									<span class="badge badge-success">Yes</span>
								</c:when>
								<c:otherwise>
									<span class="badge badge-danger">No</span>
								</c:otherwise>
							</c:choose></td>
						<td>
							<div class="actions">

								 <a href="${pageContext.request.contextPath}/admin/edit-attorney?id=${user.id}"
                                   class="action-btn edit-btn" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/admin/delete-attorney?id=${user.id}"
                                   class="action-btn delete-btn" title="Delete"
                                   onclick="return confirm('Are you sure you want to delete this court?');">
                                    <i class="fas fa-trash"></i>
                                </a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>
