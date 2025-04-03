<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="header.jsp" %>
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
                    <h6 class="m-0 font-weight-bold text-primary">All available patterns</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${patterns}" var="pattern">
                                <tr>
                                    <td>
                                            ${pattern.name}
                                        <span class="difficulty-stars">
                                        <c:choose>
                                            <c:when test="${pattern.difficulty == 'beginner'}">
                                                <i class="fas fa-star"></i>
                                            </c:when>
                                            <c:when test="${pattern.difficulty == 'intermediate'}">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                            </c:when>
                                            <c:when test="${pattern.difficulty == 'experienced'}">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                            </c:when>
                                        </c:choose>
                                    </span>
                                    </td>
                                    <td class="action-links">
                                        <a href="save?id=${pattern.id}" class="btn btn-save btn-sm">Save</a>
                                        <a href="show?id=${pattern.id}" class="btn btn-show btn-sm">Show</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>
<!-- /.container-fluid -->
<%@ include file="footer.jsp" %>
