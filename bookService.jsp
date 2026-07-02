<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Book Vehicle Service</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', Arial;
}

/* BODY */
body{
    height:100vh;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;

    background:
        linear-gradient(rgba(0,0,0,0.65),rgba(0,0,0,0.65)),
        url("images/bike.jpg");
    background-size:cover;
    background-position:center;
}

/* HEADER */
header{
    position:absolute;
    top:0;
    width:100%;
    background:rgba(0,0,0,0.7);
    color:white;
    padding:18px;
    text-align:center;
    font-size:24px;
    letter-spacing:1px;
}

/* BACK BUTTON */
.back-btn{
    position:absolute;
    top:20px;
    left:20px;
    background:#ff7a00;
    color:white;
    padding:8px 18px;
    text-decoration:none;
    border-radius:6px;
    font-size:14px;
    transition:0.3s;
}
.back-btn:hover{
    background:#ff9d3a;
}

/* CONTAINER */
.container{
    width:420px;
    background:rgba(255,255,255,0.18);
    backdrop-filter:blur(15px);
    padding:35px 40px;
    border-radius:15px;
    box-shadow:0 10px 40px rgba(0,0,0,0.6);
    color:white;
}

/* TITLE */
.container h2{
    text-align:center;
    margin-bottom:25px;
    font-size:24px;
}

/* LABELS */
label{
    display:block;
    margin-top:10px;
    font-size:14px;
}

/* INPUTS */
input, select{
    width:100%;
    padding:11px;
    margin-top:6px;
    margin-bottom:15px;
    border-radius:6px;
    border:none;
    outline:none;
    font-size:14px;
    transition:0.3s;
}

/* INPUT FOCUS & HOVER */
input:focus, select:focus, input:hover, select:hover{
    box-shadow:0 0 6px #ff7a00;
}

/* BUTTON */
#book{
    width:100%;
    padding:12px;
    background:#ff7a00;
    color:white;
    border:none;
    border-radius:6px;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

/* BUTTON HOVER */
#book:hover{
    background:#ff9d3a;
    transform:scale(1.03);
}

</style>
</head>

<body>

<header>
Book Vehicle Service
</header>

<a href="dashboard.jsp" class="back-btn">← Back</a>

<div class="container">

<h2>Service Booking</h2>

<form action="BookServiceServlet" method="post" onsubmit="return showToken(event)">

<label>Vehicle Type</label>
<select name="vehicletype">
<option>Car</option>
<option>Bike</option>
</select>

<label>Vehicle Number</label>
<input type="text" name="vehiclenumber" placeholder="TN-00-00-ABCD">

<label>Service Type</label>
<select name="servicetype">
<option>General Service</option>
<option>Oil Change</option>
<option>Engine Check</option>
<option>Water Wash</option>
<option>Full Service</option>
</select>

<label>Service Date</label>
<input type="date" name="servicedate">

<label>Service Time</label>
<input type="time" name="servicetime">

<input type="submit" value="Book Service" id="book">

</form>

</div>

<script>
const dateInput = document.querySelector('input[name="servicedate"]');
const today = new Date().toISOString().split('T')[0];
dateInput.min = today;

</script>

</body>
</html>