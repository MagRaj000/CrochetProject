<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>

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
    <li class="nav-item">
        <a class="nav-link" href="/userdata/library/1">My library</a>
    </li>
</ul>

<!-- Tab Content -->
<div class="tab-content mt-3">
    <div class="tab-pane fade" id="browse">
        <p>Browse content goes here...</p>
    </div>

    <div class="tab-pane fade show active" id="categories">
        <c:set var="title" value="${title}" scope="request"/>
        <c:set var="patterns" value="${patterns}" scope="request"/>
        <jsp:include page="templates/patterns_table.jsp"/>
    </div>

    <div class="tab-pane fade" id="all-patterns">
        <p>All patterns content goes here...</p>
    </div>

    <div class="tab-pane fade" id="library">
        <p>User library content goes here...</p>
    </div>
</div>

<%@ include file="templates/footer.jsp" %>
