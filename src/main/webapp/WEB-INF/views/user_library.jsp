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
            <a class="nav-link" href="/categories/all">Categories</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/patterns/all">All patterns</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="/userdata/library/1">My library</a>
        </li>
    </ul>

    <!-- Tab Content -->
    <div class="tab-content mt-3">
        <div class="tab-pane fade" id="browse">
            <p>Browse content goes here...</p>
        </div>

        <div class="tab-pane fade" id="categories">
            <p>Categories content goes here...</p>
        </div>
        <div class="tab-pane fade" id="all-patterns">
            <p>All pattern content goes here...</p>
        </div>

        <div class="tab-pane fade show active" id="library">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">${title}</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Pattern</th>
                                <th>Completed</th>
                                <th>Notes</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${patterns}" var="pattern">
                                <tr>
                                    <td>${pattern.pattern.name}</td>
                                    <td>${pattern.pattern.completed ? 'Yes' : 'No'}</td>
                                    <td>${pattern.notes}</td>
                                    <td class="action-links">
                                        <a href="${pageContext.request.contextPath}/save?id=${pattern.pattern.id}"
                                           class="btn btn-save btn-sm">Save</a>
                                        <a href="${pageContext.request.contextPath}/patterns/${pattern.pattern.id}"
                                           class="btn btn-show btn-sm">Show</a>
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
<%@ include file="templates/footer.jsp" %>
