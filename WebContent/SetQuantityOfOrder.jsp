<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<FORM action="IncreaseStock.jsp" method="post">
	ITEMCODE=<INPUT type="text" name="idx" value="<%=request.getParameter("idx")%>"><BR>
	QUANTITY=<INPUT type="text" name="quantity" maxlength="12" size="12"><BR>
	
	<INPUT type="submit" value="SET">

</FORM>

</body>
</html>