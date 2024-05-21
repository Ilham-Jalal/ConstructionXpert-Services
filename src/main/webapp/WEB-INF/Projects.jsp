
<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 20/05/2024
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%@ page import="java.util.List" %>
        <%@ page import="classes.Project" %>
        <%
            List<Project> projects = (List<Project>) request.getAttribute("projects");
        %>
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
    </tr>
    <%
        for (Project project : projects) {
    %>
    <tr>
        <td><%= project.getId() %></td>
        <td><%= project.getName() %></td>
        <td><%= project.getDescription() %></td>
        <td><%= project.getStartDate() %></td>
        <td><%= project.getEndDate() %></td>
        <td><%= project.getBudget() %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
</title>
</head>
<body>

</body>
</html>
