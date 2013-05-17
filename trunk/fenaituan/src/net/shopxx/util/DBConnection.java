package net.shopxx.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getCon()
	{
		Connection con=null;
		String url="jdbc:mysql://127.0.0.1:3306/shopxx?user=root&password=root";
		try {
			con = DriverManager.getConnection(url);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
		
  public  static void close(Connection con)
  {
	  try
	  {
	  con.close();
	  }catch(Exception e)
	  {
		  e.printStackTrace();
	  }
  }

}
