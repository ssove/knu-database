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
	
	
	String userId="id0";
	String query="SELECT Item_name, Item_code, Supplied FROM ITEM WHERE Supplied<=20";
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