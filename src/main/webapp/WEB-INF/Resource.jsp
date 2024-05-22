<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des ressources</title>
</head>
<body>
<h1>Ressources pour la tâche ${param.taskId}</h1>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Type</th>
        <th>Quantité</th>
        <th>Informations sur le fournisseur</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="resource" items="${taskResources}">
        <tr>
            <td>${resource.id}</td>
            <td>${resource.name}</td>
            <td>${resource.type}</td>
            <td>${resource.quantity}</td>
            <td>${resource.supplierInfo}</td>
            <td>
                <a href="updateResource?resourceId=${resource.id}">Modifier</a>
                <form action="deleteResource" method="post" style="display:inline;">
                    <input type="hidden" name="resourceId" value="${resource.id}">
                    <button type="submit">Supprimer</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="tasks?projectId=${projectId}">Retour aux tâches</a>
</body>
</html>
