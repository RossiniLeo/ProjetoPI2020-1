package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Service.PostService;
import Model.Post;

/**
 * Servlet implementation class Perguntas
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int userID = (int) request.getSession().getAttribute("userID");
		String titulo = request.getParameter("titulo");
		String corpo = request.getParameter("corpo");
		
		Post post = new Post(userID,titulo,corpo);
		post.setPostID(new PostService().criar(post));
		
		response.getWriter().append("Seu post foi publicado com sucesso!");
	}

}
