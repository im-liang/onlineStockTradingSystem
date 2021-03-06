<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Netrade</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="css/mainClient.css" rel="stylesheet">
<script>
function setHandle(handle) {
	console.log(handle);
	document.getElementById("handle").value = handle;
	console.log(document.getElementById("handle").value);
}
</script>
</head>
<body>
 	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="#"><img class="navbar-brand" src="img/logo.png"></a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Employee<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Profile</a></li>
							<li><a href="#">Settings</a></li>
							<li><a href="${pageContext.request.contextPath}/home">Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>

		</div><!-- /.container-fluid -->
	</nav>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form action="${pageContext.request.contextPath}/doEmployeeMain">
		<ul class="nav menu">
			<li><input type="hidden" id="handle" name="handle" value="mailing_list" /></li>
			<li><input onclick="setHandle('mailing_list');" type="submit" class="submit" id="Mailing" value="Mailing List" /></li>
			<li role="presentation" class="divider"></li>
			<li><a href="giveSuggestion">Give Suggestion</a></li>
			<li><a href="customerList">Customer Info</a></li>
			<li><a href="recordOrder">Record an Order</a></li>
			<li><a href="orderList">Review Orders</a></li>
			<li role="presentation" class="divider"></li>
			<li><a href="#" id="help">Help</a></li>
		</ul>
		</form>

	</div><!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row" id="dynamic">
			<div>${mainPanel}</div>
		</div>
	</div>	<!--/.main-->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="js/mainEmployee.js"></script>
</body>
</html>