<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Change Address</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>

<style>
#ca{
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
        if("valid".equals(msg)){
        %>
        <h3 style="color:green">Address Updated Successfully!</h3>
        <%}
        if("invalid".equals(msg)){
            %>
             <h3 style="color:red">Something went wrong! Try again!</h3>
      <%} %> 
        
    <div class="container">
    
     <%
      try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
		while(rs.next()){
	%>
      
  
 <form action="addChangeAddressAction.jsp" method="post">
 <div class="address">
 	   <div class="inputs">
     		<label>Enter Address</label><br><br>
            <input type="text" placeholder="Enter Address" name="address"  value="<%=rs.getString(7) %>" required >
       <br></div><br>
       <div class="inputs">
            <label>Enter City</label><br><br>
            <input type="text" placeholder="Enter City" name="city"  value="<%=rs.getString(8) %>" required>
       <br></div><br>
       <div class="inputs">
            <label>Enter State</label><br><br>
            <input type="text" placeholder="Enter State" name="state"  value="<%=rs.getString(9) %>"required>
       <br></div><br>
       <div class="inputs">
     		<label>Enter Country</label><br><br>
            <input type="text" placeholder="Enter Country" name="country"  value="<%=rs.getString(10) %>" required >
       </div>
       
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