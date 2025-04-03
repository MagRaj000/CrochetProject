<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<h1>Patterns</h1>
<ul>
  <c:forEach var="pattern" items="${patterns}">
    <li>
      <strong>Id:</strong> ${pattern.id}<br>
      <strong>Name:</strong> ${pattern.name}<br>
    </li>
  </c:forEach>
</ul>
<%@ include file="footer.jsp" %>
