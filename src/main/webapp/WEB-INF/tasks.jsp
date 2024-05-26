<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tasks</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU0h5e8UpqIWh9M8UOxCpFPwwzxFw4xCP/z87" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
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
            background-color: rgba(91, 70, 103, 0.46);
            box-shadow: 0 8px 80px rgba(0, 0, 0, 8);
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

        .swiper {
            width: 100vw;
            height: 100vh;
            margin-left: auto;
            margin-right: auto;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>
<body>
<<header>
    <img src="https://i.pinimg.com/564x/1f/df/7a/1fdf7a2364b1eaabd6463b7473198df0.jpg" alt="Logo" />
    <div class="head">
        <a href="http://localhost:8080/gestion_Projet_war_exploded/">Home</a>
        <a href="http://localhost:8080/gestion_Projet_war_exploded/project">Our Projects</a>
        <a href="http://localhost:8080/gestion_Projet_war_exploded/aaddtask">Add Task</a>
    </div>
</header>
<section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="" data-bs-ride="carousel">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide"
                     style="background: url('https://i.pinimg.com/564x/c8/32/be/c832beea0d9c6f4c696556aef686fcb6.jpg') center/100% no-repeat">
                    <div class="container">
                        <div class="accueil">
                            <h1>ConstructionXpert Projects</h1>
                            <h4>Welcome to our construction projects page. Discover our achievements, illustrating our expertise and our commitment to quality and innovation.</h4>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide"
                     style="background: url('https://i.pinimg.com/564x/1d/d0/58/1dd058e33e089f1d0c527e7d1c8e9258.jpg') center/100% no-repeat">

                    <div class="container">
                        <div class="accueil">
                            <h1>ConstructionXpert Projects</h1>
                            <h4>Welcome to our construction projects page. Discover our achievements, illustrating our expertise and our commitment to quality and innovation.</h4>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide"
                     style="background: url('https://i.pinimg.com/474x/68/0e/e4/680ee4d36ba99d91204b742137d5b1bf.jpg') center/100% no-repeat">
                    <div class="container">
                        <div class="accueil">
                            <h1>ConstructionXpert Projects</h1>
                            <h4>Welcome to our construction projects page. Discover our achievements, illustrating our expertise and our commitment to quality and innovation.</h4>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide"
                     style="background: url('https://i.pinimg.com/564x/1d/70/23/1d7023e18d6ad65a9741f16535d1d960.jpg') center/100% no-repeat ">
                    <div class="container">
                        <div class="accueil">
                            <h1>ConstructionXpert Projects</h1>
                            <h4>Welcome to our construction projects page. Discover our achievements, illustrating our expertise and our commitment to quality and innovation.</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
</section>
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
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXlI28/yhWlV74O3Ap64FAJc3mFzyHAoeA+mY4j1j7dChs2kXJgtO7CbhKWh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgMQC27ItQmI0C7+ds7z1TfQ/K4WcIOpyE5ZT9cu3D1sB6QN6wj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<script>
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        speed: 3000,
        loop: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        autoplay: {
            delay: 2000,

            disableOnInteraction: false,
        },
    });
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXlI28/yhWlV74O3Ap64FAJc3mFzyHAoeA+mY4j1j7dChs2kXJgtO7CbhKWh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgMQC27ItQmI0C7+ds7z1TfQ/K4WcIOpyE5ZT9cu3D1sB6QN6wj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</body>
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
</html>
