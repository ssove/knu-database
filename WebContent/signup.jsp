<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Signing up</title>
</head>
<body>
<%
	String portNum = "3306";
	String url = "jdbc:mysql:" + "localhost:" + portNum;
	String user = "phase3";
	String pass = "3";
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String sex = request.getParameter("sex");
	String age = request.getParameter("age");
	String name = request.getParameter("name");
	String occupation = request.getParameter("occupation");
	String type = request.getParameter("type");
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String query;
	ResultSetMetaData rsmd;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pass);
		
		// Null check for essential information.
		if (id.equals("") || pw.equals("") || 
				address.equals("") || phone.equals("")) {
			pageContext.forward("signup_null.html");
		}
		// End of null check.
		
		// Handles when admin signs in.
		if (id.equals("admin") && pw.equals("admin")) {
			 response.sendRedirect("admin_main.html");
		}
		
		// Duplication check for id.
		query = "SELECT customer_id FROM CUSTOMER "
			  + "WHERE customer_id = " + id;
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			System.out.println(id + " is already in database.");
			pageContext.forward("signup_dup.html");
		}
		// End of duplication check.
		
		query = "INSERT INTO CUSTOMER VALUES "
			  + "(" + name + ", " + address + ", "
			  + phone + ", " + id + ", " + pw + ", "
			  + age + ", " + sex + ", " + occupation + ", "
			  + type + ")";
		pstmt = conn.prepareStatement(query);
		pstmt.executeQuery();
		System.out.println("I customer account has been created.");
		System.out.println("---(" + id + ", " + pw + ", " + name + ")");
		
		rs.close();
		pstmt.close();
		conn.close();
		pageContext.forward("signup_complete.html");
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>