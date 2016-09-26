<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Product Form</title>
<head>
<link href="<c:url value="/stylesheet/css/bootstrap.min.css" />" rel="stylesheet">
<script src="<c:url value="/stylesheet/jquery/jquery-3.1.0.min.js" />"></script>
<script src="<c:url value="/stylesheet/js/bootstrap.min.js" />"></script>

</head>
<body>
	<div id="global">
		<form:form commandName="product" action="save-product" method="post"
			enctype="multipart/form-data">
			<fieldset>
				<table style="margin-left: 500px; margin-top: 100px">
					<tr class="success">
						<td>Add a product</td>
					</tr>
					<tr class="success">
						<td class="info"><label for="name">Product Name: </label></td>
						<td><form:input id="name" path="name" cssErrorClass="error" /></td>
						<%--                    <td> <form:errors path="name" cssClass="error" /></td> --%>
					</tr>
					<tr class="success">

						<td class="info"><label for="description">Description:
						</label></td>
						<td><form:input id="description" path="description" /></td>
					</tr>
					<tr class="success">
						<td class="info"><label for="image">Product Images: </label></td>
						<td><input type="file" name="images" multiple="multiple" /></td>
					</tr>
					<tr class="success">
						<td><input id="reset" type="reset" tabindex="4"
							class="btn btn-info"></td>
						<td class="info"><input id="submit" type="submit"
							tabindex="5" value="Add Product" class="btn btn-success"></td>
					</tr>




				</table>
			</fieldset>
		</form:form>
	</div>

</body>
</html>