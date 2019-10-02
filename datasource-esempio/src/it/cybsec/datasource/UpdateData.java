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
	private Connection conn;
	private PreparedStatement st;
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) {
		try {
			dc = new DatabaseConnection();
			setStatement();
		} catch (Exception e) {

		}
	}
	
	private void setStatement() throws SQLException {
		conn = dc.getConnection();
		st = conn.prepareStatement("update impiegati set nome = ?, cognome = ?, settore = ? where id = ?");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getServletContext().getRequestDispatcher("/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message = "";
		try {
			if(conn.isClosed())
				setStatement();
				
			st.setString(1, request.getParameter("nome"));
			st.setString(2, request.getParameter("cognome"));
			st.setString(3, request.getParameter("settore"));
			st.setInt(4, Integer.parseInt(request.getParameter("id")));
			st.execute();
			st.close();
			conn.close();

			message += "Successfully updated - id=" + request.getParameter("id");
			message += " nome = '" + request.getParameter("nome") + "'";
			message += " cognome = '" + request.getParameter("cognome") + "'";
			message += " settore = '" + request.getParameter("nome") + "'";
					
			request.setAttribute("message", message);
			request.getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
