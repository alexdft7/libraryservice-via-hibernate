<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>
    <style>
        h2 {text-align: center}
        td {text-align: center}
    </style>
    <title>Библиотека</title>
</head>

<body>
<h2>Библиотечный сервис — Личный кабинет читателя <sec:authentication property="principal.username" /></h2>

<table border="1" cellpadding="7" bordercolor="steelblue">
    <tr>
        <th>Название</th>
        <th>Описание</th>
        <th>Средняя оценка</th>
        <th>Всего оценок</th>
        <th>Ваша оценка</th>
    </tr>

    <c:forEach var="allBooks" items="${allBooks}">

        <c:forEach var="allScores" items="${allScores}"> <%-- Задаём условия, при которых ссылки будут работать (или дизейблиться), а программа сможет определять балл на текущей строке. --%>
            <c:set var="scoreForBookFromCurrentRow" value="" scope="session"/>
            <c:set var="helperForDisablingButtons" value="${allScores.username}${allScores.title}" scope="session"/>
            <sec:authentication var="user" property="principal.username" />
            <c:if test="${fn:contains(scoreForBookFromCurrentRow, helperForDisablingButtons)}">
                <c:set var="scoreForBookFromCurrentRow" value="" />
            </c:if>
            <c:if test="${allScores.username==user && allBooks.title==allScores.title && !fn:contains(scoreForBookFromCurrentRow, allScores.title)}">
                <c:set var="scoreForBookFromCurrentRow" value="${allScores.username}${allScores.title}" />
                <c:url var="deleteLink" value="/deleteScore">
                    <c:param name="scoreId" value="${allScores.id}"/>
                </c:url>
            </c:if>
        </c:forEach>

        <tr>
        <td><c:out value="${allBooks.title}" /></td>
        <td><c:out value="${allBooks.description}" /></td>
        <td><c:out value="${allBooks.averageScore}" /></td>
        <td><c:out value="${allBooks.amountOfScores}" /></td>

        <td>
        <form:form action="addScore" modelAttribute="newScore" method="post"> <%-- Задаём переменные для нового, добавляемого нами балла. --%>
            <form:hidden path="id"/>
            <input hidden id="username" name="username" value="<sec:authentication property="principal.username" />" />
            <input hidden id="title" name="title" value="<c:out value="${allBooks.title}" />" />
            <c:forEach var="allScores" items="${allScores}">
                <c:if test="${allScores.username==user && allBooks.title==allScores.title}">
                    <b><c:out value="${allScores.score}" /></b>
                </c:if>
            </c:forEach>
            <input id="score" name="score" type="text" required="required" pattern="[1-9]|10" placeholder="1-10">

            <c:choose> <%-- Объясняем программе, когда должна работать кнопка "Сохранить", а когда "Удалить". Вместе они работать не могут. Тут нам помогает ранее созданный helper. --%>
                <c:when test="${scoreForBookFromCurrentRow.length()==0}">
                    <input type="submit" value="Сохранить" class="save"/>
                    <a href="${deleteLink}"><button type="button" disabled="disabled">Удалить</button></a>
                </c:when>
                <c:otherwise>
                    <input type="submit" value="Сохранить" class="save" disabled="disabled"/>
                    <a href="${deleteLink}"><button type="button">Удалить</button></a>
                </c:otherwise>
            </c:choose>

            </td>

            </tr>
        </form:form>
    </c:forEach>
</table>
<br>
<a href="${pageContext.request.contextPath}/" style="float: right;">
    В главное меню
</a>
</body>

</html>