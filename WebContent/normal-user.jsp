<%@page import="com.cart.entities.User"%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	User user = (User) session.getAttribute("current-user");

	if (user == null) {
		session.setAttribute("message", "You are not logged in !! Login First");
		response.sendRedirect("login.jsp");
		return;
	} else {
		if (user.getUserType().equals("admin")) {
			session.setAttribute("message", "You are not user !! Do not access this page");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Panel</title>
	<%@include file="components/common_css_js.jsp"%>
	<%@include file="components/common_modals.jsp"%>
</head>
<body>
	<%@include file="components/navBar.jsp"%>

	<h1>Welcome user</h1>
</body>
</html>