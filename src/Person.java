import java.sql.*;
public class Person {

	static Connection con;
	static String url = "jdbc:mysql://localhost/advising_app?useSSL=false";
	static String username = "root";
	static String password = "admin";
	static String statem = "select * from person";
	
	public static void main(String[] args) {
		_connection();
		try {
			PreparedStatement st = con.prepareStatement(statem);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString("name") + " " + rs.getString("id"));
			}
		}
		catch(Exception ex) {
			System.out.println("You messed up");
		}
		
	}
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
