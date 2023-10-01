<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Catalog</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<header id="home" class="header">
		<nav class="nav" role="navigation">
			<div class="container nav-elements">
				<ul class="navbar">
					<li><a href="dashboard">Dashboard</a></li>
					<li><a href="orderHistory">Order History</a></li>
					<li><a href='logout'>Logout</a></li>
				</ul>
			</div>
		</nav>
	</header>
<div class="container mt-5">
    <!-- Search Bar and Radio Buttons -->
        <div class="mb-4">
        <!-- Form to submit search criteria to a servlet -->
        <form action="searchBooks" method="get" class="form-inline">
            <div class="form-group mr-3">
                <input type="text" class="form-control" name="searchString" placeholder="Search...">
            </div>
            <div class="form-group">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="searchType" id="searchByTitle" value="book_name" checked>
                    <label class="form-check-label" for="searchByTitle">Search by Title</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="searchType" id="searchByAuthor" value="author_id">
                    <label class="form-check-label" for="searchByAuthor">Search by Author</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>
    <h2 class="mb-4">Book Catalog</h2>
    <div class="row">

        <!-- Loop through the paginated list of books -->
        <c:forEach var="book" items="${booksPage}">
            <div class="col-md-4 mb-4">
                <div class="card">
           
                    <div class="card-body">
                        <h5 class="card-title">${book.bookName}</h5>
                        <p class="card-text">${book.bookDescription}</p>
                        <p class="card-text"><strong>Author:</strong> ${book.authorName}</p>
                        <p class="card-text"><strong>Genre:</strong> ${book.genre}</p>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>

    <!-- Pagination -->
    <ul class="pagination">
        <c:forEach var="pageNum" begin="1" end="${totalPages}">
            <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                <a class="page-link" href="?page=${pageNum}">${pageNum}</a>
            </li>
        </c:forEach>
    </ul>
</div>

<!-- Bootstrap JS and Popper.js (Optional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
