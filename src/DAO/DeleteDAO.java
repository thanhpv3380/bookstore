package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteDAO {
	public static boolean delete(Connection conn, String table, String col, int id) {
		PreparedStatement ptmt = null;
		String sql = "delete from " + table + " where " + col + " = ?";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, id);
			int temp = ptmt.executeUpdate();
			ptmt.close();
			return temp == 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public static void deleteProduct_Id(Connection conn, String col, int id) {
		PreparedStatement ptmt = null;
		String sql = "delete from product where "+ col + " = ? ";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, id);
			int temp = ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}public static void deleteProduct_2Id(Connection conn, String col1, int id1, String col2, int id2) {
		PreparedStatement ptmt = null;
		String sql = "delete from cartprod where "+ col1 + " = ? and "+ col2 +"= ?";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, id1);
			ptmt.setInt(2, id2);
			int temp = ptmt.executeUpdate();
			ptmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
