<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message Us</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>

<style>
#message{
color:yellow;
}
h2{
	margin:30px;
}

input:not(#search){
    width: 580px;
    height: 30px;
    padding: 25px;
    color: black;
    background:white;
    border:0px;
}

textarea{
	width: 580px;
    height: 200px;
    padding: 25px;
    color: black;
    background:white;
    border:0px;
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
if("valid".equals(msg)){
    %>
    <h3 style="color:green">Message sent successfully. Our team will contact you soon!</h3>
    <%}
    if("invalid".equals(msg)){
        %>
         <h3 style="color:red">Something went wrong! Try again!</h3>
  <%} %> 
        
    <div class="container">
      
    <form action="messageUsAction.jsp" method="post">
 
 <div class="address">
 	   <div class="inputs">
            <input type="text" placeholder="Subject" name="subject"  required >
       <br></div><br>
       <div class="inputs" >
           <textarea name="body" placeholder="Enter your message" required ></textarea>
       <br></div><br>
       
</div>
        
        
       <div class="inputs">     
       		
            <input type="submit" value="Send" id="btn">
       </div>
</div>
        </form>
        <br><br><br>
    </center>
    </div>
    
  
</body>
</html>