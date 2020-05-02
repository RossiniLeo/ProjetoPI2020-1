<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action='perguntas.do' method='POST'>
		Titulo <input type='text' name='titulo' id='nome'>
		Corpo <textarea name='corpo' rows='5' cols='33'></textarea>
		<button type = 'submit'>Enviar</button>
	</form>
</body>
</html>