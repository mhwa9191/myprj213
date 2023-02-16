<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/nstyle.css" />
</head>
<body>
<h3>memberupdateform.jsp</h3>
<h1>회원정보수정화면</h1>
<form action="memberupdate" method = "post">
<input type="hidden" name="m_id" value="${memberupdate_id.m_id }" />
<table>
	<tr>
		<td class = "left">아이디</td>
		<td>${memberupdate_id.m_id }</td>
	</tr>
	<tr>
		<td class = "left">비밀번호</td>
		<td><input type="text" name="m_pw" value="${memberupdate_id.m_pw }" /></td>
	</tr>
	<tr>
		<td class = "left">이름</td>
		<td><input type="text" name="m_name" value="${memberupdate_id.m_name }" /></td>
	</tr>
	<tr>
		<td class = "left">전화번호</td>
		<td><input type="text" name="m_tel" value="${memberupdate_id.m_tel }" /></td>
	</tr>
	<tr>
		<td class = "left">닉네임</td>
		<td><input type="text" name="m_name2" value="${memberupdate_id.m_name2 }" /></td>
	</tr>
	<tr>
		<td class = "left">이메일</td>
		<td><input type="text" name="m_email" value="${memberupdate_id.m_email }" /></td>
	</tr>
	<tr>
		<td class = "left">등급</td>
		<td><input type="text" name="m_grade" value="${memberupdate_id.m_grade }" /></td>
	</tr>
	<tr>
		<td class = "left">나이</td>
		<td><input type="text" name="m_age" value="${memberupdate_id.m_age }" /></td>
	</tr>
	<tr>
		<td class = "left">성별</td>
		<td><input type="text" name="m_gender" value="${memberupdate_id.m_gender }" /></td>
	</tr>
	<tr>
		<td class = "left">현금</td>
		<td><input type="text" name="m_cash" value="${memberupdate_id.m_cash }" /></td>
	</tr>
	<tr>
		<td class = "left">프로필사진</td>
		<td><input type="text" name="m_filesrc" value="${memberupdate_id.m_filesrc }" /></td>
		
	</tr>
	<tr>
		<td colspan = "2">
		<input type="submit" value="수정완료" /> &nbsp;&nbsp;
		<a href="memberlist">회원목록으로</a> &nbsp;&nbsp;
		<a href="memberdelete?m_id=${memberupdate_id.m_id }">회원삭제하기</a> &nbsp;&nbsp;
		</td>
	</tr>
</table>
</form>
</body>
</html>