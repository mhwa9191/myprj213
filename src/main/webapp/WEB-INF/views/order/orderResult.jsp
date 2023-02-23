<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Nanum+Gothic&family=Noto+Sans+KR:wght@900&family=UnifrakturCook&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.1.min.js"></script>
<script src="../resources/js/jquery.bpopup.min.js"></script>
<style>
.ordResult{
	border: 1px solid #ccc;
	margin: 30px auto;
	padding: 15px;
	width: 300px;
	color: #141414;
	text-align: center;
}

.replaceLink{
	background-color: #141414;
	color: #fff;
	border: 1px solid #141414;
	margin: 20px 20px 10px 20px;
}

.btn-go{
	margin: 10px auto;
	text-align: center;
}
.btn-go-pdtlist{
	background-color: #ccc;
	border: 1px solid #ccc;
	border-radius: 5px;
	color: #3b3b3b;
}
</style>
</head>
<body>
<div class="ordResult">
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
<div class="btn-go">
<button class="btn-go-pdtlist" onclick="location.href='../product/productList'">상품목록보기</button>
</div>

<script>
$('.replaceLink').click(function(){
	var link='../order/myOrderList';
	location.replace(link);
});
</script>

</body>
</html>