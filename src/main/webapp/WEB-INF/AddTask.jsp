<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
</head>
<body>
<h1>Add Task</h1>
<form action="addTask" method="post">
    Project ID: <input type="text" name="projectId"><br>
    Description: <input type="text" name="description"><br>
    Start Date: <input type="date" name="startDate"><br>
    End Date: <input type="date" name="endDate"><br>
    Status: <input type="text" name="status"><br>
    <input type="submit" value="Add Task">
</form>
</body>
</html>
