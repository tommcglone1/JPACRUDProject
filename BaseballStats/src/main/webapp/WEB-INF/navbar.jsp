<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<a href="home.do"> <img class="logo"
				src="https://assets.listia.com/photos/f59aa0f5a5c0e3997944/original.png?s=800x600g&sig=c3d23c0a1bac00c4&ts=1453488288"
				alt="Logo">
			</a>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.do">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="create.html">Create
						a Player</a></li>

			</ul>
			<form class="navBarForm" action="findPlayerDataByLastName.do" method="GET">
				Search a player by Last Name <input type="text" name="lastName" />
				<input type="submit" value="Search">
			</form>
			<form class="navBarForm" action="findPlayerDataById.do" method="GET">
				Search a player by ID number <input type="number" name="playerId" />
				<input type="submit" value="Search">
			</form>
		</div>
	</div>
</nav>