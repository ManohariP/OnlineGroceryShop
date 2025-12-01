<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="adminheader-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>

<style>
nav a{
	text-decoration:none;
}

nav i:hover{
	cursor:pointer;
	transform:scale(1.2);
}
nav li:hover{
	color:yellow;
}
</style>
<body>
<%
String email=(String)session.getAttribute("email");
%>
<header><h1>Online Grocery Shop</h1></header>

    <nav>
        <ul type="none">
            <a href="addNewProduct.jsp"><li id="new">Add New Product <i class="fa-solid fa-circle-plus"></i></li></a>
            <a href="allProductEditProduct.jsp"><li id="edit">All Products & Edit Products <i class="fa-solid fa-pen-to-square"></i></li></a>
            <a href="messagesRecieved.jsp"><li id="messageReceived">Messages Received <i class="fa-solid fa-message"></i></li></a>
            <a href="ordersReceived.jsp"><li id="ordersReceived">Orders Received <i class="fa-solid fa-box-archive"></i></li></a>
            <a href="cancelOrder.jsp"><li id="cancel">Cancel Orders <i class="fa-solid fa-circle-xmark"></i></li></a>
            <a href="deliveredOrder.jsp"><li id="delivered">Delivered Orders <i class="fa-solid fa-truck-ramp-box"></i></li></a>
            <a href="../logout.jsp"><li>Logout <i class="fa-solid fa-arrow-right-from-bracket"></i></li></a>
        </ul>
    </nav>
</body>
</html>