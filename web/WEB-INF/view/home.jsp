<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" isELIgnored="false" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<meta charset="utf-8">

<html>

<head>
    <title>Домашняя страница библиотеки</title>
</head>

<body>
<h2>Главное меню библиотеки</h2>
<hr>
Добро пожаловать в книжную обитель, <sec:authentication property="principal.username" />!
<hr>
<sec:authorize access="hasRole('User')">
    <p>
        <a href="${pageContext.request.contextPath}/bookList">Список доступных книг</a>
    </p>
</sec:authorize>
<sec:authorize access="hasRole('Admin')">
    <p>
        <a href="${pageContext.request.contextPath}/adminPanel">Панель администратора</a>
    </p>
</sec:authorize>
<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value="Выйти из аккаунта"/>
</form:form>
</body>

</html>
