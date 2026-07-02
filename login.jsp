<%-- 
    Document   : login
    Created on : 10 Mar, 2026, 3:14:43 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User Login</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

/* BACKGROUND */

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:
linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),
url("https://images.unsplash.com/photo-1503376780353-7e6692767b70");
background-size:cover;
background-position:center;
}

/* BACK BUTTON */

.back-btn{
position:absolute;
top:25px;
left:25px;
background:#ff6600;
color:white;
padding:10px 18px;
text-decoration:none;
border-radius:25px;
font-size:14px;
transition:0.3s;
}

.back-btn:hover{
background:#ff4500;
transform:scale(1.05);
}

/* LOGIN BOX */

.container{
width:360px;
background:rgba(255,255,255,0.15);
padding:35px;
border-radius:12px;
backdrop-filter:blur(10px);
box-shadow:0 10px 30px rgba(0,0,0,0.4);
color:white;
animation:fadeUp 1s ease;
}

/* TITLE */

h2{
text-align:center;
margin-bottom:20px;
}

/* INPUT FIELDS */

input{
width:100%;
padding:12px;
margin:10px 0;
border:none;
border-radius:6px;
outline:none;
font-size:14px;
}

/* INPUT FOCUS EFFECT */

input:focus{
box-shadow:0 0 8px #ff6600;
}

/* LOGIN BUTTON */

button{
width:100%;
padding:12px;
background:linear-gradient(45deg,#ff6600,#ff9900);
border:none;
color:white;
font-size:16px;
border-radius:25px;
cursor:pointer;
transition:0.3s;
}

button:hover{
transform:translateY(-3px);
box-shadow:0 8px 20px rgba(0,0,0,0.3);
}

/* REGISTER LINK */

.register{
text-align:center;
margin-top:15px;
}

.register a{
color:#ffd700;
text-decoration:none;
font-weight:bold;
}

.register a:hover{
text-decoration:underline;
}
@keyframes fadeUp{
from{
opacity:0;
transform:translateY(40px);
}
to{
opacity:1;
transform:translateY(0);
}
}
.error{
color:red;
font-size:13px;
margin-top:-5px;
margin-bottom:8px;
display:none;
}

input:invalid{
border:2px solid red;
}

input:valid{
border:2px solid green;
}

</style>
</head>

<body>

<a href="home.jsp" class="back-btn">← Back</a>

<div class="container">

<h2>User Login</h2>

<form action="loginservlet" method="post">
<input type="email" name="email" placeholder="Enter Email" required>
<input type="password" name="password" placeholder="Enter Password" required>
<button type="submit">Login</button>

</form>

<div class="register">
<a href="Register.jsp">New User? Register</a>
</div>

</div>
<script>

function validateLogin(){

let email=document.getElementById("email");
let password=document.getElementById("password");

document.querySelectorAll(".error").forEach(e=>e.style.display="none");

if(!email.checkValidity()){
document.getElementById("emailError").style.display="block";
return false;
}

if(password.value.length < 6){
document.getElementById("passError").style.display="block";
return false;
}

return true;

}

</script>
</body>
</html>
