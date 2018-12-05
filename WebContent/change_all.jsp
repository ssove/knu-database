<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*, conn.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
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
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DBConnection.getConnection();
		
		query = "SELECT COUNT(*) FROM CUSTOMER "
			  + "WHERE customer_id = " + id
			  + "AND password = " + pw;
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		if (rs.getString(1).equals("0")) {
			pstmt.close();
			rs.close();
			conn.close();
			response.sendRedirect("change_all_ac_failure.html");
		} else {
			if (type.equals("Retail")) {
				type = "1";
			} else if (type.equals("Wholesale")) {
				type = "2";
			} else {
				type = "3";
			}
			query = "UPDATE CUSTOMER SET address = " + address
				  + ", phone = " + phone
				  + ", sex = " + sex
				  + ", age = " + age
				  + ", name = " + name
				  + ", job = " + job
				  + ", type = " + type;
			pstmt = conn.prepareStatement(query);
			pstmt.executeQuery();
			System.out.println("I customer account has been changed.");
			System.out.println("---(" + id + ", " + pw + ", " + name + ")");
			
			rs.close();
			pstmt.close();
			conn.close();
			pageContext.forward("change_all_success.html");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>