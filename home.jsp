<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

</head>

<style>

#home{
color:yellow;
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
    padding: 5px 85px;
}

tr a{
    text-decoration: none;
    color: black;
}

tr i, h2 i{
    color: black;
}

#cart:hover{
	color:purple;
}
</style>
<body>
    <div>
        
 <center><h2>Home<i class="fa-solid fa-home"></i></h2>
 
  <%
        String msg=request.getParameter("msg");
        if("added".equals(msg)){
        %>
        <h3 style="color:green">Product added successfully</h3>
        <%}
        if("exist".equals(msg)){
        %>
         <h3 style="color:blue">Product already exist in your cart! Quantity increased</h3>
        <%} 
        if("invalid".equals(msg)){
            %>
             <h3 style="color:red">Something went wrong! Try again!</h3>
      <%} %> 
 
 <table cellspacing="0">
 	<tr bgcolor="white">
 		<th>ID</th>
 		<th>NAME</th>
 		<th>CATEGORY</th>
 		<th><i class="fa fa-inr"></i>PRICE</th>
 		<th>ADD TO CART</th>
 	</tr>

<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where active='Yes'");
	while(rs.next()){
%>
    <tr>
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
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
    </center>
    </div>
</body>

</html>
