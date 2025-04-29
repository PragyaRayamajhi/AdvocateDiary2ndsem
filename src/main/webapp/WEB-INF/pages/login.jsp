<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/global.css">
    <style>
        .left {
            flex: 1;
            background: url('${pageContext.request.contextPath}/resources/image/justice.jpg') no-repeat center center;
            background-size: cover;
            min-height: 100vh;
        }
    </style>
</head>
<body>

<div class="left"></div>

<div class="right">
    <div class="login-box">
        <h2>LOGIN TO YOUR ACCOUNT</h2>
        
        <%
			String error = (String) request.getAttribute("error");
			if (error != null && !error.isEmpty()) {
			%>
			<p class="error"><%=error%></p>
			<%
			}
			%>

        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" name="username" id="username" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" required>
            </div>

            <input type="submit" value="LOGIN" class="submit-btn">
        </form>


        <div class="signup-link">
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Sign up now</a></p>
        </div>
    </div>
</div>

</body>
</html>  