<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<html>
<head>
    <title>All Bookings</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:Segoe UI, Arial; }
        body { min-height:100vh; background-image:url("images/bg.jpg"); background-size:cover; background-position:center; background-attachment:fixed; }
        h2 { text-align:center; padding-top:40px; color:white; letter-spacing:1px; }
        .table-container { width:92%; margin:40px auto; background:rgba(255,255,255,0.15); backdrop-filter:blur(10px); -webkit-backdrop-filter:blur(10px); border-radius:15px; border:1px solid rgba(255,255,255,0.3); padding:25px; box-shadow:0 8px 32px rgba(0,0,0,0.35); }
        table { width:100%; border-collapse:collapse; color:white; }
        th { background: rgba(0,0,0,0.6); padding:12px; }
        td { padding:10px; border-bottom:1px solid rgba(255,255,255,0.2); text-align:center; }
        tr:hover { background: rgba(255,255,255,0.1); }
        button { padding:6px 12px; border:none; border-radius:5px; cursor:pointer; margin:2px; font-weight:500; transition:0.3s; }
        .approve { background:#28a745; color:white; }
        .reject { background:#dc3545; color:white; }
        .complete { background:#007bff; color:white; }
        button:hover { transform:scale(1.05); opacity:0.9; }
        .backbtn { display:block; margin:25px auto; background:#ff7a00; color:white; padding:10px 20px; border-radius:6px; }
        .backbtn:hover { background:black; }
    </style>
</head>
<body>

<h2>Admin - All Bookings</h2>

<div class="table-container">
    <table>
        <tr>
            <th>ID</th>
            <th>Email</th>
            <th>Vehicle Type</th>
            <th>Vehicle Number</th>
            <th>Service Type</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb","app","app");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM BOOKINGS");

                while(rs.next()) {
                    String status = rs.getString("STATUS");
                    if(status==null) status="Pending";
        %>

        <tr>
            <td><%= rs.getInt("ID") %></td>
            <td><%= rs.getString("EMAIL") %></td>
            <td><%= rs.getString("VEHICLETYPE") %></td>
            <td><%= rs.getString("VEHICLENUMBER") %></td>
            <td><%= rs.getString("SERVICETYPE") %></td>
            <td><%= rs.getString("SERVICEDATE") %></td>
            <td><%= rs.getString("SERVICETIME") %></td>
            <td><%= status %></td>
            <td>
                <% if("Booked".equals(status)|| "Rescheduled".equals(status)) { %>
                    <form action="ApproveBookingServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= rs.getInt("ID") %>">
                        <button class="approve">Approve</button>
                    </form>
                    <form action="RejectBookingServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= rs.getInt("ID") %>">
                        <button class="reject">Reject</button>
                    </form>
                <% } else if("Assigned".equals(status)) { %>
                    <button class="complete" disabled>Complete</button>
                <% } else if("Mechanic Done".equals(status)) { %>
                    <form action="CompleteServiceServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= rs.getInt("ID") %>">
                        <button class="complete">Complete</button>
                    </form>
                <% } else if("Completed".equals(status)) { %>
                    <button class="complete" disabled>Completed</button>
                <% } %>
            </td>
        </tr>

        <%
                }
            } catch(Exception e) { out.println(e); }
        %>

    </table>
</div>

<a href="adminMenu.jsp"><button class="backbtn">Back</button></a>

</body>
</html>