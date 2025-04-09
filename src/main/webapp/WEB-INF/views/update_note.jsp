<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>

<br><br>
<form action="${pageContext.request.contextPath}/notes/update" method="post">
    <input type="hidden" name="noteId" value="${note.id}"/>
    <div class="form-group">
        <textarea name="content" id="content" class="form-control" required>${note.content}</textarea>
    </div>
    <button type="submit" class="btn btn-primary">Update Note</button>
</form>

<%@ include file="templates/footer.jsp" %>
