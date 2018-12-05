<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*, conn.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Searching</title>
</head>
<body>
<%
	String userId = request.getParameter("userId");
	String itemName = request.getParameter("keyword");
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
			  + "FROM ITEM "
			  + "WHERE item_name LIKE '%" + itemName + "'%";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		out.println("<table border=\"1\">");
		for (int i = 1; i <= cnt; i++) {
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
	    while(rs.next()) {
%>
	    <tr>
	        <td><%=rs.getString(1)%></td>
	        <td><%=rs.getString(2) %></td>	   
	        <TD>
	        <A href="item_data.jsp?idx=<%=rs.getString(2)%>&userId=<%=userId%>">MORE</A>
	        </TD>
	    </tr>
	    <%
	    }
	    %>
	    </table> 
<% 
	pstmt.close();
	rs.close();
	conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>