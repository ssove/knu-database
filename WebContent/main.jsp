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
	<input type="button" value="비밀번호 수정" onclick="location.href='change_pw.html'">
	<br />
	<input type="button" value="회원정보 수정" onclick="location.href='change_all.html'">
	<br />
	<input type="button" value="장바구니 확인 & 주문" onclick="location.href='ShowShoppingList.jsp'?userId=<%=userId%>">
	<br /> <br /> <br />
	<form action="category_search.jsp" method="POST">
		Category : <select name="category">
				<option value="ca-1" selected>철물원예-철물-곡괭이</option>
				<option value="ca-2">철물원예-철물-도어록</option>
				<option value="ca-3">철물원예-철물-못</option>
				<option value="ca-4">철물원예-생활,청소-건전지</option>
				<option value="ca-5">철물원예-생활,청소-과도</option>
				<option value="ca-6">철물원예-생활,청소-휴지통</option>
				<option value="ca-7">산업용품-화학제품-도어록</option>
				<option value="ca-8">산업용품-화학제품-구리스</option>
				<option value="ca-9">산업용품-화학제품-보수제</option>
				<option value="ca-10">산업용품-전기기자재-PVC볼트</option>
				<option value="ca-11">산업용품-전기기자재-누전차단기</option>
				<option value="ca-12">산업용품-전기기자재-배선차단기</option>
				<option value="ca-13">안전용품-안면보호구-고글</option>
				<option value="ca-14">안전용품-안면보호구-방음보호구</option>
				<option value="ca-15">안전용품-안면보호구-보안경</option>
				<option value="ca-16">안전용품-안전장갑-PVC장갑</option>
				<option value="ca-17">안전용품-안전장갑-고무장갑</option>
				<option value="ca-18">안전용품-안전장갑-내화학용장갑</option>
		</select>
		<input type="submit" value="확인"> <br />
	</form>
</body>
</html>