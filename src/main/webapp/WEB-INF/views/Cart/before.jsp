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
<h3>before</h3>
<table width="500" border="1">
	<tr>
		<td>상품번호</td>
		<td>이름</td>
		<td>가격</td>
		<td>갯수</td>
		<td>컬러</td>
		<td>사이즈</td>
		<td>첨부파일</td>
	</tr>
	<c:forEach items="${list }" var="bto">
	<tr>
		<td>${bto.p_no }</td>
		<td>${bto.p_name }</td>
		<td>
			${bto.p_price }
<%-- 			<a href="contentview?p_no=${bto.p_no }">${bto.btitle }</a> --%>
		</td>
		<td>${bto.p_cnt }</td>
		<td>${bto.p_color }</td>
		<td>${bto.p_size }</td>
		<td><a href="detaillist?p_no=${bto.p_no }">${bto.p_filesrc }</a></td>
	</tr>
	</c:forEach>
	
</table>
</body>
</html>