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

import BEAN.Order;
import BEAN.Users;
import DAO.OrderDAO;
import DB.DBConnection;

@WebServlet("/StateCartController")
public class StateCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StateCartController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("user");
		
		if (user == null) response.sendRedirect("LoginController");
		else {
			List<Order> listOrder = OrderDAO.listOrder(conn, user.getId());
			request.setAttribute("listOrder", listOrder);
			RequestDispatcher rd = request.getRequestDispatcher("/View/Client/stateCart.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
