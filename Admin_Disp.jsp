<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin_Dashboard</title>
<link rel="stylesheet" href="css/circles.css">
<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=ABeeZee"
	rel="stylesheet">
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
<style>
header {
	padding-left: 300px;
}
.leftnav {
	height: 100%;
	width: 15%;
	position: fixed;
	z-index: -1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	padding-top: 20px;
}
.leftnav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
}
.leftnav a:hover {
	color: #f1f1f1;
}
.navigation {
	position: sticky;
	top: 0;
	background: url(img/abstract.png);
}
@media screen and (max-width: 990px) {
	header {
		padding-left: 0px;
	}
}
body {
	background-color: #fafafa;
	font-size: 16px;
	line-height: 1.5;
}
h1, h2, h3, h4, h5, h6 {
	font-weight: 400;
}
#header {
	border-bottom: 5px solid #37474F;
	color: #37474F;
	margin-bottom: 1.5rem;
	padding: 1rem 0;
}
#revenue-tag {
	font-weight: inherit !important;
	border-radius: 0px !important;
}
.card {
	border: 0rem;
	border-radius: 0rem;
}
.card-header {
	background-color: #37474F;
	border-radius: 0 !important;
	color: white;
	margin-bottom: 0;
	padding: 1rem;
}
.card-block {
	border: 1px solid #cccccc;
}
.shadow {
	box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.14), 0 1px 18px 0
		rgba(0, 0, 0, 0.12), 0 3px 5px -1px rgba(0, 0, 0, 0.2);
}
#revenue-column-chart, #products-revenue-pie-chart, #orders-spline-chart
	{
	height: 300px;
	width: 100%;
}
</style>
<body>

<div id="modal3" class="modal">
					<div class="modal-content">
						<h4>List of Students Absent for Session</h4>
						<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://localhost/test" user="root" password="root" />
						<sql:query dataSource="${snapshot}" var="result">
         			SELECT ID, Name from analysis where attend=0;
						</sql:query>
						<table border="1" width="100%">
							<tr>
								<th>ID</th>
								<th>Name</th>
							</tr>

							<c:forEach var="row" items="${result.rows}">
								<tr>
									<td><c:out value="${row.ID}" /></td>
									<td><c:out value="${row.Name}" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="container">
						<button class="btn col s12 m3 waves-effect blue darken-4">Notify</button>
						<button
							class="container btn col s12 m3 offset-m2 waves-effect blue darken-4">Ask
							Feedback</button>

					</div>
					<div class="modal-footer">
						<a href="#" class="modal-close waves-effect waves-green btn-flat">Done</a>
					</div>
				</div>
				<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js">
        </script>
				<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
				<script>
            $(document).ready(function(){
                $('.sidenav').sidenav();
                $('.modal').modal();
            });
        </script>
</body>
</html>