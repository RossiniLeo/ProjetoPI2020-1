package Service;

import DAO.UsuarioDAO;
import Model.Usuario;

public class UsuarioService {
	private UsuarioDAO usuarioDao = new UsuarioDAO();
	
	public void criar(Usuario usuario) {
		usuarioDao.criar(usuario);
	}
	
	public Usuario carregar(int id) {
		return usuarioDao.carregar(id);
	}
	
	public Usuario carregarPorEmailSenha(String email, String senha) {
		return usuarioDao.carregarPorEmailSenha(email, senha);
	}
}	
