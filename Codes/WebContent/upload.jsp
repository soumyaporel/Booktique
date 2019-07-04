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
	padding-top: 109px;
}

form {
	width: 600px;
	background-color: rgba(10, 20, 30, 0.7);
	margin: 0 auto;
	padding: 20px;
}

form ol {
	padding-left: 0;
}

form li, div>p {
	background: rgba(0, 0, 0, 0);
	color: deepskyblue;
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
	list-style-type: none;
}

form p {
	line-height: 22px;
	padding-left: 10px;
	white-space: pre-line;
}

form label {
	background-color: #00c9ff;
	color: white;
	padding: 10px 17px;
	border-radius: 18px;
	border: none;
	font-size: 18px;
	font-weight: medium;
	cursor: pointer;
}

form button {
	background-color: #00c9ff;
	color: white;
	padding: 10px 17px;
	border-radius: 18px;
	border: none;
	font-size: 20px;
	font-weight: medium;
	cursor: pointer;
}

form label:hover, form button:hover {
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
	color: #fff;
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
		   	if(session.getAttribute("uploaded") == null) //during 1st visit of upload.jsp
		    	{session.setAttribute("uploaded",0);}
		%>
	<header id="header">
		<nav>
			<h1>
				Booktique<br> the study lounge
			</h1>
			<ul>
				<li><a class="homeblack" href="welcome.jsp">Home</a></li>
				<li><a class="homeblack" href="search.jsp">Search Files</a></li>
				<li><a class="homered" href="upload.jsp">Upload Files</a></li>
				<li><a class="homeblack" href="youruploads">Your Uploads</a></li>
				<li><a id="logout" class="homeblack" href="logout">Log Out</a></li>
			</ul>
		</nav>
	</header>
	<div class="content">
		<p id="thep" style="display: none;"><%= session.getAttribute("userid")%></p>

		<br>
		<br>
		<br>
		<form method="post" action="upload" enctype="multipart/form-data">
			<div>
				<% if((Integer)session.getAttribute("uploaded") == 1){ %>
				<h2>file has been uploaded successfully!</h2>
				<%  session.setAttribute("uploaded",0); } 
			else {%>
				<h2></h2>
				<% } %>
				<br> <label for="text_uploads">choose texts to upload</label><br>
				<br>
				<h3 style="color: #00ffff;">Enter your branch and year below:</h3>
				<input class="in" type="text" name="branch" placeholder="branch"><br>
				<br> <input class="in" type="text" name="s_year"
					placeholder="year"> <input class="cl" type="file"
					id="text_uploads" name="file"
					accept=".pdf, .java, .c, .ipynb, .war, .jar, .zip, .txt, .csv, .db, .log, .sql, .xml, .bat, .bin, .cgi, .jar, .py, .wsf, .fnt, .asp, .css, .htm, .html, .js, .jsp, .php, .rss, .xhtml, .pps, .ppt, .pptx, .key, .odp, .class, .cs, .h, .sh, .swift, .vb, xlr, .xls, .xlsx, .doc, .docx, .rtf, .tex, .wps, .wks, .wpd"
					multiple>
			</div>

			<div class="preview">
				<p>No files currently selected for upload</p>
			</div>
			<div>
				<button>upload</button>
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
        var input = document.querySelector('input.cl');
        var preview = document.querySelector('.preview');
        input.style.opacity = 0;
        input.addEventListener('change', updateTextDisplay);
        function updateTextDisplay() 
        {
          while(preview.firstChild) 
          {
            preview.removeChild(preview.firstChild);
          }
          var curFiles = input.files;
          if(curFiles.length === 0) 
          {
            var para = document.createElement('p');
            para.textContent = 'No files currently selected for upload';
            preview.appendChild(para);
          } 
          else 
          {
            var list = document.createElement('ol');
            preview.appendChild(list);
            for(var i = 0; i < curFiles.length; i++) 
            {
              var listItem = document.createElement('li');
              var para = document.createElement('p');
              para.textContent = 'FILE NAME: ' + curFiles[i].name + '\r\nFILE SIZE: ' + returnFileSize(curFiles[i].size) + '.';
              listItem.appendChild(para);   
              list.appendChild(listItem);
            }
          }
        }
        function returnFileSize(number) {
          if(number < 1024) {
            return number + 'bytes';
          } else if(number >= 1024 && number < 1048576) {
            return (number/1024).toFixed(1) + 'KB';
          } else if(number >= 1048576) {
            return (number/1048576).toFixed(1) + 'MB';
          }
        }

	 	var userr = document.getElementById("thep").innerHTML;
     </script>

</body>
</html>