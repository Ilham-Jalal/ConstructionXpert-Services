<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un projet</title>
</head>
<body>
<h1>Ajouter un projet</h1>
<form action="addProject" method="post">
    <label for="name">Nom :</label>
    <input type="text" id="name" name="name" required><br>
    <label for="description">Description :</label>
    <input type="text" id="description" name="description" required><br>
    <label for="startDate">Date de début :</label>
    <input type="date" id="startDate" name="startDate" required><br>
    <label for="endDate">Date de fin :</label>
    <input type="date" id="endDate" name="endDate" required><br>
    <label for="budget">Budget :</label>
    <input type="number" step="0.01" id="budget" name="budget" required><br>
    <input type="submit" value="Ajouter le projet">
</form>
<a href="projects">Retour à la liste des projets</a>
</body>
</html>
