<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- header section -->
<%@include file="admin_header.jsp" %>
<link rel="stylesheet" href="resources/css/search_oliststyle.css" />
<style>
.om_cntnum{
	 color: black;
	 text-decoration: none;
}
.om_cntnum:hover{
 	color: gray;
 	font-weight: bold;
 }
</style>
</head>

<body>
<h3 class="line-h3" align="center" 
style="margin-top: -20; margin-right: 50px; padding: 52px;">
관리자 주문현황 검색</h3>
<br />

	<div class="scontainer" align="center"  >
	<table border="1">
		<tr bgcolor="#CCCCCC">
			<th class="th1"  width="10%">상품주문번호</th>
			<th class="th1"  width="13%">주문번호</th>
			<th class="th1"  width="8%">상품번호</th>
			<th class="th1"  width="6%">주문수량</th>			
			<th class="th1"  width="6%">아이디</th>
			<th class="th1"  width="10%">주문일자</th>
			<th class="th1"  width="8%">결제형태</th>
			<th class="th1"  width="10%">총액</th>
			<th class="th1"  width="10%">처리상태</th>
			<th class="th1"  width="6%">주문취소요청여부</th>
			<th class="th1"  width="10%">주문취소일자</th>
		</tr>
		
		<c:forEach items="${slist }" var="dto">
		<tr style="text-align: center;">
<!-- 상품주문번호 -->       <td><a href="admin_contentview?om_cntnum=${dto.om_cntnum}"
								class="om_cntnum">
									${dto.om_cntnum }</a></td> 
<!-- 주문번호 -->		    <td>${dto.om_num }</td>
<!-- 상품번호 -->			<td>${dto.p_no }</td>
<!-- 주문수량 -->			<td>${dto.u_cnt }</td>			
<!-- 아이디 -->			<td>${dto.m_id }</td>
<!-- 주문일자 -->			<td><fmt:formatDate value="${dto.om_date }" pattern="yyyy-MM-dd"/></td>
<!-- 결제형태 -->			<td>${dto.om_pay }</td>
<!-- 총액 -->			    <td><fmt:formatNumber type="currency" value="${dto.p_price }" /></td>
<!-- 처리상태 -->			<td>${dto.om_state }</td>
<!-- 주문취소요청여부 -->		<td>${dto.om_cancle }</td>
<!-- 주문취소일자 -->		<td><fmt:formatDate value="${dto.om_cdate }" pattern="yyyy-MM-dd"/></td>
		</tr>	
		</c:forEach>
	</table>	
	
	</div>
</body>
<br /><br /><br /><br />
</html>

<!-- footer section -->
<%@ include file="admin_footer.jsp" %>
