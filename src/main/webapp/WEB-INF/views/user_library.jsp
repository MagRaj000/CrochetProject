<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>

<!-- Tab Content -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">${title}</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table">
                <tbody>
                <c:forEach items="${library}" var="userData">
                    <tr>
                        <td>${userData.pattern.name}</td>
                        <td>
                            <span class="completion-status">${userData.pattern.completed ? 'Completed' : 'In progress'}</span>
                            <input type="checkbox" data-user-id="${userId}" data-pattern-id="${userData.pattern.id}"
                                ${userData.pattern.completed ? 'checked' : ''}
                                   onclick="toggleCompleted(this)">
                        </td>
                        <td class="action-links">
                            <a href="${pageContext.request.contextPath}/notes/${userData.id}"
                               class="btn btn-save btn-sm">Show Notes</a>
                            <a href="${pageContext.request.contextPath}/patterns/${userData.pattern.id}"
                               class="btn btn-show btn-sm">Show Pattern</a>
                            <a href="${pageContext.request.contextPath}/userdata/delete?userId=${userId}&patternId=${userData.pattern.id}"
                               class="btn btn-delete btn-sm">Remove from Library</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="templates/footer.jsp" %>

<script>
    function toggleCompleted(checkbox) {
        const userId = checkbox.getAttribute('data-user-id');
        const patternId = checkbox.getAttribute('data-pattern-id');
        const completionStatusElement = checkbox.previousElementSibling;

        fetch(`${pageContext.request.contextPath}/userdata/complete`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'userId=' + userId + '&patternId=' + patternId
        }).then(response => {
            if (response.ok) {
                if (checkbox.checked) {
                    completionStatusElement.innerText = 'Completed';
                } else {
                    completionStatusElement.innerText = 'In progress';
                }
            } else {
                alert("Failed to toggle completion status.");
                checkbox.checked = !checkbox.checked;
            }
        }).catch(error => {
            console.error('Error:', error);
            alert("An error occurred while toggling the completion status.");
            checkbox.checked = !checkbox.checked;
        });
    }
</script>