package it.cybsec.datasource;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class InsertData
 */
@WebServlet("/delete")
public class DeleteData extends HttpServlet {

	private DatabaseConnection dc;
	private static final long serialVersionUID = 1L;
	
	public void init(ServletConfig config) {
		try {
			dc = new DatabaseConnection();
		} catch(Exception e) {
			
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try { 
			 	Connection conn = dc.getConnection();
			 	
	            PreparedStatement st = conn.prepareStatement("delete from impiegati where id = ?"); 
	  
	            st.setString(1, request.getParameter("id")); 
	            st.executeUpdate(); 
	            st.close(); 
	            conn.close(); 
	  
	            // Get a writer pointer  
	            // to display the succesful result 
	            PrintWriter out = response.getWriter(); 
	            out.println("<html><body><b>Successfully deleted" + "</b></body></html>"); 
	        } 
	        catch (Exception e) { 
	            e.printStackTrace(); 
	        }
	}
}
