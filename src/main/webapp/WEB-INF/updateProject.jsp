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
    <title>Update Project</title>
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
        }
        .form-container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #f0f0f0;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #5b4667;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .btn-primary {
            background-color: #f8cd3f;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
            font-size: 16px;
        }
        .btn-primary:hover {
            background-color: #e0b829;
        }
        .footer {
            padding: 20px;
            background-color: rgba(91, 70, 103, 0.55);
            box-shadow: 0 8px 80px rgba(0, 0, 0, 0.2);
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
</head>
<body>
<header>
    <img src="https://i.pinimg.com/564x/1f/df/7a/1fdf7a2364b1eaabd6463b7473198df0.jpg" alt="Logo" />
    <div class="head">
        <a href="http://localhost:8080/gestion_Projet_war_exploded/">Home</a>
        <a href="http://localhost:8080/gestion_Projet_war_exploded/project">Our Projects</a>
        <a href="http://localhost:8080/gestion_Projet_war_exploded/addPr">Add Project</a>
    </div>
</header>
<div class="container">
    <div class="form-container">
        <h2>Update Project</h2>
        <form action="updateProject" method="post">
            <input type="hidden" name="id" value="${project.id}">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${project.name}" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" value="${project.description}" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="startDate">Start Date:</label>
                <input type="date" id="startDate" name="start_Date" value="<%= startDate %>" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="endDate">End Date:</label>
                <input type="date" id="endDate" name="end_Date" value="<%= endDate %>" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="budget">Budget:</label>
                <input type="number" step="0.01" id="budget" name="budget" value="${project.budget}" class="form-control" required>
            </div>
            <button type="submit" class="btn-primary">Update Project</button>
        </form>
        <div style="text-align: center; margin-top: 20px;">
            <a href="projects">Back to Project List</a>
        </div>
    </div>
</div>
<div class="footer">
    <div class="foot" style="display: flex">
        <img src="https://i.pinimg.com/564x/1f/df/7a/1fdf7a2364b1eaabd6463b7473198df0.jpg" alt="Logo" style="height: 60px;border-radius: 50%;" />
        <h4>ConstructionXpert Services</h4>
        <p>Construction Services & Conseil is a general contractor for all trades authorized to support clients from the design to the completion of their projects.</p>
        <div class="contact-info">
            <div class="address" style="display: flex">
                <img src="Images/11197983181642744712-64.png" width="25">
                <p>255, Boulevard Ghandi – Casablanca</p>
            </div>
            <div class="address" style="display: flex">
                <img src="Images/11816919591556274018-64.png" width="25"><p>+212 722923404</p>
            </div>
            <div class="address" style="display: flex">
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
