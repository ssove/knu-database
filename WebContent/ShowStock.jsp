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
	
	<h2>Show Stock</h2>
	
<%
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DBConnection.getConnection();
	
	
	String query="SELECT Item_name, Item_code, Supplied FROM ITEM";
	pstmt=conn.prepareStatement(query);
	rs=pstmt.executeQuery();

	out.println("<table border=\"1\">");	
	ResultSetMetaData rsmd=rs.getMetaData();
	int cnt=rsmd.getColumnCount();
	for(int i=1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
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
		<td><%=rs.getString(1 )%></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
	
	<TD>
		<A href="SetQuantityOfOrder.jsp?idx=<%=rs.getString(2)%>">INCREASE</A>
	</TD>
	</tr>
	<%
	}
	%>
	</table>
	
	<%
		rs.close();
		pstmt.close();
		conn.close();	
	%>
	
	<A href="ShowScarceStock.jsp">ShowScarceStock</A>
	
	<A href="ManagerMenu.jsp?">Back To ManagerMenu</A>
	
	
</body>
</html>