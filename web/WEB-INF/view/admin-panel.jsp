<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="overflow" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<meta charset="utf-8">

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
		<h2>Библиотечный сервис — Панель администратора</h2>
		<table border="1" cellpadding="7" bordercolor="steelblue">
			<tr>
				<th>Название</th>
				<th>Описание</th>
				<th>Оценка</th>
				<th>Всего оценок</th>
				<th>Действие</th>
			</tr>
			<c:forEach var="allBooks" items="${allBooks}">
				<c:url var="updateLink" value="/updateForm">
					<c:param name="bookId" value="${allBooks.id}"/>
				</c:url>
				<c:url var="deleteLink" value="/deleteBook">
					<c:param name="bookId" value="${allBooks.id}"/>
				</c:url>
				<tr>
					<td><c:out value="${allBooks.title}" /></td>
					<td><c:out value="${allBooks.description}" /></td>
					<td><c:out value="${allBooks.averageScore}" /></td>
					<td><c:out value="${allBooks.amountOfScores}" /></td>
					<td><a href="${updateLink}">Обновить</a>> | <a href="${deleteLink}" onclick="if(!(confirm('Вы действительно хотите удалить эту книгу?'))) return false">Удалить</a>></td>
				</tr>
			</c:forEach>
		</table>
		<br>
			<a href="${pageContext.request.contextPath}/addForm"><button type="button" style="position: absolute; right: 10px;">Добавить книгу</button></a>
		<br>
		<br>
		<a href="${pageContext.request.contextPath}/" style="position: absolute; right: 10px;">
			В главное меню
		</a>
</body>

</html>