package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Users;
import DAO.CartDAO;
import DB.DBConnection;

@WebServlet("/AddToCartController")
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddToCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		
		String idStr = request.getParameter("idProd");
		int idProd = Integer.parseInt(idStr);
		
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("user");
		
		if (user == null) response.sendRedirect("LoginController");
		else {
			int id_cart = (int) session.getAttribute("id_cart");
			boolean check = CartDAO.addProdToCartProd(conn, idProd, id_cart);
			
			if (check) {
				boolean check2 = CartDAO.updateProductInCart(conn, id_cart, idProd);
			}
			else {		
				boolean check3 = CartDAO.addProductInCart(conn, id_cart, idProd);
			}
			response.sendRedirect("CartController");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
