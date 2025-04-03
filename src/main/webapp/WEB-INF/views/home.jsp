<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="header.jsp" %>
<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Crochet Pattern Manager</h1>
            <a href="add" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i>Sign in</a>
          </div>

            <!-- Tabs -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="patterns/all" data-toggle="tab">Browse</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#categories" data-toggle="tab">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#all-patterns" data-toggle="tab">All patterns</a>
                </li>
            </ul>

            <!-- Tab Content -->
            <div class="tab-content mt-3">
                <div class="tab-pane fade show active" id="browse">
                    <!-- Content for Browse tab -->
                    <p>Browse content goes here...</p>
                </div>
                <div class="tab-pane fade" id="categories">
                    <!-- Content for Categories tab -->
                    <p>Categories content goes here...</p>
                </div>
                <div class="tab-pane fade" id="all-patterns">
                    <!-- Content for All patterns tab -->
                    <!-- User Table -->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">User list</h6>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead>
                    <tr>
                      <th>Id</th>
                      <th>Name</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${patterns}" var="pattern">
                      <tr>
                        <td>${pattern.id}</td>
                        <td>${pattern.name}</td>
                        <td>
                            <a href="delete?id=${pattern.id}">Delete</a>
                            <a href="edit?id=${pattern.id}">Edit</a>
                            <a href="show?id=${pattern.id}">Show</a></td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

                </div>
            </div>


<%--          <!-- User Table -->--%>
<%--          <div class="card shadow mb-4">--%>
<%--              <div class="card-header py-3">--%>
<%--                <h6 class="m-0 font-weight-bold text-primary">User list</h6>--%>
<%--              </div>--%>
<%--              <div class="card-body">--%>
<%--                <div class="table-responsive">--%>
<%--                  <table class="table">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                      <th>Id</th>--%>
<%--                      <th>Name</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach items="${patterns}" var="pattern">--%>
<%--                      <tr>--%>
<%--                        <td>${pattern.id}</td>--%>
<%--                        <td>${pattern.name}</td>--%>
<%--                        <td>--%>
<%--                            <a href="delete?id=${pattern.id}">Delete</a>--%>
<%--                            <a href="edit?id=${pattern.id}">Edit</a>--%>
<%--                            <a href="show?id=${pattern.id}">Show</a></td>--%>
<%--                      </tr>--%>
<%--                    </c:forEach>--%>
<%--                    </tbody>--%>
<%--                  </table>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>

        </div>
        <!-- /.container-fluid -->
<%@ include file="footer.jsp" %>
