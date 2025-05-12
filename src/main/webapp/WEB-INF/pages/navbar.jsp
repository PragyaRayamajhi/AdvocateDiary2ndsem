<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="com.advocatediary.model.UserModel"%>
<%
UserModel usernav = (UserModel) session.getAttribute("user");
if (usernav == null) {
	response.sendRedirect("/advocatediary/login");
	return;
}
%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/navbar.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/global.css">


<header>
	<nav>
		<div class="logo">
			<span class="logo-icon">⚖️</span> Advocate Diary
		</div>

		<ul class="nav-links">
			<li><a href="${pageContext.request.contextPath}/">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/about">About
					Us</a></li>
			<li><a href="${pageContext.request.contextPath}/contact">Contact
					Us</a></li>
					<li><a href="${pageContext.request.contextPath}/faq">FAQ
					</a></li>
					<li><a href="${pageContext.request.contextPath}/services">Services
					</a></li>
			<%
			if (usernav.isAdmin() == 1) { 
			%>
			<li><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
			<%
			} else {
			%>
			<li><a href="${pageContext.request.contextPath}/user/dashboard">Dashboard</a></li>
			<%
			}
			%>

			<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
		</ul>

		<a href="/layer/register.jsp">
			<button class="cta-button">Free Trial</button>
		</a>
	</nav>
</header>
