<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Courts</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        @import
	url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap')
	;

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
	margin-bottom: 2rem;
	margin-left: 300px;
	margin-right: 30px;
}

.table-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 1.5rem;
	margin-top: 20px;
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
}

.cases-table {
	width: 100%;
	border-collapse: collapse;
}

.cases-table th {
	text-align: left;
	padding: 1rem;
	font-size: 0.85rem;
	font-weight: 600;
	color: var(--gray);
	border-bottom: 1px solid var(--border);
}

.cases-table td {
	padding: 1rem;
	border-bottom: 1px solid var(--border);
	font-size: 0.9rem;
}

.cases-table tr:last-child td {
	border-bottom: none;
}

.cases-table tr:hover {
	background-color: var(--light-gray);
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
        <div class="table-title">All Courts</div>
        <div class="table-actions" style="display: flex; align-items: center; gap: 1rem;">
            <form action="${pageContext.request.contextPath}/admin/court" method="get" style="display: flex; gap: 0.5rem;">
                <input type="text" name="query" placeholder="Search by name or address" value="${param.query}"
                       style="padding: 8px 12px; border-radius: 5px; border: 1px solid #ccc; font-size: 14px;">
                <button type="submit" class="filter-btn">
                    <i class="fas fa-search"></i>
                </button>
            </form>
            <a href="${pageContext.request.contextPath}/admin/add-court" class="filter-btn">
                <i class="fas fa-plus"></i> <span>Add Court</span>
            </a>
        </div>
    </div>

    <table class="cases-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Court Name</th>
            <th>Location</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty courtList}">
                <c:forEach var="court" items="${courtList}" varStatus="status">
                    <tr>
                        <td>${court.id}</td>
                        <td>${court.name}</td>
                        <td>${court.location}</td>
                        <td>
                            <div class="actions">
                                <a href="${pageContext.request.contextPath}/admin/edit-court?id=${court.id}"
                                   class="action-btn edit-btn" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/admin/delete-court?id=${court.id}"
                                   class="action-btn delete-btn" title="Delete"
                                   onclick="return confirm('Are you sure you want to delete this court?');">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4" style="text-align: center;">No courts found.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>

</body>
</html>
