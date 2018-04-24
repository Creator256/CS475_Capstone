package final_project;
import java.sql.*;
public class DBBean {

	String url = "jdbc:mysql://localhost/advising_app?useSSL=false";
	String username = "root";
	String password = "admin";
	String driver = "com.mysql.jdbc.Driver";
	Connection con = null;  
	
	void InitConnection(){  
		try{  
			Class.forName(driver);  
			con = DriverManager.getConnection(url,username,password);
			System.out.println("connected successful");
		}
		catch(Exception e){
			System.out.println(e);
		}  
	}  
	  
	public Connection getConnection(){  
	    return con;  
	}  
	  
}  
