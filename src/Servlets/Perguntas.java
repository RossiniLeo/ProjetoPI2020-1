package Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Service.PostService;
import Model.Post;

/**
 * Servlet implementation class Pergunta
 */
@WebServlet("/perguntas.do")
public class Perguntas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Perguntas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String paginaParam = request.getParameter("pagina");
		
		int pagina = paginaParam == null ? 1 : Integer.parseInt(paginaParam);
		
		request.setAttribute("pagina",pagina);

		ArrayList<Post> posts = new PostService().carregar(pagina);
		request.setAttribute("Posts", posts);
		int todasPaginas = new PostService().countPosts();
		
		if(todasPaginas % 10 != 0)
			todasPaginas += 10;
		todasPaginas /= 10;

		request.setAttribute("qtdPaginas", todasPaginas);
		
		RequestDispatcher view = request.getRequestDispatcher("perguntas.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
