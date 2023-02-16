<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>memberlistform.jsp</h3>
<h1>회원목록</h1>
<a href="adminpage">관리자페이지로</a>
<table width="500" border="1">
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>닉네임</td>
		<td>이메일</td>
		<td>등급</td>
		<td>나이</td>
		<td>성별</td>
		<td>현금</td>
		<!-- <td>프로필사진</td> -->
	</tr>
<c:forEach items="${member }" var="dto">  
	<tr>
		<td><a href="memberupdateform?m_id=${dto.m_id }">${dto.m_id }</a></td>
		<td>${dto.m_pw }</td>
		<td>${dto.m_name }</td>
		<td>${dto.m_tel }</td>
		<td>${dto.m_name2 }</td>
		<td>${dto.m_email }</td>
		<td>${dto.m_grade }</td>
		<td>${dto.m_age }</td>
		<td>${dto.m_gender }</td>
		<td>${dto.m_cash }</td>
		<%-- <td>${dto.m_filesrc }</td> --%>
	</tr>
</c:forEach>	
</table>

</body>
</html>