<%--
  Created by IntelliJ IDEA.
  User: keimh
  Date: 9/10/2024
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html data-bs-theme="dark">
<head>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <title>Book Details</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="/books">Book Club</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link link-light" href="/books">All Books</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link link-light" href="/books/new">Create a Book</a>
                </li>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link link-light" href="/books/edit">Edit Book</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link link-light" href="/books/details">Book Details</a>--%>
<%--                </li>--%>
                <li class="nav-item">
                    <a class="nav-link link-light" href="/logout">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<main class="container mt-3" >
    <div class="card shadow-sm mb-3">
        <div class="card-body">
            <h2 class="card-title fst-italic mb-3 text-white">${book.title}</h2>
            <h6 class="card-subtitle mb-3 fw-bold text-white">${book.user.name} read ${book.title} by ${book.author}</h6>
            <h6 class="text-info mt-3">Here are ${book.user.name}'s thoughts:</h6>
            <p class="text-white">${book.thoughts}</p>
        </div>
    </div>
    <c:if test="${user.id == book.user.id}">
        <a class="btn btn-sm btn-primary" href="/books/${book.id}/edit">Edit</a>
        <form action="/books/${book.id}\delete" method="post" style="display:inline;">
            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
        </form>
    </c:if>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>

