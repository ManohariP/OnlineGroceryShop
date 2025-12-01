<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>

<style>
#cp{
color:yellow;
}
h2{
	margin:30px;
}

input:not(#search), select{
    width: 580px;
    height: 30px;
    padding: 25px;
    color: black;
    background:white;
    border:0px;
}

select{
	padding:5px;
}

.address{
	margin:40px;
}

.inputs #btn{
    background: yellow;
    font-weight: bolder;
    font-size: 20px;
    cursor: pointer;
    border: 0px;
    padding:25px;
    padding-top:15px;
}

#btn:hover{
    background: rgb(182, 182, 70);
}

hr{
border:0px;
border-bottom: 2px solid black;
}

</style>

<body>
 <div >       
 <center>
<br><br>
<%
        String msg=request.getParameter("msg");
        if("notMatch".equals(msg)){
        %>
        <h3 style="color:red">New Password and Confirm Password does not match!</h3>
        <%}
        if("wrong".equals(msg)){
        %>
         <h3 style="color:red">Your old Password is wrong!</h3>
        <%} 
        if("done".equals(msg)){
            %>
             <h3 style="color:green">Password changed successfully!</h3>
      <%}
        if("invalid".equals(msg)){
            %>
             <h3 style="color:red">Something went wrong! Try again!</h3>
      <%} %> 
        
    <div class="container">
      
    <form action="changePasswordAction.jsp" method="post">
 
 <div class="address">
 	   <div class="inputs">
     		<label>Enter Old Password</label><br><br>
            <input type="password" placeholder="Enter Old Password" name="oldPassword"  required >
       <br></div><br>
       <div class="inputs">
            <label>Enter New Password</label><br><br>
            <input type="password" placeholder="Enter New Password" name="newPassword"  required>
       <br></div><br>
       <div class="inputs">
            <label>Enter Confirm Password</label><br><br>
            <input type="password" placeholder="Enter Confirm Password" name="confirmPassword"  required>
       <br></div>
       
</div>
        
        
       <div class="inputs">     
       		
            <input type="submit" value="Save" id="btn">
       </div>
</div>
        </form>
        <br><br><br>
    </center>
    </div>
    
  
</body>
</html>