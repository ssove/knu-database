<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*, conn.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String query;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DBConnection.getConnection();
		
		query = "SELECT COUNT(*) FROM CUSTOMER "
			  + "WHERE customer_id = " + id
			  + "AND password = " + pw;
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		pstmt.close();
		rs.close();
		conn.close();
		
		// Handles when admin signs in.
		if (id.equals("admin") && pw.equals("admin")) {
			response.sendRedirect("admin_main.html");
		}
		
		if (rs.getString(1).equals("0")) {
			response.sendRedirect("signin_fail.html");
		} else {
			response.sendRedirect("main.html?userId="+id+"");
		} 
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>