<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Update Note</h1>
    </div>

    <form action="${pageContext.request.contextPath}/notes/update" method="post">
        <input type="hidden" name="noteId" value="${note.id}"/>
        <div class="form-group">
            <textarea name="content" id="content" class="form-control" required>${note.content}</textarea>
        </div>
        <button type="submit" class="btn btn-primary">Update Note</button>
    </form>

</div>
<!-- /.container-fluid -->
<%@ include file="templates/footer.jsp" %>
