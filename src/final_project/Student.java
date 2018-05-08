package final_project;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

public class Student {
	
	String eNumber = "";
	String name = "";
	String major = "";
	String[] schedulerClasses;
	String[] yearOneClasses;
	String[] yearTwoClasses;
	String[] yearThreeClasses;
	String[] yearFourClasses;
	
	public Student(String eNumber, String name, DBBean bean) {
		init(eNumber, name, bean);
	}
	
	public void init(String eNumber, String name, DBBean bean) {
		System.out.println("INIT STUDENT");
		this.eNumber = eNumber;
		this.name = name;
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
	
}
