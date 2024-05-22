<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Resource</title>
</head>
<body>
<h1>Update Resource</h1>
<c:if test="${not empty resource}">
    <form action="${pageContext.request.contextPath}/updateResource" method="post">
        <input type="hidden" name="id" value="${resource.id}" />
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${resource.name}" required /><br />

        <label for="type">Type:</label>
        <input type="text" id="type" name="type" value="${resource.type}" required /><br />

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" value="${resource.quantity}" required /><br />

        <label for="supplierInfo">Supplier Info:</label>
        <input type="text" id="supplierInfo" name="supplierInfo" value="${resource.supplierInfo}" /><br />

        <button type="submit">Update Resource</button>
    </form>
</c:if>
<c:if test="${empty resource}">
    <p>Resource not found.</p>
</c:if>
</body>
</html>
