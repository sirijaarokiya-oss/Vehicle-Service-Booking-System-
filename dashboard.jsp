<%-- 
    Document   : dashboard
    Created on : 10 Mar, 2026, 3:20:16 PM
    Author     : HP
--%>


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
<title>User Dashboard</title>

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

background:
linear-gradient(rgba(0,0,0,0.65),rgba(0,0,0,0.65)),
url("https://images.unsplash.com/photo-1511919884226-fd3cad34687c");

background-size:cover;
background-position:center;
overflow:hidden;
}

/* MENU ICON */

.menu-btn{
position:fixed;
top:20px;
left:20px;
font-size:30px;
color:white;
cursor:pointer;
z-index:1000;
}

/* SIDEBAR */

.sidebar{

position:fixed;
top:0;
left:-300px;   /* hidden first */

width:300px;
height:100%;

background:rgba(0,0,0,0.9);

padding-top:40px;

display:flex;
flex-direction:column;
align-items:center;

transition:0.4s;

}

/* WHEN OPEN */

.sidebar.active{
left:0;
}

/* USER IMAGE */

.sidebar img{
width:100px;
border-radius:50%;
margin-bottom:15px;
}

.sidebar h2{
color:white;
margin-bottom:40px;
}

/* MENU LINKS */

.sidebar a{

width:100%;
padding:18px;

text-align:center;
text-decoration:none;

color:white;

border-top:1px solid #333;

font-size:18px;

transition:0.3s;

}

.sidebar a:hover{
background:#ff7a00;
}

/* MAIN AREA */

.main{
height:100%;
display:flex;
flex-direction:column;
}

/* TOP BAR */

.topbar{

background:rgba(0,0,0,0.7);

padding:18px;

text-align:right;

color:white;

font-size:18px;

}

/* CARD AREA */

.container{

flex:1;

display:flex;

justify-content:center;
align-items:center;

gap:70px;

}

/* GLASS CARDS */

.card{

width:330px;
height:230px;

background:rgba(255,255,255,0.25);
backdrop-filter:blur(10px);

border-radius:18px;

text-align:center;

padding-top:50px;

color:white;

font-size:24px;
font-weight:bold;

box-shadow:0 10px 30px rgba(0,0,0,0.5);

transition:0.4s;

}

.card img{
width:100px;
margin-bottom:15px;
}

.card:hover{
transform:translateY(-12px) scale(1.05);
background:rgba(255,122,0,0.9);
}

.card a{
text-decoration:none;
color:inherit;
}

.card button{
background:none;
border:none;
font-size:24px;
font-weight:bold;
cursor:pointer;
color:inherit;
}

</style>
</head>

<body>

<!-- MENU ICON -->

<div class="menu-btn" onclick="toggleMenu()">☰</div>

<!-- SIDEBAR -->

<div class="sidebar" id="sidebar">

<img src="https://cdn-icons-png.flaticon.com/512/847/847969.png">

<h2><%= user %></h2>

<a href="home.jsp">Home</a>
<a href="bookService.jsp">Book Service</a>
<a href="myBookings.jsp">My Bookings</a>

<form action="LogoutServlet" method="post" style="width:100%;">
<button style="width:100%;padding:18px;background:none;border:none;color:white;font-size:18px;cursor:pointer;">
Logout
</button>
</form>

</div>

<!-- MAIN -->

<div class="main">

<div class="topbar">
Welcome, <%= user %>
</div>

<div class="container">

<div class="card">
<a href="bookService.jsp">
<img src="https://cdn-icons-png.flaticon.com/512/2921/2921222.png">
<br>
Book Service
</a>
</div>

<div class="card">
<a href="myBookings.jsp">
<img src="https://cdn-icons-png.flaticon.com/512/2921/2921226.png">
<br>
My Bookings
</a>
</div>

<div class="card">
<form action="LogoutServlet" method="post">
<button>
<img src="https://cdn-icons-png.flaticon.com/512/1828/1828479.png">
<br>
Logout
</button>
</form>
</div>

</div>

</div>

<script>

function toggleMenu(){

var sidebar=document.getElementById("sidebar");

sidebar.classList.toggle("active");

}

</script>

</body>
</html>