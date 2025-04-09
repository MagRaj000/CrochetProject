<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>

<!-- Tab Content -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Filter patterns by:</h6>
    </div>
    <div class="card-body">
        <form method="post" action="/patterns/filtered">
            <div class="form-group">
                <label>Category</label>
                <select name="categoryId" class="form-control">
                    <option value="">Select Category</option>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label>Difficulty</label>
                <select name="difficulty" class="form-control">
                    <option value="">Select Difficulty</option>
                    <c:forEach items="${difficulties}" var="difficulty">
                        <option value="${difficulty}">${difficulty}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label>Yarn Weight</label>
                <select name="yarnId" class="form-control">
                    <option value="">Select Yarn Weight</option>
                    <c:forEach items="${yarns}" var="yarn">
                        <option value="${yarn.id}">${yarn.weight} - ${yarn.name}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Filter</button>
        </form>
    </div>
</div>

<%@ include file="templates/footer.jsp" %>
