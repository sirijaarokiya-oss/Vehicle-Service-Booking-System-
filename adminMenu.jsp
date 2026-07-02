<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<%
int total = 0;
int pending = 0;
int completed = 0;
int todayServices = 0;

try{
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb","app","app");

    /* TOTAL BOOKINGS */
    Statement st1 = con.createStatement();
    ResultSet rs1 = st1.executeQuery("SELECT COUNT(*) FROM BOOKINGS");
    if(rs1.next()){ total = rs1.getInt(1); }

    /* COMPLETED BOOKINGS */
    Statement st2 = con.createStatement();
    ResultSet rs2 = st2.executeQuery("SELECT COUNT(*) FROM BOOKINGS WHERE STATUS='Completed'");
    if(rs2.next()){ completed = rs2.getInt(1); }

    /* PENDING BOOKINGS */
    Statement st3 = con.createStatement();
    ResultSet rs3 = st3.executeQuery(
        "SELECT COUNT(*) FROM BOOKINGS WHERE STATUS!='Completed' AND STATUS!='Cancelled'"
    );
    if(rs3.next()){ pending = rs3.getInt(1); }

    /* TODAY'S SERVICES */
    Statement st4 = con.createStatement();
    ResultSet rs4 = st4.executeQuery(
        "SELECT COUNT(*) FROM BOOKINGS WHERE SERVICEDATE = CURRENT_DATE AND STATUS!='Cancelled'"
    );
    if(rs4.next()){ todayServices = rs4.getInt(1); }

}catch(Exception e){
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<style>
*{ margin:0; padding:0; box-sizing:border-box; font-family:'Segoe UI',Arial; }

body{
min-height:100vh;
background: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7)), url("images/bg1.jpg");
background-size:cover;
background-position:center;
color:white;
}

/* TOP BAR */
.topbar{
display:flex;
align-items:center;
justify-content:space-between;
padding:15px 25px;
background:rgba(0,0,0,0.6);
}
.menu-icon{ font-size:26px; cursor:pointer; }
.logo{ font-size:22px; font-weight:bold; }

/* SIDEBAR */
.sidebar{
position:fixed;
top:0;
left:-250px;
width:250px;
height:100%;
background:#111;
padding-top:60px;
transition:0.4s;
}
.sidebar a{
display:block;
padding:15px 25px;
color:white;
text-decoration:none;
border-bottom:1px solid rgba(255,255,255,0.1);
}
.sidebar a:hover{ background:#ff7a00; }

/* LOGOUT BUTTON */
.logout-btn{
width:100%;
padding:15px 25px;
background:none;
border:none;
color:white;
text-align:left;
font-size:16px;
cursor:pointer;
border-bottom:1px solid rgba(255,255,255,0.1);
}
.logout-btn:hover{ background:#ff7a00; }

/* MAIN */
.main{
max-width:1000px;
margin:auto;
padding:50px 20px;
text-align:center;
}

/* STATS */
.stats{
display:flex;
justify-content:center;
gap:30px;
flex-wrap:wrap;
}

.stat{
width:220px;
padding:25px;
background:rgba(255,255,255,0.15);
border-radius:10px;
box-shadow:0 8px 20px rgba(0,0,0,0.5);
}
.stat h2{ font-size:30px; }

/* NOTIFICATION CARD */
.notification-card{
width:220px;
padding:20px;
border-radius:10px;
box-shadow:0 8px 20px rgba(0,0,0,0.5);
font-size:16px;
font-weight:bold;
animation: pulse 2s infinite;
text-align:center;
}
@keyframes pulse{
0%,100%{transform:scale(1);}
50%{transform:scale(1.05);}
}

/* ACTION PANELS */
.actions{
margin-top:60px;
display:flex;
justify-content:center;
gap:40px;
flex-wrap:wrap;
}

.panel{
width:260px;
padding:30px;
background:rgba(255,255,255,0.15);
border-radius:12px;
text-align:center;
}
.panel img{ width:60px; margin-bottom:10px; }
.panel a{
display:inline-block;
margin-top:10px;
padding:10px 20px;
background:#ff7a00;
color:white;
text-decoration:none;
border-radius:6px;
}
.panel a:hover{ background:#ff9800; }

</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar" id="sidebar">
<a href="home.jsp">🏠 Home</a>
<a href="viewBookings.jsp">📋 View Bookings</a>
<a href="manageBookings.jsp">⚙ Manage Bookings</a>
<form action="LogoutServlet" method="post">
<button type="submit" class="logout-btn">🚪 Logout</button>
</form>
</div>

<!-- TOP BAR -->
<div class="topbar">
<span class="menu-icon" onclick="toggleMenu()">☰</span>
<div class="logo">Vehicle Service Admin</div>
</div>

<!-- MAIN -->
<div class="main">

<h1>Welcome Admin 👋</h1>
<p>Manage vehicle service bookings and monitor system activity.</p>
<br><br>

<div class="stats">

<div class="stat">
<h2><%=total%></h2>
<p>Total Bookings</p>
</div>

<div class="stat">
<h2><%=pending%></h2>
<p>Pending</p>
</div>

<div class="stat">
<h2><%=completed%></h2>
<p>Completed</p>
</div>

<!-- PENDING BOOKINGS ALERT -->
<%
    if(pending > 0){
%>
    <div class="notification-card" style="background:rgba(255,122,0,0.85);">
        📢 You have <%= pending %> new booking(s)!
    </div>
<%
    } else {
%>
    <div class="notification-card" style="background:rgba(0,0,0,0.3);">
        ✅ No new bookings
    </div>
<%
    }
%>

<!-- TODAY'S SERVICES ALERT -->
<%
    if(todayServices > 0){
%>
    <div class="notification-card" style="background:rgba(0,180,255,0.85);">
        📅 <%= todayServices %> service(s) scheduled for today!
    </div>
<%
    } else {
%>
    <div class="notification-card" style="background:rgba(0,0,0,0.3);">
        ✅ No services scheduled for today
    </div>
<%
    }
%>

</div> <!-- stats -->

<div class="actions">

<div class="panel">
<img src="https://cdn-icons-png.flaticon.com/512/2921/2921222.png">
<h3> Manage Bookings</h3>
<a href="veiwBookings.jsp">Open</a>
</div>

<div class="panel">
<img src="https://cdn-icons-png.flaticon.com/512/2921/2921226.png">
<h3>View Bookings</h3>
<a href="manageBookings.jsp">Open</a>
</div>

<div class="panel">
<img src="https://cdn-icons-png.flaticon.com/512/1995/1995470.png">
<h3>Assign Mechanic</h3>
<a href="assignMechanic.jsp">Open</a>
</div>    
 
<div class="panel">
<img src="https://cdn-icons-png.flaticon.com/512/2921/2921220.png">
<h3>View Mechanic</h3>
<a href="viewMechanics.jsp">Open</a>
</div>   
    
<div class="panel">
<img src="https://cdn-icons-png.flaticon.com/512/1828/1828479.png">
<h3>Logout</h3>
<form action="LogoutServlet" method="post">
<button type="submit" style="padding:10px 20px;background:#ff7a00;border:none;color:white;border-radius:6px;cursor:pointer;">
Logout
</button>
</form>
</div>

</div> <!-- actions -->

</div> <!-- main -->

<script>
function toggleMenu(){
    var sidebar = document.getElementById("sidebar");
    if(sidebar.style.left === "0px"){
        sidebar.style.left = "-250px";
    }else{
        sidebar.style.left = "0px";
    }
}
</script>
</body>
</html>