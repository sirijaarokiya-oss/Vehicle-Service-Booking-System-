<%-- 
    Document   : reschedule
    Created on : 26 Mar, 2026, 10:50:37 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>

<title>Reschedule Booking</title>

<style>

body{
background:
linear-gradient(rgba(0,0,0,0.65),rgba(0,0,0,0.65)),
url("images/bg1.jpg");

background-size:cover;
background-position:center;
height:100vh;

display:flex;
justify-content:center;
align-items:center;
font-family:Segoe UI;
color:white;
}

.container{
background:rgba(255,255,255,0.1);
padding:30px;
border-radius:12px;
backdrop-filter:blur(10px);
width:350px;
box-shadow:0 10px 30px rgba(0,0,0,0.6);
}

h2{
text-align:center;
margin-bottom:20px;
}

input,textarea{
width:100%;
padding:10px;
margin:10px 0;
border:none;
border-radius:6px;
}

button{
width:100%;
padding:10px;
background:#ff7a00;
color:white;
border:none;
border-radius:6px;
cursor:pointer;
font-size:15px;
margin-top:10px;
}

button:hover{
background:#ff9a2a;
}

/* Back button style */
.back-btn{
background:#555;
}

.back-btn:hover{
background:#777;
}

</style>

</head>

<body>

<div class="container">

<h2>Reschedule Booking</h2>

<form action="RescheduleServlet" method="post">

<input type="hidden" name="id" value="<%=id%>">

<label>New Date:</label>
<input type="date" name="new_date" required>

<label>Reason:</label>
<textarea name="message" placeholder="Enter reason"></textarea>

<button type="submit">Submit</button>

</form>

<!-- BACK BUTTON -->
<a href="dashboard.jsp">
    <button class="back-btn">Back</button>
</a>

</div>

</body>
</html>