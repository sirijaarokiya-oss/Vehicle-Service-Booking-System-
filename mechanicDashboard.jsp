<%-- 
    Document   : mechanicDashboard
    Created on : 16 Mar, 2026, 9:32:20 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<html>
<head>
    <title>Mechanic Dashboard</title>

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
            padding-top: 40px;
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
        }

        table {
            width: 100%;
            border-collapse: collapse;
            color: white;
        }

        th {
            background: rgba(0,0,0,0.6);
            padding: 12px;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid rgba(255,255,255,0.2);
            text-align: center;
        }

        tr:hover {
            background: rgba(255,255,255,0.1);
        }

        button {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 2px;
            font-weight: 500;
            background: #007bff;
            color: white;
        }

        .backbtn {
            display: block;
            margin: 25px auto;
            background: #ff7a00;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
        }

        .status-assigned {
            color: #0275d8;
            font-weight: bold;
        }

        .status-done {
            color: #f0ad4e;
            font-weight: bold;
        }

        .status-completed {
            color: #5cb85c;
            font-weight: bold;
        }
    </style>
</head>

<body>

<%
    // ✅ SAFE SESSION CHECK
    Object mechObj = session.getAttribute("mechanicId");

    if(mechObj == null){
        response.sendRedirect("mechanicLogin.jsp");
        return;
    }

    int mechanicId = Integer.parseInt(mechObj.toString());
%>

<h2>Mechanic - Assigned Services</h2>

<div class="table-container">
    <table>
        <tr>
            <th>ID</th>
            <th>Vehicle Number</th>
            <th>Service Type</th>
            <th>Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/mydb","app","app"
                );

                PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM BOOKINGS WHERE MECHANIC_ID=?"
                );
                ps.setInt(1, mechanicId);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {

                    String status = rs.getString("STATUS");
                    if (status == null) status = "Assigned";

                    String statusClass = "";
                    if (status.equals("Assigned")) statusClass = "status-assigned";
                    else if (status.equals("Done")) statusClass = "status-done";
                    else if (status.equals("Completed")) statusClass = "status-completed";
        %>

        <tr>
            <td><%= rs.getInt("ID") %></td>
            <td><%= rs.getString("VEHICLENUMBER") %></td>
            <td><%= rs.getString("SERVICETYPE") %></td>
            <td><%= rs.getString("SERVICEDATE") %></td>
            <td class="<%= statusClass %>"><%= status %></td>
            <td>
    <%
        if (!status.equalsIgnoreCase("Completed")) {
    %>

    <!-- MARK DONE -->
    <form action="MechanicDoneServlet" method="post">
        <input type="hidden" name="bookingId" value="<%= rs.getInt("ID") %>">
        <button type="submit">Mark Done</button>
    </form>

    <!-- REPORT ISSUE -->
    <form action="reportIssue.jsp" method="get" style="display:inline;">
        <input type="hidden" name="bookingId" value="<%= rs.getInt("ID") %>">
        <button type="submit">Report Issue</button>
    </form>

    <%
        } else {
    %>
        Completed
    <%
        }
    %>
</td>
        </tr>

        <%
                }
                rs.close();
                ps.close();
                con.close();

            } catch (Exception e) {
                out.println("<h3 style='color:red;text-align:center;'>Error: " + e + "</h3>");
            }
        %>

    </table>
</div>

<a href="mechanicLogin.jsp">
    <button class="backbtn">Back</button>
</a>

</body>
</html>