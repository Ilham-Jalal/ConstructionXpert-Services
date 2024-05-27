<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des ressources</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
            background-size: cover;
            background-position: center;
            color: #333;
        }
        header {
            background-color: rgb(91, 70, 103);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            height: 80px;
            color: white;
        }
        header img {
            height: 60px;
            border-radius: 50%;
        }
        header a {
            color: #ffffff;
            text-decoration: none;
            font-weight: bold;
            margin: 0 15px;
            transition: color 0.3s;
        }
        header a:hover {
            color: #f8cd3f;
        }
        .container {
            padding: 20px;
            min-height: calc(100vh - 80px);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #f8cd3f;
        }
        table th {
            background-color: rgb(91, 70, 103);
            color: white;
        }

        .footer {
            padding: 20px;
            background-color: rgba(91, 70, 103, 0.55);
            text-align: center;
            border-top: 2px solid #130a0a;
        }
        .footer .contact-info {
            text-align: left;
            padding: 20px;
        }
        .footer .contact-info p {
            margin: 5px 0;
        }
        .footer .social-icons img {
            width: 30px;
            margin: 0 10px;
        }
    </style>
</head>
<body>
<header>
    <img src="https://i.pinimg.com/564x/1f/df/7a/1fdf7a2364b1eaabd6463b7473198df0.jpg" alt="Logo" />
    <div class="head">
        <a href="http://localhost:8080/gestion_Projet_war_exploded/">Home</a>
        <a href="http://localhost:8080/gestion_Projet_war_exploded/project">Our Projects</a>
        <a href="http://localhost:8080/gestion_Projet_war_exploded/addResource?taskId=${taskId}">Add Resource</a>

    </div>
</header>
<div class="container">
    <h1>Ressources pour la tâche ${param.taskId}</h1>
    <table>
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
                    <a href="updateResource?resourceId=${resource.id}" class="btn btn-warning btn-sm">Modifier</a>
                    <form action="deleteResource" method="post" style="display: inline;">
                        <input type="hidden" name="resourceId" value="${resource.id}">
                        <input type="hidden" name="taskId" value="${taskId}">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
<div class="footer">
    <div class="foot" style="display: flex">
        <img src="https://i.pinimg.com/564x/1f/df/7a/1fdf7a2364b1eaabd6463b7473198df0.jpg" alt="Logo" style="height: 60px;border-radius: 50%;" />
        <h4>ConstructionXpert Services</h4>
        <p>Construction Services & Conseil is a general contractor for all trades authorised to support clients from the design to the completion of their projects.</p>
        <div class="contact-info">
            <div class="adress" style="display: flex">
                <img src="Images/11197983181642744712-64.png" width="25">
                <p>255, Boulevard Ghandi – Casablanca</p>
            </div>
            <div class="adress" style="display: flex">
                <img src="Images/11816919591556274018-64.png" width="25"><p>+212 722923404</p>
            </div>
            <div class="adress" style="display: flex">
                <img src="Images/17952689171595156226-512.png" width="25"><p>constructionxpert@gmail.com</p>
            </div>
            <div class="col-md-6" style="display: flex">
                <div class="social-icons" style="display: flex">
                    <a href="#"><img src="Images/facebook&.png" alt="Facebook"></a>
                    <a href="#"><img src="Images/linkedin.png" alt="LinkedIn"></a>
                    <a href="https://www.instagram.com/ilham_jalal55/?hl=en"><img src="Images/9608604721530099615-64.png" alt="Instagram"></a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
