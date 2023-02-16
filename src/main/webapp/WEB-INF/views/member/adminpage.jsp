<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>adminpage.jsp</h3>
<h1>관리자페이지</h1>
<a href="main">메인페이지로</a>
<input type="button" value="회원목록" onclick="location.href='memberlist'" />
<input type="button" value="회원주문목록" onclick="location.href='../admin_olist'" />
<input type="button" value="큐앤에이게시판" onclick="location.href='adminqnalist'" />
</body>
</html>