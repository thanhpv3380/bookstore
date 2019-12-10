package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Author;
import BEAN.Category_Prod;
import DAO.AuthorDAO;
import DAO.Category_ProdDAO;
import DB.DBConnection;

@WebServlet("/EditAuthorController")
public class EditAuthorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditAuthorController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();

		String idStr = request.getParameter("idAuthor");
		int id = Integer.parseInt(idStr);
		
		Author author = AuthorDAO.getAuthor_Id(conn, id);
		
		request.setAttribute("author", author);

		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/editAuthor.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	    request.setCharacterEncoding("UTF-8");
		
	    Connection conn = DBConnection.CreateConnection();
		String name = request.getParameter("name");
		String idStr = request.getParameter("idAuthor");
		int id = Integer.parseInt(idStr);
		
		boolean check = AuthorDAO.updateAuthor(conn, id, name);
		
		if (check) response.sendRedirect("AuthorController");
	}

}
