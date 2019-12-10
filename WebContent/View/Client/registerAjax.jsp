<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/View" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Ajax</title>
</head>
<body>
	<% 
		String msg = (String) request.getAttribute("msg");
		if (msg.equals("true")) {
	%>
		<div style="color:red;margin-left:125px;">username is exist</div>
	<%
		}
	%>
</body>
</html>