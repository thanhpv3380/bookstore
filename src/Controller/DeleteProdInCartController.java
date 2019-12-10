package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DeleteDAO;
import DB.DBConnection;

@WebServlet("/DeleteProdInCartController")
public class DeleteProdInCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DeleteProdInCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		
		String idProd = request.getParameter("idProd");
		String idCart = request.getParameter("idCart");
		
		int id_product = Integer.parseInt(idProd);
		int id_cart = Integer.parseInt(idCart);
		
		DeleteDAO.deleteProduct_2Id(conn, "id_product", id_product, "id_cart", id_cart);
		response.sendRedirect("CartController");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
