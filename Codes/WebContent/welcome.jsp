<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booktique: The Study Lounge</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Poiret+One&display=swap');

html {
	margin: 0;
	padding: 0;
}

body {
	font-family: Tahoma, Geneva, sans-serif;
	color: #000;
	margin: 0;
	padding: 0px 0px 70px 0px;
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
	margin-left: 220px;
}

.sticky {
	position: fixed;
	margin-top: 0;
	width: 100%;
}

.sticky+.content {
	padding-top: 160px;
}

#da {
	padding: 38px 20px 34px 20px;
}

#da:hover {
	background-color: #00ffec;
}

.content1 {
	background:
		url(https://www.holoniq.com/wp-content/uploads/2019/01/E-learning-and-education-520374378_1369x770.jpeg);
	background-size: 100%;
}

.content {
	background-image: linear-gradient(rgba(10, 20, 30, 0.9),
		rgba(10, 20, 30, 0.4));
	padding: 60px 80px 220px 100px;
	color: white;
}

.thep1 {
	padding: 0;
	margin-bottom: 35px;
	color: white;
	font-family: 'Poiret One', cursive;
	font-weight: 100;
	font-size: 50px;
}

.thep2 {
	padding: 0;
	margin: 0;
	color: white;
	font-family: 'Poiret One', cursive;
	font-weight: 400;
	font-size: 50px;
}

.thep3 {
	padding: 0;
	margin: 0;
	color: #00ffff;
	font-family: 'Playfair Display', serif;
	font-weight: 400;
	font-size: 60px;
}

.thep4 {
	color: white;
	font-family: 'Montserrat', sans-serif;
	font-weight: 500;
	font-size: 25px;
}

.content span {
	color: #00c9ff;
}

.content a {
	color: white;
	text-decoration: none;
	font-family: 'Montserrat', sans-serif;
	font-weight: 500;
	font-size: 25px;
	width: 100%;
	height: 100%;
}

.content a:hover {
	color: yellow;
}

.lower {
	padding: 40px 300px 10px 160px;
}

#aboutush {
	color: purple;
	mrgin-bottom: 15px;
	padding: 0px 0px 8px 0px;
	font-family: 'Montserrat', sans-serif;
	font-weight: 500;
	font-size: 40px;
	width: 100%;
	height: 100%;
}

#aboutus {
	color: black;
	font-family: 'Montserrat', sans-serif;
	font-weight: 100;
	font-size: 20px;
	width: 100%;
	height: 100%;
	line-height: 30px;
	padding: 0px 0px 0px 1px;
}

@media screen and (max-width: 1295px) {
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
	<div class="content1">
		<header id="header">
			<nav>
				<h1>
					Booktique<br> the study lounge
				</h1>
				<ul>
					<li><a class="homered" href="welcome.jsp">Home</a></li>
					<li><a class="homeblack" href="search.jsp">Search Files</a></li>
					<li><a class="homeblack" href="upload.jsp">Upload Files</a></li>
					<li><a class="homeblack" href="youruploads">Your Uploads</a></li>
					<li><a id="logout" class="homeblack" href="logout">Log Out</a></li>
				</ul>
			</nav>
		</header>

		<div class="content">
			<div class="thep1">
				Hello <span class="yellow"><%= session.getAttribute("userid")%></span>
			</div>
			<div class='thep2'>Welcome to</div>
			<div class="thep3">Booktique: the Study Lounge</div>
			<br>
			<div class="thep4">

				Sharing is caring. Share your files with everyone by clicking <a
					href="upload.jsp">here.</a><br> You can search for your
				required files by clicking <a href="search.jsp">here.</a><br>
			</div>
		</div>
	</div>
	<div class="lower">
		<div id="aboutush">About Us</div>
		<div id="aboutus">Booktique is a website designed specifically
			for helping college students. Students can share their educational
			files like pdf files, programming files, presentations effortlessly
			on Booktique. Students can also search for their required files
			according to the college name, branch, year, username of the
			uploader. This website is developed by Soumya Porel, Shikha Samat,
			Satyam Banik under the supervision of Sumit Gupta Sir.</div>
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