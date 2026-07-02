<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String user = (String)session.getAttribute("user");

if(user == null){
response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>

<title>My Bookings</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI', Arial;
}

body{
background:
linear-gradient(rgba(0,0,0,0.65),rgba(0,0,0,0.65)),
url("images/bg1.jpg");

background-size:cover;
background-position:center;
background-attachment:fixed;

min-height:100vh;
color:white;
}

.navbar{
background:rgba(0,0,0,0.85);
padding:15px 40px;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 4px 10px rgba(0,0,0,0.5);
}

.logo{
font-size:22px;
font-weight:bold;
}

.navbar a{
color:white;
text-decoration:none;
margin-left:25px;
}

.title{
text-align:center;
margin-top:40px;
font-size:36px;
}

table{
width:85%;
margin:40px auto;
border-collapse:collapse;
background:rgba(255,255,255,0.12);
backdrop-filter:blur(10px);
border-radius:10px;
overflow:hidden;
}

th{
background:#ff7a00;
color:white;
}

th,td{
padding:14px;
text-align:center;
}

.status-booked{
color:#4CAF50;
font-weight:bold;
}

.status-cancelled{
color:#ff4d4d;
font-weight:bold;
}

.cancel-btn{
background:#ff4d4d;
color:white;
border:none;
padding:8px 15px;
border-radius:6px;
cursor:pointer;
margin-bottom:5px;
}

.reschedule-btn{
background:#007bff;
color:white;
border:none;
padding:8px 15px;
border-radius:6px;
cursor:pointer;
}

</style>

</head>

<body>

<div class="navbar">
<div class="logo">Vehicle Service System</div>
<div>
<a href="dashboard.jsp">Home</a>
<a href="bookService.jsp">Book Service</a>
<a href="myBookings.jsp">My Bookings</a>
<a href="LogoutServlet">Logout</a>
</div>
</div>

<h1 class="title">My Bookings</h1>

<table>

<tr>
<th>ID</th>
<th>Vehicle Type</th>
<th>Vehicle Number</th>
<th>Service Type</th>
<th>Date</th>
<th>Time</th>
<th>Status</th>
<th>Action</th>
</tr>

<%

try{

Class.forName("org.apache.derby.jdbc.ClientDriver");

Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb","app","app");

PreparedStatement ps = con.prepareStatement("SELECT * FROM BOOKINGS WHERE EMAIL=?");
ps.setString(1,user);

ResultSet rs = ps.executeQuery();

while(rs.next()){

String status = rs.getString("STATUS");

%>

<tr>

<td><%=rs.getInt("ID")%></td>
<td><%=rs.getString("VEHICLETYPE")%></td>
<td><%=rs.getString("VEHICLENUMBER")%></td>
<td><%=rs.getString("SERVICETYPE")%></td>
<td><%=rs.getString("SERVICEDATE")%></td>
<td><%=rs.getString("SERVICETIME")%></td>

<td>
<%
if("Cancelled".equalsIgnoreCase(status)){
%>
<span class="status-cancelled">Cancelled</span>
<%
}else{
%>
<span class="status-booked"><%=status%></span>
<%
}
%>

<br>

<%
String msg = rs.getString("MESSAGE");
if(msg != null){
%>
<span style="color:orange; font-size:13px;">
⚠️ <%= msg %>
</span>
<%
}
%>

</td>

<td>

<%
if(status != null && !status.equalsIgnoreCase("Cancelled") && !status.equalsIgnoreCase("Completed")){
%>

<!-- Cancel Button -->
<form action="CancelBookingServlet" method="post">
<input type="hidden" name="id" value="<%=rs.getInt("ID")%>">
<button class="cancel-btn">Cancel</button>
</form>

<!-- Reschedule Button -->
<%
if(status.equalsIgnoreCase("Booked") || status.equalsIgnoreCase("Issue Reported")){
%>

<a href="reschedule.jsp?id=<%=rs.getInt("ID")%>">
<button class="reschedule-btn">Reschedule</button>
</a>

<%
}
%>

<%
}else{
%>
-
<%
}
%>

</td>

</tr>

<%
}

}catch(Exception e){
out.println(e);
}

%>

</table>

</body>
</html>