package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Product;
import DAO.CartDAO;
import DAO.DeleteDAO;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteController() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();

		String idStr = request.getParameter("id");
		String name = request.getParameter("name");
		
		int id = Integer.parseInt(idStr);
		String idName = "";
		String url = "";
		if (name.equals("product")) {
			idName = "id_product";
			url = "ProductController";
			DeleteDAO.delete(conn, "cartprod", "id_product", id);
			
		}
		else if (name.equals("category_prod")){
			idName = "id_categoryprod";
			url = "CategoryProdController";
			List<Product> list = ProductDAO.listProduct(conn);
			for (Product prod : list) {
				if (id == prod.getId_categoryprod()) {
					DeleteDAO.delete(conn, "cartprod", "id_product", prod.getId_product());
					DeleteDAO.deleteProduct_Id(conn, idName, id);
					break;
				}
			}	
		} else if (name.equals("author")){
			idName = "id_author";
			url = "AuthorController";
			List<Product> list = ProductDAO.listProduct(conn);
			for (Product prod : list) {
				if (id == prod.getId_author()) {
					DeleteDAO.delete(conn, "cartprod", "id_product", prod.getId_product());
					DeleteDAO.deleteProduct_Id(conn, idName, id);
					break;
				}
			}
		} else if (name.equals("publisher")){
			idName = "id_publisher";
			url = "PublisherController";
			List<Product> list = ProductDAO.listProduct(conn);
			for (Product prod : list) {
				if (id == prod.getId_publisher()) {
					DeleteDAO.delete(conn, "cartprod", "id_product", prod.getId_product());
					DeleteDAO.deleteProduct_Id(conn, idName, id);
					break;
				}
			}	
		} else if (name.equals("users")){
			idName = "id_user";
			url = "UserController";
			int id_cart = CartDAO.addProdToCart(conn, id);
			DeleteDAO.delete(conn, "bookstore.order", "id_user", id);
			DeleteDAO.delete(conn, "bookstore.cartprod", "id_cart", id_cart);
			DeleteDAO.delete(conn, "bookstore.cart", "id_user", id);
		} else if (name.equals("bookstore.order")){
			idName = "id_order";
			url = "OrderController";
		}
		boolean c2 = DeleteDAO.delete(conn, name, idName, id);
		if (c2) response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
