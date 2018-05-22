<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Details Page</title>
<style>
	body {
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	
	table {
		border:1px solid #cccccc;
		border-collapse: collapse;
	}
	
	table tr td {
		border:1px solid #cccccc;
		padding:0.5rem;
	}
	
	table tr:nth-child(even) {
		background:#cccccc;
	}
</style>
</head>
<%
	String message = "";
	String firstname = request.getParameter("firstname").trim();
	String lastname = request.getParameter("lastname").trim();
	String password = request.getParameter("password").trim();
	String username = request.getParameter("username").trim();
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobbies");
	String country = request.getParameter("country");
	String arrayHobbies = "";
		
	if(firstname.isEmpty()) {
		message = "First Name+";
	}
	
	if(lastname.isEmpty()) {
		message += "Last Name+";
	}
	
	if(password.isEmpty()) {
		message += "Password+";
	}
	
	if(username.isEmpty()) {
		message += "User Name+";
	}
	
	if(gender == null) {
		message += "Gender+";
	}
	
	if(hobbies == null) {
		message += "Hobbies+";
	}else{
		for(String hobby : hobbies) {
			if(hobby != null){
				arrayHobbies += hobby + ", ";
			}
		}
	}
	
	if(country == null) {
		message += "Country";
	}
	
	if(message != ""){
		String temp = "";
		
		for(int i = 0; i < message.length(); i++){
			if(message.charAt(i) == '+'){
				temp += ", ";
			}else{
				temp += message.charAt(i);
			}
				
		}
		
		message = temp;
	}
%>
<body>
	<% if(!firstname.isEmpty() && !lastname.isEmpty() && !password.isEmpty() && !username.isEmpty() && gender != null && hobbies != null && country != null){ %>
		<h1>Registration Details</h1>
		<table>
			<tbody>
				<tr>
					<td>First Name</td>
					<td><%= firstname %></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><%= lastname %></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><%= password %></td>
				</tr>
				<tr>
					<td>User Name</td>
					<td><%= username %></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><%= gender %></td>
				</tr>
				<tr>
					<td>Hobbies</td>
					<td><%= arrayHobbies %></td>
				</tr>
				<tr>
					<td>Country</td>
					<td><%= country %></td>
				</tr>
			</tbody>
		</table>
	<%  }else{
			message += " cannot be null";
			response.sendRedirect("registration.jsp?message=" + message);
	   } 
	%>
</body>
</html>