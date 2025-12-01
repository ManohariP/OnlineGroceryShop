<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
    <link rel="stylesheet" href="signup-style.css">
</head>
<body>
	<div class="container">
        <form action="loginAction.jsp" method="post">
            <input type="email" placeholder="Enter Email"  name="email" required><br><br>
            <input type="password" placeholder="Enter Password" name="password" required><br><br>

            <input type="submit" value="Login" id="btn"><br><br>
            <a href="signup.jsp">SignUp</a><br>
            <a href="forgotPassword.jsp">Forgot Password?</a><br>
        </form>
        
        <%
        String msg=request.getParameter("msg");
        if("notexist".equals(msg)){
        %>
        <h3 style="color:red">Incorrect email or Password</h3>
        <%}
        if("invalid".equals(msg)){
        %>
         <h3 style="color:red">Something went wrong! Try Again</h3>
        <%} %>
    </div>
</body>
</html>