<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
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
	<%String errors = (String)request.getAttribute("errors"); %>
	<% if(errors != null){ %>
		<%= errors %>
	<%} %>
		<form action='session.do' method='post'class="box">
			<h1>Login</h1>
			<input type='text' name='email' id='email' placeholder="Email">
			<input type='password' name='senha' id='senha' placeholder="Senha">
			<input type='submit' value='Entrar'>
		</form>
	
	
	</body>
</html>