<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminheader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Products and Edit Products</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
<style>
#edit{
color:yellow;
}
h3{
	font-size:30px;
	display:flex;
	align-items:center;
	justify-content:center;
	padding:20px;
}

h2{
	margin:30px;
}

table{
	margin:20px 53px;
    border: 1px solid rgb(110, 110, 9);
}

td,th{
    border: 1px solid rgb(110, 110, 9);
    padding: 5px 55px;
}

tr a{
    text-decoration: none;
    color: black;
}

tr i{
    color: black;
}
</style>
</head>
<body>
<div>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
 	<h3 style="color:green">Product added succesfully</h3>
 <%}
if("updated".equals(msg)){
%>
 	<h3 style="color:green">Product updated succesfully</h3>
 <%}
 if("wrong".equals(msg)){
 %>
 	<h3 style="color:red">Something went wrong! Try again</h3>
 <%} %>
  <center>
 <h2>All Products and Edit Products</h2>
  
 <table cellspacing="0">
 	<tr bgcolor="white">
 		<th>ID</th>
 		<th>NAME</th>
 		<th>CATEGORY</th>
 		<th><i class="fa fa-inr"></i>PRICE</th>
 		<th>STATUS</th>
 		<th>EDIT<i class="fa-solid fa-pen-to-square"></i></th>
 	</tr>
 	<%
 	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from product");
		while(rs.next()){
	%>
		<tr>
 		<td><%=rs.getString(1) %></td>
 		<td><%=rs.getString(2) %></td>
 		<td><%=rs.getString(3) %></td>
 		<td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
 		<td><%=rs.getString(5) %></td>
 		<td><a href="editProduct.jsp?id=<%=rs.getString(1) %>">Edit<i class="fa-solid fa-pen"></i></a></td>
 	</tr>
 	<%}
		}
	catch(Exception e)
 	{
		System.out.println(e);
 	}
	%>
 	
 </table>
 </center>
 </div>
</body>
</html>