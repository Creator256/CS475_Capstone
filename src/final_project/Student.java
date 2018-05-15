package final_project;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

public class Student {
	
	String eNumber = "";
	String firstName = "";
	String lastName = "";
	String majorID = "";
	String major = "";
	String[] schedulerClasses;
	String[] yearOneClasses;
	String[] yearTwoClasses;
	String[] yearThreeClasses;
	String[] yearFourClasses;
	
	DBBean studentBean;
	
	public Student(String eNum, String fName, String lName, DBBean bean) {
		init(eNum, fName, lName, bean);
	}
	
	public Student(String eNum, DBBean bean) {
		try {
			PreparedStatement ps = bean.getConnection().prepareStatement("select * from person where eNumber = ?");
			ps.setString(1, eNumber);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				firstName = rs.getString("FirstName");
				lastName = rs.getString("LastName");
			}
			ps.close();
		}
		catch (Exception e) {

		}
		init(eNum, firstName, lastName, bean);
	}
	
	public void init(String eNumber, String fName, String lName, DBBean bean) {
		System.out.println("INIT STUDENT");
		studentBean = new DBBean();
		studentBean.InitConnection();
		this.eNumber = eNumber;
		firstName = fName;
		lastName = lName;
		try {
			
			PreparedStatement ps = bean.getConnection().prepareStatement("select * from schedule where eNumberStudent = ?");
			ps.setString(1, eNumber);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String classes = rs.getString("courses");
				System.out.println(classes);
				schedulerClasses = classes.split(Pattern.quote("|"));
				yearOneClasses = schedulerClasses[0].split(",");
				yearTwoClasses = schedulerClasses[1].split(",");
				yearThreeClasses = schedulerClasses[2].split(",");
				yearFourClasses = schedulerClasses[3].split(",");
				initStudentMajor(bean);
			}
			else {
				System.out.println("Can't find a schedule for this student");
			}
			ps.close();
		} catch (Exception e) {
			
		}
	}
	
	public void initStudentMajor(DBBean bean) {
		try {
			PreparedStatement ps = bean.getConnection().prepareStatement("select idMajor from student where eNumberStudent = ?");
			ps.setString(1, eNumber);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String studentMajorID = rs.getString("idMajor");
				System.out.println(studentMajorID);
				majorID = studentMajorID;
				try {
					PreparedStatement ps2 = bean.getConnection().prepareStatement("select abbreviation from major where idMajor = ?");
					ps2.setString(1, majorID);
					ResultSet rs2 = ps2.executeQuery();
					if(rs2.next()) {
						String studentMajor = rs2.getString("abbreviation");
						System.out.println(studentMajor);
						major = studentMajor;
					}
					else {
						System.out.println("Can't find a major for this student");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			else {
				System.out.println("Can't find a major for this student");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String[] getCourseInfo(String courseID) {
		String[] courseInfo = new String[9];
		try {
			PreparedStatement ps = studentBean.getConnection().prepareStatement("select * from course where idcourse = ?");
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
	
	public String getRemainingCourses() {
		String[] majorRequirements;
		String[] metRequirements;
		String remainingRequirements = "";
		try {	
			PreparedStatement ps = studentBean.getConnection().prepareStatement("select required_course_ids from major where abbreviation = ?");
			ps.setString(1, major);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String classes = rs.getString(1);
				System.out.println(classes);
				if (classes != null && !classes.isEmpty()) {
					majorRequirements = classes.split(",");
					metRequirements = new String[majorRequirements.length];
					for(int x = 0; x < majorRequirements.length; x++) {
						for(int y = 0; y < yearOneClasses.length; y++) {
							if(majorRequirements[x].equals(yearOneClasses[y])) {
								metRequirements[x] = majorRequirements[x];
							}
						}
						for(int y = 0; y < yearTwoClasses.length; y++) {		
							if(majorRequirements[x].equals(yearTwoClasses[y])) {
								metRequirements[x] = majorRequirements[x];
							}
						}
						for(int y = 0; y < yearThreeClasses.length; y++) {	
							if(majorRequirements[x].equals(yearThreeClasses[y])) {
								metRequirements[x] = majorRequirements[x];
							}
						}
						for(int y = 0; y < yearFourClasses.length; y++) {
							if(majorRequirements[x].equals(yearFourClasses[y])) {
								metRequirements[x] = majorRequirements[x];
							}
						}
					}
					for(int x = 0; x < metRequirements.length; x++) {
						if(!(metRequirements[x] != null && !metRequirements[x].isEmpty()) && (remainingRequirements != null && !remainingRequirements.isEmpty())) {
							remainingRequirements = remainingRequirements + "," + majorRequirements[x];
						} else if(!(metRequirements[x] != null && !metRequirements[x].isEmpty())) {
							remainingRequirements = majorRequirements[x];
						}
					}
				} else {
					String nullCourses = "";
					return nullCourses;
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("REMAINING: " + remainingRequirements);
		return remainingRequirements;
	}
	
	public String[] getRemainingGeneralFields() {
		String[] generalFields;
		String[] metFields;
		String[] courseInfo;
		String remainingFields = "";
		try {	
			PreparedStatement ps = studentBean.getConnection().prepareStatement("select AoKsTagsProficiencyAndOther from graduationrequirement where idgradrequirement = ?");
			ps.setString(1, majorID);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String fields = rs.getString(1);
				System.out.println(fields);
				if (fields != null && !fields.isEmpty()) {
					generalFields = fields.split(",");
					metFields = new String[generalFields.length];
					for(int x = 0; x < generalFields.length; x++) {
						for(int y = 0; y < yearOneClasses.length; y++) {
							courseInfo = getCourseInfo(yearOneClasses[y]);
							if((courseInfo[5] != null && !courseInfo[5].isEmpty()) || (courseInfo[6] != null && !courseInfo[6].isEmpty())) {
								if(generalFields[x].equals(courseInfo[5])) {
									metFields[x] = generalFields[x];
								} else if(generalFields[x].equals(courseInfo[6])) {
									metFields[x] = generalFields[x];
								}
							}
						}
						for(int y = 0; y < yearTwoClasses.length; y++) {
							courseInfo = getCourseInfo(yearTwoClasses[y]);
							if((courseInfo[5] != null && !courseInfo[5].isEmpty()) || (courseInfo[6] != null && !courseInfo[6].isEmpty())) {
								if(generalFields[x].equals(courseInfo[5])) {
									metFields[x] = generalFields[x];
								} else if(generalFields[x].equals(courseInfo[6])) {
									metFields[x] = generalFields[x];
								}
							}
						}
						for(int y = 0; y < yearThreeClasses.length; y++) {
							courseInfo = getCourseInfo(yearThreeClasses[y]);
							if((courseInfo[5] != null && !courseInfo[5].isEmpty()) || (courseInfo[6] != null && !courseInfo[6].isEmpty())) {
								if(generalFields[x].equals(courseInfo[5])) {
									metFields[x] = generalFields[x];
								} else if(generalFields[x].equals(courseInfo[6])) {
									metFields[x] = generalFields[x];
								}
							}
						}
						for(int y = 0; y < yearFourClasses.length; y++) {
							courseInfo = getCourseInfo(yearFourClasses[y]);
							if((courseInfo[5] != null && !courseInfo[5].isEmpty()) || (courseInfo[6] != null && !courseInfo[6].isEmpty())) {
								if(generalFields[x].equals(courseInfo[5])) {
									metFields[x] = generalFields[x];
								} else if(generalFields[x].equals(courseInfo[6])) {
									metFields[x] = generalFields[x];
								}
							}
						}
					}
					for(int x = 0; x < metFields.length; x++) {
						if(!(metFields[x] != null && !metFields[x].isEmpty()) && (remainingFields != null && !remainingFields.isEmpty())) {
							remainingFields = remainingFields + "," + generalFields[x];
						} else if(!(metFields[x] != null && !metFields[x].isEmpty())) {
							remainingFields = generalFields[x];
						}
					}
				} else {
					String[] nullCourses = new String[1];
					return nullCourses;
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("REMAINING FIELDS: " + remainingFields);
		return remainingFields.split(",");
	}
	
	public String[] getYearOneClasses() {
		return yearOneClasses;
	}
	public String[] getYearTwoClasses() {
		return yearTwoClasses;
	}
	public String[] getYearThreeClasses() {
		return yearThreeClasses;
	}
	public String[] getYearFourClasses() {
		return yearFourClasses;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public String getENumber() {
		return eNumber;
	}
	public String getMajorID() {
		return majorID;
	}
	public String getMajor() {
		return major;
	}
	
}
