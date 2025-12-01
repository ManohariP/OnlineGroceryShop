<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
<title>Bill</title>

</head>
<style>
*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

body{
    background: linear-gradient(to bottom, rgb(252, 252, 4),rgba(255, 255, 255, 0.53));
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    width: 100%;
    height: 100%;
	min-height:100vh;
}

header {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
    /* background:linear-gradient(to bottom, rgb(0, 0, 0),rgba(255, 255, 255, 0.53)); */
    background: rgb(110, 110, 9);
    color: white;
 
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

tr i{
    color: black;
}

.head{
border:0;
background:rgb(110, 110, 9);
color:white;
}

.details {
	display:grid;
	grid-template-columns:repeat(3,auto);
	grid-gap:30px;
	margin-top:25px;
}

hr{
	border:1px solid black;
}
 .buttons {
	display:grid;
	grid-template-columns:repeat(2,auto);
	grid-gap:155px;
	margin:85px;
	margin-top:15px;
	padding:15px;
}
  .buttons  a button{
    background: yellow;
    padding-top: 15px;
    font-weight: bolder;
    font-size: 15px;
    cursor: pointer;
    border:0px;
    border-radius:25px;
    padding:15px;
    width:600px;
}

.buttons button:hover{
    background: rgb(182, 182, 70);
}
</style>
<body>
	 <header><h1>Online Grocery Shop</h1></header>
	       
 <center>
 
 <%
 String email=session.getAttribute("email").toString();
 int total=0;
try{
	 int slno=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	while(rs1.next()){
		total=rs1.getInt(1);
	}
	
	ResultSet rs=st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	while(rs.next()){
%>
 <div class=details>
 <h3>Name: <%=rs.getString(1) %></h3>
 <h3>Mobile Number: <%=rs.getString(20) %> </h3>
 <h3>Email:<%out.println(email); %> </h3>
 <h3>Order Date:<%=rs.getString(21) %> </h3>
 <h3>Expected Delivery: <%=rs.getString(22) %></h3>
 <h3>Payment Method:<%=rs.getString(23) %> </h3>
 <h3>Transaction ID: <%=rs.getString(24) %></h3>
 <h3>Address: <%=rs.getString(16) %></h3>
 <h3>City: <%=rs.getString(17) %></h3>
 <h3>State:<%=rs.getString(18) %> </h3>
 <h3>Country:<%=rs.getString(19) %> </h3>
 
 </div>
 <br>
 <hr>
 <%break;} %>
 
 <h2>Product Details</h2>
 <table cellspacing="0">

 
 	<tr bgcolor="white">
 		<th>SL.NO</th>
 		<th>PRODUCT NAME</th>
 		<th>CATEGORY</th>
 		<th><i class="fa fa-inr"></i>PRICE</th>
 		<th>QUANTITY</th>
 		<th>SUB TOTAL</th>
 	</tr>
    <tr>
    <%ResultSet rs2=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
	while(rs2.next()){
		slno+=1;
		%>
	
        <td><%out.println(slno); %></td>
        <td><%=rs2.getString(17) %></td>
        <td><%=rs2.getString(18) %></td>
        <td><i class="fa fa-inr"></i><%=rs2.getString(19) %></td>
        <td><%=rs2.getString("quantity")%></td>
        <td><i class="fa fa-inr"></i><%=rs2.getString(5) %></td>
    </tr>  
 
          <%
	}
}
catch(Exception e){
	
}

    %>

 </table>
     <h2>Total:<i class="fa fa-inr"></i><%out.println(total); %></h2>
  
  
  <div class="buttons">
  		<a href="continueShopping.jsp"><button type="submit">Continue Shopping</button></a>
  		<a onclick="window.print();"><button type="submit">Print</button></a>
  </div>
  
</body>
</html>