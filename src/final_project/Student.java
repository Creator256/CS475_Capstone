package final_project;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

public class Student {
	
	String eNumber = "";
	String firstName = "";
	String lastName = "";
	String major = "";
	String[] schedulerClasses;
	String[] yearOneClasses;
	String[] yearTwoClasses;
	String[] yearThreeClasses;
	String[] yearFourClasses;
	
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
			}
			else {
				System.out.println("Can't find a schedule for this student");
			}
			ps.close();
		} catch (Exception e) {

		}
		
		
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
	public String getMajor() {
		return major;
	}
	
}
