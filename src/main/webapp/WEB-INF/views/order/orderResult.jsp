<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.1.min.js"></script>
<script src="../resources/js/jquery.bpopup.min.js"></script>
</head>
<body>

<div>
	<c:choose>
		<c:when test="${orderResult eq '0'}">
		<h2>주문실패</h2>
		<c:out value="회원님의 캐시를 확인해주세요"></c:out>
	</c:when>
	<c:when test="${orderResult eq '1'}">
		<h2>주문실패</h2>
		<c:out value="품절입니다."></c:out>
	</c:when>
	<c:when test="${orderResult eq '2'}">
		<c:out value="새로고침되었습니다."></c:out>
	</c:when>
	<c:otherwise>
		<span>주문성공</span>
		<p>주문번호</p>
		<c:out value="${checkOmnum}"></c:out> <br />
		<button class="replaceLink">나의주문내역확인하기</button>
	</c:otherwise>
	</c:choose>
</div>

<button onclick="location.href='../product/productList'">상품목록보기</button>

<script>
$('.replaceLink').click(function(){
	var link='../order/myOrderList';
	location.replace(link);
});
</script>

</body>
</html>