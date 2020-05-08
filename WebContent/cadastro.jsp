<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cadastro</title>
		<link rel="stylesheet"  href="css/stylecadastro.css">
		<link rel="stylesheet"  href="css/menu.css" />
	</head>

	<body class="homepage">

    <div id="header"  >
            <div>

                <!-- Logo -->
                    <div id="logo">
                        <h1><a href="#">COVID Fórum</a></h1>
                    </div>
                <!-- Nav -->
                    <nav id="nav">
                        <ul>
                            <li class="active"><a href="index.jsp">Home</a></li>
                            <li><a href="perguntas.do">Faça sua pergunta</a></li>
                            <li><a href="faq.html">FAQ</a></li>
                                <li><a href="session.do">Entrar</a></li>
                                <li><a href="cadastro.do">Cadastrar</a></li>
                        </ul>
                    </nav>

            </div>
        </div>

	<%String nome =  request.getParameter("nome"); %>
	<%String email =  request.getParameter("email"); %>
	<%String errors = (String) request.getAttribute("errors"); %>
	<%if(errors != null){%>
		<div>
			<%= errors %>
		</div>
	<% } %>
	<div>
		<form action='cadastro.do' method='POST'  class ="box">
		
			<h1>  Cadastro </h1>
			<input type='text' name='nome' id='nome' value='<%=nome == null ? "" : nome%>' placeholder="Usuário">
			<input type='text' name='email' id='email' value='<%=email == null ? "" : email%>'placeholder="Email">
			<input type='password' name='senha' id='senha'placeholder="Senha">
			<input type='password' name='confirmaSenha' id='confirmaSenha'placeholder="Confirmar senha">
			<br/><input type = 'submit' value ="Cadastrar">
		</form>
		</div>
</body>
</html>