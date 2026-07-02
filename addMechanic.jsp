<%-- 
    Document   : addMechanic
    Created on : 26 Mar, 2026, 11:58:42 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Add Mechanic</title>

<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:'Segoe UI';}

body{
    min-height:100vh;
    background: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)), url("images/bg1.jpg");
    background-size:cover;
    display:flex;
    justify-content:center;
    align-items:center;
    color:white;
}

.form-box{
    width:380px;
    padding:30px;
    border-radius:12px;
    background:rgba(255,255,255,0.15);
    text-align:center;
}

/* IMAGE UPLOAD */
.upload-box{
    width:120px;
    height:120px;
    border:2px dashed #aaa;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    cursor:pointer;
    overflow:hidden;
    margin:10px auto;
}

.upload-box img{
    width:100%;
    height:100%;
    object-fit:cover;
}

.upload-box span{
    font-size:35px;
    color:#ccc;
}

#fileInput{
    display:none;
}

input,button{
    width:100%;
    padding:10px;
    margin:10px 0;
    border:none;
    border-radius:6px;
}
button
{
    background:#ff7a00;
    color:white;
    cursor:pointer;
}
button:hover{
    background:#ff9800;
}
.error{
    color:#ff4d4d;
    font-size:13px;
    text-align:left;
}
</style>
</head>

<body>

<div class="form-box">
<h2>Add Mechanic</h2>

<form action="AddMechanicServlet" method="post" enctype="multipart/form-data">
    ID: <input type="number" name="id" required><br>
    Name: <input type="text" name="name" required><br>
    Phone: <input type="text" name="phone" required><br>
    Specialization: <input type="text" name="specialization" required><br>
    Username: <input type="text" name="username" required><br>
    Password: <input type="password" name="password" required><br>
    Image: <input type="file" name="image" required><br>
    <input type="submit" value="Add Mechanic">
</form>
</body>
</html>
