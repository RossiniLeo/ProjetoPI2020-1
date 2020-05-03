package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.*;
import Service.*;
/**
 * Servlet implementation class Pergunta
 */
@WebServlet("/pergunta.do")
public class Pergunta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pergunta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = request.getParameter("id") == null ? -1 : Integer.parseInt(request.getParameter("id"));
		
		if(id != -1) {
			Post post = new PostService().carregarPorID(id);
			
			Usuario usuario = new UsuarioService().carregar(post.getUserID());
			
			usuario.setSenha(null);
			
			request.setAttribute("Post", post);
			
			request.setAttribute("Usuario", usuario);
			
			RequestDispatcher view = request.getRequestDispatcher("pergunta.jsp");
			view.forward(request, response);
			
			return;
		}
		
		response.sendRedirect("perguntas.do");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if(method.equals("DELETE"))
			doDelete(request,response);
		
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = ((Post) request.getSession().getAttribute("PostAtual")).getPostID();	
				
		boolean isDeleted = new PostService().excluirPorId(id);
		
		request.getSession().setAttribute("PostAtual", null);
		response.sendRedirect("perguntas.do");
	}

}
