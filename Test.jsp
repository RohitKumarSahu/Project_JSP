<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test</title>
</head>
<body>
	<form action="Test.jsp" method="post">

		<div align="center">
			Name : <input type="text" name="na"><br />
			<br /> Password : <input type="password" name="pass"><br />
			<br /> <input type="submit" value="LogIn">
		</div>
		<%
			String driverName = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String dbName = "test";
			String userId = "root";
			String password = "root";
			try {
				Class.forName(driverName);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;
			try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();
				String sql = "SELECT * FROM Credentials";

				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
		<%
			String name = request.getParameter("na");
					String pass = request.getParameter("pass");
		%>
		<%
			if (name.equals(resultSet.getString(2)) && pass.equals(resultSet.getString(3))) {
		%>

		<h2 align="center">
			<font><strong>Retrieve data from database in jsp</strong></font>
		</h2>

		<table align="center" cellpadding="5" cellspacing="5" border="1"
			id=getdata>
			<tr>

			</tr>
			<tr bgcolor="#A52A2A">
				<td><b>Id</b></td>
				<td><b>Name</b></td>
				<td><b>Password</b></td>
				<td><b>Status</b></td>
			</tr>

			<tr bgcolor="#DEB887">

				<td><%=resultSet.getString("id")%></td>
				<td><%=resultSet.getString("Name")%></td>
				<td><%=resultSet.getString("Password")%></td>
				<td><%=resultSet.getString("status")%></td>

			</tr>

			<%
				} else {
							out.println("<html>");
							out.println("<body>");
							out.println("<script>");
							out.println("window.location='Test.jsp'");
							out.println("alert('Invalid Credentials')");
							out.println("</script>");
							out.println("</body>");
							out.println("</html>");
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</table>

	</form>

</body>
</html>