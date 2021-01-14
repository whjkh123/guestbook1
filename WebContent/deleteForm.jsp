<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import="com.javaex.dao.GuestBookDao"%>
<%@ page import="com.javaex.vo.GuestBookVo"%>

<%
	request.setCharacterEncoding("UTF-8");// 요청 시 문자를 'UTF-8' 쳬계로 변환(Encoding)하여 출력 

	int no = Integer.parseInt(request.getParameter("no"));
	
	GuestBookDao gDao = new GuestBookDao();
	GuestBookVo gVo = gDao.getOne(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문록 삭제</title>
</head>
<body>

	<form action="./delete.jsp" method="post">

		비밀번호: <input type="password" name="password">
		<button type="submit">확인</button>
		<input type="hidden" name="no" value="<%=gVo.getNo()%>">

	</form>

	<br>

	<a href="./addList.jsp">메인으로 돌아가기</a>

</body>
</html>