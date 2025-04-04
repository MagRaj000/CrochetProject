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

  <!-- Tabs -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link" href="/home">Browse</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active" href="/categories/all">Categories</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/patterns/all">All patterns</a>
    </li>
  </ul>

  <!-- Tab Content -->
  <div class="tab-content mt-3">
    <div class="tab-pane fade" id="browse">
      <p>Browse content goes here...</p>
    </div>

    <div class="tab-pane fade show active" id="categories">
      <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Categories</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${categories}" var="category">
                                    <tr>
                                        <td>
                                            <a href="/categories/${category.id}/patterns">${category.name}</a>
                                        </td>
                                        <td>${category.description}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>
    </div>

    <div class="tab-pane fade" id="all-patterns">
      <p>All pattern content goes here...</p>
    </div>
  </div>

</div>
<!-- /.container-fluid -->
<%@ include file="templates/footer.jsp" %>


