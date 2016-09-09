<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List,mynk.test.beans.*,mynk.test.mock.database.Database"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<script>
	var lastId = -1;
	function showEditFor(id){
		if(lastId!=-1){
			var last_row_edit = document.getElementById("edit_"+lastId);
			var last_row = document.getElementById(lastId);
			last_row_edit.style.display = "none";
			last_row.style.display = "";
		}
		var row_edit = document.getElementById("edit_"+id);
		var row = document.getElementById(id);
		row.style.display = "none";
		row_edit.style.display = "";
		lastId = id;
	}
	function cancel(id){
		var row_edit = document.getElementById("edit_"+id);
		var row = document.getElementById(id);
		row.style.display = "";
		row_edit.style.display = "none";
		lastId = -1;
	}
</script>
<style type="text/css">
	th,td{
		width: 120px;
		text-align: left;
	}
	input {
		width: 115px;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>Id</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Date Of Birth</th>
			<th>Actions</th>
		</tr>
		<%
			List<Employee> emps = (List<Employee>) session.getAttribute("emps");
			for(Employee emp : emps){
		%>
		<tr id="<%=emp.getId() %>">
			<td><%=emp.getId() %></td>
			<td><%=emp.getFirstName() %></td>
			<td><%=emp.getLastName() %></td>
			<td><%=Database.sdf.format(emp.getDob())%></td>
			<td><input style="width: 45%;" type="button" value="edit" onclick="showEditFor(<%=emp.getId() %>)"></td>
		</tr>
		
		<tr id="edit_<%=emp.getId() %>" style="display: none;">
			<td>
				<form method="post" action="updateEmployee" id="<%="form"+emp.getId()%>"></form>
				<input type="text" name="id" value="<%=emp.getId() %>" disabled> 
				<input form="<%="form"+emp.getId()%>" type="hidden" name="id" value="<%=emp.getId() %>">
			</td>
			<td><input form="<%="form"+emp.getId()%>" type="text" name="firstName" value="<%=emp.getFirstName() %>"></td>
			<td><input form="<%="form"+emp.getId()%>" type="text" name="lastName" value="<%=emp.getLastName() %>"></td>
			<td><input form="<%="form"+emp.getId()%>" type="text" name="dob" value="<%=Database.sdf.format(emp.getDob())%>"></td>
			<td>
			    <input style="width: 45%;" type="button" value="cancel" onclick="cancel(<%=emp.getId() %>)">
				<input style="width: 45%;" form="<%="form"+emp.getId()%>" type="submit" value="save">
			</td>
		</tr>
		
		<%
			}
		%>
	</table>
</body>
</html>