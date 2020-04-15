package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Service.UsuarioService;
import Model.Usuario;

/**
 * Servlet implementation class Cadastro
 */
@WebServlet("/cadastro.do")
public class Cadastro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cadastro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuarioService usuarioService = new UsuarioService();
		
		String email = request.getParameter("email");
		String nome = request.getParameter("nome");
		String senha = usuarioService.convertMD5(request.getParameter("senha"));
		
		usuarioService.criar(new Usuario(-1,nome,email,senha));
		
		response.sendRedirect("index.jsp");
	}

}
