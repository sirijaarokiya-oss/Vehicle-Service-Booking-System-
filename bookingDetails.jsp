```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<html>
<head>
<title>Booking Details</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI, Arial;
}

/* BACKGROUND IMAGE */

body{
min-height:100vh;
background:url("images/service-bg3.jpg") center/cover no-repeat;
display:flex;
flex-direction:column;
align-items:center;
}

/* DARK OVERLAY */

body::before{
content:"";
position:fixed;
top:0;
left:0;
width:100%;
height:100%;
background:rgba(0,0,0,0.6);
z-index:-1;
}

/* TITLE */

h2{
color:white;
margin-top:40px;
letter-spacing:1px;
}

/* GLASS TABLE CONTAINER */

.table-container{

width:90%;
margin-top:40px;

background:rgba(255,255,255,0.15);
backdrop-filter:blur(10px);

border-radius:12px;
border:1px solid rgba(255,255,255,0.25);

padding:25px;

box-shadow:0 8px 25px rgba(0,0,0,0.4);
}

/* TABLE */

table{
width:100%;
border-collapse:collapse;
color:white;
}

/* HEADER */

th{
background:rgba(0,0,0,0.7);
padding:12px;
}

/* CELLS */

td{
padding:12px;
border-bottom:1px solid rgba(255,255,255,0.2);
text-align:center;
}

/* ROW HOVER */

tr:hover{
background:rgba(255,255,255,0.1);
}

/* STATUS TEXT */

.status{
font-weight:bold;
}

.approved{
color:#28a745;
}

.completed{
color:#007bff;
}

.rejected{
color:#dc3545;
}

.cancelled{
color:#ff7a00;
}

.pending{
color:#cccccc;
}

/* BACK BUTTON */

.back{
margin-top:30px;
padding:10px 25px;
border:none;
border-radius:5px;
background:#ff7a00;
color:white;
cursor:pointer;
font-weight:bold;
}

.back:hover{
background:#e66900;
}

</style>
</head>

<body>

<%

String status = request.getParameter("status");

Class.forName("org.apache.derby.jdbc.ClientDriver");

Connection con = DriverManager.getConnection(
"jdbc:derby://localhost:1527/mydb","app","app");

PreparedStatement ps;

/* SHOW ALL OR FILTER BY STATUS */

if(status == null || status.equals("Total")){
ps = con.prepareStatement("SELECT * FROM BOOKINGS");
}
else{
ps = con.prepareStatement("SELECT * FROM BOOKINGS WHERE STATUS=?");
ps.setString(1,status);
}

ResultSet rs = ps.executeQuery();

%>

<h2>Booking Details</h2>

<div class="table-container">

<table>

<tr>
<th>ID</th>
<th>Email</th>
<th>Vehicle</th>
<th>Number</th>
<th>Service</th>
<th>Date</th>
<th>Time</th>
<th>Status</th>
</tr>

<%
while(rs.next()){

String st = rs.getString("STATUS");
String cls = "pending";

if("Approved".equalsIgnoreCase(st)){
cls="approved";
}
else if("Completed".equalsIgnoreCase(st)){
cls="completed";
}
else if("Rejected".equalsIgnoreCase(st)){
cls="rejected";
}
else if("Cancelled".equalsIgnoreCase(st)){
cls="cancelled";
}
%>

<tr>

<td><%=rs.getInt("ID")%></td>
<td><%=rs.getString("EMAIL")%></td>
<td><%=rs.getString("VEHICLETYPE")%></td>
<td><%=rs.getString("VEHICLENUMBER")%></td>
<td><%=rs.getString("SERVICETYPE")%></td>
<td><%=rs.getString("SERVICEDATE")%></td>
<td><%=rs.getString("SERVICETIME")%></td>

<td class="status <%=cls%>">
 <%=st%>
</td>

</tr>

<%
}
%>

</table>

</div>

<a href="manageBookings.jsp">
<button class="back">Back</button>
</a>

</body>
</html>
```
