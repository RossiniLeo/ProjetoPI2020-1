package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Post;

public class PostDAO {
	
	public int criar(Post post) {
		String sqlInsert = "INSERT INTO post VALUES(null, ?, ?, ?, ?)";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlInsert);) {
			stm.setInt(1, post.getUserID());
			stm.setDate(2, post.getDataPost());
			stm.setString(3, post.getTitulo());
			stm.setString(4, post.getCorpo());
			stm.execute();
			String sqlQuery  = "SELECT LAST_INSERT_ID()";
			try(PreparedStatement stm2 = conn.prepareStatement(sqlQuery);
				ResultSet rs = stm2.executeQuery();) {
				if(rs.next()){
					post.setPostID(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return post.getPostID();
	}
	
	public ArrayList<Post> carregar(int pagina) {
		int comeco = (pagina * 10) - 10;
		System.out.println("Começo: "+comeco);
		ArrayList<Post> posts = new ArrayList<Post>();
		String sqlRead = "SELECT * FROM post LIMIT ?,?";
		try (Connection conn = ConnectionFactory.obtemConexao();
				PreparedStatement stm = conn.prepareStatement(sqlRead);) {
			stm.setInt(1, comeco);
			stm.setInt(2, 10);
			stm.execute();
			try(ResultSet rs = stm.executeQuery()) {
				while(rs.next()){
					System.out.println(rs.getInt("postID"));
					Post post = new Post(
							rs.getInt("postID"),
							rs.getInt("userID"),
							rs.getDate("dataPost"),
							rs.getString("titulo"),
							rs.getString("corpo")
					);
					posts.add(post);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return posts;
	}
	
	public int countPost() {
		String sqlCount = "SELECT COUNT(*) AS Contagem FROM post";
		try(Connection conn = ConnectionFactory.obtemConexao();
			PreparedStatement stm = conn.prepareStatement(sqlCount);
				ResultSet rs = stm.executeQuery();){
			if(rs.next()) {
				return rs.getInt("Contagem");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}

}
