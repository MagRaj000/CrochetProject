<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>


<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Create a new account</h6>
  </div>
  <div class="card-body">
    <!-- Display error messages if any -->
    <c:if test="${not empty errorMessage}">
      <div class="alert alert-danger" role="alert">
          ${errorMessage}
      </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/signup" method="post">
      <div class="form-group">
        <label>Enter new username</label>
        <input type="text" name="username" id="username" placeholder="Username" class="form-control" required/>
        <small id="usernameHelp" class="form-text text-muted">Username cannot be empty</small>
      </div>
      <div class="form-group">
        <label>Enter password</label>
        <input type="password" name="password" id="password" placeholder="Your password" class="form-control" required/>
        <small id="passwordHelp" class="form-text text-muted">Password must be at least 5 characters long</small>
      </div>
      <div class="form-group">
        <label>Repeat your password</label>
        <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Your password" class="form-control" required/>
        <small id="passwordMatchHelp" class="form-text text-danger" style="display: none;">Passwords do not match!</small>
      </div>
      <button type="submit" class="btn btn-primary">Sign up</button>
    </form>
  </div>
</div>

<%@ include file="templates/footer.jsp" %>

<script>
  function validatePassword() {
    const password = document.getElementById('password').value;
    const username = document.getElementById('username').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    const passwordMatchHelp = document.getElementById('passwordMatchHelp');
    const passwordHelp = document.getElementById('passwordHelp');
    const usernameHelp = document.getElementById('usernameHelp');

    usernameHelp.style.display =  (username.length > 0) ? 'none' : 'block';
    passwordHelp.style.display =  (password.length >= 5) ? 'none' : 'block';
    const passwordsMatch = password === confirmPassword;
    passwordMatchHelp.style.display = passwordsMatch ? 'none' : 'block';

    return (username.length > 0 && password.length >= 5 && passwordsMatch);
  }

  document.getElementById('username').addEventListener('input', validatePassword);
  document.getElementById('password').addEventListener('input', validatePassword);
  document.getElementById('confirmPassword').addEventListener('input', validatePassword);
</script>
