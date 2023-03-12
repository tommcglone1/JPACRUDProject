<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Player</title>
<jsp:include page="bootstrapheader.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<c:choose>
		<c:when test="${not empty player}">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th colspan="2">Name</th>
						<th>Team</th>
						<th>Position</th>
						<th>Hits</th>
						<th>Homeruns</th>
						<th>Batting Avg.</th>
						<th>WAR</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">${player.firstName} ${player.lastName}</td>
						<td>${player.team}</td>
						<td>${player.position}</td>
						<td>${player.hits}</td>
						<td>${player.homeruns}</td>
						<td>${player.battingAverage}</td>
						<td>${player.WAR}</td>


					</tr>
				</tbody>
			</table>

			<c:choose>
				<c:when test="${not empty player.imgUrl }">
					<img class="playerPicture" src="${player.imgUrl}"
						alt="Player Picture">
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<br>

			<a class="btn btn-light" href="beginUpdate.do?playerId=${player.id}"
				role="button">Update</a>


			<form action="delete.do" method="POST">
				<label for="playerId"></label> <input type="hidden" name="playerId"
					value="${player.id}" /> <input type="submit" class="btn btn-dark"
					value="Delete" />
			</form>
		</c:when>
		<c:otherwise>
			<h2>No player found</h2>

		</c:otherwise>
	</c:choose>

	<jsp:include page="bootstrapfooter.jsp" />
</body>
</html>