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
	
</body>
</html>