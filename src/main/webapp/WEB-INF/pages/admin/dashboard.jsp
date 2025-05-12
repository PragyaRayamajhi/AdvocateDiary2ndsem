<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="sidebar.jsp"%>
<%@ page import="com.advocatediary.model.UserModel"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/dashboard.css">
</head>

<body>

	<div class="container">
		<div class="main-content">
			<div class="topbar">
				<div class="toggle-sidebar">
					<i class="fas fa-bars"></i>
				</div>

				<div class="search-bar">
					<span class="search-icon"><i class="fas fa-search"></i></span> <input
						type="text"
						placeholder="Search for cases, clients, or documents...">
				</div>

				<div class="user-menu">
					<div class="notification">
						<i class="fas fa-bell"></i>
						<div class="notification-badge">5</div>
					</div>
					<%
					UserModel userdas = (UserModel) session.getAttribute("user");
					if (userdas == null) {
						response.sendRedirect("/advocatediary/login");
						return;
					}

					String fullName = userdas.getName();
					String[] parts = fullName.trim().split("\\s+");
					String initials = "U";
					if (parts.length >= 2) {
						initials = parts[0].substring(0, 1).toUpperCase() + parts[1].substring(0, 1).toUpperCase();
					} else if (parts.length == 1) {
						initials = parts[0].substring(0, 1).toUpperCase();
					}
					%>

					<div class="user-profile">
						<div class="avatar"><%=initials%></div>
						<div class="user-info">
							<div class="user-name"><%=fullName%></div>
							<div class="user-role">
								<%=userdas.isAdmin() == 1 ? "Administrator" : "User"%>
							</div>
						</div>
					</div>


				</div>
			</div>

			<div class="dashboard-content">
				<div class="page-title">
					<h1 class="title">Dashboard</h1>
					<div class="action-buttons">
						<button class="btn btn-outline">
							<i class="fas fa-download"></i> Export
						</button>
						<button class="btn btn-primary">
							<i class="fas fa-plus"></i> New Case
						</button>
					</div>
				</div>

				<div class="stats-grid">
					<div class="stat-card active-cases">
						<div class="stat-icon">
							<i class="fas fa-briefcase"></i>
						</div>
						<div class="stat-info">
							<div class="stat-value">${activeCases}</div>
							<div class="stat-label">Active Cases</div>
							<div class="stat-change increase">
								<i class="fas fa-arrow-up"></i> 12% from last month
							</div>
						</div>
					</div>

					<div class="stat-card pending-hearings">
						<div class="stat-icon">
							<i class="fas fa-calendar-alt"></i>
						</div>
						<div class="stat-info">
							<div class="stat-value">${pendingHearings}</div>
							<div class="stat-label">Pending Hearings</div>
							<div class="stat-change increase">
								<i class="fas fa-arrow-up"></i> 5% from last month
							</div>
						</div>
					</div>

					<div class="stat-card completed-cases">
						<div class="stat-icon">
							<i class="fas fa-check-circle"></i>
						</div>
						<div class="stat-info">
							<div class="stat-value">${completedCases}</div>
							<div class="stat-label">Completed Cases</div>
							<div class="stat-change increase">
								<i class="fas fa-arrow-up"></i> 8% from last month
							</div>
						</div>
					</div>

					<div class="stat-card urgent-matters">
						<div class="stat-icon">
							<i class="fas fa-exclamation-circle"></i>
						</div>
						<div class="stat-info">
							<div class="stat-value">${urgentMatters}</div>
							<div class="stat-label">Urgent Matters</div>
							<div class="stat-change decrease">
								<i class="fas fa-arrow-down"></i> 3% from last month
							</div>
						</div>
					</div>
				</div>

				<div class="table-container">
					<div class="table-header">
						<h2 class="table-title">Recent Cases</h2>
						<div class="table-actions">
							<div class="filter-dropdown">
								<button class="filter-btn">
									<i class="fas fa-filter"></i> Filter
								</button>
							</div>
							<div class="filter-dropdown">
								<button class="filter-btn">
									<i class="fas fa-sort"></i> Sort
								</button>
							</div>
						</div>
					</div>

					<div class="table-responsive">
						<table class="cases-table">
							<thead>
								<tr>
									<th>Case Details</th>
									<th>Attorney</th>
									<th>Case Type</th>
									<th>Court</th>
									<th>Status</th>
									<th>Last Hearing</th>
									<th>Next Hearing</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="case-title">Smith vs. Johnson Inc.</div>
										<div class="case-client">Client: Robert Smith</div>
									</td>
									<td>
										<div class="lawyer-name">
											<div class="lawyer-avatar">AL</div>
											<span>Amy Lawrence</span>
										</div>
									</td>
									<td><span class="badge badge-primary">Civil</span></td>
									<td>Superior Court, Los Angeles</td>
									<td><span class="badge badge-warning">In Progress</span></td>
									<td>
										<div class="hearing-date">
											<span class="date">Apr 10, 2025</span> <span class="time">10:30
												AM</span>
										</div>
									</td>
									<td>
										<div class="hearing-date">
											<span class="date">Apr 22, 2025</span> <span class="time">11:00
												AM</span>
										</div>
									</td>
									<td>
										<div class="actions">
											<button class="action-btn view-btn">
												<i class="fas fa-eye"></i>
											</button>
											<button class="action-btn edit-btn">
												<i class="fas fa-edit"></i>
											</button>
											<button class="action-btn delete-btn">
												<i class="fas fa-trash"></i>
											</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>
