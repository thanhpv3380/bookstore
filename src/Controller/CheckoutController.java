package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Order;
import BEAN.Users;
import DAO.DeleteDAO;
import DAO.OrderDAO;
import DB.DBConnection;


@WebServlet("/CheckoutController")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    public CheckoutController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String totalStr = request.getParameter("total");
		float total = Float.parseFloat(totalStr);
		
		request.setAttribute("total", total);
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/checkout.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	    request.setCharacterEncoding("UTF-8");
		
		Connection conn = DBConnection.CreateConnection();
		
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("user");
		
		if (user == null) response.sendRedirect("LoginController");
		else {
			int id_cart = (int) session.getAttribute("id_cart");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			
			String totalStr = request.getParameter("total");
			float total = Float.parseFloat(totalStr);
			
			Order order = new Order();
			order.setName(name);
			order.setPhone(phone);
			order.setAddress(address);
			order.setMoney(total);
			order.setId(user.getId());
			DeleteDAO.delete(conn, "bookstore.cartprod", "id_cart",id_cart);
			OrderDAO.addOrder(conn, order);
			response.sendRedirect("StateCartController");	
		}
			
	}

}
