package Service;

import java.util.ArrayList;

import DAO.ComentarioDAO;
import Model.Comentario;

public class ComentarioService {
	ComentarioDAO comentarioDAO = new ComentarioDAO();
	
	public ArrayList<Comentario> carregar(int pagina,int id){
		return comentarioDAO.carregar(pagina, id);
	}
	
	public int countComentario(int postID){
		return comentarioDAO.countComentario(postID);
	}

}
