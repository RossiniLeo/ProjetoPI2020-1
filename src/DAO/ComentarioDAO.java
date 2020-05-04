package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Comentario;
import Model.Post;

public class ComentarioDAO {
	
	public ArrayList<Comentario> carregar(int pagina, int postID){
		int comeco = (pagina * 10) - 10;
		ArrayList<Comentario> comentarios = new ArrayList<Comentario>();
		String sqlRead = "SELECT * FROM comentarios WHERE postID = ? LIMIT ?,?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlRead);) {
			stm.setInt(1, postID);
			stm.setInt(2, comeco);
			stm.setInt(3, 10);
			stm.execute();
			try(ResultSet rs = stm.executeQuery()) {
				while(rs.next()){
					Comentario comentario = new Comentario(
							rs.getInt("comentarioID"),
							rs.getInt("postID"),
							rs.getInt("userID"),
							rs.getDate("dataComentario"),
							rs.getString("comentario"),
							rs.getDate("dataAtualizacao")
					);
					comentarios.add(comentario);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comentarios;
	}
	
	public int countComentario(int postID) {
		String sqlCount = "SELECT COUNT(*) AS Contagem FROM comentarios WHERE postID = ?";
		try(Connection conn = ConnectionFactory.obtemConexao();
			PreparedStatement stm = conn.prepareStatement(sqlCount);){
			stm.setInt(1, postID);
			stm.execute();
			try(ResultSet rs = stm.executeQuery();){
				if(rs.next())
					return rs.getInt("Contagem");
			}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		
		return -1;
	}

}
