<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Booktique: The Study Lounge</title>
    <link href="login.css" rel="stylesheet" type="text/css" />
</head>
<body><br><br><br><br>
    <div class="login">
        <form method="post" action="signup" style="text-align: center" >
            <h2 style="color:white">Sign Up</h2>
            <input type="text" name="name" placeholder="name" required ><br><br>
            <input type="text" name="userid" placeholder="userID" required ><br><br>
            <input type="text" name="insti" placeholder="the official name of institution" required ><br><br>
            <input type="password" name="pass" placeholder="password" required ><br><br>
            <a href=""><input type="submit" value="Create Account"></a><br><br><br>
            already have an account? <a href="index.jsp">log in</a>
        </form>
    </div>
</body>
</html>