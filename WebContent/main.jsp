<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*, conn.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
	String userId=request.getParameter("userId");
	%>
	<input type="button" value="��й�ȣ ����" onclick="location.href='change_pw.html'">
	<br />
	<input type="button" value="ȸ������ ����" onclick="location.href='change_all.html'">
	<br />
	<input type="button" value="��ٱ��� Ȯ�� & �ֹ�" onclick="location.href='ShowShoppingList.jsp'?userId=<%=userId%>">
	<br /> <br /> <br />
	<form action="category_search.jsp" method="POST">
		Category : <select name="category">
				<option value="ca-1" selected>ö������-ö��-���</option>
				<option value="ca-2">ö������-ö��-�����</option>
				<option value="ca-3">ö������-ö��-��</option>
				<option value="ca-4">ö������-��Ȱ,û��-������</option>
				<option value="ca-5">ö������-��Ȱ,û��-����</option>
				<option value="ca-6">ö������-��Ȱ,û��-������</option>
				<option value="ca-7">�����ǰ-ȭ����ǰ-�����</option>
				<option value="ca-8">�����ǰ-ȭ����ǰ-������</option>
				<option value="ca-9">�����ǰ-ȭ����ǰ-������</option>
				<option value="ca-10">�����ǰ-���������-PVC��Ʈ</option>
				<option value="ca-11">�����ǰ-���������-�������ܱ�</option>
				<option value="ca-12">�����ǰ-���������-�輱���ܱ�</option>
				<option value="ca-13">������ǰ-�ȸ麸ȣ��-���</option>
				<option value="ca-14">������ǰ-�ȸ麸ȣ��-������ȣ��</option>
				<option value="ca-15">������ǰ-�ȸ麸ȣ��-���Ȱ�</option>
				<option value="ca-16">������ǰ-�����尩-PVC�尩</option>
				<option value="ca-17">������ǰ-�����尩-���尩</option>
				<option value="ca-18">������ǰ-�����尩-��ȭ�п��尩</option>
		</select>
		<input type="submit" value="Ȯ��"> <br />
	</form>
</body>
</html>