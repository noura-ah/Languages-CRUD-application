<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    


<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Edit Language</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div class="container w-75 mt-4">
	
		<div class="container w-75 ">
			<div class="d-flex align-items-center justify-content-between">
				<h1>Edit Language:</h1>
				<div class="row">
					</h3> <a href="/languages" class="mt-2">Dashboard</a> <span class="p-1">|</span>  
					<form action='/languages/<c:out value="${language.getId()}"/>' method="post">
						<input type="hidden" name="_method" value="delete">
						<input type="submit" class="btn btn-link" value="Delete">
					</form>
				</div>
			</div>
			
			<form:form class="border border-3 p-4 border-dark mt-2" method="post" modelAttribute="language" action="/languages/${language.id}">
				<input type="hidden" name="_method" value="put">
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
				<form:input path="version" type="text" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
				<form:errors  path="version" cssClass="invalid-feedback"/>
				
			</div>
			
			<input type="submit" value="Submit" class="btn btn-dark">
		</form:form>
		</div>
		
	</div>
    
	
</body>
</html>
