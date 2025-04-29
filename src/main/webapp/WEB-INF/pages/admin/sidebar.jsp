<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');

:root {
	--primary: #7a1c1c;
	--secondary: #c0392b;
}

.sidebar {
	width: 250px;
	background-color: var(--primary);
	color: white;
	height: 100vh;
	position: fixed;
	display: flex;
	flex-direction: column;
	font-family: 'Roboto', sans-serif;
}

.sidebar-header {
	padding: 1.5rem;
	display: flex;
	align-items: center;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.logo-icon {
	margin-right: 10px;
	font-size: 1.5rem;
}

.logo-text {
	font-size: 1.25rem;
	font-weight: bold;
}

.sidebar-menu {
	flex: 1;
	overflow-y: auto;
	padding: 1rem 0;
}

.menu-category {
	font-size: 0.8rem;
	text-transform: uppercase;
	padding: 1rem 1.5rem 0.5rem;
	color: rgba(255, 255, 255, 0.5);
	font-weight: 600;
}

.menu-items {
	list-style: none;
	padding: 0;
	margin: 0;
}

.menu-item {
	padding: 0.75rem 1.5rem;
	display: flex;
	align-items: center;
	color: rgba(255, 255, 255, 0.8);
	cursor: pointer;
	border-left: 3px solid transparent;
	transition: all 0.3s;
}

.menu-item.active {
	background-color: rgba(255, 255, 255, 0.1);
	border-left: 3px solid var(--secondary);
	color: white;
}

.menu-item:hover {
	background-color: rgba(255, 255, 255, 0.1);
}

.menu-icon {
	margin-right: 10px;
	width: 20px;
	text-align: center;
}

.logout-section {
	padding: 1rem 1.5rem;
	border-top: 1px solid rgba(255, 255, 255, 0.1);
	height:90px;
	display:flex;
	flex-direction:column;
	justify-content:space-between;
	
}

.logout-link {
	display: flex;
	align-items: center;
	color: rgba(255, 255, 255, 0.8);
	text-decoration: none;
	cursor: pointer;
	transition: background-color 0.3s;
}

.logout-link:hover {
	background-color: rgba(255, 255, 255, 0.1);
	color: white;
}

.logout-icon {
	margin-right: 10px;
	width: 20px;
	text-align: center;
}
</style>

<div class="sidebar">
	<div class="sidebar-header">
		<div class="logo-icon">
			<i class="fas fa-balance-scale"></i>
		</div>
		<div class="logo-text">Advocate Diary</div>
	</div>

	<div class="sidebar-menu">
		<div class="menu-category">Main</div>
		<ul class="menu-items">
			<li class="menu-item active"><a
				href="${pageContext.request.contextPath}/admin/dashboard"
				style="color: white; text-decoration: none;"> <span
					class="menu-icon"><i class="fas fa-tachometer-alt"></i></span> <span
					class="menu-text">Dashboard</span></a></li>
			<li class="menu-item"><span class="menu-icon"><i
					class="fas fa-briefcase"></i></span> <span class="menu-text">Cases</span>
			</li>
			<li class="menu-item"><span class="menu-icon"><i
					class="fas fa-users"></i></span> <span class="menu-text">Clients</span></li>
			<li class="menu-item"><span class="menu-icon"><i
					class="fas fa-user-tie"></i></span> <span class="menu-text">Attorneys</span>
			</li>
			<li class="menu-item"><span class="menu-icon"><i
					class="fas fa-gavel"></i></span> <span class="menu-text">Courts</span></li>
		</ul>

		<div class="menu-category">Management</div>
		<ul class="menu-items">
			<li class="menu-item"><span class="menu-icon"><i
					class="fas fa-calendar-alt"></i></span> <span class="menu-text">Calendar</span>
			</li>
			<li class="menu-item"><span class="menu-icon"><i
					class="fas fa-file-alt"></i></span> <span class="menu-text">Documents</span>
			</li>
			<li class="menu-item"><span class="menu-icon"><i
					class="fas fa-tasks"></i></span> <span class="menu-text">Tasks</span></li>
			<li class="menu-item"><span class="menu-icon"><i
					class="fas fa-dollar-sign"></i></span> <span class="menu-text">Billing</span>
			</li>
		</ul>

		<div class="menu-category">Settings</div>
		<ul class="menu-items">
			<li class="menu-item"><a
				href="${pageContext.request.contextPath}/admin/profile"
				style="color: white; text-decoration: none;"> <span
					class="menu-icon"><i class="fas fa-user-cog"></i></span> <span
					class="menu-text">Profile</span></a></li>
			<li class="menu-item"><span class="menu-icon"><i
					class="fas fa-cog"></i></span> <span class="menu-text">Settings</span></li>
			<li class="menu-item"><span class="menu-icon"><i
					class="fas fa-question-circle"></i></span> <span class="menu-text">Help</span>
			</li>
		</ul>
	</div>

	<div class="logout-section">
			<a href="${pageContext.request.contextPath}/" class="logout-link"><span style=""
				class="logout-icon"><i class="fas fa-home"></i></span><span class="menu-text">Home</span> </a>

		
		<a href="/logout" class="logout-link"> <span class="logout-icon"><i
				class="fas fa-sign-out-alt"></i></span> <span class="menu-text">Logout</span>
		</a>
	</div>
</div>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
