<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Save Product</title>
    <link href="<c:url value="/stylesheet/css/bootstrap.min.css" />" rel="stylesheet">
<%--     <script src="<c:url value="/resources/js/jquery.1.10.2.min.js" />"></script> --%>
    <script src="<c:url value="/stylesheet/js/bootstrap.min.js" />"></script>
</head>
<body>
<div id="global">
    <h4>The product has been saved.</h4>
        <h5>Details:</h5>
        Product Name: ${product.name}<br/>
        Description: ${product.description}<br/>
        <p>Following files are uploaded successfully.</p>
        <ol>
        <c:forEach items="${product.images}" var="image">
            <li>${image.originalFilename}
            <img width="300" height="300" src="<c:url value="/image/"/>${image.originalFilename}" class="img-circle"/>
            </li>
        </c:forEach>
        </ol>
</div>
</body>
</html>