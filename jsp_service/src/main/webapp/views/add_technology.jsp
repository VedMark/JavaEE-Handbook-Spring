<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<style>
    <%@include file="/static/style.css" %>
</style>
<head>
    <title>Add Technology entry form</title>
</head>
<body>
<%@include file="_menu.jsp" %>
<%@include file="_header.jsp" %>

<div class="centered">
    <h3>Add Technology Form</h3>
</div>

<form:form method="POST" modelAttribute="technology" action="${pageContext.request.contextPath}/com.javaeehandbook/create">
    <label> Name:
        <form:input type="text" path="name"/>
    </label>
    <label> Version for java 4:
        <form:input type="text" path="versions.versionForJava4"/>
    </label>
    <label> Version for java 5:
        <form:input type="text" path="versions.versionForJava5"/>
    </label>
    <label> Version for java 6:
        <form:input type="text" path="versions.versionForJava6"/>
    </label>
    <label> Version for java 7:
        <form:input type="text" path="versions.versionForJava7"/>
    </label>
    <label> Version for java 8:
        <form:input type="text" path="versions.versionForJava8"/>
    </label>
    <label> Description
        <textarea name="description" cols="40" rows="4"></textarea>
    </label>
    <div class="centered">
        <input type="submit" value="Submit"/>
    </div>
</form:form>
</body>
</html>
