<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booktique: The Study Lounge</title>
<style>
html {
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Montserrat', sans-serif;
	color: #000;
	background:
		url(https://images.pexels.com/photos/938965/pexels-photo-938965.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940);
	background-size: 100%;
	margin: 0;
	padding: 0;
}

header {
	background: black;
	color: white;
	padding: 8px 0px 6px 40px;
	height: 86px;
}

header h1 {
	display: inline;
	font-family: 'Playfair Display', serif;
	font-weight: 400;
	font-size: 30px;
	margin-top: 0px;
	margin-right: 0px;
	padding: 0px;
	float: left;
	color: #00ffff;
}

nav ul {
	display: inline;
	float: left;
	padding-left: 0px;
	margin-top: 29px;
	margin-left: 36px;
}

nav ul li {
	display: inline-block;
	list-style-type: none;
	color: white;
	float: left;
	margin-left: 0px;
}

nav ul li a {
	color: white;
	text-decoration: none;
	font-family: 'Montserrat', sans-serif;
	font-weight: 500;
	font-size: 25px;
	width: 100%;
	height: 100%;
}

.homered {
	background-color: #00c9ff;
	padding: 38px 20px 34px 20px;
}

.homeblack {
	padding: 38px 20px 34px 20px;
}

.homered:hover {
	background-color: #00ffec;
}

.homeblack:hover {
	background-color: #00ffec;
}

#logout {
	margin-left: 240px;
}

.content {
	padding: 16px;
}

.sticky {
	position: fixed;
	top: 0;
	width: 100%;
}

.sticky+.content {
	padding-top: 116px;
}

form {
	width: 600px;
	background: rgba(10, 20, 30, 0.7);
	margin: 0 auto;
	padding: 20px;
}

form button {
	background-color: #00c9ff;
	font-family: 'Montserrat', sans-serif;
	color: white;
	padding: 10px 20px;
	border-radius: 23px;
	border: none;
	font-size: 25px;
	font-weight: medium;
	cursor: pointer;
}

form button:hover {
	background-color: #00ffae;
	color: white;
}

.in {
	width: 240px;
	background: transparent;
	border: none;
	border-bottom: 1px solid #fff;
	font-family: 'Play', sans-serif;
	font-size: 16px;
	font-weight: 200px;
	padding: 10px 0;
	transition: border 0.5s;
	outline: none;
	color: white;
}

h2 {
	color: white;
}

#da {
	padding: 38px 20px 34px 20px;
}

#da:hover {
	background-color: #00ffec;
}

::placeholder {
	color: #ffffff;
}

@media screen and (max-width: 1325px) {
	#logout {
		margin-left: 10px;
	}
}

@media screen and (max-width: 1090px) {
	header {
		padding: 8px 0px 238px 40px;
	}
	header h1 {
		display: block;
		margin-top: 0px;
		margin-right: 0px;
		padding: 0px;
		float: none;
		color: #00ffff;
	}
	nav ul {
		display: block;
		float: none;
		padding-left: 0px;
		margin-top: 0px;
		margin-left: 0px;
	}
	nav ul li {
		display: block;
		float: none;
		margin-left: 0px;
		margin-bottom: 19px;
	}
	.homered {
		padding: 10px 10px 10px 10px;
	}
	.homeblack {
		padding: 10px 10px 10px 10px;
	}
	#logout {
		margin-left: 0px;
	}
	.content {
		padding-top: 40px;
	}
	.sticky {
		position: fixed;
		margin-top: 0;
		width: 100%;
	}
	.sticky+.content {
		padding-top: 370px;
	}
}
</style>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	
		if( session.getAttribute("userid") == null)
		{
			response.sendRedirect("index.jsp");
		}
	%>
	<header id="header">
		<nav>
			<h1>
				Booktique<br> the study lounge
			</h1>
			<ul>
				<li><a class="homeblack" href="welcome.jsp">Home</a></li>
				<li><a class="homered" href="search.jsp">Search Files</a></li>
				<li><a class="homeblack" href="upload.jsp">Upload Files</a></li>
				<li><a class="homeblack" href="youruploads">Your Uploads</a></li>
				<li><a id="logout" class="homeblack" href="logout">Log Out</a></li>
			</ul>
		</nav>
	</header>
	<div class="content">
		<br>
		<p id="thep" style="display: none;"><%= session.getAttribute("userid")%></p>

		<form method="get" action="search">
			<div>
				<h2 style="color: #00ffff;">Enter your query:</h2>
				<input class="in" type="text" placeholder="name of file"
					name="filename"><br>
				<br> <input class="in" type="text"
					placeholder="format of file (ex: pdf, docx etc.)" name="format"><br>
				<br> <input class="in" type="text"
					placeholder="userid of uploader" name="userid"><br>
				<br> <input class="in" type="text"
					placeholder="branch of uploader" name="branch"><br>
				<br> <input class="in" type="text"
					placeholder="year of uploader" name="s_year"><br>
				<br> <input class="in" type="text"
					placeholder="college of uploader" name="insti"><br>
				<br>
				<button>Search</button>
			</div>
		</form>
	</div>
	<script>
            window.onscroll = function() {myFunction()};

            var header = document.getElementById("header");
            var sticky = header.offsetTop;

            function myFunction() 
            {
                if (window.pageYOffset > sticky) 
                {
                    header.classList.add("sticky");
                } 
                else 
                {
                    header.classList.remove("sticky");
                }
            }
            
	        var userr = document.getElementById("thep").innerHTML;
        </script>

</body>
</html>