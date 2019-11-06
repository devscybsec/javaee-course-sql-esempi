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
		st = conn.prepareStatement("delete from impiegati where id = ?");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			if(conn.isClosed())
				setStatement();
			
			st.setString(1, request.getParameter("id"));
			st.execute();
			st.close();
			conn.close();
			
			request.setAttribute("message", "Successfully deleted - id=" + request.getParameter("id"));
			request.getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
