<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    


<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Languages</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div class="container w-75">
		<c:if test="${not empty success}">
			<div class="alert alert-success mt-4"><c:out value="${success}"/></div>
		</c:if>
		<h1 class="m-3">Languages</h1>
		<table class="table">
			<thead>
				<tr>
					
					<th scope="col">Name</th>
					<th scope="col">Creator</th>
					<th scope="col">Version</th>
					<th scope="col" >Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${languages}" var="language">
					<tr>	
						<td ><a href='<c:url value="/languages/${language.getId()}"/>' ><c:out value="${language.getName()}"/></a></td>
						<td ><c:out value="${language.getCreator()}"/></td>
						<td ><c:out value="${language.getVersion()}"/></td>
						<td >
							<div class="row">
								<a href= '<c:url value="/languages/${language.getId()}/edit"/>' class="btn btn-light">Edit</a><span class="p-1">|</span>  
								<form action='/languages/<c:out value="${language.getId()}"/>' method="post">
									<input type="hidden" name="_method" value="delete">
									<input type="submit" class="btn btn-light" value="Delete">
								</form>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="container w-75">
			<h1 class="mb-2">Add a Language:</h1>
			<form:form class="border border-3 p-4 border-dark" method="post" modelAttribute="language" action="">
				
			<div class="mb-3"> 
				<form:label path="name" class="form-label">Name:</form:label>
				<form:input  path="name" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
				<form:errors path="name" cssClass="invalid-feedback"/>
			</div>
			<div class="mb-3">
				<form:label path="creator" class="form-label">Creator:</form:label>
				<form:input path="creator" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
				<form:errors path="creator" cssClass="invalid-feedback"/>
				
			</div>
			<div class="mb-3">
				<form:label path="version" class="form-label">Version: </form:label>
				<form:input  path="version" type="text" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
				<form:errors  path="version" cssClass="invalid-feedback"/>
				
			</div>
			<input type="submit" value="Submit" class="btn btn-dark">
		</form:form>
		</div>
		
	</div>
    
	
</body>
</html>
