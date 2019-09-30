package it.cybsec.datasource;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class DatabaseConnection 
{
	static private DataSource ds = null;
	
	public DatabaseConnection() throws NamingException {
		if(ds == null)
			ds = (DataSource) (new InitialContext()).lookup("java:comp/env/jdbc/azienda");
	}
	
	public Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

}
