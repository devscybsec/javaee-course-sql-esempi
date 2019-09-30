package it.cybsec.datasource;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class InsertData
 */
@WebServlet("/update")
public class UpdateData extends HttpServlet {
	
	private DatabaseConnection dc;
	private static final long serialVersionUID = 1L;
	
	public void init(ServletConfig config) {
		try {
			dc = new DatabaseConnection();
		} catch(Exception e) {
			
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try { 
			 	
	        } 
	        catch (Exception e) { 
	            e.printStackTrace(); 
	        }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try { 
			 	Connection conn = dc.getConnection();
			 	
	            PreparedStatement st = conn.prepareStatement("insert into impiegati(nome,cognome,settore) values(?,?,?)"); 
	  
	            st.setString(1, request.getParameter("nome")); 
	            st.setString(2, request.getParameter("cognome"));
	            st.setString(3, request.getParameter("settore"));
	            st.executeUpdate(); 
	            st.close(); 
	            conn.close(); 
	  
	            // Get a writer pointer  
	            // to display the succesful result 
	            PrintWriter out = response.getWriter(); 
	            out.println("<html><body><b>Successfully inserted" + "</b></body></html>"); 
	        } 
	        catch (Exception e) { 
	            e.printStackTrace(); 
	        }
	}

}
