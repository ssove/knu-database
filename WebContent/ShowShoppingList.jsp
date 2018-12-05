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
	
	<h2>Lab</h2>
	<h4>Your ShoppingBag</h4>
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
	
	String userId=request.getParameter("userId");
	String query="SELECT Item_name, Supplied, Unit From ITEM i, OWNS o, HAS h WHERE o.Customer_id='"+userId+"' AND o.Shoppingbag_id=h.Shoppingbag AND h.Item_code=i.Item_code";
	pstmt=conn.prepareStatement(query);
	rs=pstmt.executeQuery();
	
	out.println("<table border=\"1\">");
	
	ResultSetMetaData rsmd=rs.getMetaData();
	int cnt=rsmd.getColumnCount();
	for(int i=1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	
%>
	<A href="OrderFromShoppingList.jsp?userId<%=userId%>">ORDER</A>
	
	
	
	<h4>Your Ordered List</h4>
	

<%
	query="SELECT Delivered, Prepared, ol.Order_id From ORDERLIST ol, OWNS o, BELONGS_TO b WHERE o.Customer_id='"+userId+"' AND o.Shoppingbag_id=b.Shoppingbag_id AND b.Order_id=ol.Order_id";
	pstmt=conn.prepareStatement(query);
	rs=pstmt.executeQuery();
	
	out.println("<table border=\"1\">");
	rsmd=rs.getMetaData();
	cnt=rsmd.getColumnCount();
	for(int i=1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	pstmt.close();
	conn.close();
%> 

</body>
</html>