<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Cart</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

</head>

<style>

#mycart{
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

h2 i{
    color: black;
}
tr i{
	color:black;
}

#total i{
	color:white;
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

#proceed{
	color:white;
}

#proceed:hover{
	color:yellow;
}
</style>
<body>
 
        
 <center><h2>My Cart<i class="fa-solid fa-cart-shopping"></i></h2>
 
  <%
        String msg=request.getParameter("msg");
        if("notPossible".equals(msg)){
        %>
        <h3 style="color:blue">There is only one quantity! so click on remove!</h3>
        <%}
        if("inc".equals(msg)){
        %>
         <h3 style="color:green">Quantity increased successfully!</h3>
        <%} 
        if("dec".equals(msg)){
            %>
             <h3 style="color:green">Quantity decreased successfully!</h3>
      <%} 
        if("removed".equals(msg)){
            %>
             <h3 style="color:green">Product successfully removed!</h3>
      <%} %> 
      
 
 <table cellspacing="0">

 <%
 int total=0;
 int slno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is null");
	while(rs1.next()){
		total=rs1.getInt(1);
	}


%>
 	<tr class="head">
 		<th id="total">TOTAL: <i class="fa fa-inr"></i><%out.println(total); %></th>
 		<%
 		if(total>0){
		%>
 		<th ><a href="addressPaymentForOrder.jsp" id="proceed">PROCEED TO ORDER</a></th>
 		<%} %> 		
 	</tr>
 
 	<tr bgcolor="white">
 		<th>SL.NO</th>
 		<th>PRODUCT NAME</th>
 		<th>CATEGORY</th>
 		<th><i class="fa fa-inr"></i>PRICE</th>
 		<th>QUANTITY</th>
 		<th>SUB TOTAL</th>
 		<th>REMOVE<i class="fa fa-trash"></i></th>
 	</tr>

<%
	ResultSet rs=st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is null");
	while(rs.next()){
%>
    <tr>
    <%slno+=1; %>
        <td><%out.println(slno); %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
        <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class="fa fa-minus-circle" id="minus"></i></a><%=rs.getString(8) %><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class="fa fa-plus-circle" id="plus"></i></a></td>
        <td><i class="fa fa-inr"></i><%=rs.getString(10) %></td>
   		<td><a href="removeFromCart.jsp?id=<%=rs.getInt("product_id")%>" id="remove" >Remove<i class="fa fa-trash"></i></a></td>
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
    
</body>
</html>