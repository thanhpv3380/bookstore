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

import BEAN.Product;
import DAO.ProductDAO;
import DB.DBConnection;


@WebServlet("/SearchProdController")
public class SearchProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchProdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		Connection conn = DBConnection.CreateConnection();
		String name = request.getParameter("search");
		
		List<Product> listProd = ProductDAO.listProduct_Search(conn, name);
		
		request.setAttribute("listProd", listProd);
		
		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/product.jsp");
		rd.forward(request, response);		
	}

}
