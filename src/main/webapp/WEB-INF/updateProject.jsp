<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="classes.Project" %>
<%
    Project project = (Project) request.getAttribute("project");
    String startDate = project.getStartDate() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(project.getStartDate()) : "";
    String endDate = project.getEndDate() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(project.getEndDate()) : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mettre à jour le projet</title>
</head>
<body>
<h1>Mettre à jour le projet</h1>
<form action="updateProject" method="post">
    <input type="hidden" name="id" value="${project.id}">
    <label for="name">Nom :</label>
    <input type="text" id="name" name="name" value="${project.name}" required><br>
    <label for="description">Description :</label>
    <input type="text" id="description" name="description" value="${project.description}" required><br>
    <label for="startDate">Date de début :</label>
    <input type="date" id="startDate" name="start_Date" value="<%= startDate %>" required><br>
    <label for="endDate">Date de fin :</label>
    <input type="date" id="endDate" name="end_Date" value="<%= endDate %>" required><br>
    <label for="budget">Budget :</label>
    <input type="number" step="0.01" id="budget" name="budget" value="${project.budget}" required><br>
    <input type="submit" value="Mettre à jour le projet">
</form>
<a href="projects">Retour à la liste des projets</a>
</body>
</html>
