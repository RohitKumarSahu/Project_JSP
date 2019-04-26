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
<title>View Feedbacks</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
     <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<style>


body
{

background-image: url("light.jpg");
background-repeat: no-repeat;
background-size: cover;
}

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
<body>
<h2 align="center">FeedBacks</h2>
<div id="test-swipe-1" class="col s12">

 <div class="row">
                    <div class="col s12 m12 z-depth-3" style="overflow-y: auto;
    height: 456px;
    border-radius: 34px;">
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://localhost/test" user="root" password="root" />
						<sql:query dataSource="${snapshot}" var="result">
         			SELECT * from feedback;
      			</sql:query>
                        <table class="responsive-table centered highlight" style=" border-radius: 23px;">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Objective</th>
                                    <th>Participation</th>
                                    <th>Topics</th>
                                    <th>Training</th>
                                    <th>Trainer</th>
                                    <th>Feed</th>
                                </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="row" items="${result.rows}">
								<tr>
									<td><c:out value="${row.id}" /></td>
									<td><c:out value="${row.name}" /></td>
									<td><c:out value="${row.objective}" /></td>
									<td><c:out value="${row.participation}" /></td>
									<td><c:out value="${row.topics}" /></td>
									<td><c:out value="${row.training}" /></td>
									<td><c:out value="${row.trainer}" /></td>
									<td><c:out value="${row.feed}" /></td>
								</tr>
							</c:forEach>
                                
                            </tbody>
                        </table>
                        </div>
                        </div>
                        </div>
               
                        <script type="text/javascript" src="js/materialize.min.js"></script>

</body>
</html>