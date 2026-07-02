<%-- 
    Document   : reportIssue
    Created on : 26 Mar, 2026, 7:44:42 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Report Issue</title>

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
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            width: 400px;
            background: rgba(255,255,255,0.15);
            backdrop-filter: blur(12px);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.4);
            color: white;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            letter-spacing: 1px;
        }

        textarea {
            width: 100%;
            height: 120px;
            padding: 12px;
            border-radius: 8px;
            border: none;
            outline: none;
            resize: none;
            font-size: 14px;
        }

        textarea::placeholder {
            color: #555;
        }

        .btn {
            width: 100%;
            margin-top: 15px;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background: #007bff;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        .btn:hover {
            background: #0056b3;
        }

        .backbtn {
            width: 100%;
            margin-top: 10px;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background: #ff7a00;
            color: white;
            cursor: pointer;
        }

        .backbtn:hover {
            background: #e56a00;
        }
    </style>
</head>

<body>

<div class="form-container">
    <h2>Report Issue</h2>

    <form action="ReportIssueServlet" method="post">
        <input type="hidden" name="bookingId" value="<%= request.getParameter("bookingId") %>">

        <textarea name="message" placeholder="Enter issue..." required></textarea>

        <button type="submit" class="btn">Submit Issue</button>
    </form>

    <a href="mechanicDashboard.jsp">
        <button class="backbtn">Back</button>
    </a>
</div>

</body>
</html>
