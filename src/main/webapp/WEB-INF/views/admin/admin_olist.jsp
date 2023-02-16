<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 링크 -->
<link rel="stylesheet" href="resources/css/admin_oliststyle.css" />
 <style>
 .page{
	 text-decoration: none;
	 color: black;
 }
 .page:hover{
 	color: gray;
    font-weight: bold;
 }
 .om_cntnum{
	 color: black;
	 text-decoration: none;
 }
 .om_cntnum:hover{
 	color: gray;
 	font-weight: bold;

 }

 </style>

<!-- header section -->
<%@include file="admin_header.jsp" %>

</head>

<body>

<%-- <aside>
<%@include file="admin_sidebar.jsp" %>
</aside> --%>

<div class="jumbotron text-center">
	<h1 class="line-h1" align="center" 
>
	주문관리 현황 리스트</h1>
</div>
<br /><br />


<!-- 주문취소 목록 검색 기능 : 시작날짜~종료날짜+취소요청Y 기준 -->
<form action="search_olist" method="post">
	<div class="container1" align="center">
		<label>
			검색시작일 : 
			<input type="date" name="som_cdate" required pattern="\d{4}-\d{2}-\d{2}" value="som_cdate" />
		</label>
		<label>&nbsp;
			검색종료일 : 
 		<input type="date" name="eom_cdate" required pattern="\d{4}-\d{2}-\d{2}" value="eom_cdate" />
		</label>&nbsp;&nbsp;
	        <label>주문취소요청여부</label>
	    	<input type="text" name="om_cancle" value="${resk }" placeholder="검색어를 입력해주세요"/> 
		    <input type="submit" value="조회"/>		
	</div>
</form>
<br />


<div class="container2" align="center">
	<table border="1" >
		<tr style="vertical-align: middle;" >
			<th class="th1" width="10%">상품주문번호</th>
			<th class="th1" width="13%">주문번호</th>
			<th class="th1" width="8%">상품번호</th>
			<th class="th1" width="6%">주문수량</th>			
			<th class="th1" width="6%">아이디</th>
			<th class="th1" width="10%">주문일자</th>
			<th class="th1" width="8%">결제형태</th>
			<th class="th1" width="10%">총액</th>
			<th class="th1" width="10%">처리상태</th>
			<th class="th1" width="6%">주문취소요청여부</th>
			<th class="th1" width="10%">주문취소일자</th>
		</tr>
		
		<c:forEach items="${olist }" var="dto">
		<tr style="text-align: center;">
<!-- 상품주문번호 -->       <td><a href="admin_contentview?om_cntnum=${dto.om_cntnum}" class="om_cntnum">
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


<br /><br />
<!-- 페이지 처리 -->
	<div class="p" align="center">
	<c:if test="${searchVo.page > 1 }">
		<a href="admin_olist?page=1" class="page">[처음]</a>
		<a href="admin_olist?page=${searchVo.page-1 }" class="page">[이전]</a>
	</c:if>
	
	<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }" var="i">
		<c:choose>
			<c:when test="${i eq searchVo.page }">
				<span style="color: gray; font-weight:bold">${i }&nbsp;</span>
			</c:when>
			<c:otherwise>
				<a href="admin_olist?page=${i }" class="page">${i }&nbsp;</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:if test="${searchVo.page < searchVo.totPage }">
		<a href="admin_olist?page=${searchVo.page+1 }" class="page">[다음]</a>
		<a href="admin_olist?page=${searchVo.totPage }" class="page">[마지막]</a>
	</c:if>
	</div>
	<br /><br /><br /><br />

<!-- footer section -->
<footer>
<%@ include file="admin_footer.jsp"%>
</footer>
</body>
</html>
