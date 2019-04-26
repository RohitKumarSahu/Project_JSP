<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display</title>
</head>
<body>
<sql:setDataSource var="myDSL" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/test" user="root" password="root" />

<sql:query var="listEmpl" dataSource="${myDSL}">
select * from Credentials;
</sql:query>

<div align="center">
<table border="1" cellpadding="5">
<caption>
<h2>Login List</h2>
</caption>
<tr>
<th>Id</th>
<th>Name</th>
<th>Password</th>
<th>Status</th>
<!-- <th>Date of joining</th>
<th>City</th>
<th>Department No</th> -->
</tr>
<c:forEach var="empobjl" items="${listEmpl.rows}">
<tr>
<td><c:out value="${empobjl.id}" /></td>
<td><c:out value="${empobjl.Name}" /></td>
<td><c:out value="${empobjl.Password}" /></td>
<td><c:out value="${empobjl.status}" /></td>
</tr>
</c:forEach>

</table>
</div>
</body>
</html>