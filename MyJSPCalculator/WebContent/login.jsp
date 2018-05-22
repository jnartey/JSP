<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<style>
	body {
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	
	form#login-form {
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
		display:block;
		margin-bottom:0.5rem;
	}
	
	form#login-form input[type="text"], form#login-form input[type="password"] {
		display:block;
		width:100%;
		height:2.2rem;
		border:1px solid #cccccc;
		margin-bottom:1rem;
		padding:0.5rem;
		box-sizing:border-box;
	}
	
	.error {
		color:red;
	}
</style>
</head>
<%
		String message = null;
	
		if(request.getParameter("login") != null){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			if("tom".equals(username) && "jerry".equals(password)){
				response.sendRedirect("success.jsp");
			}else{
				message = "Username and Password do not match";
			}
		}
	%>
<body>
	<form id="login-form" action="" method="post">
		<%
			if(message != null){
				out.print("<h6 class=\"error\">" + message + "</h6>");
			}
		%>
		<h2>Login</h2>
		<label for="username">Username</label>
		<input type="text" id="username" name="username" />
		<label for="password">Password</label>
		<input type="password" id="password" name="password" />
		<input type="submit" id="login" name="login" value="Login" />
	</form>
</body>
</html>