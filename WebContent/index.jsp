<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
	</head>
	
	<body>
	<%String errors = (String)session.getAttribute("errors"); %>
	<% if(errors != null){ %>
		<%= errors %>
	<%} %>
		<form action='session.do' method='post'>
			Email : <input type='text' name='email' id='email'>
			Senha : <input type='password' name='senha' id='senha'>
			<button type='submit'>Entrar</button>
		</form>
	
	
	</body>
</html>


