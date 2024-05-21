<%@ page import="java.util.List" %>
<%@ page import="classes.Task" %>
<%
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
%>
<html>
<head>
    <title>Tasks</title>
</head>
<body>
<h1>Tasks</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Project ID</th>
        <th>Description</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Status</th>
    </tr>
    <%
        for (Task task : tasks) {
    %>
    <tr>
        <td><%= task.getId() %></td>
        <td><%= task.getProject().getId() %></td>
        <td><%= task.getDescription() %></td>
        <td><%= task.getStartDate() %></td>
        <td><%= task.getEndDate() %></td>
        <td><%= task.getStatus() %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
