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
	String advisor = "";
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
		}
		catch (Exception e) {

		}
		init(eNum, firstName, lastName, bean);
	}
	
	public void init(String eNumber, String fName, String lName, DBBean bean) {
		//System.out.println("INIT STUDENT");
		studentBean = new DBBean();
		studentBean.InitConnection();
		fetchAdvisor();
		this.eNumber = eNumber;
		firstName = fName;
		lastName = lName;
		initStudentMajor(bean);
		getStudentSchedule();
	}
	
	public void fetchAdvisor() {
		try {
			PreparedStatement ps = studentBean.getConnection().prepareStatement("SELECT eNumberAdvisor FROM advising_app.advisor INNER join person on advisor.eNumberAdvisor = person.eNumber where adviseeList like ?");
			ps.setString(1, "%"+eNumber+"%");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				advisor = rs.getString("eNumberAdvisor");
			}
			ps = studentBean.getConnection().prepareStatement("select * from person where eNumber = ?");
			ps.setString(1,  advisor);
			rs = ps.executeQuery();
			if(rs.next()) {
				advisor = rs.getString("FirstName") + " " + rs.getString("LastName");
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void getStudentSchedule() {
		try {
			PreparedStatement ps = studentBean.getConnection().prepareStatement("select * from schedule where eNumberStudent = ?");
			ps.setString(1, eNumber);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String classes = rs.getString("courses");
				//System.out.println(classes);
				schedulerClasses = classes.split(Pattern.quote(" | "));
				if(schedulerClasses!= null && schedulerClasses.length > 0) {
					yearOneClasses = schedulerClasses[0].split(", ");
					if(schedulerClasses.length > 1) yearTwoClasses = schedulerClasses[1].split(", ");
					if(schedulerClasses.length > 2) yearThreeClasses = schedulerClasses[2].split(", ");
					if(schedulerClasses.length > 3) yearFourClasses = schedulerClasses[3].split(", ");
				}
			}
			else {
				System.out.println("Can't find a schedule for this student");
			}
		} catch (Exception e) {
			
		}
	}
	
	public String getAdvisor() {
		return advisor;
	}
	
	public void initStudentMajor(DBBean bean) {
		try {
			PreparedStatement ps = bean.getConnection().prepareStatement("select idMajor from student where eNumberStudent = ?");
			ps.setString(1, eNumber);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String studentMajorID = Integer.toString(rs.getInt("idMajor"));
				//System.out.println(studentMajorID);
				majorID = studentMajorID;
				try {
					PreparedStatement ps2 = bean.getConnection().prepareStatement("select abbreviation from major where idMajor = ?");
					ps2.setString(1, majorID);
					ResultSet rs2 = ps2.executeQuery();
					if(rs2.next()) {
						String studentMajor = rs2.getString("abbreviation");
						//System.out.println(studentMajor);
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
				courseInfo[0] = rs.getString(1); 				// idcourse
				courseInfo[1] = Integer.toString(rs.getInt(2)); // idmajor
				courseInfo[2] = rs.getString(3); 				// course
				courseInfo[3] = rs.getString(4); 				// description
				courseInfo[4] = Double.toString(rs.getDouble(5));//credit
				courseInfo[5] = rs.getString(6); 				// aoks
				courseInfo[6] = rs.getString(7); 				// tags
				courseInfo[7] = rs.getString(8); 				// other
				courseInfo[8] = rs.getString(9); 				// prequisites
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return courseInfo;
	}
	
	public String getRemainingCourses() {
		String[] majorRequirements;
		String[] metRequirements;
		String remainingRequirements = null;
		try {	
			PreparedStatement ps = studentBean.getConnection().prepareStatement("select required_course_ids from major where abbreviation = ?");
			ps.setString(1, major);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String classes = rs.getString(1);
				//System.out.println(classes);
				if (classes != null && !classes.isEmpty()) {
					majorRequirements = classes.split(", ");
					metRequirements = new String[majorRequirements.length];
					for(int x = 0; x < majorRequirements.length; x++) {
						if(yearOneClasses != null) {
							for(int y = 0; y < yearOneClasses.length; y++) {
								if(majorRequirements[x].equals(yearOneClasses[y])) {
									metRequirements[x] = majorRequirements[x];
								}
							}
						}
						if(yearTwoClasses != null) {
							for(int y = 0; y < yearTwoClasses.length; y++) {		
								if(majorRequirements[x].equals(yearTwoClasses[y])) {
									metRequirements[x] = majorRequirements[x];
								}
							}
						}
						if(yearThreeClasses != null) {
							for(int y = 0; y < yearThreeClasses.length; y++) {	
								if(majorRequirements[x].equals(yearThreeClasses[y])) {
									metRequirements[x] = majorRequirements[x];
								}
							}
						}
						if(yearFourClasses != null) {
							for(int y = 0; y < yearFourClasses.length; y++) {
								if(majorRequirements[x].equals(yearFourClasses[y])) {
										metRequirements[x] = majorRequirements[x];
								}
							}
						}
					}
					for(int x = 0; x < metRequirements.length; x++) {
						if(!(metRequirements[x] != null && !metRequirements[x].isEmpty()) && (remainingRequirements != null)) {
							remainingRequirements += ", " + majorRequirements[x];
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
		//System.out.println("REMAINING: " + remainingRequirements);
		return remainingRequirements;
	}
	
	public String[] getRemainingGeneralFields() {
		String[] generalFields;
		String[] metFields;
		String[] courseInfo;
		String remainingFields = "";
		try {	
			PreparedStatement ps = studentBean.getConnection().prepareStatement("select AoKsTagsProficiencyAndOther from graduationrequirement");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String fields = rs.getString(1);
				//System.out.println(fields);
				
				if (fields != null && !fields.isEmpty()) {
					generalFields = fields.split(", ");
					metFields = new String[generalFields.length];
					for(int x = 0; x < generalFields.length; x++) {
						if(yearOneClasses != null) {
							for(int y = 0; y < yearOneClasses.length; y++) {
								courseInfo = getCourseInfo(yearOneClasses[y]);
								if((courseInfo[5] != null && !courseInfo[5].isEmpty()) && courseInfo[5].contains(generalFields[x])) {
							 		metFields[x] = generalFields[x];
								} else if((courseInfo[6] != null && !courseInfo[6].isEmpty()) && courseInfo[6].contains(generalFields[x])) {
									metFields[x] = generalFields[x];
								} else if((courseInfo[7] != null && !courseInfo[7].isEmpty()) && courseInfo[7].contains(generalFields[x])) {
									metFields[x] = generalFields[x];
								}
							}
						}
						if(yearTwoClasses != null) {
							for(int y = 0; y < yearTwoClasses.length; y++) {
								courseInfo = getCourseInfo(yearTwoClasses[y]);
								if((courseInfo[5] != null && !courseInfo[5].isEmpty()) && courseInfo[5].contains(generalFields[x])) {
							 		metFields[x] = generalFields[x];
								} else if((courseInfo[6] != null && !courseInfo[6].isEmpty()) && courseInfo[6].contains(generalFields[x])) {
									metFields[x] = generalFields[x];
								} else if((courseInfo[7] != null && !courseInfo[7].isEmpty()) && courseInfo[7].contains(generalFields[x])) {
									metFields[x] = generalFields[x];
								}
							}
						}
						if(yearThreeClasses != null) {
							for(int y = 0; y < yearThreeClasses.length; y++) {
								courseInfo = getCourseInfo(yearThreeClasses[y]);
								if((courseInfo[5] != null && !courseInfo[5].isEmpty()) && courseInfo[5].contains(generalFields[x])) {
							 		metFields[x] = generalFields[x];
								} else if((courseInfo[6] != null && !courseInfo[6].isEmpty()) && courseInfo[6].contains(generalFields[x])) {
									metFields[x] = generalFields[x];
								} else if((courseInfo[7] != null && !courseInfo[7].isEmpty()) && courseInfo[7].contains(generalFields[x])) {
									metFields[x] = generalFields[x];
								}
							}
						}
						if(yearFourClasses != null) {
							for(int y = 0; y < yearFourClasses.length; y++) {
								courseInfo = getCourseInfo(yearFourClasses[y]);
								if((courseInfo[5] != null && !courseInfo[5].isEmpty()) && courseInfo[5].contains(generalFields[x])) {
							 		metFields[x] = generalFields[x];
								} else if((courseInfo[6] != null && !courseInfo[6].isEmpty()) && courseInfo[6].contains(generalFields[x])) {
									metFields[x] = generalFields[x];
								} else if((courseInfo[7] != null && !courseInfo[7].isEmpty()) && courseInfo[7].contains(generalFields[x])) {
									metFields[x] = generalFields[x];
								}
							}
						}
					}
					for(int x = 0; x < metFields.length; x++) {
						if(!(metFields[x] != null && !metFields[x].isEmpty()) && (remainingFields != null)) {
							remainingFields = remainingFields + ", " + generalFields[x];
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
		//System.out.println("REMAINING FIELDS: " + remainingFields);
		return remainingFields.split(", ");
	}
	
	public double getRemainingCredits() {
		double creditsTaken = 0.0;
		double neededCredits = 0.0;
		double remainingCredits = 0.0;
		String[] courseInfo = null;
		if(yearOneClasses != null) {
			for(int y = 0; y < yearOneClasses.length; y++) {
				courseInfo = getCourseInfo(yearOneClasses[y]);
				if(courseInfo[4] != null) {
					creditsTaken += Double.parseDouble(courseInfo[4]);
				}
			}
		}
		if(yearTwoClasses != null) {
			for(int i = 0; i < 3; i++ ) System.out.print(i + "\t");
			for(int i = 4; i < 9; i++ ) System.out.print(i + "\t");
			System.out.println("");
			for(int y = 0; y < yearTwoClasses.length; y++) {
				courseInfo = getCourseInfo(yearTwoClasses[y]);
				System.out.println("yearTWO: " + yearTwoClasses[y] + "yearTWO::: " + courseInfo[4]);
				if(courseInfo[4] != null) {
					creditsTaken += Double.parseDouble(courseInfo[4]);
				}
				
			}
		}
		if(yearThreeClasses != null) {
			for(int y = 0; y < yearThreeClasses.length; y++) {
				courseInfo = getCourseInfo(yearThreeClasses[y]);
				if(courseInfo[4] != null) {
					creditsTaken += Double.parseDouble(courseInfo[4]);
				}
			}
		}
		if(yearFourClasses != null) {
			for(int y = 0; y < yearFourClasses.length; y++) {
				courseInfo = getCourseInfo(yearFourClasses[y]);
				if(courseInfo[4] != null) {
					creditsTaken += Double.parseDouble(courseInfo[4]);
				}
			}
		}
		try {
			PreparedStatement ps = studentBean.getConnection().prepareStatement("select graduationcredits from graduationrequirement");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				neededCredits = rs.getDouble(1);
				remainingCredits =  neededCredits - creditsTaken;
				return remainingCredits;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return remainingCredits;
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
	public String getName() {
		return firstName + " " + lastName;
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
