<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Tasks</title>
</head>
<body>
<h1>Tasks for Project ${projectId}</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Description</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="task" items="${tasks}">
        <tr>
            <td>${task.id}</td>
            <td>${task.description}</td>
            <td>${task.startDate}</td>
            <td>${task.endDate}</td>
            <td>${task.status}</td>
            <td>
                <form action="updateTask" method="get">
                    <input type="hidden" name="id" value="${task.id}">
                    <input type="submit" value="Update">
                </form>
                <form action="deleteTask" method="post">
                    <input type="hidden" name="id" value="${task.id}">
                    <input type="hidden" name="projectId" value="${projectId}">
                    <button type="submit">Delete Task</button>
                </form>
                <form action="listResources" method="get">
                    <input type="hidden" name="taskId" value="${task.id}">
                    <button type="submit">View Resources</button>
                </form>

            </td>
        </tr>
    </c:forEach>
</table>
<a href="projects">Back to Projects</a>
</body>
</html>
