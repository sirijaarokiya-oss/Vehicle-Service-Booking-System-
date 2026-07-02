<%-- 
    Document   : viewMechanics
    Created on : 26 Mar, 2026, 6:53:13 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>View Mechanics</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Segoe UI, Arial;
}

body {
    min-height: 100vh;
    background-image: url("images/bg.jpg");
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
}

h2 {
    text-align: center;
    padding-top: 30px;
    color: white;
    letter-spacing: 1px;
}

.table-container {
    width: 92%;
    margin: 40px auto;
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(10px);
    border-radius: 15px;
    padding: 25px;
    box-shadow: 0 8px 32px rgba(0,0,0,0.35);
    color: white;
}

.header-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.header-bar span {
    font-size: 18px;
    font-weight: bold;
}

.add-btn {
    background: #28a745;
    padding: 10px 15px;
    border-radius: 6px;
    color: white;
    text-decoration: none;
    font-weight: 500;
}

.add-btn:hover {
    background: #218838;
}

table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
}

th {
    background: rgba(0,0,0,0.6);
    padding: 12px;
}

td {
    padding: 10px;
    border-bottom: 1px solid rgba(255,255,255,0.2);
}

tr:hover {
    background: rgba(255,255,255,0.1);
}

img {
    border-radius: 8px;
    object-fit: cover;
}

.delete-btn {
    background: #dc3545;
    border: none;
    padding: 6px 12px;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

.delete-btn:hover {
    background: #c82333;
}

.backbtn {
    display: block;
    margin: 20px auto;
    background: #ff7a00;
    color: white;
    padding: 10px 20px;
    border-radius: 6px;
    text-align: center;
    text-decoration: none;
}
</style>
</head>

<body>

<h2>🔧 Mechanics Management</h2>

<div class="table-container">

<div class="header-bar">
    <span>All Mechanics</span>
    <a href="addMechanic.jsp" class="add-btn">+ Add Mechanic</a>
</div>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Phone</th>
    <th>Specialization</th>
    <th>Username</th>
    <th>Image</th>
    <th>Action</th>
</tr>

<%
try {
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection con = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/mydb", "app", "app");

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM MECHANICS");

    while(rs.next()) {
%>

<tr>
    <td><%= rs.getInt("MECHANIC_ID") %></td>
    <td><%= rs.getString("MECHANIC_NAME") %></td>
    <td><%= rs.getString("PHONE") %></td>
    <td><%= rs.getString("SPECIALIZATION") %></td>
    <td><%= rs.getString("USERNAME") %></td>

    <td>
        <img src="<%= rs.getString("IMAGE") %>" width="70" height="70">
    </td>

    <td>
       <form action="DeleteMechanicServlet" method="post" 
onsubmit="return confirm('Delete this mechanic?');">

    <input type="hidden" name="id" value="<%= rs.getInt("MECHANIC_ID") %>">

    <button class="delete-btn">Delete</button>

</form>
    </td>
</tr>

<%
    }
    con.close();
} catch(Exception e){
    out.println(e);
}
%>

</table>

</div>
<a href="adminMenu.jsp"><button class="backbtn">Back</button></a>
</body>
</html>
