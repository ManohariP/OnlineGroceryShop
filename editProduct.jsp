<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminheader.jsp" %>
<%@include file="../footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>
<style>

button a{
text-decoration: none;
font-size:25px;
color:rgb(110, 110, 9);
}

button i{
color:rgb(110, 110, 9);
}

button{
margin:30px;
background:transparent;
border:0;
cursor:pointer;
}

button i:hover{
	color:black;
}
</style>
<body>
    <div class="container">
 <button><a href="allProductEditProduct.jsp"><i class="fa fa-arrow-circle-left"></i>Back</a></button>
      <%
      String id=request.getParameter("id");
      try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from product where id='"+id+"'");
		while(rs.next()){
	%>
	
        <form action="editProductAction.jsp" method="post">
            <input type="hidden" name="id" value="<%out.println(id);%>">
            <input type="text" placeholder="Enter Product Name" name="name" value="<%=rs.getString(2) %>" required >
            <input type="text" placeholder="Enter Category" name="category" value="<%=rs.getString(3) %>" required>
            <input type="text" placeholder="Enter Price" name="price" value="<%=rs.getString(4) %>" required>
            <select name="active" id="" >
                <option value="Yes">Yes</option>
                <option value="No">No</option>
            </select>

            <input type="submit" value="Save" id="btn">
        </form>
    </div>
    
    <%}
		}
	catch(Exception e){
	System.out.println(e);
	}%>

</body>
</html>