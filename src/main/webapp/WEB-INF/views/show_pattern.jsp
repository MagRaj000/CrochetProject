<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            <a class="nav-link active" href="/home">Browse</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/categories/all">Categories</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/patterns/all">All patterns</a>
        </li>
    </ul>

    <!-- Tab Content -->
    <div class="tab-content mt-3">
        <div class="tab-pane fade show active" id="browse">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">${pattern.name}</h6>
                </div>
                <div class="card-body">
                    <div class="row">
                        <!-- Picture Section -->
                        <div class="col-md-6 d-flex justify-content-center align-items-center">
                            <img src="/static/images/img_${pattern.id}.png" alt="Pattern Image" class="img-fluid"/>
                        </div>

                        <!-- Details Section -->
                        <div class="col-md-6">
                            <br>
                            <h2>${pattern.name}</h2><br>
                            <br><h4><span style="text-decoration: underline;">Details</span></h4><br>
                            <p><strong>Difficulty:</strong> ${pattern.difficulty}</p>
                            <p><strong>Yarn:</strong> ${pattern.yarn.weight} - ${pattern.yarn.name}</p>
                            <p><strong>Recommended hook size:</strong> ${pattern.yarn.hookSize} mm</p><br><br>

                            <button id="toggleDescription" class="btn btn-primary mt-3">Show Description</button>
                            <br><br>
                            <a href="${pageContext.request.contextPath}/userdata/progress/1/${pattern.id}"
                               class="btn btn-show btn-sm">Track progress</a>
                            <a href="${pageContext.request.contextPath}/save?id=${pattern.id}"
                               class="btn btn-save btn-sm">Save</a>
                        </div>
                    </div>

                    <!-- Description Section -->
                    <div id="description" class="mt-3" style="display: none;">
                        <table class="table table-striped">
                            <c:forEach var="line" items="${descriptionLines}">
                                <tr>
                                    <td>${line}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="categories">
            <p>Categories content goes here...</p>
        </div>

        <div class="tab-pane fade" id="all-patterns">
            <p>All pattern content goes here...</p>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<%@ include file="templates/footer.jsp" %>


<script>
    document.getElementById("toggleDescription").addEventListener("click", function () {
        var description = document.getElementById("description");
        if (description.style.display === "none") {
            description.style.display = "block";
            this.textContent = "Hide Description";
        } else {
            description.style.display = "none";
            this.textContent = "Show Description";
        }
    });
</script>