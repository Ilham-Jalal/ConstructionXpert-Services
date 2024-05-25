<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tasks</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU0h5e8UpqIWh9M8UOxCpFPwwzxFw4xCP/z87" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        header {
            background-color: #6c757d;
            padding: 10px 0;
            margin-bottom: 20px;
        }
        header img {
            height: 50px;
            border-radius: 50%;
        }
        header a {
            color: #f8f9fa;
            text-decoration: none;
            margin-right: 15px;
        }
        header a:hover {
            color: #fff;
        }
        .container {
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #6c757d;
        }
        .card {
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .card img {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .card-body {
            padding: 20px;
        }
        .btn-group {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6">
                <img src="https://i.pinimg.com/564x/1f/df/7a/1fdf7a2364b1eaabd6463b7473198df0.jpg" alt="Logo" />
            </div>
            <div class="col-md-6 text-right">
                <a href="http://localhost:8080/gestion_Projet_war_exploded/">Home</a>
                <a href="http://localhost:8080/gestion_Projet_war_exploded/project">Our Projects</a>
                <a href="#">About</a>
                <a href="#">Contact</a>
            </div>
        </div>
    </div>
</header>
<div class="container">
    <h1>Tasks for Project ${projectId}</h1>
    <div class="row">
        <c:forEach var="task" items="${tasks}">
            <div class="col-md-4">
                <div class="card">
                    <img src="${task.picture}" class="card-img-top" alt="${task.description}">
                    <div class="card-body">
                        <h5 class="card-title" >Task ${task.id}</h5>
                        <p class="card-text">${task.description}</p>
                        <p class="card-text"><small class="text-muted">Start Date: ${task.startDate}</small></p>
                        <p class="card-text"><small class="text-muted">End Date: ${task.endDate}</small></p>
                        <p class="card-text"><strong>Status: ${task.status}</strong></p>
                        <div class="btn-group" role="group">
                            <form action="updateTask" method="get">
                                <input type="hidden" name="id" value="${task.id}">
                                <input type="submit" value="Update" class="btn btn-warning btn-sm">
                            </form>
                            <form action="deleteTask" method="post" onsubmit="return confirm('Are you sure you want to delete this task?');">
                                <input type="hidden" name="id" value="${task.id}">
                                <input type="hidden" name="projectId" value="${projectId}">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                            <form action="listResources" method="get">
                                <input type="hidden" name="taskId" value="${task.id}">
                                <button type="submit" class="btn btn-primary btn-sm">View Resources</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <a href="projects" class="btn btn-secondary">Back to Projects</a>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXlI28/yhWlV74O3Ap64FAJc3mFzyHAoeA+mY4j1j7dChs2kXJgtO7CbhKWh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgMQC27ItQmI0C7+ds7z1TfQ/K4WcIOpyE5ZT9cu3D1sB6QN6wj" crossorigin="anonymous"></script>
</body>
</html>
