<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ page import="com.javaex.dao.GuestBookDao"%>
<%@ page import="com.javaex.vo.GuestBookVo"%>

<%
	request.setCharacterEncoding("UTF-8");// 요청 시 문자를 'UTF-8' 쳬계로 변환(Encoding)하여 출력 

	int no = Integer.parseInt(request.getParameter("no"));// #1 삭제할 사용자(번호)를 지정
	String password = request.getParameter("password");// #2 비밀번호가 일치하면 delete
	
	GuestBookDao gDao = new GuestBookDao();
	GuestBookVo gVo = new GuestBookVo(no, password);
	
	// gDao.dbDle >> count = pstmt.executeUpdate(); >> 데이터 처리 성공횟수를 'count'에 저장 >> 즉, 삭제를 성공했을 시 count++(1) 실패했을 시 count(0)
	// int cnt = 데이터 처리(삭제) 결과(1 or 0)
	int cnt = gDao.dbDle(gVo);
	// 데이터 처리(삭제)를 성공했을 경우 int cnt = 1(gDao.dbDle = 1)
	// Redirect 실행(addList 페이지로 이동)
	if (cnt == 1) {
		response.sendRedirect("./addList.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문록 삭제</title>
</head>
<body>

	<%
		// 데이터 처리(삭제)를 실패했을 경우 int cnt = 0(gDao.dbDle = 0)
		// 화면에 현재 상태와 비밀번호 재입력을 위한 장치 마련 >> 'deleteForm'으로 돌아가기
		if (cnt == 0) {
		%>
		<p>비밀번호 오류</p>
		<a href="./addList.jsp">메인으로 돌아가기</a>
		<a href="./deleteForm.jsp?no=<%=gVo.getNo()%>">비밀번호 재입력</a>
		<%
		}
	%>

</body>
</html>
