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

	<% ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("Posts"); %>
	<% for(Post post : posts){ %>
		<div>
			<a href=""><%=post.getTitulo()%></a> <br>
			<% String[] palavras = post.getCorpo().split(" "); %>
			<% String corpo = ""; %>
			<% if(palavras.length > 10){ %>
				<%for(int i = 0; i < 10;i++){ %>
					<% corpo += " "+palavras[i]; %>
				<% } %>
			<% }else{ %>
				<% corpo = post.getCorpo(); %>
			<% } %>
			<%= corpo %>...
			<hr/>
		</div>
	<% } %>
	<%int paginas =  (int) request.getAttribute("qtdPaginas"); %>
</body>
</html>