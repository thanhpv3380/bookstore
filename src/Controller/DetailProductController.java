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

@WebServlet("/DetailProdController")
public class DetailProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		
		String idStr = request.getParameter("idProd");
		int id = Integer.parseInt(idStr);
		
		Product prod = ProductDAO.getProduct_id(conn, id);
		List<Product> listProd_CategoryProd = ProductDAO.listProduct_CategoryProd(conn, id, prod.getId_categoryprod());
		
		request.setAttribute("prod", prod);
		request.setAttribute("listProd_CategoryProd", listProd_CategoryProd);
		
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/detail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
