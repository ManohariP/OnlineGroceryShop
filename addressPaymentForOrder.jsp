<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>addressPaymentForOrder</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

</head>

<style>

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

tr i{
    color: black;
}

.head{
border:0;
background:rgb(110, 110, 9);
color:white;
}
.head i{
	color:white;
}

input:not(#search), select{
    width: 580px;
    height: 30px;
    padding: 25px;
    color: black;
    background:white;
    border:0px;
}

select{
	padding:5px;
}

.address{
	display:grid;
	grid-template-columns:repeat(2,auto);
	grid-gap:20px;
}

.inputs #btn{
    background: yellow;
    font-weight: bolder;
    font-size: 20px;
    cursor: pointer;
    border: 0px;
    padding:25px;
    padding-top:15px;
}

#btn:hover{
    background: rgb(182, 182, 70);
}

hr{
border:0px;
border-bottom: 2px solid black;
}

#back{
color:white;
}

#back:hover{
color:yellow;
}

</style>

<body>

<script>
	if(window.history.forward(1) !=null)
		window.history.forward(1);
</script>
 <div >
        
 <center>
 
 <table cellspacing="0">

 <%
 email=session.getAttribute("email").toString();
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
 			<th><a href="myCart.jsp" id="back"><i class="fa fa-arrow-circle-left"></i>Back</a></th>
 		<th>TOTAL: <i class="fa fa-inr"></i><%out.println(total); %></th>
 				
 	</tr>
 
 	<tr bgcolor="white">
 		<th>SL.NO</th>
 		<th>PRODUCT NAME</th>
 		<th>CATEGORY</th>
 		<th><i class="fa fa-inr"></i>PRICE</th>
 		<th>QUANTITY</th>
 		<th>SUB TOTAL</th>
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
        <td><%=rs.getString("quantity")%></td>
        <td><i class="fa fa-inr"></i><%=rs.getString(10) %></td>
    </tr>

    <%} 
	ResultSet rs2=st.executeQuery("select * from users where email='"+email+"'");
	while(rs2.next()){
	
    %>

   
    </table>
    
    <div class="container">
      
    <form action="addressPaymentForOrderAction.jsp" method="post">
 
 <div class="address">
 	   <div class="inputs">
     		<label>Enter Address</label><br><br>
            <input type="text" placeholder="Enter Address" name="address" value="<%=rs2.getString(7)%>" required >
       <br></div>
       <div class="inputs">
            <label>Enter City</label><br><br>
            <input type="text" placeholder="Enter City" name="city" value="<%=rs2.getString(8)%>" required>
       <br></div>
       <div class="inputs">
            <label>Enter State</label><br><br>
            <input type="text" placeholder="Enter State" name="state" value="<%=rs2.getString(9)%>" required>
       <br></div>
       <div class="inputs"> 
            <label>Enter Country</label><br><br>
            <input type="text" placeholder="Enter Country" name="country" value="<%=rs2.getString(10)%>" required>
        <br>    
      </div>
</div>
         <br>
         <hr>
        <br>
<div class="address">
       <div class="inputs">
      		<label>Select payment method</label><br><br>
			<select name="paymentMethod" id="">
                <option value="Online Payment">Online Payment</option>
                <option value="Cash On Delivery">Cash On Delivery</option>
            </select>
      </div>
       <div class="inputs">
            <label>Enter Transaction ID</label><br><br>
            <input type="text" placeholder="Enter Transaction ID" name="transactionId">  
       </div>
</div>
        <br>
            <hr>
            <br>
            
 <div class="address">
       <div class="inputs">       
             <label>Enter Mobile Number</label> <br>  <br>   
             <input type="tel" placeholder="Enter Mobile Number" name="mobileNumber" value="<%=rs2.getString(3)%>" required>
        </div>
       <div class="inputs">     
       		<label></label> <br><br>
            <input type="submit" value="Proceed to Generate Bill & Save" id="btn">
       </div>
</div>
        </form>
        <br><br><br>
    </center>
    </div>
    
     <%
	}
	}
	catch(Exception e){
		
	}
	
 %> 
</body>
</html>