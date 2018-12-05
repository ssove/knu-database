<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*, conn.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Signing up</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String pwCheck = request.getParameter("pwcheck");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String sex = request.getParameter("sex");
	String age = request.getParameter("age");
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	String type = request.getParameter("type");
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String query;
	ResultSetMetaData rsmd;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DBConnection.getConnection();
		
		// Null check for essential information.
		if (id.equals("") || pw.equals("") || 
				address.equals("") || phone.equals("")) {
			response.sendRedirect("signup_null.html");
		}
		// End of null check.
		
		// Handles when password check is failed.
		if (!pw.equals(pwCheck)) {
			response.sendRedirect("signup_pw_failure.html");
		}
		
		if (type.equals("Retail")) {
			type = "1";
		} else if (type.equals("Wholesale")) {
			type = "2";
		} else {
			type = "3";
		}
		
		// Duplication check for id.
		query = "SELECT COUNT(*) FROM CUSTOMER "
			  + "WHERE customer_id = " + id;
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		if (!rs.getString(1).equals("0")) {
			System.out.println(id + " is already in database.");
			response.sendRedirect("signup_dup.html");
		}
		// End of duplication check.
		
		query = "INSERT INTO CUSTOMER VALUES "
			  + "(" + name + ", " + address + ", "
			  + phone + ", " + id + ", " + pw + ", "
			  + age + ", " + sex + ", " + job + ", "
			  + type + ")";
		pstmt = conn.prepareStatement(query);
		pstmt.executeQuery();
		System.out.println("I customer account has been created.");
		System.out.println("---(" + id + ", " + pw + ", " + name + ")");
		
		rs.close();
		pstmt.close();
		conn.close();
		pageContext.forward("signup_success.html");
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>