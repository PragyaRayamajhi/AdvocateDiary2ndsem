<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/sidebar.css">
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
			<li class="menu-item"><a
				href="${pageContext.request.contextPath}/admin/case"
				style="color: white; text-decoration: none;"> <span
					class="menu-icon"><i class="fas fa-briefcase"></i></span> <span
					class="menu-text">Cases</span>
			</a></li>
			<li class="menu-item"><a
				href="${pageContext.request.contextPath}/admin/attorney"
				style="color: white; text-decoration: none;"><span
					class="menu-icon"><i class="fas fa-user-tie"></i></span> <span
					class="menu-text">Attorneys</span></a></li>

			<!-- <li class="menu-item"><span class="menu-icon"><i
					class="fas fa-users"></i></span> <span class="menu-text">Clients</span></li>
			-->
			<li class="menu-item"><a
				href="${pageContext.request.contextPath}/admin/court"
				style="color: white; text-decoration: none;"><span
					class="menu-icon"><i class="fas fa-gavel"></i></span> <span
					class="menu-text">Courts</span></a></li>
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
		<ul class="menu-items">
			<li class="menu-item"><a
				href="${pageContext.request.contextPath}/" class="logout-link"><span
					style="" class="logout-icon"><i class="fas fa-home"></i></span><span
					class="menu-text">Home</span> </a></li>

			<li class="menu-item"><a href="${pageContext.request.contextPath}/logout" class="logout-link">
					<span class="logout-icon"><i class="fas fa-sign-out-alt"></i></span>
					<span class="menu-text">Logout</span>
			</a></li>
		</ul>
	</div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const menuItems = document.querySelectorAll(".menu-item");

    menuItems.forEach(item => {
      item.addEventListener("click", function () {
        // Remove active class from all items
        menuItems.forEach(i => i.classList.remove("active"));
        // Add active class to the clicked item
        this.classList.add("active");
      });
    });
  });
</script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
