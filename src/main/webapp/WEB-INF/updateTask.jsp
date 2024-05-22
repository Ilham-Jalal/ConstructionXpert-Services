<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Update Task</title>
</head>
<body>
<h1>Update Task</h1>

<c:if test="${not empty errorMessage}">
    <div style="color:red;">${errorMessage}</div>
</c:if>

<form action="updateTask" method="post">
    <input type="hidden" name="id" value="${task.id}">
    <input type="hidden" name="projectId" value="${task.project.id}">

    <div>
        <label for="description">Description:</label>
        <input type="text" id="description" name="description" value="${task.description}" required>
    </div>

    <div>
        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" value="${task.startDate}" required>
    </div>

    <div>
        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" value="${task.endDate}" required>
    </div>

    <div>
        <label for="status">Status:</label>
        <input type="text" id="status" name="status" value="${task.status}" required>
    </div>

    <div>
        <button type="submit">Update Task</button>
    </div>
</form>

<a href="tasks?projectId=${task.project.id}">Back to Tasks</a>
</body>
</html>
