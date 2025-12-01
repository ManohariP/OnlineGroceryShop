<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="admin/adminheader-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

<style>
button{
	background:transparent;
	border:0;
}
input{
	width:200px;
	padding-left:20px;
	padding-top:2px;
	padding-bottom:2px;
}
form{
display:inline;
margin-left:100px;
}

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
</head>
<body>
	<%
	String email=session.getAttribute("email").toString();
	%>
    <header><h1>Online Grocery Shop</h1></header>
    <nav>
        <ul type="none">
            <li style="color:white" ><i class="fa-solid fa-circle-user"></i><%out.println(email);%></li>
            <a href="home.jsp"><li id="home">Home<i class="fa-solid fa-home"></i></li></a>
            <a href="myCart.jsp"><li id="mycart">My Cart<i class="fa-solid fa-cart-shopping"></i></li></a>
            <a href="myOrders.jsp"><li id="orders">My Orders<i class="fa-solid fa-basket-shopping"></i></li></a>
            <a href="changeDetails.jsp"><li>Change Details<i class="fa-solid fa-pen-to-square"></i></li></a>
            <a href="messageUs.jsp"><li id="message">Message Us <i class="fa-solid fa-message"></i></li></a>
            <a href="logout.jsp"><li>Logout <i class="fa-solid fa-arrow-right-from-bracket"></i></li></a>
        	<form action="searchHome.jsp" method="post">
        		<li><input type="text" placeholder="Search" name="search" id="search">
        		<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button></li>
        	</form>
        </ul>
        <a></a>
    </nav>
 
</body>
</html>