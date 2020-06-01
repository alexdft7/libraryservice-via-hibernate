<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<meta charset="utf-8">

<html>
<head>
    <title>Библиотека — Добавить книгу</title>
</head>
<body>
<h2> Библиотечный сервис</h2>
    <h3> Сохранить книгу </h3>
    <form:form action="saveBook" modelAttribute="newBook" method="post">
        <form:hidden path="id"/>
        <form:hidden path="averageScore" />
        <form:hidden path="amountOfScores" />
        <table>
            <tbody>
            <tr>
                <td><label>Название:</label></td>>
                <td><form:input path="title"/> </td>
            </tr>
            <tr>
                <td><label>Описание:</label></td>>
                <td><form:input path="description"/> </td>
            </tr>
            <tr>
                <td><input type="submit" value="Сохранить" class="save"/> </td>
            </tr>
            </tbody>
        </table>
    </form:form>>
    <p>
        <a href="${pageContext.request.contextPath}/adminPanel">Вернуться к списку</a>
    </p>
</body>
</html>