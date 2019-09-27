package it.cybsec.datasource;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class DatabaseConnection 
{
	private DataSource ds;
	private Context ctx = null;
	
	public DatabaseConnection() throws NamingException {
		ctx = new InitialContext();
		ds = (DataSource) ctx.lookup("java:comp/env/jdbc/azienda");
	}
	
	public Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

}
