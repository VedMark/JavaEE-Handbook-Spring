<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style>
    <%@include file="/static/style.css" %>
</style>
<head>
    <title>Edit Technology</title>
</head>
<body>
<%@include file="_menu.jsp" %>
<%@include file="_header.jsp" %>

<h3 class="page_title">Edit Technology Form</h3>

<div>
    <c:if test="${not empty technology}">
    <form method="POST" modelAttribute="technology" action="${pageContext.request.contextPath}/javaeehandbook/update">
        <input type="hidden" name="id" value="${technology.id}"/>

        <label> Name:
            <input type="text" name="name" value="${ technology.name }"/>
        </label>
        <label> Version for java 4:
            <input type="text" name="versions.versionForJava4"
                   value="${ technology.versions.versionForJava4 != null ? technology.versions.versionForJava4 : "" }"/>
        </label>
        <label> Version for java 5:
            <input type="text" name="versions.versionForJava5"
                   value="${ technology.versions.versionForJava5 != null ? technology.versions.versionForJava5 : "" }"/>
        </label>
        <label> Version for java 6:
            <input type="text" name="versions.versionForJava6"
                   value="${ technology.versions.versionForJava6 != null ? technology.versions.versionForJava6 : "" }"/>
        </label>
        <label> Version for java 7:
            <input type="text" name="versions.versionForJava7"
                   value="${ technology.versions.versionForJava7 != null ? technology.versions.versionForJava7 : "" }"/>
        </label>
        <label> Version for java 8:
            <input type="text" name="versions.versionForJava8"
                   value="${ technology.versions.versionForJava8 != null ? technology.versions.versionForJava8 : "" }"/>
        </label>
        <label> Description
            <textarea name="description" cols="40"
                      rows="4">${technology.description != null ? technology.description : "" }</textarea>
        </label>
        <div class="centered">
            <input type="submit" value="Submit"/>
        </div>
    </form>
</div>
</c:if>
</body>
</html>
