package Servlets;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.*;
import java.math.*;
import Model.Usuario;
import Service.UsuarioService;


@WebServlet("/session.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setStatus(404);
		response.getWriter().append("Erro 404");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuarioService usuarioService = new UsuarioService();
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String senhaHash = convertMD5(senha);
		Usuario usuario = usuarioService.carregarPorEmailSenha(email, senhaHash);
		
		System.out.println(usuario.toString());
		
		if(usuario.getUserID() > 0) {
			request.getSession().setAttribute("userID", usuario.getUserID());
			request.getSession().setAttribute("nome", usuario.getNome());
			request.getSession().setAttribute("email", usuario.getEmail());
			response.getWriter().append("Logado").append(request.getContextPath());
		}else {
			response.getWriter().append("usuario não encontrado");
		}	
		
	}

	public String convertMD5(String senha) {
		try {
		    MessageDigest m = MessageDigest.getInstance("MD5");
		  
		    m.update( senha.getBytes(), 0 , senha.length() );
		              
		    byte[] digest = m.digest();
		          
		    String hexa = new BigInteger(1,digest).toString(16);
		              
		    return hexa;
		} catch (NoSuchAlgorithmException e) {
		    return null;
		}
		
	}
	
}
