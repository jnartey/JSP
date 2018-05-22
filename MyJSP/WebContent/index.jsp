<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Page Counter</title>
</head>
<%-- Declaration tag --%>
<%! 
	int page_counter = 0; 
	void incrementCounter() {
		page_counter++;
	}
%>
<body>
	<h1>Welcome to page counter</h1>
	<%-- Expression tag --%>
	<%= "This page has been viewed " + page_counter + " times" %>
	
	<%-- Scriplet tag --%>
	<% incrementCounter(); %>
</body>
</html>