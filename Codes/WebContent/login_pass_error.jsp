
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Booktique: The Study Lounge</title>
    <link href="login.css" rel="stylesheet" type="text/css" />
</head>
<body><br><br><br>
    <div class="login">
        <form method="post" action="login" style="text-align: center" >
        	<p style="color:yellow"> The password is not correct!</p>
        	<p style="color:yellow"> Please try again!</p>
            <h2 style="color:white">Log In</h2>
            <input type="text" name="userid" placeholder="userID" required ><br><br>
            <input type="password" name="pass" placeholder="password" required ><br><br>
            <a href=""><input type="submit" value="Log In"></a><br><br><br>
            don't have an account? <a href="signup.jsp">sign up</a>
        </form>
    </div>
</body>
</html>













