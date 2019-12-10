package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Order;
import BEAN.Product;

public class OrderDAO {
	public static void addOrder(Connection conn, Order order) {
		PreparedStatement ptmt = null;
		String sql = "insert into bookstore.order(name, phone, address,date_send, money, id_user) "
				+ "values('"+order.getName()+"','"+order.getPhone()+"','"+order.getAddress()+"', now(),"+order.getMoney()+","+order.getId()+")";
		System.out.println(sql);
		try {
			ptmt = conn.prepareStatement(sql);
			System.out.println(order.getId());
			int row = ptmt.executeUpdate();
			ptmt.close();
			if (row > 0) {
				System.out.print("add success");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print("add not success");
		}
	}
	public static List<Order> listOrder(Connection conn, int id_user) {
		List<Order> list = new ArrayList<Order>();
		PreparedStatement ptmt = null;
		String sql = "select * from bookstore.order where id_user="+id_user;
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId_order(rs.getInt("id_order"));
				order.setName(rs.getString("name"));
				order.setAddress(rs.getString("address"));
				order.setPhone(rs.getString("phone"));
				order.setDate_send(rs.getDate("date_send"));
				order.setDate_receive(rs.getDate("date_receive"));
				order.setMoney(rs.getFloat("money"));
				list.add(order);
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static List<Order> listOrderAll(Connection conn) {
		List<Order> list = new ArrayList<Order>();
		PreparedStatement ptmt = null;
		String sql = "select * from bookstore.order";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId_order(rs.getInt("id_order"));
				order.setName(rs.getString("name"));
				order.setAddress(rs.getString("address"));
				order.setPhone(rs.getString("phone"));
				order.setDate_send(rs.getDate("date_send"));
				order.setDate_receive(rs.getDate("date_receive"));
				order.setMoney(rs.getFloat("money"));
				list.add(order);
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
