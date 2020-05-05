<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cadastro</title>
	</head>
<body>

	<%String nome =  request.getParameter("nome"); %>
	<%String email =  request.getParameter("email"); %>
	<%String errors = (String) request.getAttribute("errors"); %>
	<%if(errors != null){%>
		<div>
			<%= errors %>
		</div>
	<% } %>
	<div>
		<form action='cadastro.do' method='POST'>
			Nome : <input type='text' name='nome' id='nome' value='<%=nome == null ? "" : nome%>'>
			Email : <input type='text' name='email' id='email' value='<%=email == null ? "" : email%>'>
			Senha : <input type='password' name='senha' id='senha'>
			Confirmação de senha : <input type='password' name='confirmaSenha' id='confirmaSenha'>
			<button type = 'submit'>Cadastrar</button>
		</form>
	</div>
</body>
</html>