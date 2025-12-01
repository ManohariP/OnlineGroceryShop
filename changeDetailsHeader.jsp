
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
    <link rel="stylesheet" href="admin/adminheader-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

<style>


a{
	text-decoration:none;
	color:white;
}

nav i:hover{
	cursor:pointer;
	transform:scale(1.2);
}
nav a:hover,li:hover{
	color:yellow;
}
</style>
</head>
<body>
	<%
	String email=session.getAttribute("email").toString();
	%>
    <header><h1>Change Details<i class="fa-solid fa-pen-to-square"></i></h1></header>
    <nav>
        <ul type="none">
        	<a href="home.jsp"><i class="fa fa-arrow-circle-left"></i>Back</a>
            <li style="color:white"><i class="fa-solid fa-circle-user"></i><%out.println(email);%></li>
            <a href="changePassword.jsp"><li id="cp">Change Password <i class="fa fa-key"></i></li></a>
            <a href="addChangeAddress.jsp"><li id="ca">Add or Change Address<i class="fa fa-map-marker-alt"></i></li></a>
            <a href="changeSecurityQuestion.jsp"><li id="csq">Change Security Question<i class="fa fa-repeat"></i></li></a>
            <a href="changeMobileNumber.jsp"><li id="cm">Change Mobile Number <i class="fa fa-phone"></i></li></a>
        </ul>
        <a></a>
    </nav>
 
</body>
</html>