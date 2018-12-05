<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*, conn.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Category search</title>
</head>
<body>
<%
	String categoryCode = request.getParameter("category");
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String query;
	ResultSetMetaData rsmd;
	int cnt;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DBConnection.getConnection();
		
		out.println("<input type=\"button\" value=\"뒤로가기\" "
				+ "onclick = \"location.href=\'main.html\'\">");
		out.println("<br /> <br />");
		
		query = "SELECT item_name, item_code "
			  + "FROM ITEM, INCLUDES_IN "
			  + "WHERE item_code = itemcode "
			  + "AND Categorycode = " + categoryCode;
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		out.println("<table border=\"1\">");
		for (int i = 1; i <= cnt; i++) {
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
	    while(rs.next()){
%>
	   <tr>
	      <td><%=rs.getString(1)%></td>
	      <td><%=rs.getString(2) %></td>	   
	   <TD>
	      <A href="SetQuantityOfOrder.jsp?idx=<%=rs.getString(2)%>">INCREASE</A>
	   </TD>
	   </tr>
	   <%
	   }
	   %>
	   </table> 
<% 
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>