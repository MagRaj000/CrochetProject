<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>

<!-- Tab Content -->
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
<a href="javascript:history.back()" class="btn btn-secondary">Back</a>

<%@ include file="templates/footer.jsp" %>

