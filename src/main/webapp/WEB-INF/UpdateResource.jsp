<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Modifier une ressource</title>
</head>
<body>
<h1>Modifier une ressource</h1>
<form action="updateResource" method="post">
    <input type="hidden" name="id" value="${resource.id}">
    <div>
        <label for="name">Nom :</label>
        <input type="text" id="name" name="name" value="${resource.name}" required>
    </div>
    <div>
        <label for="type">Type :</label>
        <input type="text" id="type" name="type" value="${resource.type}" required>
    </div>
    <div>
        <label for="quantity">Quantité :</label>
        <input type="number" id="quantity" name="quantity" value="${resource.quantity}" required>
    </div>
    <div>
        <label for="supplierInfo">Informations sur le fournisseur :</label>
        <input type="text" id="supplierInfo" name="supplierInfo" value="${resource.supplierInfo}" required>
    </div>
    <div>
        <button type="submit">Enregistrer les modifications</button>
    </div>
</form>
<a href="listResources">Retour à la liste des ressources</a>
</body>
</html>
