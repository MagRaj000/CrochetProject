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
            <a class="nav-link <c:if test='${param.tab == null || param.tab == "browse"}'>active</c:if>'" href="?tab=browse" data-toggle="tab">Browse</a>
<%--            <a class="nav-link active" href="" data-toggle="tab">Browse</a>--%>
        </li>
        <li class="nav-item">
            <a class="nav-link <c:if test='${param.tab == "categories"}'>active</c:if>'" href="?tab=categories" data-toggle="tab">Categories</a>
        </li>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link" href="#categories" data-toggle="tab">Categories</a>--%>
<%--        </li>--%>
        <li class="nav-item">
            <a class="nav-link" href="#all-patterns" data-toggle="tab">All patterns</a>
<%--    <a class="nav-link <c:if test='${param.tab == "all-patterns"}'>active</c:if>'" href="?tab=all-patterns" data-toggle="tab">All patterns</a>--%>
        </li>
    </ul>

    <!-- Tab Content -->
    <div class="tab-content mt-3">
        <div class="tab-pane fade show active" id="browse">
            <!-- Content for Browse tab -->
            <p>Browse content goes here...</p>
        </div>
        <!-- Categories tab -->
        <div class="tab-pane fade <c:if test='${param.tab == "categories"}'>show active</c:if>'" id="categories">
<%--        <div class="tab-pane fade" id="categories">--%>
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
                                <c:forEach items="${allCategories}" var="category">
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
            <!-- Placeholder for patterns table -->
            <div id="category-patterns">
                <c:if test="${not empty patterns}">
                    <c:set var="title" value="${title}" scope="request" />
                    <c:set var="patterns" value="${patterns}" scope="request" />
                    <jsp:include page="patterns_table.jsp" />
                </c:if>
            </div>
        </div>

        <!-- All Patterns Tab -->
<%--        <div class="tab-pane fade <c:if test='${param.tab == "all-patterns"}'>show active</c:if>'" id="all-patterns">--%>
        <div class="tab-pane fade" id="all-patterns">
            <c:set var="title" value="${titleAll}" scope="request" />
            <c:set var="patterns" value="${allPatterns}" scope="request" />
            <jsp:include page="patterns_table.jsp" />
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<%@ include file="footer.jsp" %>
