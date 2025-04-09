<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>

<!-- Tab Content -->
<c:set var="title" value="${title}" scope="request"/>
<c:set var="patterns" value="${patterns}" scope="request"/>
<jsp:include page="templates/patterns_table.jsp"/>
<a href="javascript:history.back()" class="btn btn-secondary">Back</a>

<%@ include file="templates/footer.jsp" %>
