<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <style>
  h2{
	margin:30px;
}

table{
	margin:20px 53px;
    border: 1px solid rgb(110, 110, 9);
}

td,th{
    border: 1px solid rgb(110, 110, 9);
    padding: 5px 85px;
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
        
 <center><h2>Home</h2>
 
 <%
int z=0;
try{
	String search=request.getParameter("search");
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes'");
	while(rs.next()){
		z=1;
%>

 <table cellspacing="0">
 	<tr bgcolor="white">
 		<th>ID</th>
 		<th>NAME</th>
 		<th>CATEGORY</th>
 		<th><i class="fa fa-inr"></i>PRICE</th>
 		<th>ADD TO CART</th>
 	</tr>
    <tr style="background: rgb(227, 238, 10)">
         <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><i class="fa fa-inr"></i><%=rs.getString(3) %></td>
        <td><%=rs.getString(4) %></td>
        <td ><a href="addToCartAction.jsp?id=<%=rs.getInt(1)%>" id="cart">Add to cart<i class="fa-solid fa-cart-shopping"></i></a></td>
    </tr>
   <%
   }
}
    
   catch(Exception e){
   System.out.println(e);
   }
   %>
   
    </table>
    <%if(z==0) {%>
   	<h1 style="color:blue; font-size:3rem;">Nothing to show</h1>
   	<%} %>
    </center>
    </div>

</body>
</html>