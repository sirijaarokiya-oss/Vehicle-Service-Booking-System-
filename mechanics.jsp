<%-- 
    Document   : mechanics
    Created on : 17 Mar, 2026, 10:22:13 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Our Mechanics</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Segoe UI, Arial;
}

/* BACKGROUND */
body{
    min-height:100vh;
    background:
    linear-gradient(rgba(0,0,0,0.65), rgba(0,0,0,0.65)),
    url("https://images.unsplash.com/photo-1511919884226-fd3cad34687c");
    background-size:cover;
    background-position:center;
    overflow-x:hidden;
    color:white;
}

/* BACK BUTTON TOP LEFT */
.backbtn{
    position:fixed;
    top:20px;
    left:20px;
    background:#ff7a00;
    color:white;
    padding:12px 25px;
    border-radius:6px;
    text-decoration:none;
    font-weight:bold;
    font-size:16px;
    transition:0.3s;
    z-index:1000;
}
.backbtn:hover{
    background:#222;
}

/* PAGE HEADING */
h2{
    text-align:center;
    margin:90px 0 40px 0;
    font-size:32px;
}

/* CARD CONTAINER */
.container{
    display:flex;
    justify-content:center;
    align-items:flex-start;
    gap:40px;
    flex-wrap:wrap;
    padding:0 20px 50px 20px;
}

/* GLASS-LIKE MECHANIC CARD */
.card{
    width:280px;
    height:320px;
    background:rgba(255,255,255,0.25);
    backdrop-filter:blur(10px);
    border-radius:18px;
    text-align:center;
    padding:30px 20px;
    color:white;
    font-size:16px;
    font-weight:500;
    box-shadow:0 10px 30px rgba(0,0,0,0.5);
    transition:0.4s;
}

.card:hover{
    transform:translateY(-12px) scale(1.05);
    background:rgba(255,122,0,0.9);
}

/* CARD IMAGE */
.card img{
    width:100px;
    height:100px;
    border-radius:50%;
    object-fit:cover;
    margin-bottom:15px;
}

/* CARD TEXT */
.card h3{
    margin-bottom:10px;
    font-size:20px;
}
.card p{
    margin:5px 0;
    font-size:14px;
    color:white;
}

</style>
</head>

<body>

<a href="home.jsp" class="backbtn">← Back</a>

<h2>Our Mechanics</h2>

<div class="container">

<%
try{
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb","app","app");

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM MECHANICS");

    while(rs.next()){
%>

    <div class="card">
        <img src="<%= rs.getString("IMAGE") %>">
        
        <h3>
            Name: <%=rs.getString("MECHANIC_NAME")%><br>
            Specialization: <%=rs.getString("SPECIALIZATION")%><br>
            Phone: <%=rs.getString("PHONE")%><br>
        </h3>
    </div>

<%
    }
}catch(Exception e){
    out.println(e);
}
%>

</div>
</body>
</html>