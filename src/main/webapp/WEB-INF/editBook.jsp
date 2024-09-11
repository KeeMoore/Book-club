<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="/css/bootstrap.min.css" rel="stylesheet">
  <title>Change your Entry</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/books">Back to the shelves</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-form:label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link link-light" href="/books">All Books</a>
        </li>
        <li class="nav-item">
          <a class="nav-link link-light" href="/books/new">Create a Book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link link-light" href="/logout">Log Out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<p class="mt-2">Author must not be blank</p>
<form:form action="/books/${book.id}/update" method="post" modelAttribute="book">
  <form:hidden path="user" value="${user.id}" />

  <div class="mb-3">
    <form:label path="title" cssClass="form-label">Title:</form:label>
    <form:input path="title" cssClass="form-control" />
    <span class="form-text text-warning">
                <form:errors path="title" />
            </span>
  </div>

  <div class="mb-3">
    <form:label path="author" cssClass="form-label">Author:</form:label>
    <form:input path="author" cssClass="form-control" />
    <span class="form-text text-warning">
                <form:errors path="author" />
            </span>
  </div>

  <div class="mb-3">
    <form:label path="thoughts" cssClass="form-label">My thoughts:</form:label>
    <form:textarea path="thoughts" cssClass="form-control" rows="3"></form:textarea>
    <span class="form-text text-warning">
                <form:errors path="thoughts" />
            </span>
  </div>

  <div class="text-end">
    <button type="submit" class="btn btn-primary">Update Book</button>
  </div>
</form:form>

<%--<form action="deleteBook" method="post" onsubmit="return confirm('Are you sure you want to delete this book?');">--%>
<%--  <input type="hidden" id="bookId" name="bookId" value="${book.id}">--%>
<%--  <input type="submit" value="Delete Book">--%>
<%--</form>--%>
<a href="/books">Back to the shelves</a>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
