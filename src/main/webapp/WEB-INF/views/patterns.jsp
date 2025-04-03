<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Patterns</title>
</head>
<body>
<h1>Patterns</h1>
<ul>
  <c:forEach var="pattern" items="${patterns}">
    <li>
      <strong>ID:</strong> ${pattern.id}<br>
      <strong>Name:</strong> ${pattern.name}<br>
    </li>
  </c:forEach>
</ul>
</body>
</html>
