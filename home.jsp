<!DOCTYPE html>
<html>
<head>
<title>Vehicle Service Booking System</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

/* PAGE ANIMATION */

body{
background:#f4f6f9;
animation:fadePage 1.2s ease-in;
}

@keyframes fadePage{
from{
opacity:0;
transform:translateY(20px);
}
to{
opacity:1;
transform:translateY(0);
}
}

/* NAVBAR */

nav{
display:flex;
justify-content:space-between;
align-items:center;
padding:20px 60px;
background:white;
box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

nav h2{
color:#ff5a00;
}

nav a{
text-decoration:none;
margin-left:25px;
font-weight:600;
color:#333;
transition:0.3s;
}

nav a:hover{
color:#ff5a00;
}

/* HERO SECTION */

.hero{
display:flex;
align-items:center;
justify-content:space-between;
padding:80px 60px;
flex-wrap:wrap;
}

.hero-text{
max-width:500px;
animation:fadeUp 1.2s ease;
}

.hero-text h1{
font-size:45px;
margin-bottom:20px;
color:#222;
}

.hero-text p{
font-size:17px;
color:#555;
margin-bottom:30px;
line-height:1.6;
}

/* BUTTONS */

.btn{
padding:12px 28px;
border-radius:30px;
border:none;
text-decoration:none;
font-weight:bold;
margin-right:10px;
background:linear-gradient(45deg,#ff6600,#ff9900);
color:white;
transition:all 0.3s ease;
}

.btn:hover{
transform:translateY(-4px);
box-shadow:0 8px 20px rgba(0,0,0,0.25);
}

/* HERO IMAGE */

.hero img{
width:500px;
border-radius:12px;
box-shadow:0 10px 30px rgba(0,0,0,0.2);
animation:floatCar 4s ease-in-out infinite;
}

@keyframes floatCar{
0%{ transform:translateY(0px); }
50%{ transform:translateY(-15px); }
100%{ transform:translateY(0px); }
}

/* SERVICES */

.services{
padding:70px;
text-align:center;
background:white;
animation:fadeUp 1.5s ease;
}

.services h2{
margin-bottom:40px;
font-size:34px;
color:#333;
}

/* SERVICE CARDS */

.cards{
display:flex;
justify-content:center;
gap:30px;
flex-wrap:wrap;
}

.card{
background:#f7f7f7;
padding:30px;
width:250px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.1);
transition:all 0.4s ease;
}

.card:hover{
transform:translateY(-15px) scale(1.05);
box-shadow:0 10px 30px rgba(0,0,0,0.25);
}

.card img{
width:70px;
margin-bottom:15px;
}

.card h3{
margin-bottom:10px;
}

.card p{
font-size:14px;
color:#666;
}

/* FADE ANIMATION */

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

/* FOOTER */

footer{
text-align:center;
padding:20px;
background:#222;
color:white;
margin-top:40px;
}

</style>
</head>

<body>

<nav>

<h2>Vehicle Service</h2>

<div>
<a href="home.jsp">Home</a>
<a href="#services">Service</a>
<a href="login.jsp">User Login</a>
<a href="mechanics.jsp">our Mechanics</a>
<a href="mechanicLogin.jsp">Mechanics</a>
<a href="adminLogin.jsp">Admin</a>
</div>

</nav>

<!-- HERO SECTION -->

<section class="hero">

<div class="hero-text">

<h1>Book Your Vehicle Service Online</h1>

<p>
Schedule maintenance or repair for your car, bike, truck or any vehicle in just a few clicks.
Avoid long waiting lines and manage your vehicle service easily.
</p>

<a class="btn" href="login.jsp">Login</a>
<a class="btn" href="Register.jsp">Register</a>

</div>

<img src="https://images.unsplash.com/photo-1503376780353-7e6692767b70">

</section>

<!-- SERVICES -->

<section class="services" id="services">

<h2>Our Services</h2>

<div class="cards">

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/2966/2966486.png">
<h3>Oil Change</h3>
<p>Complete engine oil replacement service.</p>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/3202/3202926.png">
<h3>Engine Check</h3>
<p>Full engine inspection and repair.</p>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/743/743922.png">
<h3>Vehicle Wash</h3>
<p>Professional cleaning for all vehicles.</p>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/3202/3202926.png">
<h3>Battery Check</h3>
<p>Battery testing and replacement for vehicles.</p>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/2966/2966486.png">
<h3>Tire Service</h3>
<p>Tire repair and replacement.</p>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/743/743131.png">
<h3>Brake Repair</h3>
<p>Brake inspection and repair service.</p>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/2972/2972185.png">
<h3>Bike Service</h3>
<p>Maintenance for motorcycles and scooters.</p>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/3774/3774278.png">
<h3>Truck Service</h3>
<p>Inspection and servicing for heavy vehicles.</p>
</div>

</div>

</section>

<footer>

© 2026 Vehicle Service Booking System

</footer>

</body>
</html>