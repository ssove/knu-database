<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KNU: COMP322 - Databases</title>
</head>
<body>

	
	
<%
	String serverIP="localhost";
	String strSID="orcl";
	String portNum="1521";
	String url="jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	String user="home";
	String pass="work";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pass);
	
	String quantity=request.getParameter("quantity");
	String ItemCode=request.getParameter("idx");
	int a=1;
	String query="UPDATE ITEM SET supplied=supplied+"+quantity+" WHERE Item_code='"+ItemCode+"'";
	pstmt=conn.prepareStatement(query);
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();
	response.sendRedirect("ShowStock.jsp");
%>


</body>
</html>