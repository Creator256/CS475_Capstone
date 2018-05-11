package final_project;

import java.sql.*;
import final_project.DBBean;
import java.util.*;

public class Advisor {
	private DBBean dbbean;
	private String eNumber;
	private String password;
	private String firstName;
	private String lastName;
	private boolean loggedIn;
	private Map<String, String[]> studentinfo;
	private int personType;

	public String geteNumber() {
		return eNumber;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public boolean isLoggedIn() {
		return loggedIn;
	}

	public Map<String, String[]> getStudentinfo() {
		return studentinfo;
	}

	public int getPersonType() {
		return personType;
	}

	public void seteNumber(String eNumber) {
		this.eNumber = eNumber;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}

	public void setStudentinfo(Map<String, String[]> studentinfo) {
		this.studentinfo = studentinfo;
	}

	public void setPersonType(int personType) {
		this.personType = personType;
	}

	
	Advisor(String eN, String fN, String lN, DBBean db) {
		dbbean = db;
		eNumber = eN;
		firstName = fN;
		lastName = lN;
		studentinfo = new HashMap<String, String[]>();
		// can check if null, then throw error
	}

	// we need to get each student's eNumber, FirstName, LastName, Major, (and
	// even scheduler for later use).
	public boolean getStudents() {
		try {
			boolean stat;
			PreparedStatement ps = dbbean.getConnection()
					.prepareStatement("select adviseeList from advisor where eNumberAdvisor = ?");
			ps.setString(1, eNumber);
			ResultSet rs = ps.executeQuery();
			stat = rs.next();
			// how can you ensure that only one was selected? if two selected
			// then error...
			if (stat) {
				String adviseeList = rs.getString("adviseeList");
				String[] studentENumber = adviseeList.split(", ");

				for (String studentstr : studentENumber) {
					//System.out.print(studentstr + ",, ");
					boolean stat2;
					PreparedStatement ps2 = dbbean.getConnection().prepareStatement(
							"select firstName, lastName, major.fullname from person, student join major on student.idMajor = major.idMajor where person.eNumber = ? && student.eNumberStudent = person.eNumber");
					ps2.setString(1, studentstr);
					ResultSet rs2 = ps2.executeQuery();
					stat2 = rs2.next();
					if (stat2) {
						
						String temp[] = new String[3];
						temp[0] = rs2.getString("firstName");
						temp[1] = rs2.getString("lastName");
						temp[2] = rs2.getString("major.fullname");

						//System.out.println(temp);
						studentinfo.put(studentstr, temp);
					} else {
						System.out.println("Reached end of results in Result Set.");
					}
					rs2.close();
					ps2.close();
				}
				rs.close();
				ps.close();
				return true;
			} else { // advisor has no students 
				rs.close();
				ps.close();
				return true;
			}
		} catch (Exception e) {
			System.out.println("Invalid query");
			e.printStackTrace();
			return false;
		}
	}
}
