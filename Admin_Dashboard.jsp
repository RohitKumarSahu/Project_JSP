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
<title>Profile</title>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
     <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</head>

<style>
    /* Clicking the label does not activate the input without this */
    input[type="text"]+label {
        pointer-events: none;

        * {
            pointer-events: all;
        }
    }

    input[type="email"]+label {
        pointer-events: none;

        * {
            pointer-events: all;
        }
    }


    input[type="tel"]+label {
        pointer-events: none;

        * {
            pointer-events: all;
        }
    }

    input[type="number"]+label {
        pointer-events: none;

        * {
            pointer-events: all;
        }
    }

    input[type="password"]+label {
        pointer-events: none;

        * {
            pointer-events: all;
        }
    }


    header,
    main,
    footer {
        padding-left: 300px;
    }
    
    

    @media only screen and (max-width : 992px) {

        header,
        main,
        footer {
            padding-left: 0;
        }
    }
    #sub1{
    
    display: inline-block;
    }
    
    .tabs .indicator {

  background-color: purple;

}

/*To change the active state color use the following code in .css file:*/

.tabs .tab a.active {

  background-color: white !important;

  color: purple !important;

}

/*To change the background color on hover use the following code in .css file:*/

.tabs .tab a:hover {

  background-color: #eee;

}

/*To change the link color use the following code in .css file:*/

.tab a {

  font-weight: 600;

  color: rgb(105, 105, 105) !important;

}
    

</style>
</head>
<body style="">
    <div class="navbar-fixed">
    <nav style="background-color: #673ab7;"> <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a> 
        <div class="nav-wrapper" style="text-align: center;">
        <img src="icons/aero.png" style="width: 109px;margin-top: 16px;">
