<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<style><%@include file ="dashbord.css"%></style>


	<title>AdminHub</title>
</head>
<body>


<!-- SIDEBAR -->
<section id="sidebar">
	<a href="#" class="brand">
		<i class='bx bxs-smile'></i>
		<span class="text">CINM MOVIE</span>
	</a>
	<ul class="side-menu top">
		<li class="active">
			<a href="admin.jsp">
				<i class='bx bxs-dashboard' ></i>
				<span class="text">Dashboard</span>
			</a>
		</li>
		<li>
			<a href="#">
				<i class='bx bxs-shopping-bag-alt' ></i>
				<span class="text">Movie</span>
			</a>
		</li>

		<li>
			<a href="#">
				<i class='bx bxs-message-dots' ></i>
				<span class="text">Resrvation</span>
			</a>
		</li>
		<li>
			<a href="#">
				<i class='bx bxs-group' ></i>
				<span class="text">User</span>
			</a>
		</li>
	</ul>
	<ul class="side-menu">
		<li>
			<a href="#">
				<i class='bx bxs-cog' ></i>
				<span class="text">Settings</span>
			</a>
		</li>
		<li>
			<a href="#" class="logout">
				<i class='bx bxs-log-out-circle' ></i>
				<span class="text">Logout</span>
			</a>
		</li>
	</ul>
</section>
<!-- SIDEBAR -->



<!-- CONTENT -->
<section id="content">
	<!-- NAVBAR -->
	<nav>
		<i class='bx bx-menu' ></i>
		<a href="#" class="nav-link">Categories</a>
		<form action="#">
			<div class="form-input">
				<input type="search" placeholder="Search...">
				<button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
			</div>
		</form>
		<input type="checkbox" id="switch-mode" hidden>
		<label for="switch-mode" class="switch-mode"></label>
		<a href="#" class="notification">
			<i class='bx bxs-bell' ></i>
			<span class="num">8</span>
		</a>
		<a href="#" class="profile">
			<img src="img/people.png">
		</a>
	</nav>
	<!-- NAVBAR -->

	<!-- MAIN -->
	<main>
		<div class="head-title">
			<div class="left">
				<h1>Dashboard</h1>
				<ul class="breadcrumb">
					<li>
						<a href="#">Dashboard</a>
					</li>
					<li><i class='bx bx-chevron-right' ></i></li>
					<li>
						<a class="active" href="#">User Mangement</a>
					</li>
				</ul>
			</div>
			<a href="#" class="btn-download">
				<i class='bx bxs-cloud-download' ></i>
				<span class="text">add user</span>
			</a>
		</div>

		<!-- <ul class="box-info">
            <li>
                <i class='bx bxs-calendar-check' ></i>
                <span class="text">
                    <h3>1020</h3>
                    <p>Users</p>
                </span>
            </li>
            <li>
                <i class='bx bxs-group' ></i>
                <span class="text">
                    <h3>283</h3>
                    <p>Reservation</p>
                </span>
            </li>
            <li>
                <i class='bx bxs-dollar-circle' ></i>
                <span class="text">
                    <h3>543</h3>
                    <p>Total users</p>
                </span>
            </li>
        </ul>
-->

		<div class="table-data">
			<div class="order">
				<div class="head">
					<h3>Recent User</h3>
					<i class='bx bx-search' ></i>
					<i class='bx bx-filter' ></i>
				</div>
				<table>
					<thead>
					<tr>
						<th>User</th>
						<th>Email</th>
						<th>Number</th>
						<th>Action</th>
						<th>Action</th>

					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<img src="img/people.png">
							<p>Chaimaa</p>
						</td>
						<td>user@gmail.com</td>
						<td>0606070809</td>
						<td><button class="status pending">Delete</button></td>
						<td><button class="status completed">Update</button></td>


					</tr>
					<tr>
						<td>
							<img src="img/people.png">
							<p>Imane</p>
						</td>
						<td>user@gmail.com</td>
						<td>0606070809</td>
						<td><button class="status pending">Delete</button></td>
						<td><button class="status completed">Update</button></td>
					</tr>
					<tr>
						<td>
							<img src="img/people.png">
							<p>Nabil</p>
						</td>
						<td>user@gmail.com</td>
						<td>0606070809</td>
						<td><button class="status pending">Delete</button></td>
						<td><button class="status completed">Update</button></td>
					</tr>
					<tr>
						<td>
							<img src="img/people.png">
							<p>Said</p>
						</td>
						<td>user@gmail.com</td>
						<td>0606070809</td>
						<td><button class="status pending">Delete</button></td>
						<td><button class="status completed">Update</button></td>
					</tr>
					<tr>
						<td>
							<img src="img/people.png">
							<p>Mohamed</p>
						</td>
						<td>user@gmail.com</td>
						<td>0606070809S</td>
						<td><button class="status pending">Delete</button></td>
						<td><button class="status completed">Update</button></td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>

	</main>
	<!-- MAIN -->
</section>
<!-- CONTENT -->


<script><%@include file ="script.js"%></script>
</body>
</html>