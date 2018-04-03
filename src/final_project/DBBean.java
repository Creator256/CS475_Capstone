package final_project;
import java.sql.*;
public class DBBean {

	static Connection con;
	static String url = "jdbc:mysql://localhost/advising_app?useSSL=false";
	static String username = "root";
	static String password = "admin";
	static String statem = "select * from person";
	
	public static void _connection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
		}
		catch(Exception ex){
			System.out.println("Cannot connect");
			return;
		}
		
	}	
}
