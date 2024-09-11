<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- c:out ; c:forEach etc. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Formatting (dates) --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- form:form --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%-- for rendering errors on PUT routes --%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <title>Login-Reg</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="/books">Book Club</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
                    <a class="nav-link link-light" href="/">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<main class="container mt-3">
    <h1 class="display-4 mb-3">Welcome, ${user.name}!</h1>
    <h6>Books from everyone's shelves:</h6>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author Name</th>
            <th>Posted By</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${books}">
            <tr>
                <td class="align-middle">${book.id}</td>
                <td class="align-middle">
                    <a href="/books/${book.id}">${book.title}</a>
                </td>
                <td class="align-middle">${book.author}</td>
                <td class="align-middle text-white">${book.user.name}</td>
                <td class="align-middle">
                    <c:if test="${user.id == book.user.id}">
                        <a class="btn btn-sm btn-primary text-white" href="/books/${book.id}/edit">Edit</a>
                        <form action="/books/${book.id}\delete" method="post" style="display:inline;">
                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<div class="text-center">
    <a href="/" class="btn btn-sm btn-outline-primary">Logout</a>
</div>
</body>
</html>