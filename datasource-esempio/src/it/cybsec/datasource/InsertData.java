package it.cybsec.datasource;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class InsertData
 */
@WebServlet("/insert")
public class InsertData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try { 

			 	DatabaseConnection dc = new DatabaseConnection();
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
	            out.println("<html><body><b>Successfully Inserted" + "</b></body></html>"); 
	        } 
	        catch (Exception e) { 
	            e.printStackTrace(); 
	        }
	}

}
