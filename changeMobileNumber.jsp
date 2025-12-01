<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Mobile Number</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>

<style>
#cm{
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
if("done".equals(msg)){
    %>
    <h3 style="color:green">Your Mobile Number Changed Successfully!</h3>
    <%}
    if("wrong".equals(msg)){
        %>
         <h3 style="color:red">Your Password is Wrong!</h3>
  <%} %> 
        
    <div class="container">
      
    <form action="changeMobileNumberAction.jsp" method="post">
 
 <div class="address">
 	   <div class="inputs">
     		<label>Enter your new mobile number</label><br><br>
            <input type="tel" placeholder="Enter your new mobile number" name="mobileNumber"  required >
       <br></div><br>
       <div class="inputs">
            <label>Enter Password (For Security)</label><br><br>
            <input type="password" placeholder="Enter Password" name="password"  required>
       <br></div><br>
       
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