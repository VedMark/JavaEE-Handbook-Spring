<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<style>
    <%@include file="/static/style.css" %>
</style>

<head>
    <title>JavaEE Handbook</title>
</head>

<body itemscope itemtype="http://schema.org/TechArticle">
<%@include file="_menu.jsp" %>
<%@include file="_header.jsp" %>

<span itemprop="description">
Site contains information about Java Enterprise Edition technologies.
</span>

<div class="centered">
    <p class="error">${errorMessage}</p>
</div>
</body>
</html>
