<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminheader.jsp" %>
<%@include file="../footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messages Received</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

</head>

<style>
#messageReceived{
color:yellow;
}
h2{
	margin:30px;
}
table{
	margin:10px 23px;
    border: 1px solid rgb(110, 110, 9);
}

td,th{
    border: 1px solid rgb(110, 110, 9);
    padding: 5px 45px;
}

tr a{
    text-decoration: none;
    color: black;
}

tr i, h2 i{
    color: black;
}

.head{
border:0;
background:rgb(110, 110, 9);
color:white;
}

#remove:hover{
	color:red;
}

#plus:hover, #minus:hover{
	transform:scale(1.1);
}
</style>
<body>
    <div>
        
 <center><h2>Messages Received<i class="fa-solid fa-cart-shopping"></i></h2>
  
 <table cellspacing="0">

 
 
 
 	<tr bgcolor="white">
 		<th>ID</th>
 		<th>EMAIL</th>
 		<th>SUBJECT</th>
 		<th>BODY</th>
 	</tr>
 	
 	<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from message");
	while(rs.next()){
	
%>
    <tr>
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><%=rs.getString(4) %></td>
    </tr>
    
 <%
	}
	}
	catch(Exception e){
		System.out.println(e);
	}
	
 %> 
   
    </table>
    </center>
    </div>
</body>
</html>