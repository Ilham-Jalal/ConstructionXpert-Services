<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("https://i.pinimg.com/564x/c8/32/be/c832beea0d9c6f4c696556aef686fcb6.jpg");
            background-size: cover;
            background-position: center;
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
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            padding: 20px;
            min-height: calc(100vh - 80px);
        }
        .accueil {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            max-width: 600px;
            margin: 20px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 8px 80px rgba(0,0,0,20);
            text-align: center;
        }
        .accueil h1 {
            color: #ffffff;
            margin-bottom: 20px;
        }
        .accueil h4 {
            line-height: 1.6;
            color: #ffffff;
            margin-bottom: 20px;
        }
        .accueil button {
            background-color: #f8cd3f;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .accueil button a {
            color: #130a0a;
            text-decoration: none;
            font-weight: bold;
        }
        .accueil button:hover {
            background-color: #e0b829;
        }
    </style>
</head>
<body>
<header>
    <img src="https://i.pinimg.com/564x/1f/df/7a/1fdf7a2364b1eaabd6463b7473198df0.jpg" alt="Logo" />
    <div class="head">
        <a href="http://localhost:8080/gestion_Projet_war_exploded/">Home</a>
        <a href="http://localhost:8080/gestion_Projet_war_exploded/project">Our Projects</a>
        <a href="#">About</a>
        <a href="#">Contact</a>
    </div>
</header>
<div class="container">
    <div class="accueil">
        <h1>ConstructionXpert Services</h1>
        <h4>This web application will allow the construction team to create and manage construction projects, assign tasks to team members, manage necessary resources, and track project and task details.</h4>
        <button><a href="#">SEE OUR RECENT PROJECTS</a></button>
    </div>
</div>
</body>
</html>
