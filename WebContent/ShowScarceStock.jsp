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
	
	
	String userId="id0";
	String query="SELECT Item_name, Item_code, Supplied FROM ITEM WHERE Supplied<=20";
	pstmt=conn.prepareStatement(query);
	rs=pstmt.executeQuery();

	
	out.println("<table border=\"1\">");	
	
	%>
	<tr>
	<td>Item_name</td>
	<td>Item_code</td>
	<td>Supplied</td>
	<TD>비고</TD>
	
	</tr>
	<%
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
	
	<TD>
		<A href="SetQuantityOfOrder.jsp?idx=<%=rs.getString(2)%>">INCREASE</A>
	</TD>
	</tr>
	<%
	}
	%></table>
	
	<%
		rs.close();
		pstmt.close();
		conn.close();		
	%>
	
</body>
</html>