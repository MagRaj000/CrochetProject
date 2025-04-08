<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">${title}</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${patterns}" var="pattern">
                    <tr>
                        <td>
                                ${pattern.name}
                            <span class="difficulty-stars">
                                    <c:choose>
                                        <c:when test="${pattern.difficulty == 'beginner'}">
                                            <i class="fas fa-star"></i>
                                        </c:when>
                                        <c:when test="${pattern.difficulty == 'intermediate'}">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </c:when>
                                        <c:when test="${pattern.difficulty == 'experienced'}">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </c:when>
                                    </c:choose>
                                </span>
                        </td>
                        <td class="action-links">
                            <a href="${pageContext.request.contextPath}/userdata/save?userId=1&patternId=${pattern.id}"
                               class="btn btn-save btn-sm">Save</a>
                            <a href="${pageContext.request.contextPath}/patterns/${pattern.id}"
                               class="btn btn-show btn-sm">Show</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

