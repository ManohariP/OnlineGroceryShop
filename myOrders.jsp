<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

</head>

<style>
#orders{
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
    padding: 5px 15px;
}

tr a{
    text-decoration: none;
    color: black;
}

tr i{
    color: black;
}

h2 i{
	color:black;
	}

.head{
border:0;
background:rgb(110, 110, 9);
color:white;
}
</style>

<body>
    <div>
        
 <center><h2>My Orders<i class="fa-solid fa-basket-shopping"></i></h2>
    
 
 <table cellspacing="0">

 	
 	<tr bgcolor="white">
 		<th>SL.NO</th>
 		<th>PRODUCT NAME</th>
 		<th>CATEGORY</th>
 		<th><i class="fa fa-inr"></i>PRICE</th>
 		<th>QUANTITY</th>
 		<th>SUB TOTAL</th>
 		<th>ORDER DATE</th>
 		<th>EXPECTED DELIVERY DATE</th>
 		<th>PAYMENT METHOD</th>
 		<th>STATUS</th>
 	</tr>


<%

int slno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not null");
	while(rs.next()){
		slno+=1;
%>

    <tr>
        <td><%out.println(slno); %></td>
        <td><%=rs.getString(17) %></td>
        <td><%=rs.getString(18) %></td>
        <td><i class="fa fa-inr"></i><%=rs.getString(19) %></td>
        <td><%=rs.getString(3)%></td>
        <td><i class="fa fa-inr"></i><%=rs.getString(5) %></td>
   		<td><%=rs.getString(11)%></td>
   		<td><%=rs.getString(12)%></td>
   		<td><%=rs.getString(13)%></td>
   		<td><%=rs.getString(15)%></td>
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