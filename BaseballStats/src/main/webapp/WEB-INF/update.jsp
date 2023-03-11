<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Player</title>
</head>
<body>
	<h2>Update Player</h2>
	<br>
	<form action="create.do" method="POST">
	<label for="firstName">First Name: </label>
	<input type="text" name=firstName />
	<br>
	<label for="lastName">Last Name: </label>
	<input type="text" name=lastName />
	<br>

	<label for="team">Team: </label>
	<select name="team" id="team">
		<option value="SelectATeam">Select a Team</option>
		<option value="Phillies">Phillies</option>
		<option value="Braves">Braves</option>
		<option value="Angels">Angels</option>
		<option value="Orioles">Orioles</option>
		<option value="Yankees">Yankees</option>
	</select>

	<br>
	<label for="position">Position</label>
	<select name="position" id="position">
		<option value="Select">Select a poistion</option>
		<option value="Pitcher">Pitcher</option>
		<option value="Catcher">Catcher</option>
		<option value="FirstBase">First Base</option>
		<option value="SecondBase">Second Base</option>
		<option value="ThirdBase">ThirdBase</option>
		<option value="ShortStop">ShortStop</option>
		<option value="LeftField">Left Field</option>
		<option value="Center Field">Center Field</option>
		<option value="Right Field">Right Field</option>
	</select>
	<br>
	<label for="hits">Number of Hits:</label>
	<input type="number" name="hits" size=4>
	<br>
	<label for="homeruns">Number of Homeruns:</label>
	<input type="number" name="homeruns" size=4>
	<br>
	<label for="battingAverage">Batting Average:</label> 
	<input type="number" step="0.001" name="battingAverage" min=".001" max="1">
	<br>
	<label for="WAR">WAR:</label> 
	<input type="number" step="0.1" name="WAR" min="-162" max="162">
	<br>
	<label for="isRookie">Is this player a rookie?</label>
	<input type="radio" id="true" name="isRookie" value="true">
	<label for="true">Yes</label>
	<input type="radio" id="false" name="isRookie" value="flase">
	<label for="false">No</label>
	
	<input type="submit" value="Update Player">
	</form>







</body>
</html>