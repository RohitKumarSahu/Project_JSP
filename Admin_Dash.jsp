<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
<title>AdminDash</title>
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
<script>
            window.onload = function () {
                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    title: {
                        text: "Session Characteristics"
                    },
                    axisX: {
                        title: "No of Sessions",
                        includeZero: false,
                        valueFormatString: "DD MMM,YY"
                    },
                    axisY: {
                        title: "No. of Students",
                        includeZero: false,
                    },
                    legend: {
                        cursor: "pointer",
                        fontSize: 16,
                        itemclick: toggleDataSeries
                    },
                    toolTip: {
                        shared: true
                    },
                    data: [
                    {
                        name: "Presentees",
                        type: "spline",
                        yValueFormatString: "#0.## ",
                        showInLegend: true,
                        dataPoints: [
                            { x: new Date(2019, 2, 01), y: 20 },
                            { x: new Date(2019, 2, 03), y: 24 },
                            { x: new Date(2019, 2, 05), y: 25 },
                            { x: new Date(2019, 2, 07), y: 18 },
                            { x: new Date(2019, 2, 09), y: 21 },
                            { x: new Date(2019, 2, 11), y: 22 },
                            { x: new Date(2019, 2, 13), y: 23 }
                        ]
                    },
                    {
                        name: "Absentees",
                        type: "spline",
                        yValueFormatString: "#0.## ",
                        showInLegend: true,
                        dataPoints: [
                            { x: new Date(2019, 2, 01), y: 5 },
                            { x: new Date(2019, 2, 03), y: 1 },
                            { x: new Date(2019, 2, 05), y: 0 },
                            { x: new Date(2019, 2, 07), y: 7 },
                            { x: new Date(2019, 2, 09), y: 4 },
                            { x: new Date(2019, 2, 11), y: 3 },
                            { x: new Date(2019, 2, 13), y: 2 }
                        ]
                    }]
                });
                chart.render();
                function toggleDataSeries(e) {
                    if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                        e.dataSeries.visible = false;
                    }
                    else {
                        e.dataSeries.visible = true;
                    }
                    chart.render();
                }
            }
    </script>
</head>
<body>
	<header> <nav class="nav-wrapper navigation">
	<div class="container">
		<a href="#" class="brand-logo hide-on-med-and-down">Attendance
			Marking System</a> <a href="#" class="brand-logo hide-on-large-only">Marking
			System</a> <a href="#" class="sidenav-trigger" data-target="mobile-menu">
			<i class="material-icons">menu</i>
		</a>
	</div>
	</nav> </header>
	<ul class="sidenav grey lighten-4" id="mobile-menu">
		<li><div class="user-view">
				<div class="background">
					<img src="img/abstract.jpg" />
				</div>
				<a href="#"><img class="circle col s12 m4 offset-m1"
					src="img/gates.jpg" /></a> <a href="#"><span
					class="white-text name">Welcome Admin_Name</span></a> <a href="#email"><span
					class="white-text email">admin.email@gmail.com</span></a>
			</div></li>
		<li><a class="waves-effect modal-trigger" href="#modal1">Sessions</a></li>
		<li><a class="waves-effect modal-trigger" href="#modal2">Present</a></li>
		<li><a class="waves-effect modal-trigger" href="#modal3">Absentees</a></li>
	</ul>
	<ul class="sidenav sidenav-fixed hide-on-large-and-down">
		<li><div class="user-view">
				<div class="background">
					<img src="img/abstract.jpg" />
				</div>
				<a href="#"><img class="circle col s12 m4 offset-m1"
					src="img/gates.jpg" /></a> <a href="#"><span
					class="white-text name">Welcome Admin_Name</span></a> <a href="#email"><span
					class="white-text email">admin.email@gmail.com</span></a>
			</div></li>
		<li><a class="waves-effect modal-trigger" href="#modal1">Sessions</a></li>
		<li><a class="waves-effect modal-trigger" href="#modal2">Present</a></li>
		<li><a class="waves-effect modal-trigger" href="#modal3">Absentees</a></li>
	</ul>
	<!-- <div class="leftnav hide-on-med-and-down">
            <div class="conatiner">
            <ul>
                <li><a class="waves-effect" href="#skills">Skills</a></li>
                <li><a class="waves-effect" href="#projects">Project</a></li>
    	        <li><a class="waves-effect" href="#education">Education</a></li>
                <li><a class="waves-effect" href="#contact">Contact</a></li>
            </ul>
            </div>
        </div> -->

	<div class="container">
		<h2 id="header" class="container">
			<strong>Sessions Analytics</strong>
		</h2>
		<div class="container">
			<div class="row m-b-1">
				<div class="col s12 m12 l12">
					<div class="card shadow">
						<h4 class="card-header">Sessions</h4>
						<div class="card-block">
							<div id="chartContainer" style="height: 370px; width: 100%;"></div>
						</div>
					</div>
				</div>
				<div></div>

				<div id="modal1" class="modal">
					<div class="modal-content">
						<h4>Do you want to start a new session?</h4>
						<br />
						<br />
						<p class="container center-align">
							<button class="btn waves-effect blue darken-4">Schedule</button>
						</p>
					</div>
					<div class="modal-footer">
						<a href="#" class="modal-close waves-effect waves-green btn-flat">Okay</a>
					</div>
				</div>
				<div id="modal2" class="modal">
					<div class="modal-content">
						<h4>List of Students Present for Session</h4>
						<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://localhost/test" user="root" password="root" />
						<sql:query dataSource="${snapshot}" var="result">
         			SELECT ID, Name from analysis where attend=1;
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
					<div class="modal-footer">
						<a href="#" class="modal-close waves-effect waves-green btn-flat">Okay</a>
					</div>
				</div>
				<div id="modal3" class="modal">
					<div class="modal-content">
						<h4>List of Students Absent for Session</h4>
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