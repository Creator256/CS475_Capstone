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
	private DBBean dbbean;
	
	private String[] majorCourses;

	
	public boolean Login() {
		boolean stat = false;
		try {
			System.out.println(eNumber);
			System.out.println(password);
			dbbean = new DBBean();
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
				else {
					advisor = new Advisor(eNumber, firstName, lastName, dbbean);
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
	
	public String[] getMajors() {
		String[] majors = new String[6];
		try {
			PreparedStatement ps = dbbean.getConnection().prepareStatement("select abbreviation from major");
			ResultSet rs = ps.executeQuery();
			int i = 0;
			while(rs.next()) {
				majors[i] = rs.getString(1);
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return majors;
	}
	
	public String[] getMajorCourses(String majorAbb) {
		try {
			System.out.println(majorAbb);
			PreparedStatement ps = dbbean.getConnection().prepareStatement("select required_course_ids from major where abbreviation = ?");
			ps.setString(1, majorAbb);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String classes = rs.getString(1);
				System.out.println(classes);
				if (classes != null && !classes.isEmpty()) {
					majorCourses = classes.split(",");
				} else {
					String[] nullCourses = new String[1];
					return nullCourses;
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return majorCourses;
	}
	
	public String[] getCourses() {
		String[] courses = new String[30];
		try {
			PreparedStatement ps = dbbean.getConnection().prepareStatement("select idcourse from course");
			ResultSet rs = ps.executeQuery();
			int i = 0;
			while(rs.next()) {
				courses[i] = rs.getString(1);
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return courses;
	}
	
	public String[] getCourseInfo(String courseID) {
		String[] courseInfo = new String[9];
		try {
			PreparedStatement ps = dbbean.getConnection().prepareStatement("select * from course where idcourse = ?");
			ps.setString(1, courseID);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				courseInfo[0] = rs.getString(1);
				courseInfo[1] = Integer.toString(rs.getInt(2));
				courseInfo[2] = rs.getString(3);
				courseInfo[3] = rs.getString(4);
				courseInfo[4] = Double.toString(rs.getDouble(5));
				courseInfo[5] = rs.getString(6);
				courseInfo[6] = rs.getString(7);
				courseInfo[7] = rs.getString(8);
				courseInfo[8] = rs.getString(9);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return courseInfo;
	}
	public Advisor getAdvisor() {
		return advisor;
	}
}