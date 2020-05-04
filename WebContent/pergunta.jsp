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

	<%int userID = session.getAttribute("userID") == null ? -1 : (int) session.getAttribute("userID"); %>
	<% ArrayList<Comentario> comentarios = (ArrayList<Comentario>) request.getAttribute("comentarios"); %>
	<%int qtdPaginas =  (int) request.getAttribute("qtdPaginasComentario"); %>
	<%int paginaAtual = (int) request.getAttribute("paginacomentario"); %>
	<%String[][] comentarioUsuario = (String[][]) request.getAttribute("comentarioUsuario"); %>
	
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
	
	<%for(Comentario comentario : comentarios){ %>
	<div id='comentario'>
		<% String usuarioNome = new String(); %>
		<% for(int i = 0;i<comentarios.size();i++) {%>
			<% if(comentarioUsuario[i][0].equals(""+comentario.getComentarioID())){%>
				<% usuarioNome = comentarioUsuario[i][1]; %>
			<% } %>
		<% } %>
		Comentario: <%= comentario.getComentario() %>
		Data: <%= comentario.getDataComentario() %>
		Por: <%= usuarioNome %>
	</div>
	<% } %>
	<%if(userID != -1){ %>
		<form action='adicionarcomentario.do' method='POST'>
			Comentario: <textarea name='comentario' rows='3' cols='50'></textarea>
		</form>
	<% } %>
	
	<% if(paginaAtual > 10){ %>
			<%int comeco = ((paginaAtual/10) * 10); %>
			<%boolean validacao = qtdPaginas/10 == paginaAtual/10; %>
			<%for(int i =  (validacao ? comeco-1 : comeco);i <= (validacao ? qtdPaginas : comeco + 10);i++){%>
			<a href="pergunta.do?id=<%=request.getParameter("id") %>&paginacomentario=<%=i %>"><%=i %></a>
			<% } %>
		<% }else{ %>
			<%for(int i = 1;i <= (qtdPaginas>11 ? 11 : qtdPaginas);i++){%>
				<%if(qtdPaginas > 1){ %>
					<a href="pergunta.do?id=<%=request.getParameter("id") %>&paginacomentario=<%=i %>"><%=i %></a>
				<% } %>
			<% } %>
		<% } %>
</body>
</html>