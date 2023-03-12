<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomePage</title>
<jsp:include page="bootstrapheader.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<h1>Welcome to BSPN</h1>

	<div class="container-fluid">
		<c:choose>
			<c:when test="${empty players }"> No players found.</c:when>
			<c:otherwise>
			<h2>Current Players</h2>
			<table id="table2" class="table table-hover table-dark" >
				<c:forEach var="player" items="${players}">
				<tr>
					<td><a href="findPlayerDataById.do?playerId=${player.id}">${player.id}. ${player.firstName } ${player.lastName }</a></td>
				</tr>
				</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<jsp:include page="bootstrapfooter.jsp" />
</body>
</html>