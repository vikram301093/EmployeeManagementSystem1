package conn;

import java.sql.Connection;
import java.sql.DriverManager;
public class MyConnection {

	 private Connection con;
	 private static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";
	 private static final String URL = "jdbc:mysql://datanamictool.cl0uft8eytsx.ap-south-1.rds.amazonaws.com:3306/simpledb";
	 private static final String USER_NAME = "vikram";
	 private static final String PASSWORD = "lap725top";
	 public Connection getMyConnnection(){
	  try {
	   if(con == null || con.isClosed()){
	    Class.forName(DRIVER_CLASS);
	    con = DriverManager.getConnection(URL,USER_NAME,PASSWORD);
	    
	   }
	  } catch (Exception e) {
	   e.printStackTrace();
	  }
	  return con;
	 }
}
