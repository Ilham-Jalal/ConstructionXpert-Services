<%@ page import="java.util.List" %>
<%@ page import="classes.Resource" %>
<%
    List<Resource> resources = (List<Resource>) request.getAttribute("resources");
%>
<html>
<head>
    <title>Resources</title>
</head>
<body>
<h1>Resources</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Type</th>
        <th>Quantity</th>
        <th>Supplier Info</th>
    </tr>
    <%
        for (Resource resource : resources) {
    %>
    <tr>
        <td><%= resource.getId() %></td>
        <td><%= resource.getName() %></td>
        <td><%= resource.getType() %></td>
        <td><%= resource.getQuantity() %></td>
        <td><%= resource.getSupplierInfo() %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
