<%@ page import = "java.util.*" %>
<%@ page import = "Model.Post" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action='perguntas.do' method='GET'>
		<input type ='text' name='busca'>
		<button type='submit'>Buscar</button>
	</form>
	<% ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("Posts"); %>
	<% for(Post post : posts){ %>
		<div>
			<a href=''><%=post.getTitulo()%></a> <br>
			<% String[] palavras = post.getCorpo().split(" "); %>
			<% String corpo = ""; %>
			<% if(palavras.length > 10){ %>
				<%for(int i = 0; i < 10;i++){ %>
					<% corpo += " "+palavras[i]; %>
				<% } %>
				<%= corpo %>...
			<% }else{ %>
				<% corpo = post.getCorpo(); %>
				<%= corpo %>
			<% } %>
			<%= post.getDataPost() %>
			<hr/>
		</div>
	<% } %>
	<%int qtdPaginas =  (int) request.getAttribute("qtdPaginas"); %>
	<%int paginaAtual = (int) request.getAttribute("pagina"); %>
	<% if(paginaAtual > 10){ %>
		<%int comeco = ((paginaAtual/10) * 10); %>
		<%boolean validacao = qtdPaginas/10 == paginaAtual/10; %>
		<%for(int i =  (validacao ? comeco-1 : comeco);i <= (validacao ? qtdPaginas : comeco + 10);i++){%>
		<a href="perguntas.do?pagina=<%=i %>"><%=i %></a>
		<% } %>
	<% }else{ %>
		<%for(int i = 1;i <= (qtdPaginas>11 ? 11 : qtdPaginas);i++){%>
		<a href="perguntas.do?pagina=<%=i %>"><%=i %></a>
		<% } %>
	<% } %>
</body>
</html>