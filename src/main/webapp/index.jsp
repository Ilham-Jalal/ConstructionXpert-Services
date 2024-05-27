<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ConstructionXpert Services</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU0h5e8UpqIWh9M8UOxCpFPwwzxFw4xCP/z87" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
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



        .container1 {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
        }
        .who-are-we {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
            border-radius: 1%;
            padding: 10px;
            border: 1px solid #f8cd3f;
            text-align: center;
        }
        .who-are-we img {
            width: 50%;
            margin-right: 20px;
            border-radius: 8px;
        }
        .text {
            width:50%;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .text h2 {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .text h5 {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .missions {
            text-align: center;
            border: 1px solid #f8cd3f;
            display: flex;
            flex-direction: column;
            border-radius: 1%;
        }
        .missions h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .mission-cards {
            display: flex;
            justify-content: space-around;
            padding-bottom: 15px;
        }
        .mission-card {
            width: 150px;
            padding: 20px;
            margin: 10px;
            background-color: #f0eaff;
            border-radius: 8px;
            text-align: center;
        }
        .mission-card img {
            width: 50px;
            margin-bottom: 10px;
        }
        .mission-card p {
            font-size: 14px;
        }
        .values-section {
            display: flex;
            flex-direction: column;
            text-align: center;
            padding: 40px 20px;
            border: 1px solid #f8cd3f;
            border-radius: 1%;
            margin: 10px;
        }
        .values {
            display: flex;
            padding: 10px;
        }
        .values h2 {
            font-size: 32px;
            margin-bottom: 30px;
            color: #000;
            text-shadow: black;
        }
        .values .value-card {
            margin-bottom: 30px;
            width: 100%;
        }
        .values .value-card h3 {
            font-size: 24px;
            color: #f8cd3f;
            margin-top: 20px;
        }
        .values .value-card p {
            font-size: 16px;
            line-height: 1.5;
        }
        .footer {
            padding: 20px;
            background-color: rgba(91, 70, 103, 0.55);
            box-shadow: 0 8px 80px rgba(0, 0, 0, 0.2);
            border-top: 2px solid #130a0a;
            text-align: center;
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

        /* hero swiper */
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
<div class="home">
    <header>
        <img src="https://i.pinimg.com/564x/1f/df/7a/1fdf7a2364b1eaabd6463b7473198df0.jpg" alt="Logo" />
        <div class="head">
            <a href="http://localhost:8080/gestion_Projet_war_exploded/">Home</a>
            <a href="http://localhost:8080/gestion_Projet_war_exploded/project">Our Projects</a>
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
                                <h1>ConstructionXpert Services</h1>
                                <h4>This web application will allow the construction team to create and manage construction projects, assign tasks to team members, manage necessary resources, and track project and task details.</h4>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide"
                         style="background: url('https://i.pinimg.com/564x/1d/d0/58/1dd058e33e089f1d0c527e7d1c8e9258.jpg') center/100% no-repeat">

                        <div class="container">
                            <div class="accueil">
                                <h1>ConstructionXpert Services</h1>
                                <h4>This web application will allow the construction team to create and manage construction projects, assign tasks to team members, manage necessary resources, and track project and task details.</h4>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide"
                         style="background: url('https://i.pinimg.com/474x/68/0e/e4/680ee4d36ba99d91204b742137d5b1bf.jpg') center/100% no-repeat">
                        <div class="container">
                            <div class="accueil">
                                <h1>ConstructionXpert Services</h1>
                                <h4>This web application will allow the construction team to create and manage construction projects, assign tasks to team members, manage necessary resources, and track project and task details.</h4>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide"
                         style="background: url('https://i.pinimg.com/564x/1d/70/23/1d7023e18d6ad65a9741f16535d1d960.jpg') center/100% no-repeat ">
                        <div class="container">
                            <div class="accueil">
                                <h1>ConstructionXpert Services</h1>
                                <h4>This web application will allow the construction team to create and manage construction projects, assign tasks to team members, manage necessary resources, and track project and task details.</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </section>

</div>
<div class="container1">
    <div class="who-are-we">
        <img src="https://i.pinimg.com/736x/3e/53/74/3e5374a1679fec64764f450441647088.jpg" alt="Company Image">
        <div class="text">
            <h2>Who are we?</h2>
            <h5>Rigour, transparency and customer satisfaction are the values that drive us in our daily work.<br>We put our expertise at your disposal to build your projects.</h5>
        </div>
    </div>
    <div class="missions">
        <h2>Our missions</h2>
        <div class="mission-cards">
            <div class="mission-card">
                <img src="Images/1.png" alt="Construction Icon">
                <p>Construction Gros Œuvre et Corps d'états secondaires</p>
            </div>
            <div class="mission-card">
                <img src="Images/2.png" alt="Office Icon">
                <p>Aménagement Plateaux bureaux</p>
            </div>
            <div class="mission-card">
                <img src="Images/3.png" alt="Design and Build Icon">
                <p>Assistance Clé en Main - Design & Build</p>
            </div>
            <div class="mission-card">
                <img src="Images/4.png" alt="Management Icon">
                <p>Assistance Maîtrise d'ouvrage - OPC</p>
            </div>
        </div>
    </div>
    <div class="values-section">
        <h2>Our values</h2>
        <div class="values">
            <div class="value-card">
                <img src="Images/5.png" alt="Ethics Icon">
                <h3>Ethics</h3>
                <p>To highlight our professional attitudes at the service of our customers and partners in order to build a relationship of respect and trust.</p>
            </div>
            <div class="value-card">
                <img src="Images/6.png" width="60" alt="Security Icon">
                <h3>Security</h3>
                <p>To place our human capital at the centre of our concerns in order to guarantee the safety of all our employees. Continuous reflection on our plans for execution methods during structural works and finishes.</p>
            </div>
            <div class="value-card">
                <img src="Images/7.png" width="60" alt="Customer Satisfaction Icon">
                <h3>Customer satisfaction</h3>
                <p>The leitmotif of our mission: to create customer satisfaction throughout the project with tailor-made support. To be a force for innovative proposals adapted to the needs of our customers.</p>
            </div>
        </div>
    </div>

</div>
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

            <div class="social-icons">
                <a href="#"><img src="Images/facebook&.png" alt="Facebook"></a>
                <a href="#"><img src="Images/linkedin.png" alt="LinkedIn"></a>
                <a href="#"><img src="Images/9608604721530099615-64.png" alt="Instagram"></a>
            </div>
        </div>
        </div>
    </div>
</div>
</html>
