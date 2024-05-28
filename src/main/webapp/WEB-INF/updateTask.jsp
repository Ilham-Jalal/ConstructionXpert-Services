<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Update Task</title>
</head>
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
    h1 {
        text-align: center;
        color: #5b4667;
        margin-top: 20px;
    }
    form {
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        background: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }
    form label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    form input[type="text"],
    form input[type="number"],
    form input[type="date"] {
        width: calc(100% - 22px);
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    form button {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        border: none;
        border-radius: 5px;
        background-color: #5b4667;
        color: #fff;
        cursor: pointer;
        font-size: 16px;
    }
    form button:hover {
        background-color: #4a3857;
    }
    .footer {
        padding: 20px;
        background-color: rgba(91, 70, 103, 0.55);
        text-align: center;
        border-top: 2px solid #130a0a;
        color: #fff;
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
<body>
<header>
    <img src="https://i.pinimg.com/564x/1f/df/7a/1fdf7a2364b1eaabd6463b7473198df0.jpg" alt="Logo" />
    <div class="head">
        <a href="http://localhost:8080/gestion_Projet_war_exploded/">Home</a>
        <a href="http://localhost:8080/gestion_Projet_war_exploded/project">Our Projects</a>
        <a href="http://localhost:8080/gestion_Projet_war_exploded/addResource?taskId=${taskId}">Add Resource</a>
    </div>
</header>
<h1>Update Task</h1>

<c:if test="${not empty errorMessage}">
    <div style="color:red;">${errorMessage}</div>
</c:if>

<form action="updateTask" method="post">
    <input type="hidden" name="id" value="${task.id}">
    <input type="hidden" name="projectId" value="${task.project.id}">

    <div>
        <label for="description">Description:</label>
        <input type="text" id="description" name="description" value="${task.description}" required>
    </div>

    <div>
        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" value="${task.startDate}" required>
    </div>

    <div>
        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" value="${task.endDate}" required>
    </div>

    <div>
        <label for="status">Status:</label>
        <input type="text" id="status" name="status" value="${task.status}" required>
    </div>

    <div>
        <button type="submit">Update Task</button>
    </div>
</form>

<a href="tasks?projectId=${task.project.id}">Back to Tasks</a>
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
</body>
</html>
