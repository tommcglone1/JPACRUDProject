<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Creation Successful</title>
</head>
<body>
	<h2>Congratulations! Your player was created!</h2>

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
</body>
</html>