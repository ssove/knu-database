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
	
	<h2>Shipping Company</h2>
<%
	String serverIP="localhost";
	String strSID="orcl";
	String portNum="1521";
	String url="jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	String user="home";
	String pass="work";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs1, rs2;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pass);
	
	
	String query="SELECT * FROM SHIPPINGCOMPANY";
	pstmt=conn.prepareStatement(query);
	rs1=pstmt.executeQuery();
	
	query="SELECT * FROM TAKES";
	pstmt=conn.prepareStatement(query);
	rs2=pstmt.executeQuery();
	
	out.println("<table border=\"1\">");	
	
	int a=0,b=0,c=0;
	while(rs2.next()){
		if(rs2.getString(2).equals("Shipa-1")) a++;
		else if(rs2.getString(2).equals("Shipa-2")) b++;
		else if(rs2.getString(2).equals("Shipa-3")) c++;
	}
	%>
	<tr>
	<td>COMPANY NAME</td>
	<td>COMPANY CODE</td>
	<td>ORDER COUNT</td>	
	</tr>
	
	<tr>
		<td>CJ</td>
		<td>shipa-1</td>
		<td><%=a%></td>
	</tr>	
	<tr>
		<td>대한</td>
		<td>shipa-2</td>
		<td><%=b%></td>
	</tr>
	<tr>	
		<td>CU</td>
		<td>shipa-3</td>
		<td><%=c%></td>
	
	</tr>
	
	</table>
	<%	
	pstmt.close();
	conn.close();
	 %>	
	 <A href="ManagerMenu.jsp?">Back To ManagerMenu</A>

</body>
</html>