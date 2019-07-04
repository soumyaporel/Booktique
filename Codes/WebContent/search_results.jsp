<%@ page import="java.util.*" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booktique: The Study Lounge</title>
<link href="search_results.css" rel="stylesheet" type="text/css" />
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
		<p id="thep" style="display: none;"><%= session.getAttribute("userid")%></p>
		<%!
		int i;
	%>
		<%
		ArrayList<Long> dbuploadid = (ArrayList<Long>) request.getAttribute("dbuploadid");
		ArrayList<String> dbuserid = (ArrayList<String>) request.getAttribute("dbuserid");
		ArrayList<String> dbfilename = (ArrayList<String>) request.getAttribute("dbfilename");
		ArrayList<String> dbfilesize = (ArrayList<String>) request.getAttribute("dbfilesize");
		ArrayList<java.sql.Date> dbuploaddate = (ArrayList<java.sql.Date>) request.getAttribute("dbuploaddate");
		ArrayList<String> dbinsti = (ArrayList<String>) request.getAttribute("dbinsti");
		ArrayList<String> dbbranch = (ArrayList<String>) request.getAttribute("dbbranch");
		ArrayList<String> dbs_year = (ArrayList<String>) request.getAttribute("dbs_year");
	%>
		<% if (dbuploadid.size() == 0){ %>
		<h1>Sorry, we could not find any files.</h1>
		<%}
	else{ %>
		<br>
		<h1><%= dbuploadid.size() %>
			files matches your query!
		</h1>
		<br>
		<% } %>
		<% for(i = dbuploadid.size()-1; i >= 0; i--)
	   { %>
		<div>
			<form method="get" action="download">
				<div id="id2">
					<label id="id1"> <%= dbfilename.get(i) %>
					</label><br>
					<br> <b>size: </b>
					<%= dbfilesize.get(i) %>
					<br> <b>uploaded on: </b>
					<%= dbuploaddate.get(i) %>
					<br> <b>uploaded by:</b>
					<%= dbuserid.get(i) %>
					<br> <b>name of institution: </b><%= dbinsti.get(i) %>
					<br> <b>branch: </b><%= dbbranch.get(i) %>
					<br> <b>year: </b><%= dbs_year.get(i) %>
				</div>
				<input type="hidden" name="uploadid"
					value="<%= dbuploadid.get(i) %>"><br> <input
					type="submit" value="download">
			</form>
			<br>
		</div>
		<% } %>
		<br>
		<br>
		<br>
		<br>
		<br>
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