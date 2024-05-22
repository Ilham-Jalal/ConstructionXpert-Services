<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Ajouter une ressource</title>
</head>
<body>
<h1>Ajouter une ressource</h1>
<form action="addResource" method="post">
  <div>
    <label for="name">Nom :</label>
    <input type="text" id="name" name="name" required>
  </div>
  <div>
    <label for="type">Type :</label>
    <input type="text" id="type" name="type" required>
  </div>
  <div>
    <label for="quantity">Quantité :</label>
    <input type="number" id="quantity" name="quantity" required>
  </div>
  <div>
    <label for="supplierInfo">Informations sur le fournisseur :</label>
    <input type="text" id="supplierInfo" name="supplierInfo" required>
  </div>
  <div>
    <button type="submit">Ajouter la ressource</button>
  </div>
</form>
<a href="listResources">Retour à la liste des ressources</a>
</body>
</html>
