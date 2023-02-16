<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>detaillist</h3>
<table width="500" border="1">
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>가격</td>
		<td>갯수</td>
		<td>컬러</td>
		<td>사이즈</td>
		<td>첨부파일</td>
	</tr>
	<tr>
		<td>${list.p_no }</td>
		<td>${list.p_name }</td>
		<td>
			${list.p_price }
		</td>
		<td>${list.p_cnt }</td>
		<td>${list.p_color }</td>
		<td>${list.p_size }</td>
		<td>${list.p_filesrc }</td>
	</tr>
	
	<tr>
		<td colspan="5">
				<a href="insertCart?p_no=${list.p_no }">장바구니넣기</a>
				<a href="Cartlist?p_no=${list.p_no }">장바구니</a>
				
		</td>
	</tr>
</table>
</body>
</html>