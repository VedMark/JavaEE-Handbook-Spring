<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style>
    <%@include file="/static/style.css" %>
</style>

<head>
    <title>Content</title>
</head>

<body>
<%@include file="_menu.jsp" %>
<%@include file="_header.jsp" %>

<div class="centered">
    <h3>Java Enterprise Edition Technologies</h3>
</div>

<table border="1" width="90%">
    <tr>
        <th>Name</th>
        <th>Version for Java 4</th>
        <th>Version for Java 5</th>
        <th>Version for Java 6</th>
        <th>Version for Java 7</th>
        <th>Version for Java 8</th>
        <th>Description</th>
        <th colspan="2"></th>
    </tr>

    <c:forEach items="${technologies}" var="t">
        <tr>
            <td>${t.name}</td>
            <td>${t.versionForJava4}</td>
            <td>${t.versionForJava5}</td>
            <td>${t.versionForJava6}</td>
            <td>${t.versionForJava7}</td>
            <td>${t.versionForJava8}</td>
            <td>${t.description}</td>
            <td><a href="javaeehandbook/update?id=${t.id}">Edit</a></td>
            <td><a href="javaeehandbook/remove?id=${t.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
