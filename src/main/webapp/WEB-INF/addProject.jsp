<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un projet - ConstructionXpert Services</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU0h5e8UpqIWh9M8UOxCpFPwwzxFw4xCP/z87" crossorigin="anonymous">
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
            margin: 0 auto;
            background-color: #f0f0f0;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
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
        <h2>Ajouter un projet</h2>
        <form action="addProject" method="post">
            <div class="form-group">
                <label for="name">Nom du projet :</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="description">Description :</label>
                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="startDate">Date de début :</label>
                <input type="date" class="form-control" id="startDate" name="startDate" required>
            </div>
            <div class="form-group">
                <label for="endDate">Date de fin :</label>
                <input type="date" class="form-control" id="endDate" name="endDate" required>
            </div>
            <div class="form-group">
                <label for="budget">Budget :</label>
                <input type="number" class="form-control" id="budget" name="budget" required>
            </div>
            <div class="form-group">
                <label for="picture">Image :</label>
                <input type="text" class="form-control" id="picture" name="picture">
            </div>
            <button type="submit" class="btn btn-primary">Ajouter</button>
        </form>
    </div>
</div>
<div class="footer">
    <div class="foot" style="display: flex">
        <img src="https://i.pinimg.com/564x/1f/df/7a/1fdf7a2364b1eaabd6463b7473198df0.jpg" alt="Logo" style="height: 60px;border-radius: 50%;" />
        <h4>ConstructionXpert Services</h4>
        <p>Construction Services & Conseil is a general contractor for all trades authorised to support clients from the design to the completion of their projects.</p>
        <div class=" contact-info">
            <div class="adress" style="display: flex">
                <img src="Images/11197983181642744712-64.png" width="25">
                <p>255, Boulevard Ghandi – Casablanca</p></div>
            <div class="adress" style="display: flex">
                <img src="Images/11816919591556274018-64.png" width="25"><p>+212 722923404</p></div>
            <div class="adress" style="display: flex"> <img src="Images/17952689171595156226-512.png" width="25"><p>constructionxpert@gmail.com</p></div>

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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXlI28/yhWlV74O3Ap64FAJc3mFzyHAoeA+mY4j1j7dChs2kXJgtO7CbhKWh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgMQC27ItQmI0C7+ds7z1TfQ/K4WcIOpyE5ZT9cu3D1sB6QN6wj" crossorigin="anonymous"></script>
</body>

</html>
