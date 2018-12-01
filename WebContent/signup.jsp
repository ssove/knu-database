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
	String strSID = "orcl";
	String portNum = "1521";
	String url = "jdbc:oracle:thin:@" + "localhost:" + portNum + ":" + strSID;
	String user = "knu";
	String pass = "comp322";
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
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	
	query = "INSERT INTO CUSTOMER "
		  + "(" + name + ", " + address + ", "
		  + phone + ", " + id + ", " + pw + ", "
		  + age + ", " + sex + ", " + occupation + ", "
		  + type + ")";
	System.out.println("customer account has been created.");
	System.out.println(id + ", " + pw + ", " + name);
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
%>
</body>
	<h3>회원가입이 완료되었습니다.</h3>
	<h3>가입된 아이디로 로그인해주세요.</h3>
	<input type="button" value="확인" onclick="location.href='signin.html'">
</html>