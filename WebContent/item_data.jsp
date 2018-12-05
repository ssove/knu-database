<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.lang.*, java.text.*, java.sql.*, conn.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Information of Item</title>
</head>
<body>
<%
	String itemCode = request.getParameter("idx");
	String userId = request.getParameter("userId");
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String query;
	ResultSetMetaData rsmd;
	int cnt;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DBConnection.getConnection();
		
		query = "SELECT * FROM ITEM WHERE item_code = " + itemCode;
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		for (int i = 1; i <= cnt; i++) {
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
		out.println("<tr>");
		out.println("<td>" + rs.getString(1) + "</td>");
		out.println("<td>" + rs.getString(2) + "</td>");
		out.println("<td>" + String.valueOf(rs.getInt(3)) + "</td>");
		out.println("<td>" + String.valueOf(rs.getInt(4)) + "</td>");
		out.println("<td>" + rs.getString(5) + "</td>");
		out.println("</tr>");
		out.println("</table> <br /> <br />");
		
%>

	<A href="add_success.jsp?itemCode=<%=itemCode%>&userId=<%=userId%>">Add to bag</A>
<%
	rs.close();
	pstmt.close();
	conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
	
</body>
</html>