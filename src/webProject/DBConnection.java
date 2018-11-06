package webProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public Connection getConnection() {
		Connection connection = null;
		String connectionurl = "jdbc:mysql://localhost:3306/project";
		String connectionusername = "root";
		String connectionpassword = "";
		
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
	   	 connection = DriverManager.getConnection(connectionurl, connectionusername, connectionpassword);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return connection;
		

		
	}

}

