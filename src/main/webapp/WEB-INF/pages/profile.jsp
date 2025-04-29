<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.advocatediary.model.UserModel" %>

<%
UserModel user = (UserModel) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("/login");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

<style>
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f7fa;
    }
    .container {
        max-width: 1100px;
        margin: 50px auto;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        padding: 40px;
    }
    .top-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }
    .top-bar h2 {
        color: #333;
        font-weight: 600;
    }
    .edit-btn {
        padding: 8px 20px;
        background: #4A6CF7;
        color: #fff;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        text-decoration: none;
    }
    .profile-main {
        display: flex;
        gap: 40px;
        align-items: center;
    }
    .profile-photo {
        flex: 0 0 150px;
        text-align: center;
    }
    .profile-photo img {
        width: 120px;
        height: 120px;
        object-fit: cover;
        border-radius: 50%;
        border: 3px solid #4A6CF7;
    }
    .profile-info {
        flex: 1;
    }
    .profile-info h3 {
        margin: 0;
        font-size: 22px;
        color: #333;
    }
    .profile-info p {
        margin: 5px 0;
        color: #666;
    }
    .info-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-top: 30px;
    }
    .info-item {
        background: #f9f9f9;
        padding: 15px 20px;
        border-radius: 8px;
    }
    .info-item label {
        display: block;
        font-size: 12px;
        color: #999;
        margin-bottom: 5px;
    }
    .info-item p {
        margin: 0;
        font-size: 16px;
        color: #333;
    }
    @media (max-width: 768px) {
        .info-grid {
            grid-template-columns: 1fr;
        }
        .profile-main {
            flex-direction: column;
            text-align: center;
        }
    }
</style>

</head>
<body>

<div class="container">
    <div class="top-bar">
        <h2>Welcome, <%= user.getName() %></h2>
        <a href="editProfile.jsp" class="edit-btn">Edit Profile</a>
    </div>

    <div class="profile-main">
       
        <div class="profile-info">
            <h3><%= user.getName() %></h3>
            <p>@<%= user.getUsername() %></p>
            <p><%= user.getEmail() %></p>
            <p><%= (user.isAdmin() == 1) ? "Admin" : "User" %></p>
        </div>
    </div>

    <div class="info-grid">
        <div class="info-item">
            <label>Full Name</label>
            <p><%= user.getName() %></p>
        </div>
        <div class="info-item">
            <label>Username</label>
            <p><%= user.getUsername() %></p>
        </div>
        <div class="info-item">
            <label>Email Address</label>
            <p><%= user.getEmail() %></p>
        </div>
        <div class="info-item">
            <label>Phone Number</label>
            <p><%= user.getPhone() != null ? user.getPhone() : "Not provided" %></p>
        </div>
        <div class="info-item">
            <label>Address</label>
            <p><%= user.getAddress() != null ? user.getAddress() : "Not provided" %></p>
        </div>
        <div class="info-item">
            <label>Role</label>
            <p><%= (user.isAdmin() == 1) ? "Admin" : "User" %></p>
        </div>
    </div>
</div>

</body>
</html>
