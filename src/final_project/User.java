package final_project;
import java.sql.*;
import final_project.DBBean;

public class User {
	
	private String eNumber;
	private String password;
	private String firstName;
	private String lastName;
	private boolean loggedIn;
	private int personType;
	private Student student;
	private Advisor advisor;

	
	public boolean Login() {
		boolean stat = false;
		try {
			System.out.println(eNumber);
			System.out.println(password);
			DBBean dbbean = new DBBean();
			dbbean.InitConnection();
			PreparedStatement ps = dbbean.getConnection().prepareStatement("select * from person where eNumber = ? and password = ?");
			ps.setString(1, eNumber);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			stat = rs.next();
			if(stat) {
				firstName = rs.getString("FirstName");
				lastName = rs.getString("LastName");
				personType = rs.getInt("isStudent");
				if(isStudent()) {
					student = new Student(eNumber, firstName + " " + lastName, dbbean);
					//student.init(eNumber, firstName + " " + lastName, dbbean);
				}
				loggedIn = true;
				return true;
			}
		}catch(Exception e) {
			System.out.println(e);
			return false;
		}
		return false;
	}
	
	public void setENumber(String eNum) {
		eNumber = eNum;
	}
	
	public String getENumber() {
		return eNumber;
	}
	
	public void setPassword(String pass) {
		password = pass;
	}
	public String getPassword() {
		return password;
	}
	
	public void setName(String first, String last) {
		firstName = first;
		lastName = last;
	}
	public String getName() {
		return firstName + " " + lastName;
	}
	
	public boolean isStudent() {
		if(personType == 1) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public boolean isLoggedIn() {
		return loggedIn;
	}
	public void setLoggedIn(boolean status) {
		loggedIn = status;
	}
	
	public Student getStudent() {
		return student;
	}
}
