<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Portal</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

/* MAIN PAGE */

body{
height:100vh;
display:flex;
background:
linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),
url("https://images.unsplash.com/photo-1609630875171-b1321377ee65");
background-size:cover;
background-position:center;
}

/* LEFT SIDE TEXT */

.left{
flex:1;
display:flex;
flex-direction:column;
justify-content:center;
padding-left:80px;
color:white;
animation:slideIn 1s ease;
}

.left h1{
font-size:45px;
margin-bottom:10px;
}

.left p{
font-size:18px;
opacity:0.9;
}

/* RIGHT LOGIN AREA */

.right{
flex:1;
display:flex;
justify-content:center;
align-items:center;
}

/* LOGIN CARD */

.box{
width:350px;
background:rgba(255,255,255,0.12);
padding:40px;
border-radius:15px;
backdrop-filter:blur(10px);
box-shadow:0 10px 40px rgba(0,0,0,0.6);
text-align:center;
color:white;
}

/* TITLE */

.box h2{
margin-bottom:20px;
}

/* INPUT */

input{
width:100%;
padding:12px;
margin:10px 0;
border:none;
border-radius:6px;
outline:none;
}

/* INPUT FOCUS */

input:focus{
box-shadow:0 0 8px #ff9900;
}

/* BUTTON */

button{
width:100%;
padding:12px;
margin-top:10px;
background:#ff6600;
border:none;
color:white;
font-size:16px;
border-radius:25px;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#ff4500;
transform:translateY(-3px);
}

/* BACK BUTTON */

.back-btn{
position:absolute;
top:25px;
left:25px;
background:#ff6600;
color:white;
padding:8px 18px;
text-decoration:none;
border-radius:20px;
}

.back-btn:hover{
background:#e65c00;
}

/* ANIMATION */

@keyframes slideIn{
from{
opacity:0;
transform:translateX(-40px);
}
to{
opacity:1;
transform:translateX(0);
}
}

</style>

</head>

<body>

<a href="home.jsp" class="back-btn">← Back</a>

<div class="left">

<h1>Admin Control Panel</h1>
<p>Manage vehicle services, bookings, and system operations.</p>

</div>

<div class="right">

<div class="box">

<h2>Admin Login</h2>

<form action="AdminLoginServlet" method="post">

<input type="text" name="username" placeholder="Admin Username" required>

<input type="password" name="password" placeholder="Password" required>

<button type="submit">Login</button>

</form>

</div>

</div>

</body>
</html>