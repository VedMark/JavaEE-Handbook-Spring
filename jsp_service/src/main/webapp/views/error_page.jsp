<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style>
    <%@include file="/static/style.css" %>
</style>
<head>
    <meta charset="UTF-8">
    <title>Delete Technology</title>
</head>

<body>
<%@include file="_menu.jsp" %>
<%@include file="_header.jsp" %>

<div class="centered">
    <h3>${errorTitle}</h3>
    <p class="error">${errorMessage}</p>
</div>
</body>
</html>