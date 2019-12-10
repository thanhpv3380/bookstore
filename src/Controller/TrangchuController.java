package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Category_Prod;
import BEAN.Product;
import BEAN.Users;
import DAO.Category_ProdDAO;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/TrangchuController")
public class TrangchuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TrangchuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		
		List<Product> listProd_Year = ProductDAO.listProduct_Year(conn);
		List<Product> listProd_Amount = ProductDAO.listProduct_Amount(conn);
		
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("admin");
		
		request.setAttribute("listProd_Year", listProd_Year);
		request.setAttribute("listProd_Amount", listProd_Amount);
		
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/trangchu.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
