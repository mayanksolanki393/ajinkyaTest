package mynk.test.mock.database;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import mynk.test.beans.Employee;

public class Database {
	public static final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	public static final List<Employee> emps = new ArrayList<>();
	static{
		try{
			emps.add(new Employee(1, "Mayank", "Solanki", sdf.parse("03/05/1993")));
			emps.add(new Employee(2, "Jayaraj", "Solanki", sdf.parse("24/09/1996")));
			emps.add(new Employee(3, "Jamal", "Khan", sdf.parse("05/03/1993")));
		}
		catch(ParseException ex){
			ex.printStackTrace();
		}
	}
}
