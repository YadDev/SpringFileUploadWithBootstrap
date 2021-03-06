<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false" %>
<html>
<head>
	<title>JQuery Datatable + Spring MVC Example</title>
	<spring:url value="/stylesheet/js/jquery-1.12.1.min.js"
	var="jqueryJs" />
		<script src="${jqueryJs}"></script>
	<spring:url value="/resources/js/jquery.dataTables.js"
	var="datatable" />
		<script src="${datatable}"></script>
	<spring:url value="/stylesheet/css/jquery.dataTables.css" var="jquerydataTables" />
		<link href="${jquerydataTables}" rel="stylesheet" />
	<spring:url value="/stylesheet/css/jquery.dataTables.min.css" var="jquerydataTablesMin" />
		<link href="${jquerydataTablesMin}" rel="stylesheet" />
	<spring:url value="/stylesheet/css/common.css" var="common" />
		<link href="${common}" rel="stylesheet" />
</head>
<body>
<!-- <div> -->
<!-- 	<img class="dataTableExample" src="resources/images/JQueryDatatableandSpringMVC.png"> -->
<!-- </div> -->
<table id="example" class="display" cellspacing="0" width="100%" style="overflow-x:auto">
				<thead>
					<tr align="left">
						<th>Name</th>
						<th>Desgination</th>
						<th>Salary</th>
						<th>Country</th>
					</tr>
				</thead>
			</table>
</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	var data =eval('${employeeList}');
	var table = $('#example').DataTable( {
		  "aaData": data,
		  "aoColumns": [
		    { "mData": "name"},
		    { "mData": "desgination"},
		    { "mData": "salary"},
		    { "mData": "country"}
		  ],
		  
		  "paging":true
		});
});
</script>

	<spring:url value="/stylesheet/js/jquery-1.12.1.min.js"
	var="jqueryJs" />
		<script src="${jqueryJs}"></script>
	<spring:url value="/stylesheet/js/jquery.dataTables.js"
	var="datatable" />
		<script src="${datatable}"></script>