<!--        <h5>AERO</h5>-->
        </div>
        
        </nav>
        </div>
    <br>

    <ul id="slide-out" class="sidenav sidenav-fixed" >
          <li>
            <div class="user-view">
                <div class="background">
                    <img src="download3.jpg">
                </div>
                <a href="#user"><img class="circle" src="download1.jpg"></a>
                <a href="#name"><span class="white-text name">Admin</span></a>
                <a href="#email"><span class="white-text email">jdandturk@gmail.com</span></a>
            </div>
        </li>
        <!--  <li><a href="#!"><i class="material-icons">edit</i>Edit Profile</a></li>-->
        <% Object b=session.getAttribute("min");
        if(b==null)
        {
        %>
       <li><a href="#modal3" class="waves-effect modal-trigger">Host Session</a></li>
       <%}else{ %>
       <li><a href="#modal7" class="waves-effect modal-trigger"><i class="material-icons">cancel</i>

Cancel Session</a></li>
       <%} %>
    	   
       <li><a href="#modal4" class="waves-effect modal-trigger"><i class="material-icons">check</i>Notify</a></li>
       <li><a href="#modal5" class="waves-effect modal-trigger"><i class="material-icons">feed</i>Feedback</a></li>
        <!-- <li>
            <div class="divider"></div>
        </li> -->
        <li><a href="#modal9" class="waves-effect modal-trigger"><i class="material-icons">input</i>Logout</a></li>
    </ul>
    <!--    <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>-->

	<div id="modal7" class="modal">
					<div class="modal-content">
						<h4 align="center">Cancel Session</h4>

					</div>
					<div align="center">
					<form id="can" action="CancelSession" method="post">
                <button class="btn col s12 m3 waves-effect blue darken-4" id="sub" form="can">Yes</button>
                </form>
                <button class="btn col s12 m3 waves-effect blue darken-4" id="sub1"><a href="#"  class="modal-close waves-effect waves-green btn-flat" style="color:white;">No</a></button>
	</div>

					</div>


	<div id="modal9" class="modal">
		<div class="modal-content">
			<div class="container">

				<h4>Do you want to Logout?</h4>
				<br />
				<br />
				<form id="log1" action="Admin_Logout" method="post">
					<button class="btn col s12 m3 waves-effect blue darken-4"
						form="log1" style="margin-left:30%;margin-top:5%;">Yes</button>
				</form>
				<button class="btn col s12 m3 waves-effect blue darken-4" style="margin-left:50%;margin-top:-37px;">
					<a href="#" class="modal-close waves-effect waves-green btn-flat"
						style="color: white;">No</a>
				</button>
			</div>
		</div>
	</div>
	<div id="modal4" class="modal">
		<div class="modal-content">
			<h4 align="center">Notify All Absentees</h4>
			<div class="container">
					<form name="myForm2" action="NotifyAll" method="post">
						<button class="btn col s12 m3 waves-effect blue darken-4" style="margin-left:20%;margin-top:5%;">Notify</button>
					</form>
					<form name="myForm2" action="Absent.jsp" method="post">
					<button class="btn col s12 m3 waves-effect blue darken-4" style="margin-left:50%;margin-top:-37px;">View Notifications</button>
					</form>
			</div>
		</div>
	</div>
	<div id="modal5" class="modal">
		<div class="modal-content">
			<h4 align="center">Send Feedback on Training Experience</h4>
			<div class="container">
					<form name="myForm2" action="Feedback" method="post"style="margin-left:20%;margin-top:5%;">
						<button class="btn col s12 m3 waves-effect blue darken-4">Ask Feedback</button>
					</form>
					<form name="myForm2" action="View_Feedbacks.jsp" method="post" style="margin-left:50%;margin-top:-37px;">
						<button class="btn col s12 m3 waves-effect blue darken-4">View Feedbacks</button>
					</form>
			</div>
		</div>
	</div>



	<div id="modal3" class="modal">
					<div class="modal-content">
						<h4 align="center">Host Session</h4>

					</div>
					<form action="Start_Session" method="post">
					<div class="container">
					Enter the time in minutes <br/>
					<input type="number" name="minhost" width="48" height="48" required/><br/>
						<button class="btn col s12 m3 waves-effect blue darken-4" style="margin-left: 40%">Start Session</button>
						</form>
	

					</div>

	
	<div class="modal-footer">
						<a href="#" class="modal-close waves-effect waves-green btn-flat">Done</a>
					</div>
				</div>
    <div class="" style="margin: 20px;">
        <main>

            <ul id="tabs-swipe-demo" class="tabs tabs-fixed-width tab-demo z-depth-1" style="box-shadow: 10px 10px 118px -19px rgba(0, 0, 0, 0.81);" data-aos="fade-down" data-aos-duration="1000">
                <li class="tab col s3"><a class="active" href="#test-swipe-1" style="font-weight: 600;color: dimgrey">PARTICIPANTS</a></li>
                <li class="tab col s3"><a href="#test-swipe-2" style="font-weight: 600;color: dimgrey">PRESENT</a></li>
                <li class="tab col s3"><a href="#test-swipe-3" style="font-weight: 600;color: dimgrey">ABSENT</a></li>
            </ul>
            <!--   ////////////////////////              //////////////////////                   /////////////               Tabs content                  //////////////////////////////////////////         -->
            <br>
   <!--  <div id="test-swipe-1" class="col s12">

 <div class="row">
                    <div class="col s12 m12 z-depth-3" style="overflow-y: auto;
    height: 456px;
    border-radius: 34px;" data-aos="fade-up" data-aos-duration="1000">
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://localhost/test" user="root" password="root" />
						<sql:query dataSource="${snapshot}" var="result">
         			SELECT ID, Name from analysis where attend=1;
      			</sql:query>
                        <table class="responsive-table centered highlight" style=" border-radius: 23px;">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="row" items="${result.rows}">
								<tr>
									<td><c:out value="${row.ID}" /></td>
									<td><c:out value="${row.Name}" /></td>
								</tr>
							</c:forEach>
                                
                            </tbody>
                        </table>


                    </div>



                </div>

                </div>
                
                -->
                
                <div id="test-swipe-1" class="col s12">

 <div class="row" id="test">
 
 
 
 </div></div>
                
                <div id="test-swipe-2" class="col s12 ">



               <div class="row">
                    <div class="col s12 m12 z-depth-3" style="overflow-y: auto;
    height: 456px;
    border-radius: 34px;" data-aos="fade-up" data-aos-duration="1000">
    <%if(b==null)
    {
    %>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://localhost/test" user="root" password="root" />
						<sql:query dataSource="${snapshot}" var="result">
         			SELECT ID, Name from analysis where attend=1;
      			</sql:query>
                        <table class="responsive-table centered highlight" style=" border-radius: 23px;">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="row" items="${result.rows}">
								<tr>
									<td><c:out value="${row.ID}" /></td>
									<td><c:out value="${row.Name}" /></td>
								</tr>
							</c:forEach>
                                
                            </tbody>
                        </table>

<%}else{ %>

<h5 align="center">Wait for the Session to end</h5>
<% 
}
%>
                    </div>



                </div>
                </div>




               
                <div id="test-swipe-3" class="col s12 ">



               <div class="row">
                    <div class="col s12 m12 z-depth-3" style="overflow-y: auto;
    height: 456px;
    border-radius: 34px;" data-aos="fade-up" data-aos-duration="1000">
    <%if(b==null)
    {
    %>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://localhost/test" user="root" password="root" />
						<sql:query dataSource="${snapshot}" var="result">
         			SELECT Eid, Name from Credentials where status=0;
      			</sql:query>
                        <table class="responsive-table centered highlight" style=" border-radius: 23px;">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="row" items="${result.rows}">
								<tr>
									<td><c:out value="${row.Eid}" /></td>
									
									<td><c:out value="${row.Name}" /></td>
								</tr>
							</c:forEach>
                                
                            </tbody>
                        </table>
<%}else{ %>

<h5 align="center">Wait for the Session to end</h5>
<% 
}
%>

                    </div>



                </div>

            </div>
            </main>
            </div>
<script>


setInterval(function(){
    $('#test').load('Table_1.jsp');
},3000);

</script>
    <!--JavaScript at end of body for optimized loading-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.sidenav').sidenav();
        });

        $(document).ready(function() {
            $('.tabs').tabs();
        });

        $(document).ready(function() {
            $('select').formSelect();
        });
    </script>
     <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>
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