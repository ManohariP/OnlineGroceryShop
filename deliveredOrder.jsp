<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminheader.jsp" %>
<%@include file="../footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivered Orders</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

</head>

<style>
#delivered{
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
    padding: 5px 10px;
    font-size:12px;
}

td{
	font-size:15px;
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
        
 <center><h2>Delivered Orders<i class="fa-solid fa-truck-ramp-box"></i></h2>
 
 <table cellspacing="0">
 
 	<tr bgcolor="white">
 		<th>MOBILE NUMBER</th>
 		<th>PRODUCT NAME</th>
 		<th>QUANTITY</th>
 		<th><i class="fa fa-inr"></i>SUBTOTAL</th>
 		<th>ADDRESS</th>
 		<th>CITY</th>
 		<th>STATE</th>
 		<th>COUNTRY</th>
 		<th>ORDER DATE</th>
 		<th>EXPECTED DELIVERY DATE</th>
 		<th>PAYMENT METHOD</th>
 		<th>T-ID</th>
 		<th>STATUS</th>
 		
 		
 	</tr>
 	
 	 <%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not null and cart.status='delivered'");
	while(rs.next()){
%>
    <tr>
   
        <td><%=rs.getString("mobileNumber") %></td>
        <td><%=rs.getString("name") %></td>
        <td><%=rs.getString("quantity") %></td>
        <td><i class="fa fa-inr"></i><%=rs.getString("total") %></td>
        <td><%=rs.getString("address") %></td>
        <td><%=rs.getString("city") %></td>
        <td><%=rs.getString("state") %></td>
        <td><%=rs.getString("country") %></td>
        <td><%=rs.getString("orderDate") %></td>
        <td><%=rs.getString("deliveryDate") %></td>
        <td><%=rs.getString("paymentMethod") %></td>
        <td><%=rs.getString("transactionId") %></td>
        <td><%=rs.getString("status") %></td>
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