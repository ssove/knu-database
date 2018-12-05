<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*,java.sql.*, conn.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KNU: COMP322 - Databases</title>
</head>
<body>

	
	
<%
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DBConnection.getConnection();
	
	String quantity=request.getParameter("quantity");
	String ItemCode=request.getParameter("idx");
	int a=1;
	String query="UPDATE ITEM SET Stock=Stock+"+quantity+" WHERE Item_code='"+ItemCode+"'";
	pstmt=conn.prepareStatement(query);
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();
	response.sendRedirect("ShowStock.jsp");
%>


</body>
</html>