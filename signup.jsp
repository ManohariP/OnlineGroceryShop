<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Sign Up</title>
    <link rel="stylesheet" href="signup-style.css">
</head>
<body>
	<div class="container">
        <form action="signupAction.jsp" method="post">
            <input type="text" placeholder="Enter Name"  name="name" required><br><br>
            <input type="text" placeholder="Enter Email" name="email" required><br><br>
            <input type="tel" placeholder="Enter Mobile Number" name="mobileNumber" required><br><br>
            <select name="securityQuestion" id="dropdown" required>
                <option value="What was your first car">What was your first car</option>
                <option value="Which is your  favorite color">Which is your  favorite color</option>
                <option value="What is your nick name" selected>What is your nick name</option>
                <option value="Which is your favorite place">Which is your favorite place</option>
                <option value="What is your lucky number">What is your lucky number</option>
            </select><br><br>
            <input type="text" placeholder="Enter Answer" name="answer" required><br><br>
            <input type="password" placeholder="Enter Password" name="password" required><br><br>

            <input type="submit" value="SignUp" id="btn"><br><br> 
            <a href="login.jsp">Login</a>
        </form>       
    <div> <br><br>
      
    <%
    	String msg=request.getParameter("msg");
    	if("valid".equals(msg)){
    %>
    <h3 style="color:green">Successfully Registered!</h3>
    <%} 
    if("invalid".equals(msg)){
    %>
    <h3 style="color:red">Something went wrong! Try again</h3>
    <%} %>
    </div>
    </div>
    
</body>
</html>
