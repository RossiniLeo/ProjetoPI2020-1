<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
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