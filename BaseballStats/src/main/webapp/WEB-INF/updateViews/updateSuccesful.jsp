<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Successful</title>
</head>
<body>
<h2>Your Update was Successful!</h2>

	<table>
		<thead>
			<tr>
				<th colspan="2">Name</th>
				<th>Team</th>
				<th>Position</th>
				<th>Hits</th>
				<th>Homeruns</th>
				<th>Batting Avg.</th>
				<th>WAR</th>
				<th>Rookie</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">${player.firstName}${player.lastName}</td>
				<td>${player.team}</td>
				<td>${player.position}</td>
				<td>${player.hits}</td>
				<td>${player.homeruns}</td>
				<td>${player.battingAverage}</td>
				<td>${player.WAR}</td>
				<td>${player.rookie}</td>

			</tr>
		</tbody>
	</table>
	
		<form action="delete.do" method="POST">
				<label for="playerId"></label> 
				<input type="hidden" name="playerId" value="${player.id}" />
				<input type="submit" value="Delete" />
			</form>
			
				<a href="beginUpdate.do?playerId=${player.id}">Update</a>
			<a href="home.do">Home</a>
</body>
</html>