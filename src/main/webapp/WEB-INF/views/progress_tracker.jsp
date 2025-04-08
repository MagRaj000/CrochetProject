<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="templates/header.jsp" %>

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
    <li class="nav-item">
        <a class="nav-link" href="/userdata/library/1">My library</a>
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
                <!-- Steps Section -->
                <div class="col-12">
                    <h5>Steps</h5>
                    <div id="steps">
                        <c:forEach var="step" items="${descriptionLines}" varStatus="status">
                            <div class="step ${progress[status.index] ? 'completed' : ''}"
                                 data-step-index="${status.index}">
                                    ${step}
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="tab-pane fade" id="categories"></div>
    <div class="tab-pane fade" id="all-patterns"></div>
    <div class="tab-pane fade" id="library"></div>
</div>

<%@ include file="templates/footer.jsp" %>

<!-- JavaScript -->
<script>
    document.querySelectorAll('.step').forEach(function (step) {
        step.addEventListener('click', function () {
            const stepIndex = this.getAttribute('data-step-index');
            const userId = 1; // userId is 1 for now
            let patternId = ${pattern.id};

            // toggle the step state
            fetch('${pageContext.request.contextPath}/userdata/progress/' + userId + '/' + patternId, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'stepIndex=' + stepIndex
            }).then(response => response.json())
                .then(data => {
                    if (data.success) {
                        const steps = document.querySelectorAll('.step'); // get all steps
                        steps.forEach((step, index) => { // update their classes
                            if (index <= stepIndex) {
                                step.classList.add('completed');
                            } else {
                                step.classList.remove('completed');
                            }
                        });

                        if (data.allCompleted) {
                            // additional message if pattern is completed!
                            const congratsMessage = document.createElement('div');
                            congratsMessage.innerText = "Congratulations! You've finished the pattern!";
                            congratsMessage.classList.add('congrats-message');
                            document.querySelector('.card-body').appendChild(congratsMessage);
                        } else {
                            // remove it if it already exists
                            const existingMessage = document.querySelector('.congrats-message');
                            if (existingMessage) {
                                existingMessage.remove();
                            }
                        }
                    }
                });
        });
    });
</script>