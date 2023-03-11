<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STATS STATS STATS</title>
</head>
<body>
<h1>Welcome to Fake ESPN</h1>


	
	<a href="findPlayerById.html">Find a Player</a>
	
	<a href="create.html">Create a Player</a>
	

	<c:choose>
	<c:when test="${empty players }"> No players found.</c:when>
	<c:otherwise>
	<c:forEach var="player" items="${players}">
	<li><a href="findPlayerDataById.do?playerId=${player.id}"> ${player.id } 
					${player.firstName } ${player.lastName }</a></li>
	
	</c:forEach>
	</c:otherwise>
	</c:choose>
</body>
</html>