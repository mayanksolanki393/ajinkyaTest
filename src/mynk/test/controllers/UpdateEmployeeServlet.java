package mynk.test.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mynk.test.beans.Employee;
import mynk.test.mock.database.Database;

/**
 * Servlet implementation class UpdateEmployeeServlet
 */
@WebServlet("/updateEmployee")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try{
	    	System.out.println(request.getParameterMap());
	    	int id = Integer.parseInt(request.getParameter("id"));
			
	    	Employee emp = Database.emps.get(Database.emps.indexOf(new Employee(id)));
		    emp.setFirstName((String)request.getParameter("firstName"));
		    emp.setLastName((String)request.getParameter("lastName"));
		    emp.setDob(Database.sdf.parse((String)request.getParameter("dob")));
	    }
	    catch(Exception ex){
	    	ex.printStackTrace();
	    }
	    response.sendRedirect("home");
	}

}
