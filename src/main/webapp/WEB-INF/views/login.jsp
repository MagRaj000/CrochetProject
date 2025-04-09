<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>


<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Log in to your account</h6>
    </div>
    <div class="card-body">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Username" class="form-control"/>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Your password" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary">Log in</button>
        </form>
        <br>
        <div style="text-align:center;">
            <p>Don't have an account? <a class="nav-link" href="${pageContext.request.contextPath}/signup">Sign up here</a></p>
        </div>
    </div>
</div>

<%@ include file="templates/footer.jsp" %>
