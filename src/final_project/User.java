package final_project;
import java.sql.*;
import java.util.ArrayList;

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
	
	private boolean failedLogin = false;
	
	private String[] majorCourses;
	private String[][] allCourseInfo;

	
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
					student = new Student(eNumber, firstName, lastName, dbbean);
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
	
	public void createStudent(String eNum, String fName, String lName) {
		student = new Student(eNumber, firstName, lastName, dbbean);
	}
	
	public void createStudent(String eNum) {
		student = new Student(eNum, dbbean);
	}
	
	public Advisor getAdvisor() {
		return advisor;
	}
	
<<<<<<< HEAD
	public String[] getAllMajorsAbbreviations() {
		String[] majors = null;
=======
	public void setFailedLogin(boolean stat) {
		failedLogin = stat;
	}
	
	public boolean getFailedLogin() {
		return failedLogin;
	}
	
	/*
	 * The functions below are used to information from the database
	*/
	
	public void setSchedule(String schedule) {
		try {
			PreparedStatement ps = dbbean.getConnection().prepareStatement("update advising_app.schedule set courses = ? where eNumberStudent = ?");
			ps.setString(1, schedule);
			ps.setString(2, student.getENumber());
			ps.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String[] getMajors() {
		String[] majors = new String[6];
>>>>>>> b5b287656aaf1e8d1913271bfe02685519444f46
		try {
			PreparedStatement ps = dbbean.getConnection().prepareStatement("select abbreviation from major");
			ResultSet rs = ps.executeQuery();
			int i = 0;
			
			rs.last();
			System.out.println(rs.getRow());
			majors = new String[rs.getRow()];
			rs.beforeFirst();
			while(rs.next()) {
				majors[i] = rs.getString(1);
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return majors;
	}

	public String[] getAllMajorsIds() {
		String[] majors = null;
		try {
			PreparedStatement ps = dbbean.getConnection().prepareStatement("select idMajor from major");
			ResultSet rs = ps.executeQuery();
			int i = 0;
			
			rs.last();
			System.out.println(rs.getRow());
			majors = new String[rs.getRow()];
			rs.beforeFirst();
			while(rs.next()) {
				majors[i] = Integer.toString(rs.getInt(1));
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
					majorCourses = classes.split(", ");
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
	
	public String[] getIdcoursesByMajorId(String idMajor) {
		String[] courses = new String[1]; // so there is no error later on.
		int rows = 0;
		try {
			PreparedStatement ps = dbbean.getConnection().prepareStatement("select idcourse from course where idMajor = ?");
			ps.setString(1, idMajor);
			ResultSet rs = ps.executeQuery();
			rs.last();
			rows = rs.getRow();
			rs.beforeFirst();
			courses = new String[rows];
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
				courseInfo[0] = rs.getString(1); 				// idcourse
				courseInfo[1] = Integer.toString(rs.getInt(2)); // idmajor
				courseInfo[2] = rs.getString(3); 				// course
				courseInfo[3] = rs.getString(4); 				// description
				courseInfo[4] = Double.toString(rs.getDouble(5));//credit
				courseInfo[5] = rs.getString(6); 				// aoks
				courseInfo[6] = rs.getString(7); 				// tags
				courseInfo[7] = rs.getString(8); 				// other
				courseInfo[8] = rs.getString(9); 				// prequisites
				//System.out.print(courseID + ": ");
				//for(int i = 0; i < 3; i++ ) System.out.print(courseInfo[i] + ". ");
				//for(int i = 4; i < 9; i++ ) System.out.print(courseInfo[i] + ". ");
				//System.out.println("");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return courseInfo;
	}

	public String[][] getAllCourses() {
		if(allCourseInfo != null) return allCourseInfo;
		allCourseInfo = null; // = new String[][];
		int rows, cols, i = 0;
		try {
			PreparedStatement ps = dbbean.getConnection().prepareStatement("select * from course");
			ResultSet rs = ps.executeQuery();
			rs.last();
			rows = rs.getRow();
			rs.beforeFirst();
			cols = rs.getMetaData().getColumnCount();
			allCourseInfo = new String[rows][cols];
			while(rs.next()) {
				allCourseInfo[i][0] = rs.getString(1);
				allCourseInfo[i][1] = Integer.toString(rs.getInt(2));
				allCourseInfo[i][2] = rs.getString(3);
				allCourseInfo[i][3] = rs.getString(4);
				allCourseInfo[i][4] = Double.toString(rs.getDouble(5));
				allCourseInfo[i][5] = rs.getString(6);
				allCourseInfo[i][6] = rs.getString(7);
				allCourseInfo[i][7] = rs.getString(8);
				allCourseInfo[i][8] = rs.getString(9);
				i++;
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allCourseInfo;
	}
	public ArrayList<Integer> searchForCoursesLocal(String search) {
		ArrayList<Integer> rows = new ArrayList<Integer>();
		String searchLowerCase = search.toLowerCase();
		if(allCourseInfo == null) return null;
		for(int i = 0; i < allCourseInfo.length; i++) {
			String[] row = allCourseInfo[i];
			for(int j = 0; j < row.length; j++) {
				String cellLowerCase = row[j].toLowerCase();
				if(searchLowerCase.contains(cellLowerCase) || cellLowerCase.contains(searchLowerCase)) {
					rows.add(i);
					break;
				}
			}
		}
		return rows;
	}
	
	public String[] searchForCoursesFromDatabase(String search) {
		
		String[][] allCourseInfo = null; // = new String[][];
		int rows, cols, i = 0;
		try {
			PreparedStatement ps = dbbean.getConnection().prepareStatement("select * from course where courseid LIKE '%?%'");
			ps.setString(1, search);
			ResultSet rs = ps.executeQuery();
			rs.last();
			rows = rs.getRow();
			rs.beforeFirst();
			cols = rs.getMetaData().getColumnCount();
			allCourseInfo = new String[rows][cols];
			while(rs.next()) {
				allCourseInfo[i][0] = rs.getString(1);
				allCourseInfo[i][1] = Integer.toString(rs.getInt(2));
				allCourseInfo[i][2] = rs.getString(3);
				allCourseInfo[i][3] = rs.getString(4);
				allCourseInfo[i][4] = Double.toString(rs.getDouble(5));
				allCourseInfo[i][5] = rs.getString(6);
				allCourseInfo[i][6] = rs.getString(7);
				allCourseInfo[i][7] = rs.getString(8);
				allCourseInfo[i][8] = rs.getString(9);
				i++;
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}