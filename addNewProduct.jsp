<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminheader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Product</title>
    <link rel="stylesheet" href="adminhome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>
<style>
#new{
color:yellow;
}
h3{
	font-size:30px;
	display:flex;
	align-items:center;
	justify-content:center;
	padding:20px;
}

</style>
<body>
    <div class="container">
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
 	<h3 style="color:green">Product added succesfully</h3>
 <%}
 if("wrong".equals(msg)){
 %>
 	<h3 style="color:red">Something went wrong! Try again</h3>
 <%} %>
    <%
    int id=1;
    try{
    	Connection con=ConnectionProvider.getCon();
    	Statement st=con.createStatement();
    	ResultSet rs=st.executeQuery("select max(id) from product");
    	while(rs.next()){
    		id=rs.getInt(1);
    		id+=1;
    	}
    }
    catch(Exception e){
    	
    }
    %>

        <h4>Product ID: <%out.println(id); %></h4>
        <form action="addNewProductAction.jsp">
        <input type="hidden" name="id" value="<%out.println(id);%>">
            <input type="text" placeholder="Enter Product Name" name="name" required>
            <input type="text" placeholder="Enter Category" name="category" required>
            <input type="text" placeholder="Enter Price" name="price" required>
            <select name="active" id="">
                <option value="Yes">Yes</option>
                <option value="No">No</option>
            </select>

            <input type="submit" value="Add" id="btn">
        </form>
    </div>

</body>
</html>