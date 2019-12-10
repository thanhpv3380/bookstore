package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Cart;
import BEAN.Users;
import DAO.CartDAO;
import DB.DBConnection;

@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("user");
	
		if (user == null) response.sendRedirect("LoginController");
		else {
			int id_cart = (int) session.getAttribute("id_cart");
		
		
			List<Cart> listCart = CartDAO.listCart(conn, id_cart);
			request.setAttribute("id_cart", id_cart);
			request.setAttribute("listCart", listCart);
	
			RequestDispatcher rd = request.getRequestDispatcher("/View/Client/cart.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
