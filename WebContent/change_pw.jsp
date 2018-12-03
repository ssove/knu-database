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
	String pw = request.getParameter("pw");
	String cpw = request.getParameter("cpw");
	String cpwCheck = request.getParameter("cpw_check");
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String query;
	
	try {
		if (!cpw.equals(cpwCheck)) {
			response.sendRedirect("change_pw_cpw_failure.html");
		}
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
			response.sendRedirect("change_pw_ac_failure.html");
		} else {
			query = "UPDATE CUSTOMER SET password = " + cpw
				  + "WHERE customer_id = " + id;
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			pstmt.close();
			rs.close();
			conn.close();
			response.sendRedirect("change_pw_success.html");
		}
	} catch (SQLException sqle) {
		sqle.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>