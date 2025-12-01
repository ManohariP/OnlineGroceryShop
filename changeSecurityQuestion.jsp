<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Security Question</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>

<style>
#csq{
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
        <h3 style="color:green">Your Security Question Changed Successfully!</h3>
        <%}
        if("wrong".equals(msg)){
            %>
             <h3 style="color:red">Your Password is Wrong!</h3>
      <%} %> 
        
    <div class="container">
    
     <%
      try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
		while(rs.next()){
	%>
      
  
 <form action="changeSecurityQuestionAction.jsp" method="post">
 <div class="address">
 	   <div class="inputs">
     		<label>Select Your Security Question</label><br><br>
            <select name="securityQuestion" id="dropdown" required>
                <option value="What was your first car">What was your first car</option>
                <option value="Which is your  favorite color">Which is your  favorite color</option>
                <option value="What is your nick name" selected>What is your nick name</option>
                <option value="Which is your favorite place">Which is your favorite place</option>
                <option value="What is your lucky number">What is your lucky number</option>
            </select>
       <br></div><br>
       <div class="inputs">
            <label>Enter Your New Answer</label><br><br>
            <input type="text" placeholder="Enter Your New Answer" name="newAnswer"  required>
       <br></div><br>
       <div class="inputs">
            <label>Enter Password (For Security)</label><br><br>
            <input type="password" placeholder="Enter Password" name="password"required>
       <br></div><br>
  
       
</div>
       
       <div class="inputs">     
       	
            <input type="submit" value="Save" id="btn">
       </div>
</div>        
         <%}
		}
	catch(Exception e){
	System.out.println(e);
	}%>
        <br><br><br>
    </form>
    </center>
   
    </div>
    
  
</body>
</html>