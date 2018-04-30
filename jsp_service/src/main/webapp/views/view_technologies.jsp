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

<div itemscope itemtype="http://schema.org/TechArticle">
<h3 itemscope itemprop="articleSection" class="page_title">Content</h3>
</div>

<table itemscope itemtype="http://schema.org/TechArticle" border="1" width="90%">
    <tr>
        <th>Name</th>
        <th>Version for Java 4</th>
        <th>Version for Java 5</th>
        <th>Version for Java 6</th>
        <th>Version for Java 7</th>
        <th>Version for Java 8</th>
        <th itemprop="text">Description</th>
        <th colspan="2"></th>
    </tr>

    <c:forEach items="${technologies}" var="t">
        <tr>
            <td>${t.name}</td>
            <td>${t.versions.versionForJava4}</td>
            <td>${t.versions.versionForJava5}</td>
            <td>${t.versions.versionForJava6}</td>
            <td>${t.versions.versionForJava7}</td>
            <td>${t.versions.versionForJava8}</td>
            <td>${t.description}</td>
            <td><a href="${pageContext.request.contextPath}/javaeehandbook/update?id=${t.id}">Edit</a></td>
            <td><a href="${pageContext.request.contextPath}/javaeehandbook/remove?id=${t.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
