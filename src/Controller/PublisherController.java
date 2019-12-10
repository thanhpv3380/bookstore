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

import BEAN.Publisher;
import BEAN.Users;
import DAO.PublisherDAO;
import DAO.UserDAO;
import DB.DBConnection;

@WebServlet("/PublisherController")
public class PublisherController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublisherController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		List<Publisher> listPublisher = PublisherDAO.listPublisher(conn);
		
		request.setAttribute("listPublisher", listPublisher);
		
		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/publisher.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
