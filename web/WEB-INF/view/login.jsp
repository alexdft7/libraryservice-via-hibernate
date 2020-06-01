<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<meta charset="utf-8">

<html>
<head>
    <title>Вход в систему</title>
    <style>
        .failed{color:red}
    </style>
</head>
<body>

<h3>Вход в библиотеку</h3>
<hr>

<form:form action="${pageContext.request.contextPath}/auth" method="post">
    <c:if test="${param.error != null}">
        <i class="failed">Вы ввели неверное имя или пароль.</i>
    </c:if>
    <p>
        Логин: <label>
        <input type="text" name="username">
    </label>
    </p>
    <p>
        Пароль: <label>
        <input type="text" name="password">
    </label>
    </p>
    <input type="submit" value="Войти">
</form:form>

</body>
</html>