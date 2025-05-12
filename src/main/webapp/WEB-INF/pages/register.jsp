<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
   <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/global.css">
	<style>
	 .right {
    flex: 1;
    background: url('<%= request.getContextPath() %>/resources/image/justice.jpg') no-repeat center center;
    background-size: cover;
    min-height: 100vh;
}
	</style>
</head>
<body>

<div class="left">
    <div class="register-box">
        <h2>REGISTER YOUR ACCOUNT</h2>
        
        <%
			String error = (String) request.getAttribute("error");
			if (error != null && !error.isEmpty()) {
			%>
			<p class="error"><%=error%></p>
			<%
			}
			%>

        <form method="post" action="register">
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" name="name" id="name" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address:</label>
                <input type="email" name="email" id="email" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" name="address" id="address" required>
            </div>

            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" name="username" id="username" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="text" name="phone" id="phone" required>
            </div>

            <input type="submit" value="Register" class="submit-btn">
        </form>

        <div class="signup-link">
           <p>Don't have an account? <a href="${pageContext.request.contextPath}/login">Sign up now</a></p>
        
        </div>

        <p class="error">
            <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
        </p>
        <p class="success">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
        </p>
    </div>
</div>

<div class="right"></div>

</body>
</html>
