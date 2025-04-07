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
                            <c:forEach items="${library}" var="userData">
                                <tr>
                                    <td>${userData.pattern.name}</td>
                                    <td>
                                    <span class="completion-status">${userData.pattern.completed ? 'Completed' : 'In progress'}</span>
                                        <input type="checkbox" data-user-id="1" data-pattern-id="${userData.pattern.id}"
                                            ${userData.pattern.completed ? 'checked' : ''} onclick="toggleCompleted(this)">
                                    </td>
                                    <td><a href="${pageContext.request.contextPath}/notes/${userData.id}"
                                           class="btn btn-save btn-sm">Show Notes</a></td>
                                    <td><a href="${pageContext.request.contextPath}/patterns/${userData.pattern.id}"
                                           class="btn btn-show btn-sm">Show Pattern</a></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/userdata/delete?userId=1&patternId=${userData.pattern.id}"
                                           class="btn btn-delete btn-sm">Remove from Library</a></td>
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