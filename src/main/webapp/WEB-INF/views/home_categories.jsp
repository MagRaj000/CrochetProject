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
    <div class="tab-pane fade" id="browse"></div>

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

    <div class="tab-pane fade" id="all-patterns"></div>
    <div class="tab-pane fade" id="library"></div>
</div>

<%@ include file="templates/footer.jsp" %>


