<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>

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
    <div class="tab-pane fade" id="browse"></div>
    <div class="tab-pane fade" id="categories"></div>
    <div class="tab-pane fade" id="all-patterns"></div>

    <div class="tab-pane fade show active" id="library">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">User's notes for pattern: ${patternName}</h6>
            </div>
            <div class="card-body">
                <div class="action-links">
                    <a href="${pageContext.request.contextPath}/notes/add?userDataId=${userDataId}"
                       class="btn btn-save btn-sm">Add Note</a>
                </div>
                <br>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Content</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${notes}" var="note">
                            <tr>
                                <td>${note.content}</td>
                                <td class="action-links">
                                    <a href="${pageContext.request.contextPath}/notes/update?noteId=${note.id}"
                                       class="btn btn-show btn-sm">Update Note</a>
                                    <a href="${pageContext.request.contextPath}/notes/delete?noteId=${note.id}"
                                       class="btn btn-delete btn-sm">Delete Note</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="templates/footer.jsp" %>

