<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Details</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

<style>
center{
margin:40px 400px;
}
</style>
</head>

<body>
    <div class="container">
      <%
      try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
		while(rs.next()){
	%>
	
	<center>
 <h3>Name: <%=rs.getString(1) %></h3><br><hr><br>
 <h3>Email: <%=rs.getString(2) %> </h3><br><hr><br>
 <h3>Mobile Number: <%=rs.getString(3) %> </h3><br><hr><br>
 <h3>Security Question: <%=rs.getString(4)%> </h3><br><hr><br>
    </center>
    <%}
		}
	catch(Exception e){
	System.out.println(e);
	}%>

</body>
</html>