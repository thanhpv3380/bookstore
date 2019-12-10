package DAO;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;



public class DisplayImg {
	public static void displayImg(Blob blob) {
		try {
			byte byteArray[] = blob.getBytes(1, (int) blob.length());
			HttpServletResponse response = null;
			response.setContentType("image/gif");
			OutputStream os = response.getOutputStream();
			os.write(byteArray);
			os.flush();
			os.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
