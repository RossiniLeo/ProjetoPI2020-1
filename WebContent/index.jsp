<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
	</head>
	
	<body>
	<%String errors = (String)request.getAttribute("errors"); %>
	<% if(errors != null){ %>
		<%= errors %>
	<%} %>
		<form action='session.do' method='post'>
			Email : <input type='text' name='email' id='email'>
			Senha : <input type='password' name='senha' id='senha'>
			<button type='submit'>Entrar</button>
		</form>
	
	<a href = 'cadastro.jsp'>Cadastro</a>
	
	</body>
</html>