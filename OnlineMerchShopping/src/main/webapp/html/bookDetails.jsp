<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Details</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<header id="home" class="header">
		<nav class="nav" role="navigation">
			<div class="container nav-elements">
				<ul class="navbar">
					<li><a href="dashboard">Dashboard</a></li>
					<li><a href="myBooks">My Books</a></li>
					<li><a href='logout'>Logout</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="container mt-5">
		<h2 class="mb-4">Book Details</h2>

		<div class="card">
			<div class="card-body">

				<div class="row">
					<div class="col-md-4">
						<img src="images/book.png" class="img-fluid"
							alt="/images/book.png" style="width:128px;height:128px;">

					</div>
					<div class="col-md-8">
						<h3 class="card-title">${book.bookName}</h3>
						<p class="card-text">
							<strong>Author:</strong> ${book.authorName}
						</p>
						<p class="card-text">
							<strong>Genre:</strong> ${book.genre}
						</p>
						<p class="card-text">
							<strong>Description:</strong> ${book.bookDescription}
						</p>
						<%--                     <p class="card-text"><strong>Price:</strong> ${book.bookPrice}</p>
 --%>
					</div>
					<form action="rentBook" method="post">
						<div class="form-group">
							<label for="rentDays">Select Number of Days to Rent:</label> <select
								class="form-control" id="rentDays" name="rentDays" required>
								<option value="7">1 Week</option>
								<option value="14">2 Weeks</option>
								<option value="30">1 Month</option>
								<!-- Add more options as needed -->
							</select>
						</div>
						<input type="hidden" name="bookId" value="${book.bookId}">
						<button type="submit" class="btn btn-primary">Rent Book</button>
					</form>
				</div>

			</div>
		</div>

	</div>

	<!-- Bootstrap JS and Popper.js (Optional) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
