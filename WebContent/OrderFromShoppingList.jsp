<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*, conn.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>>KNU: COMP322 - Databases</title>
</head>

<body>
<% 
	
	String userId=request.getParameter("userId");
	String userShoppingBagId=request.getParameter("userShoppingBagId");
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs,rs2;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DBConnection.getConnection();
	
	String query="SELECT Item_name, Supplied, Unit From ITEM i, OWNS o, HAS h WHERE o.Customer_id='"+userId+"' AND o.Shoppingbag_id=h.Shoppingbag AND h.Item_code=i.Item_code";
	pstmt=conn.prepareStatement(query);
	rs=pstmt.executeQuery();
	
	query="SELECT count(*) FROM ORDERLIST";
	pstmt=conn.prepareStatement(query);
	rs2=pstmt.executeQuery();
	String index=null;
	while(rs.next()){
		index=rs.getString(1);
	}
	int i=1;
	while(rs.next()){
		query="INSERT INTO ORDERLIST VALUES('0','0','ORDERID"+ Integer.valueOf(index)+i +"')";
		pstmt=conn.prepareStatement(query);
		pstmt.executeQuery();
		query="INSERT INTO BELONGS_TO VALUES('ORDERID"+Integer.valueOf(index)+i +"','"+userShoppingBagId+"')";
		pstmt.executeQuery();
		query="INSERT INTO TAKES VALUES('ORDERID"+Integer.valueOf(index)+i+"',"+ Math.random()%3+1 +")";
		pstmt.executeQuery();
		i++;
	}
	query="DELETE FROM HAS WHERE Shoppingbag='"+userShoppingBagId+"'";
	response.sendRedirect("ShowShoppingList.jsp");
%>

</body>
</html>