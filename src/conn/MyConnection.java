package conn;

import java.sql.Connection;
import java.sql.DriverManager;
public class MyConnection {

	 private Connection con;
	 private static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";
	 private static final String URL = "jdbc:mysql://localhost:3306/employee_management_system";
	 private static final String USER_NAME = "root";
	 private static final String PASSWORD = "vikram123";
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
