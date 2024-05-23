<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Add Resource</title>
</head>
<body>
<h1>Add Resource</h1>
<form action="${pageContext.request.contextPath}/addResource" method="post">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" required /><br />

  <label for="type">Type:</label>
  <input type="text" id="type" name="type" required /><br />

  <label for="quantity">Quantity:</label>
  <input type="number" id="quantity" name="quantity" required /><br />

  <label for="supplierInfo">Supplier Info:</label>
  <input type="text" id="supplierInfo" name="supplierInfo" /><br />

  <label for="taskId">Task ID:</label>
  <input type="number" id="taskId" name="taskId" required /><br />

  <button type="submit">Add Resource</button>
</form>
</body>
</html>
