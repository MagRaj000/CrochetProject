<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>
<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Crochet Pattern Manager</h1>
    <a href="add" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
            class="fas fa-download fa-sm text-white-50"></i>Sign in</a>
  </div>

  <!-- Print context path for debugging -->
<%--  <p>Context Path: <c:out value="${pageContext.request.contextPath}" /></p>--%>

  <!-- Tabs -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" href="/home">Browse</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/categories/all">Categories</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/patterns/all">All patterns</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/userdata/library/1">My library</a>
    </li>
  </ul>

  <!-- Tab Content -->
  <div class="tab-content mt-3">
    <div class="tab-pane fade show active" id="browse">
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Filter patterns by:</h6>
        </div>
        <div class="card-body">
          <form method="post" action="/patterns/filtered">
            <div class="form-group">
              <label>Category</label>
              <select name="categoryId" class="form-control">
              <option value="">Select Category</option>
                <c:forEach items="${categories}" var="category">
                  <option value="${category.id}">${category.name}</option>
                </c:forEach>
              </select>
            </div>

            <div class="form-group">
              <label>Difficulty</label>
              <select name="difficulty" class="form-control">
              <option value="">Select Difficulty</option>
                <c:forEach items="${difficulties}" var="difficulty">
                  <option value="${difficulty}">${difficulty}</option>
                </c:forEach>
              </select>
            </div>

            <div class="form-group">
              <label>Yarn Weight</label>
              <select name="yarnId" class="form-control">
              <option value="">Select Yarn Weight</option>
                <c:forEach items="${yarns}" var="yarn">
                  <option value="${yarn.id}">${yarn.weight} - ${yarn.name}</option>
                </c:forEach>
              </select>
            </div>

            <button type="submit" class="btn btn-primary">Filter</button>
          </form>
        </div>
      </div>
    </div>

    <div class="tab-pane fade" id="categories">
      <p>Categories content goes here...</p>
    </div>

    <div class="tab-pane fade" id="all-patterns">
      <p>All pattern content goes here...</p>
    </div>

    <div class="tab-pane fade" id="library">
      <p>User library content goes here...</p>
    </div>
  </div>

</div>
<!-- /.container-fluid -->
<%@ include file="templates/footer.jsp" %>
