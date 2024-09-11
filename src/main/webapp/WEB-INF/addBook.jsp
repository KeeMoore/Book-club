<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: keimh
  Date: 9/10/2024
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html data-bs-theme="dark">
<head>
  <link href="/css/bootstrap.min.css" rel="stylesheet">
    <title>Add a Book</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-form:label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/books">Back to the shelves</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/logout">Log Out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<h2 class="mt-2">Add a Book to Your Shelf!</h2>
<p> Author must not be blank</p>
<form:form action="/books/addBook" method="post" modelAttribute="book">
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
    <button type="submit" class="btn btn-primary">Add Book</button>
  </div>
</form:form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
