<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Player</title>
<jsp:include page="../bootstrapheader.jsp" />
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	<div class="container-fluid">
		<h2>Update Player</h2>
		<br>
		<form action="update.do" method="POST">
			<input type="hidden" name="playerId" value="${player.id }"> <label
				for="firstName">First Name: </label> <input type="text"
				name="firstName" value="${player.firstName}" required /> <br> <label
				for="lastName">Last Name: </label> <input type="text" name="lastName"
				value="${player.lastName}" required /> <br> <label for="team">Team:
			</label> <select name="team" id="team">
				<option value="${player.team}" selected>${player.team}</option>
				<option value="Phillies">Phillies</option>
				<option value="Braves">Braves</option>
				<option value="Angels">Angels</option>
				<option value="Orioles">Orioles</option>
				<option value="Yankees">Yankees</option>
			</select> <br> <label for="position">Position</label> <select
				name="position" id="position">
				<option value="${player.position}" selected>${player.position}</option>
				<option value="Pitcher">Pitcher</option>
				<option value="Catcher">Catcher</option>
				<option value="FirstBase">First Base</option>
				<option value="SecondBase">Second Base</option>
				<option value="ThirdBase">ThirdBase</option>
				<option value="ShortStop">ShortStop</option>
				<option value="LeftField">Left Field</option>
				<option value="Center Field">Center Field</option>
				<option value="Right Field">Right Field</option>
			</select> <br> <label for="hits">Number of Hits:</label> <input
				type="number" name="hits" value="${player.hits}" min="0">
			<br> <label for="homeruns">Number of Homeruns:</label> <input
				type="number" name="homeruns" value="${player.homeruns}"
				min="0"> <br> <label for="battingAverage">Batting
				Average:</label> <input type="number" step="0.001" name="battingAverage"
				min=".000" max="1" value="${player.battingAverage}"> <br>
			<label for="WAR">WAR:</label> <input type="number" step="0.1"
				name="WAR" min="-162" max="162" value="${player.WAR}"> <br>

			<label for="imgUrl">Input a URL to post a picture of your player: </label>
			<br> 
			 <input type="text" name="imgUrl" value="${player.imgUrl}" size="75"/> <br>
				 <input type="submit" value="Update Player">

		</form>

		<jsp:include page="../bootstrapfooter.jsp" />
	</div>
</body>
</html>