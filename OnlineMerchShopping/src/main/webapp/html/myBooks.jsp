<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Catalog</title>
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
		<h2 class="mb-4">My Books</h2>
		<div class="row">

			<!-- Loop through the paginated list of books -->
			<c:forEach var="book" items="${booksPage}">
				<div class="col-md-4 mb-4">
					<div class="card">
						<img src="images/book.png" class="card-img-top"
							alt="/images/book.png" style="width:128px;height:128px;">
						<div class="card-body">
							<h5 class="card-title">${book.bookName}</h5>
							<p class="card-text">${book.bookDescription}</p>
							<p class="card-text">
								<strong>Author:</strong> ${book.authorName}
							</p>
							<p class="card-text">
								<strong>Genre:</strong> ${book.genre}
							</p>
							<a href="bookDetails?bookId=${book.bookId}"
								class="btn btn-primary">View Details</a>
						</div>
					</div>
				</div>
			</c:forEach>

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
