<%@page import="java.sql.*"%>

<html>
<head>

<title>Manage Bookings</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI, Arial;
}

/* BACKGROUND */

body{
height:100vh;
background:url("images/service-bg2.jpg") center/cover no-repeat;
display:flex;
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

/* LEFT PANEL */

.left{
width:30%;
background:rgba(0,0,0,0.8);
color:white;
display:flex;
flex-direction:column;
justify-content:center;
align-items:center;
text-align:center;
padding:30px;
}

.left h1{
font-size:32px;
margin-bottom:10px;
}

.left p{
font-size:15px;
opacity:0.9;
}

/* RIGHT PANEL */

.right{
width:70%;
display:flex;
flex-direction:column;
align-items:center;
justify-content:center;
}

/* GLASS DASHBOARD */

.dashboard{
width:80%;
padding:40px;

background:rgba(0,0,0,0.55);
backdrop-filter:blur(8px);

border-radius:15px;
border:1px solid rgba(255,255,255,0.2);

display:grid;
grid-template-columns:repeat(3,1fr);
gap:30px;

color:white;
}

/* STAT BOX */

.box{
padding:25px;
text-align:center;
font-size:18px;
border-radius:10px;

background:rgba(255,255,255,0.08);
border:1px solid rgba(255,255,255,0.15);

transition:0.3s;
}

.box:hover{
transform:scale(1.05);
background:rgba(255,255,255,0.15);
}

/* NUMBER */

.number{
font-size:35px;
margin-top:10px;
font-weight:bold;
}

.number a{
color:#00e6ff;
text-decoration:none;
}

.number a:hover{
color:#ffd700;
}

/* BACK BUTTON */

.back{
margin-top:40px;
padding:10px 25px;
border:none;
border-radius:5px;
background:#ff7a00;
color:white;
cursor:pointer;
}

.back:hover{
background:black;
}

</style>

</head>

<body>

<div class="left">

<h1>Admin Dashboard</h1>
<p>Vehicle Service Booking System</p>

</div>

<div class="right">

<%

int total=0;
int approved=0;
int completed=0;
int cancelled=0;
int rejected=0;

try{

Class.forName("org.apache.derby.jdbc.ClientDriver");

Connection con = DriverManager.getConnection(
"jdbc:derby://localhost:1527/mydb","app","app");

Statement st = con.createStatement();

ResultSet rs = st.executeQuery("SELECT STATUS FROM BOOKINGS");

while(rs.next()){

total++;

String status = rs.getString("STATUS");

if("Approved".equals(status)){
approved++;
}

if("Completed".equals(status)){
completed++;
}

if("Cancelled".equals(status)){
cancelled++;
}

if("Rejected".equals(status)){
rejected++;
}

}

}catch(Exception e){
out.println(e);
}

%>

<div class="dashboard">

<div class="box">
Total Bookings
<div class="number">
<a href="bookingDetails.jsp?status=Total"><%=total%></a>
</div>
</div>

<div class="box">
Approved
<div class="number">
<a href="bookingDetails.jsp?status=Approved"><%=approved%></a>
</div>
</div>

<div class="box">
Completed
<div class="number">
<a href="bookingDetails.jsp?status=Completed"><%=completed%></a>
</div>
</div>

<div class="box">
Cancelled
<div class="number">
<a href="bookingDetails.jsp?status=Cancelled"><%=cancelled%></a>
</div>
</div>

<div class="box">
Rejected
<div class="number">
<a href="bookingDetails.jsp?status=Rejected"><%=rejected%></a>
</div>
</div>

</div>

<a href="adminMenu.jsp">
<button class="back">Back</button>
</a>

</div>

</body>
</html>