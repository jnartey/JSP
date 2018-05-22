<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Page</title>
<style>
	body {
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	
	form#reg-form {
		position: absolute;
 		top: 50%;
  		left: 50%;
  		transform: translate(-50%, -50%);
		width:400px;
		height:auto;
		padding:0.5rem 2rem 2rem;
		background:#e5e5e5;
		border:3px solid #f9f9f9;		
	}
	
	label {
		display:inline-block;
		margin-bottom:0.5rem;
		width:30%;
		vertical-align:middle;
	}
	
	form#reg-form input[type="text"], form#reg-form input[type="password"] {
		display:inline-block;
		width:65%;
		height:2.2rem;
		border:1px solid #cccccc;
		margin-bottom:1rem;
		padding:0.5rem;
		box-sizing:border-box;
	}
	
	.other-inputs {
		display:inline-block;
		width:65%;
		vertical-align:middle;
		margin-bottom:1rem;
	}
	
	label.sp {
		vertical-align:top;
	}
	
	.other-inputs label {
		width:auto;
	}
	
	.error {
		color:red;
	}
</style>
</head>
<%
	String message = null;

	if(request.getParameter("message") != null){
		message = request.getParameter("message");
	}
%>
<body>
	<form id="reg-form" action="details.jsp" method="post">
		<%
			 if(message != null){
				out.print("<h6 class=\"error\">" + message + "</h6>");
			} 
		%>
		<h2>Registration</h2>
		<label for="firstname">First Name</label>
		<input type="text" id="firstname" name="firstname" />
		<label for="lastname">Last Name</label>
		<input type="text" id="lastname" name="lastname" />
		<label for="password">Password</label>
		<input type="password" id="password" name="password" />
		<label for="username">User Name</label>
		<input type="text" id="username" name="username" />
		<label class="sp" for="gender">Gender</label>
		<div class="other-inputs">
			<label><input type="radio" name="gender" value="Male" /> <span>Male</span></label>
			<label><input type="radio" name="gender" value="Female" /> <span>Female</span></label>
		</div>
		<label class="sp" for="hobbies">Hobbies</label>
		<div class="other-inputs">
			<label><input type="checkbox" name="hobbies" value="Dance" /> <span>Dance</span></label>
			<label><input type="checkbox" name="hobbies" value="Music" /> <span>Music</span></label>
			<label><input type="checkbox" name="hobbies" value="Sports" /> <span>Sports</span></label>
			<label><input type="checkbox" name="hobbies" value="Painting" /> <span>Painting</span></label>
		</div>
		<label for="country">Country</label>
		<select name="country">
			<option value="">--Select country--</option>
			<option value="USA">USA</option>
			<option value="Ghana">Ghana</option>
		</select>
		<input type="submit" id="login" name="login" value="Register" />
	</form>
</body>
</html>