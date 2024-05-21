<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Projects</title>
</head>
<body>
<h1>Projects</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Budget</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="project" items="${projects}">
        <tr>
            <td>${project.id}</td>
            <td>${project.name}</td>
            <td>${project.description}</td>
            <td>${project.startDate}</td>
            <td>${project.endDate}</td>
            <td>${project.budget}</td>
            <td>
                <form action="updateProject" method="get">
                    <input type="hidden" name="id" value="${project.id}">
                    <input type="submit" value="Update">
                </form>
                <form action="deleteProject" method="post" onsubmit="return confirm('Are you sure you want to delete this project?');">
                    <input type="hidden" name="id" value="${project.id}">
                    <input type="submit" value="Delete">
                </form>
                <form action="tasks" method="get">
                    <input type="hidden" name="projectId" value="${project.id}">
                    <input type="submit" value="View Tasks">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
