<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customers</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="css/mainClient.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="/WEB-INF/views/Header.jsp"/>
	<h3>Customer List</h3>
	<p style="color: red;">${errorString}</p>

	<table border="1" cellpadding="5" cellspacing="1">
		<tr>
			<th>ID</th>
			<th>Username</th>
			<th>Client ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Rating</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>

		<c:forEach items="${custList}" var="cust">
			<tr>
				<td>${cust.id}</td>
				<td>${cust.username}</td>
				<td>${cust.SSN}</td>
				<td>${cust.firstname}</td>
				<td>${cust.lastname}</td>
				<td>${cust.rating}</td>
				<td><a href="editCustomer?username=${cust.username}">Edit</a></td>
				<td><a href="deleteCustomer?username=${cust.username}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>

	<a href="addCustomer" >Add Customer</a><br />
	<a href="employeeMain" >Back</a>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>