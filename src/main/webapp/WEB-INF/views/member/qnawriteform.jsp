<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String loginid = (String)session.getAttribute("loginid"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>qnawriteform.jsp</h3>
<h1>문의하기화면</h1>
<form action="qnawrite">
<table>
	<tr>
		<td class = "left">제목</td>
		<td><input type="text" name="q_mtitle" /></td>
	</tr>
	<tr>
		<td class = "left">내용</td>
		<td><textarea name="q_mcontent"></textarea></td>
	</tr>
	<tr>
		<td class = "left">아이디</td>
		<td><input type="text" name="q_mid" value="<%=session.getAttribute("loginid") %>" readonly /></td>
	</tr>
	<tr>
		<td colspan = "2">
		<input type="submit" value="문의하기" /> &nbsp;&nbsp;
		<a href="qnalist">목록</a> &nbsp;&nbsp;
		<a href="#">삭제</a> &nbsp;&nbsp;
		<a href="#">답변폼으로</a> &nbsp;&nbsp;
		</td>
	</tr>
</table>
</form>
</body>
</html>