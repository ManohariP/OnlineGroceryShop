<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminheader.jsp" %>
<%@include file="../footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders Received</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

</head>

<style>
#ordersReceived{
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
    font-size:11px;
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
        
 <center><h2>Orders Received<i class="fa-solid fa-box-archive"></i></h2>
 
  <%
        String msg=request.getParameter("msg");
        if("cancel".equals(msg)){
        %>
        <h3 style="color:blue">Order Cancelled Successfully!</h3>
        <%}
        if("delivered".equals(msg)){
        %>
         <h3 style="color:green">Successfully Updated!</h3>
        <%} 
        if("wrong".equals(msg)){
            %>
             <h3 style="color:red">Something went wrong! Try again!</h3>
      <%} 
   %> 
      
 
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
 		<th>CANCEL ORDER <i class="fa fa-window-close"></i></th>
 		<th>ORDER DELIVERED <i class="fa fa-dolly"></i></th>
 		
 	</tr>
 	
 	 <%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not null and cart.status='processing'");
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
        <td><a href="cancelOrderAction.jsp?id=<%=rs.getString("product_id")%> &email=<%=rs.getString("email") %>">Cancel<i class="fa fa-window-close"></i></a></td>
   		<td><a href="deliveredOrdersAction.jsp?id=<%=rs.getString("product_id")%> &email=<%=rs.getString("email") %>" >Delivered<i class="fa fa-dolly"></i></a></td>
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