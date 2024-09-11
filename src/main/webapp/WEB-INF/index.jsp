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
  <title>Book Club </title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-dark ">
  <div class="container-fluid">
    <a class="navbar-brand link-light " href="/books">Book Club</a>
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
        <li class="nav-item">
          <a class="nav-link link-light" href="/books/edit">Edit Book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link link-light" href="/books/details">Book Details</a>
        </li>
        <li class="nav-item">
          <a class="nav-link link-light" href="/logout">Log Out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<main class="container">
  <h1 class="display-4 mb-3">A place for friends to share thoughts on books</h1>
  <div class="row">
    <div class="col">
      <h2 class="display-6 mb-3">Register</h2>
      <div class="card shadow mb-3">
        <div class="card-body">

          <form:form action="/register" method="post" modelAttribute="user">
            <div class="mb-3">
                <form:label class="form-label" path="name">First Name:</form:label>
              <form:input cssClass="form-control" path="name"/>
              <span class="form-text text-warning">
                                    <form:errors path="name"/>
                                </span>
            </div>

            <div class="mb-3">
              <form:label class="form-label" path="email">Email:</form:label>
              <form:input cssClass="form-control" path="email"/>
              <span class="form-text text-warning">
                                    <form:errors path="email"/>
                                </span>
            </div>
            <div class="mb-3">
              <form:label class="form-label" path="password">Password:</form:label>
              <form:input type="password" cssClass="form-control" path="password"/>
              <span class="form-text text-warning">
                                    <form:errors path="password"/>
                                </span>
            </div>
            <div class="mb-3">
              <form:label class="form-label" path="confirm">Confirm Password:</form:label>
              <form:input type="password" cssClass="form-control" path="confirm"/>
              <span class="form-text text-warning">
                                    <form:errors path="confirm"/>
                                </span>
            </div>
            <button type="submit" class="btn btn-primary w-100">Register</button>
          </form:form>
        </div>
      </div>
    </div>
    <div class="col">
      <h2 class="display-6 mb-3">Login</h2>
      <div class="card shadow mb-3">
        <div class="card-body">

          <form:form action="/login" method="post" modelAttribute="loginUser">
            <div class="mb-3">

                <form:label class="form-label" path="loginEmail">Email:</form:label>
              <form:input cssClass="form-control" path="loginEmail"/>
              <span class="form-text text-warning">
                                    <form:errors path="loginEmail"/>
                                </span>
            </div>
            <div class="mb-3">
              <form:label class="form-label" path="loginPassword">Password:</form:label>
              <form:input type="password" cssClass="form-control" path="loginPassword"/>
              <span class="form-text text-warning">
                <form:errors path="loginPassword"/>
            </span>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
          </form:form>
        </div>
      </div>
    </div>
  </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>