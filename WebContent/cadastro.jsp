<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Cadastro</title>
	</head>
<body>
	<form action='cadastro.do' method='POST'>
		Nome : <input type='text' name='nome' id='nome'>
		Email : <input type='text' name='email' id='email'>
		Senha : <input type='password' name='senha' id='senha'>
		Confirmação de senha : <input type='password' name='confirmaSenha' id='confirmaSenha'>
		<button type = 'submit'>Cadastrar</button>
	</form>
	
</body>
</html>