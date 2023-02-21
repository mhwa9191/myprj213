<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style>
 table{
	width: 1200px;
	text-align: center;
	border-spacing: 0; 
	border-color: #bcbcbc;
 }

 th{
 	text-align: center;
	vertical-align: middle;
	background-color: #CCCCCC;
 }

 </style>
</head>
<body>
<c:if test="${empty sessionScope.loginid}">
   <a href="../member/loginform">login</a> 
   |  <a href="../member/joinform">join</a>

</c:if>
<c:if test="${not empty sessionScope.loginid}">
    <a href="../member/logout">logout</a> 
<br />
${sessionScope.loginid} 님, 로그인상태입니다.
</c:if>
<c:if test="${sessionScope.loginid ne 'admintest'}">
<div>
	<p>잘못된 접근입니다.</p>
</div>
</c:if>
<c:if test="${sessionScope.loginid eq 'admintest'}">
<div>

	<table width="800" border="1" >
		<thead>
		<tr>
			<td>상품주문번호</td>
			<td>상품구매일자</td>
			<td>주문번호</td>
			<td>구매회원</td>
			<td>상품번호</td>
			<td>구매수량</td>
			<td>처리상태</td>
			<td>배송번호</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>상세주소</td>
			<td>수령자</td>
			<td>수령자번호</td>
			<td>배송</td>
			
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${delivList}" var="list" varStatus="status">			
			<tr>
				<td>${list.om_cntnum}</td>
				<td><fmt:formatDate value="${list.om_date}" pattern="yyyy.MM.dd hh:mm:ss"/></td>
				<td>${list.om_num}</td>
				<td>${list.m_id}</td>
				<td>${list.p_no}</td>
				<td>${list.u_cnt}</td>
				<td>${list.om_state}</td>
				
				<td>${list.orderDeliveryDto.od_num}</td>
				<td>${list.orderDeliveryDto.addr1}</td>
				<td>${list.orderDeliveryDto.addr2}</td>
				<td>${list.orderDeliveryDto.addr3}</td>
				<td>${list.orderDeliveryDto.receipt_name}</td>
				<td>${list.orderDeliveryDto.receipt_phone}</td>	
		
				<td>
				<c:choose>
				<c:when test="${list.om_state eq '결제완료' && list.om_cancle eq 'N'}">
				<form action="../admin3/decision" method="post">
					<input type="hidden" name="od_num" value="${list.orderDeliveryDto.od_num}" />
					<input type="submit" value="주문확정하기"/>
				</form>					
				</c:when>
				<c:when test="${list.om_cancle eq 'Y'}">
					<p>취소요청</p>
				</c:when>
				<c:otherwise>
					<fmt:formatDate value="${list.orderDeliveryDto.od_date}" pattern="yyyy.MM.dd hh:mm:ss"/>
				</c:otherwise>
				</c:choose>					
				</td>
				
			</tr>
			</c:forEach>
		
		</tbody>
	</table>
</div>

totCnt : ${totRowcnt} <br />
현재페이지/토탈페이지 : ${searchVO.page }/ ${searchVO.totPage } <br />

<c:if test="${searchVO.page>1 }">
	<a href="delivList?page=1">[처음]</a>
	<a href="delivList?page=${searchVO.page-1 }">[이전]</a>
</c:if>
<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
	<c:choose>
		<c:when test="${i eq searchVO.page }">
			<span style="color:red; font-weight: bold">
			${i }&nbsp;
			</span>
		</c:when>
		<c:otherwise>
			<a href="delivList?page=${i }" style="text-decoration: none">
			${i }&nbsp;
			</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${searchVO.page<searchVO.totPage }">
	<a href="delivList?page=${searchVO.page+1 }">[다음]</a>
	<a href="delivList?page=${searchVO.totPage }">[마지막]</a>
</c:if>

</c:if>


</body>
</html>