<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Projects - ConstructionXpert Services</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU0h5e8UpqIWh9M8UOxCpFPwwzxFw4xCP/z87" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            margin: 0;
            padding: 0;
            color: #333;
        }
        header {
            background-color: rgba(215, 175, 238, 0.3);
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
            color: #130a0a;
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
        h1 {
            text-align: center;
            margin-bottom: 40px;
            color: #333;
        }
        .card {
            margin-bottom: 20px;
        }
        .card img {
            max-height: 200px;
            object-fit: cover;
        }
        .btn-group {
            display: flex;
            justify-content: center;
        }
        .btn-group form {
            margin: 0 5px;
        }
    </style>
</head>
<body>
<header>
    <img src="https://i.pinimg.com/564x/1f/df/7a/1fdf7a2364b1eaabd6463b7473198df0.jpg" alt="Logo" />
    <div class="head">
        <a href="#">Home</a>
        <a href="#">About</a>
        <a href="#">Contact</a>
    </div>
</header>
<div class="container">
    <h1>Projects</h1>
    <div class="row">
        <c:forEach var="project" items="${projects}">
            <div class="col-md-4">
                <div class="card">
                    <img src="${project.picture}" class="card-img-top" alt="${project.name}">
                    <div class="card-body">
                        <h5 class="card-title">${project.name}</h5>
                        <p class="card-text">${project.description}</p>
                        <p class="card-text"><small class="text-muted">Start Date: ${project.startDate}</small></p>
                        <p class="card-text"><small class="text-muted">End Date: ${project.endDate}</small></p>
                        <p class="card-text"><strong>Budget: ${project.budget}</strong></p>
                        <div class="btn-group">
                            <form action="updateProject" method="get">
                                <input type="hidden" name="id" value="${project.id}">
                                <button type="submit" class="btn btn-warning">Update</button>
                            </form>
                            <form action="deleteProject" method="post" onsubmit="return confirm('Are you sure you want to delete this project?');">
                                <input type="hidden" name="id" value="${project.id}">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                            <form action="tasks" method="get">
                                <input type="hidden" name="projectId" value="${project.id}">
                                <button type="submit" class="btn btn-primary">View Tasks</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXlI28/yhWlV74O3Ap64FAJc3mFzyHAoeA+mY4j1j7dChs2kXJgtO7CbhKWh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgMQC27ItQmI0C7+ds7z1TfQ/K4WcIOpyE5ZT9cu3D1sB6QN6wj" crossorigin="anonymous"></script>
</body>
</html>
