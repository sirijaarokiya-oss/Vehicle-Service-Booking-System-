<%-- 
    Document   : assignMechanic
    Created on : 16 Mar, 2026, 8:58:46 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<html>
<head>
<title>Assign Mechanic</title>
<style>
  *{margin:0;padding:0;box-sizing:border-box;font-family:Segoe UI, Arial;}
  body{min-height:100vh;background-image:url("images/bg.jpg");background-size:cover;background-position:center;background-attachment:fixed;}
  h2{text-align:center;padding-top:40px;color:white;letter-spacing:1px;}
  .table-container{width:92%;margin:40px auto;background:rgba(255,255,255,0.15);backdrop-filter:blur(10px);-webkit-backdrop-filter:blur(10px);border-radius:15px;border:1px solid rgba(255,255,255,0.3);padding:25px;box-shadow:0 8px 32px rgba(0,0,0,0.35);}
  table{width:100%;border-collapse:collapse;color:white;}
  th{background:rgba(0,0,0,0.6);padding:12px;}
  td{padding:10px;border-bottom:1px solid rgba(255,255,255,0.2);text-align:center;}
  tr:hover{background:rgba(255,255,255,0.1);}
  select{padding:6px;border-radius:4px;border:none;}
  button{padding:6px 12px;border:none;border-radius:5px;cursor:pointer;margin:2px;font-weight:500;transition:0.3s;background:#007bff;color:white;}
  button:hover{transform:scale(1.05);opacity:0.9;}
  .backbtn{display:block;margin:25px auto;background:#ff7a00;color:white;padding:10px 20px;border-radius:6px;}
  .backbtn:hover{background:black;}
  .status-pending{color:#f0ad4e;font-weight:bold;}
  .status-assigned{color:#0275d8;font-weight:bold;}
  .status-done{color:#f0ad4e;font-weight:bold;}
  .status-completed{color:#5cb85c;font-weight:bold;}
</style>
</head>
<body>

<h2>Admin - Assign Mechanic</h2>

<div class="table-container">
<table>
<tr>
<th>Booking ID</th>
<th>Vehicle Type</th>
<th>Vehicle Number</th>
<th>Service Type</th>
<th>Service Date</th>
<th>Status</th>
<th>Mechanic</th>
<th>Action</th>
</tr>

<%
try{
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb","app","app");

    // Show Pending or Approved bookings
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM BOOKINGS WHERE STATUS='Pending' OR STATUS='Approved'");

    while(rs.next()){
        String status = rs.getString("STATUS");
        if(status==null) status="Pending";
%>

<tr>
<form action="AssignMechanicServlet" method="post">
<td><%=rs.getInt("ID")%>
<input type="hidden" name="bookingId" value="<%=rs.getInt("ID")%>">
</td>
<td><%=rs.getString("VEHICLETYPE")%></td>
<td><%=rs.getString("VEHICLENUMBER")%></td>
<td><%=rs.getString("SERVICETYPE")%></td>
<td><%=rs.getDate("SERVICEDATE")%></td>

<td class="<%= "Pending".equals(status) ? "status-pending" : "status-assigned" %>"><%=status%></td>

<td>
<select name="mechanicId" required>
<%
    Statement st2 = con.createStatement();
    ResultSet rs2 = st2.executeQuery("SELECT * FROM MECHANICS");
    while(rs2.next()){
%>
    <option value="<%= rs2.getInt("MECHANIC_ID") %>">
        <%= rs2.getString("MECHANIC_NAME") %> - <%= rs2.getString("SPECIALIZATION") %>
    </option>
<%
    }
%>
</select>
</td>

<td>
<%
if(status.equals("Pending") || status.equals("Approved")){
%>
<button type="submit">Assign</button>
<%
}else{
out.print("Assigned");
}
%>
</td>

</form>
</tr>

<%
    }

}catch(Exception e){ out.println(e); }
%>

</table>
</div>

<a href="adminMenu.jsp"><button class="backbtn">Back</button></a>

</body>
</html>