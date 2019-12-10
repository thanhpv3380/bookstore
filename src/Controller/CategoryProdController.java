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

import BEAN.Category_Prod;
import DAO.Category_ProdDAO;
import DB.DBConnection;

@WebServlet("/CategoryProdController")
public class CategoryProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CategoryProdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		List<Category_Prod> listCategory = Category_ProdDAO.listCategory_Prod(conn);
		
		request.setAttribute("listCategoryProd", listCategory);
		
		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/categoryProd.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
