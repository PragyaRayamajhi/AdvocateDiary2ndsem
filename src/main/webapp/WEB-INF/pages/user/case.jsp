<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cases</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap');

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

        .badge {
            padding: 0.3rem 0.6rem;
            border-radius: 12px;
            font-size: 0.75rem;
            font-weight: 500;
            color: white;
            display: inline-block;
        }

        .badge-warning {
            background-color: var(--warning);
        }

        .badge-primary {
            background-color: var(--success);
        }

        .badge-danger {
            background-color: var(--danger);
        }

        .dropdown {
            position: relative;
        }

        .dropdown-menu {
            position: absolute;
            top: 120%;
            right: 0;
            background-color: white;
            border: 1px solid var(--border);
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: none;
            list-style: none;
            padding: 0.5rem 0;
            z-index: 1000;
            width: 150px;
        }

        .dropdown-menu li {
            padding: 0.5rem 1rem;
            cursor: pointer;
            font-size: 14px;
            color: var(--dark);
            transition: background 0.3s;
        }

        .dropdown-menu li:hover {
            background-color: var(--light-gray);
        }
    </style>
</head>
<body>

<div class="table-container">
    <div class="table-header">
        <div class="table-title">My Cases</div>
        <form action="${pageContext.request.contextPath}/user/case" method="get" style="display: flex; gap: 0.5rem;">
            <input type="text" name="query" placeholder="Search not supported here" disabled
                   style="padding: 8px 12px; border-radius: 5px; border: 1px solid #ccc; font-size: 14px;">
            <button type="submit" class="filter-btn" disabled>
                <i class="fas fa-search"></i>
            </button>
        </form>
    </div>

    <c:if test="${not empty error}">
        <div style="color:red; margin-bottom: 10px;">${error}</div>
    </c:if>

    <table class="cases-table">
        <thead>
            <tr>
                <th>Case ID</th>
                <th>Title</th>
                <th>Client Name</th>
                <th>Case Type</th>
                <th>Status</th>
                <th>Last Hearing</th>
                <th>Next Hearing</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty caseList}">
                    <c:forEach var="caseData" items="${caseList}">
                        <tr data-status="${caseData.status}">
                            <td>${caseData.id}</td>
                            <td>${caseData.title}</td>
                            <td>${caseData.clientName}</td>
                            <td>${caseData.caseType}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${caseData.status == 'Active'}">
                                        <span class="badge badge-warning">Active</span>
                                    </c:when>
                                    <c:when test="${caseData.status == 'Pending'}">
                                        <span class="badge badge-primary">Pending</span>
                                    </c:when>
                                    <c:when test="${caseData.status == 'Complete'}">
                                        <span class="badge badge-primary">Complete</span>
                                    </c:when>
                                    <c:when test="${caseData.status == 'Urgent'}">
                                        <span class="badge badge-danger">Urgent</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge" style="background-color: gray;">${caseData.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${caseData.lastHearing}</td>
                            <td>${caseData.nextHearing}</td>
                            <td>${caseData.description}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="8" style="text-align: center; color: #999; padding: 1rem;">
                            No cases found.
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

</body>
</html>