<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.lang.*, java.text.*, java.sql.*, conn.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Success</title>
</head>
<body>
<%
	String userId = request.getParameter("userId");
	String itemCode = request.getParameter("itemCode");
	String sbId;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String query;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DBConnection.getConnection();
		
		query = "SELECT shoppingbagid FROM OWNS "
			  + "WHERE customerid = " + userId;
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		sbId = rs.getString(1);
		
		query = "INSERT INTO HAS VALUES ("
			  + itemCode + ", " + sbId + ")";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		pstmt.close();
		rs.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
	<A href="main.jsp?userId=<%=userId%>">돌아가기</A>
</body>
</html>