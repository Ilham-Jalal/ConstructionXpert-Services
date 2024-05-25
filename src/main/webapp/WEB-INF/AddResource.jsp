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
      color: #333;
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
  </style>
</head>
<body>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXlI28/yhWlV74O3Ap64FAJc3mFzyHAoeA+mY4j1j7dChs2kXJgtO7CbhKWh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgMQC27ItQmI0C7+ds7z1TfQ/K4WcIOpyE5ZT9cu3D1sB6QN6wj" crossorigin="anonymous"></script>
</body>
</html>
