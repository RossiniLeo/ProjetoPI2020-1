<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%int userID = (int)session.getAttribute("userID"); %>
userID: <%=userID %><br>

<%String nome = (String)session.getAttribute("nome"); %>
Nome: <%=nome %><br>

<%String email = (String)session.getAttribute("email"); %>
Email: <%=email %><br>

<a href='logout.do'>Encerrar Sessão</a>

</body>
</html>