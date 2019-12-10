package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Publisher;
import DAO.PublisherDAO;
import DB.DBConnection;


@WebServlet("/EditPublisherController")
public class EditPublisherController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditPublisherController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();

		String idStr = request.getParameter("idPublisher");
		int id = Integer.parseInt(idStr);

		Publisher publisher = PublisherDAO.getPublisher_Id(conn, id);
		
	
		request.setAttribute("publisher", publisher);

		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/editPublisher.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	    request.setCharacterEncoding("UTF-8");
		
	    Connection conn = DBConnection.CreateConnection();
		String name = request.getParameter("name");
		String idStr = request.getParameter("idAuthor");
		int id = Integer.parseInt(idStr);
		
		boolean check = PublisherDAO.updatePublisher(conn, id, name);
		
		if (check) response.sendRedirect("PublisherController");
	}

}
