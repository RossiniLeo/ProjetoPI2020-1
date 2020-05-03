<%@ page import = "java.util.*" %>
<%@ page import = "Model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% Post post = (Post) request.getAttribute("Post"); %>
	<% Usuario usuario = (Usuario) request.getAttribute("Usuario"); %>
	Titulo: <%= post.getTitulo()%>
	Corpo: <%= post.getCorpo() %>
	Data: <%= post.getDataPost() %>
	Feita por: <%= usuario.getNome() %>
	<%if(post.getDataAtualizacao() != null){ %>
	Atualizada em: <%= post.getDataAtualizacao() %>
	<% } %>
	<%if(session.getAttribute("userID") != null && usuario.getUserID() == (int) session.getAttribute("userID")) {%>
	<% session.setAttribute("PostAtual", post); %>
		<form method='POST' action='pergunta.do'>
	        <input type="hidden" name="method" value="DELETE">
			<button type='submit'>Excluir</button>
		</form>
		<form method='GET' action='atualizarpergunta.do'>
			<button type='submit'>Atualizar</button>
		</form>
	<% } %>
</body>
</html>