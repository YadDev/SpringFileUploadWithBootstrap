<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Save Product</title>
<link href="<c:url value="/stylesheet/css/bootstrap.min.css" />" rel="stylesheet">
<script src="<c:url value="/stylesheet/jquery/jquery-3.1.0.min.js" />"></script>
<script src="<c:url value="/stylesheet/js/bootstrap.min.js" />"></script>

</head>
<body>
	<div id="global">
		<h4>The product has been saved.</h4>
		<h5>Details:</h5>
		Product Name: ${product.name}<br /> Description:
		${product.description}<br />
		<a href="pagination">View Record in Pagination</a>
		<p class="bg-success">Following files are uploaded successfully.</p>
		<ol>
			<c:forEach items="${product.images}" var="image">
			
				<li>${image.originalFilename}<p><a href="<c:url value="download/"/>${image.originalFilename}">Download Uploaded Image</a></p> </li>
				<li><img width="300" height="300"
					src="<c:url value="/image/"/>${image.originalFilename}"
					class="img-responsive img-circle" />
				</li>
			</c:forEach>
		</ol>
	</div>

</body>
</html>

