<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import="com.javaex.dao.GuestBookDao"%>
<%@ page import="com.javaex.vo.GuestBookVo"%>

<%
	request.setCharacterEncoding("UTF-8");// 요청 시 문자를 'UTF-8' 쳬계로 변환(Encoding)하여 출력 

	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	
	GuestBookVo gVo = new GuestBookVo(name, password, content);
	GuestBookDao gDao = new GuestBookDao();
	gDao.dbIsrt(gVo);
	
	response.sendRedirect("./addList.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문록 등록</title>
</head>
<body>

</body>
</html>