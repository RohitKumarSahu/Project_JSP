<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p1.*;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="css/circles.css">
        <!-- font awesome -->
        
        
        
        
        
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=ABeeZee" rel="stylesheet">
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <title>UserDash</title>
        <style>
        header{
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
            top:0;  
            background: url("airport3.jpg");
        }
        @media screen and (max-width: 990px){
          header{
            padding-left:0px;
          }
        }
body {
background-color: #fafafa;
font-size: 16px;
line-height: 1.5;
}
 
h1,h2,h3,h4,h5,h6 {
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
box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.14),
0 1px 18px 0 rgba(0, 0, 0, 0.12),
0 3px 5px -1px rgba(0, 0, 0, 0.2);
}
 
#revenue-column-chart, #products-revenue-pie-chart, #orders-spline-chart {
height: 300px;
width: 100%;
}
.box {
width: 200px;
background: hsl(120, 50%, 80%);
border: 2px solid blue;
border-radius: 2px;
text-align: center;
margin-left: 37%;
}
.button 
{
 	display: inline; 
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
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
                        title: "Day",
                        includeZero: false,
                        valueFormatString: "DD MMM,YY"
                    },
                    axisY: {
                        title: "Response",
                        includeZero: true,
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
                            { x: new Date(2019, 2, 01), y: 0 },
                            { x: new Date(2019, 2, 03), y: 1 },
                            { x: new Date(2019, 2, 05), y: 1 },
                            { x: new Date(2019, 2, 07), y: 0 },
                            { x: new Date(2019, 2, 09), y: 0 },
                            { x: new Date(2019, 2, 11), y: 1 },
                            { x: new Date(2019, 2, 13), y: 0 }
                        ]
                    },
                   ]
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
<%
session=request.getSession(false);  
        if(session!=null){  
        //String name=(String)session.getAttribute("name");  
          %>
          <header>
        <nav class="nav-wrapper navigation">
            <div class="container">
                <a href="#" class="brand-logo hide-on-med-and-down" align="center">&nbsp;Attendance Marking System</a>
                <a href="#" class="brand-logo hide-on-large-only">Marking System</a>
                <a href="#" class="sidenav-trigger" data-target="mobile-menu">
                    <i class="material-icons">menu</i>
                </a>
            </div>
        </nav>
        </header>
        <ul class="sidenav grey lighten-4" id="mobile-menu">
           <li><div class="user-view">
                    <div class="background">
                        <img src="background.jpg"/>
                    </div>
                    <a href="#"><img class="circle col s12 m4 offset-m1" src="background.jpg"/></a>
                    <a href="#"><span class="white-text name">Welcome User_Name</span></a>
                    <a href="#email"><span class="white-text email">user.email@gmail.com</span></a>
                </div></li>
            <li><a class="waves-effect modal-trigger" href="#modal1">Sessions</a></li>
            <li><a class="waves-effect modal-trigger" href="#modal2">Present</a></li>
        <li><a class="waves-effect modal-trigger" href="#modal3">Absentees</a></li>
        </ul>
        <ul class="sidenav sidenav-fixed hide-on-large-and-down">
            <li><div class="user-view">
                    <div class="background">
                        <img src="back.jpg"/>
                    </div>
                    <a href="#"><img class="circle col s12 m4 offset-m1" src="bean.jpg"/></a>
                    <a href="#"><span class="white-text name">Welcome <%   if(session!=null){  
                        String name=(String)session.getAttribute("na");  
                        
                        out.print(name);  
                        }  
   %>
                    
                    
                    </span></a>
                    <a href="#email"><span class="white-text email">user.email@gmail.com</span></a>
                </div></li>
            <!--  <li><a class="waves-effect modal-trigger" href="#modal1">Edit Profile</a></li>-->
            <li><a class="waves-effect modal-trigger" href="#modal2">Switch Session</a></li>
        <li><a class="waves-effect modal-trigger" href="#modal3">Attendance Chart</a></li>
        <%if(Feedback.d==1 && FeedbackForm.e==0){ %>
        <li><a class="waves-effect modal-trigger" href="feedback.html">Feedback</a></li>
        
        <%}else if(FeedbackForm.e==1){%>
        <li><a class="waves-effect modal-trigger" href="#modal10">Feedback</a></li>
        <%}else{ %>
        <li><a class="waves-effect modal-trigger" href="#modal9">Feedback</a></li>
        <%} %>

        
		<%if(NotifyAll.q==1) {%>
        <li><a class="waves-effect modal-trigger" href="#modal11">Notifications</a></li>
        <%}else{ %>
         <li><a class="waves-effect modal-trigger" href="#">Notifications</a></li>
         <%} %>
        <!-- <li><a class="waves-effect modal-trigger" href="#modal12">Notifications</a></li> -->
         
        <li><a class="waves-effect modal-trigger" href="#modal4">Logout</a></li>
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

        

<!--<div class="container">
<div class="row m-b-1">
<div class="col s12 m12 l12">
<div class="card shadow">
<h4 class="card-header">Sessions</h4>
<div class="card-block">
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
</div>
</div>
</div> -->
       

        <div id="modal1" class="modal">
            <div class="modal-content">
            <div class="container">
            
                <h4>Do you want to start a new session?</h4><br/><br />
                <p class="container center-align"><button class="btn waves-effect blue darken-4">Schedule</button></p>
            
            <div class="modal-footer">
                <a href="#" class="modal-close waves-effect waves-green btn-flat">Okay</a>
            </div>
                </div>
                </div>
                </div>
       
       
       <div id="modal9" class="modal">
         
            <div class="modal-content">
                <h2>Feedback</h2>
            
            <div class="container">
                No Feedback Form available
 
           
            <div class="modal-footer">
                <a href="#" class="modal-close waves-effect waves-green btn-flat">Done</a>
            </div>
                </div>
                </div>
             </div>
             
       
        <div id="modal10" class="modal">
         
            <div class="modal-content">
                <h2>Feedback</h2>
            
            <div class="container">
               Feedback Form already submitted
 
           
            <div class="modal-footer">
                <a href="#" class="modal-close waves-effect waves-green btn-flat">Done</a>
            </div>
                </div>
                </div>
             </div>
             
          <div id="modal11" class="modal">
         
            <div class="modal-content">
                <h2 align="center">Notifications</h2>
            
            <div class="container">
            <form action="WarningServlet" method="post">
      			Enter reason for absenteeism<br/>
					<input type="text" name="absent" width="48" height="48" required/><br/>
						<button class="btn col s12 m3 waves-effect blue darken-4" style="margin-left: 40%">Send</button>
						</form>
 
           
                </div>
                </div>
             </div>   
             
             







	<div id="modal2" class="modal">
         
            <div class="modal-content">
                <h2>Switch Session</h2>
            
            <div class="container">
                <button class="btn col s12 m3 waves-effect blue darken-4"> <a class="waves-effect modal-trigger" href="#modalc">Classroom Session</a></button>
                <button class="btn col s12 m3 waves-effect blue darken-4"><a class="waves-effect modal-trigger" href="#modalw">Webex Session</a></button>
 
           
            <div class="modal-footer">
                <a href="#" class="modal-close waves-effect waves-green btn-flat">Done</a>
            </div>
                </div>
                </div>
             </div>
             
              <div id="modal4" class="modal">
            <div class="modal-content">
            <div class="container">
            
                <h4>Do you want to Logout?</h4><br/><br />
                <form id="log" action="LogoutServ" method="post">
                <button class="btn col s12 m3 waves-effect blue darken-4" form="log" style="margin-left:30%;margin-top:5%;">Yes</button>
                </form>
                <button class="btn col s12 m3 waves-effect blue darken-4" style="margin-left:50%;margin-top:-37px;"><a href="#"  class="modal-close waves-effect waves-green btn-flat" style="color:white;">No</a></button>
                </div>
                </div>
                </div>
             
             
             
             
             
             
             
             
             
        <div id="modal3" class="modal">
            <div class="modal-content">
                <h2 id="header">
<strong>Attendance Analysis</strong>
</h2>
<div class="row m-b-1">
<div class="col s12 m12 l12">
<div class="card shadow">
<h4 class="card-header">Day wise Attendance</h4>
<div class="card-block">
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
</div>
</div>
</div>
        </div>
                </div>
            </div>

        
        <div id="modalc" class="modal">
            <div class="modal-content">
            <div class="container">
            <form action="UserServlet" method="post" id="test">
            
                <h4>Do you want to start a new classroom session?</h4><br/><br />
               <button class="btn waves-effect blue darken-4" form="test">Yes</button>
               <button class="btn waves-effect blue darken-4"><a href="#"  class="modal-close waves-effect waves-green btn-flat" style="color:white;">No</a></button>
               </form>
            
            <div class="modal-footer">
                <a href="#" class="modal-close waves-effect waves-green btn-flat">Okay</a>
            </div>
                </div>
                </div>
                </div>

         <div id="modalw" class="modal">
            <div class="modal-content">
            <div class="container">
            
                <h4>Do you want to start a new Webex session?</h4><br/><br />
               <button class="btn waves-effect blue darken-4">Yes</button>
               <button class="btn waves-effect blue darken-4"><a href="#" class="modal-close waves-effect waves-green btn-flat" style="color:white;">No</a></button>
            
            <div class="modal-footer">
                <a href="#" class="modal-close waves-effect waves-green btn-flat">Okay</a>
            </div>
                </div>
                </div>
                </div>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js">
        </script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.sidenav').sidenav();
                $('.modal').modal();
            });
        </script>
         <script>   
            var modal = document.getElementById('myModal');

            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            btn.onclick = function () {
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
            </script>
            <%
        }  
        else{  
        	out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Error Login' ,  'Please Login to Access Dashboard' ,  'error' );");
			out.println("});");
			out.println("setTimeout(function() {");
			out.println("window.location.href = 'Login.html'");
				  out.println("}, 3000)");
			out.println("</script>");
			out.println("</script>");
			//request.getRequestDispatcher("/Login.html").forward(request, response);
			
			
        }  
        out.close();  
  %>         
</body>
</html>