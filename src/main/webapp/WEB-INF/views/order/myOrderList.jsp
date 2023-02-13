<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty sessionScope.loginid }">
   <a href="../loginform">login</a> 
   |  <a href="">join</a>

</c:if>
 <c:if test="${not empty sessionScope.loginid }">
    <a href="../logout">logout</a> 
 <br />
 ${sessionScope.loginid } 님, 로그인상태입니다 ദ്ദി*ˊᗜˋ*)
 </c:if>
 
 
 <div>
	<p class="go-productList" style="color: #336666;">
	<a href="../product/productList">상품둘러보기</a>
	</p>
 </div>
 <div>
 	<p>회원님의 현재 보유 캐시 : ${myList.m_cash }</p>
 </div>
 

 <h3>나의주문내역 </h3>
<table width="800" border="1">
	<thead>
		<tr>
	
			<td>주문일자</td>
			<td>주문번호</td>
			<td colspan="2">상품정보</td>
			<td>주문수량</td>
			<td>총액</td>
			<td colspan="2">주문상태</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${omdList }" var="mlist">
		<tr>

			<td><fmt:formatDate value="${mlist.om_date }" pattern="yyyy.MM.dd"/></td>
			<td>${mlist.om_num }</td>
			<td><img src="../resources/img/productimg/${mlist.productDto.p_filesrc }.jpg" width="50" alt="상품사진" /></td>
			<td>
				${mlist.productDto.p_name } <br />
				${mlist.productDto.p_color } <br />
				${mlist.productDto.p_size }
			</td>
			<td>${mlist.u_cnt }</td>
			<td>${mlist.p_price }</td>
			<td>
				${mlist.om_state } <br />
				<button type="button" onclick="location.href='#'">결제취소</button>
			</td>
			<td>
				<button type="button" onclick="location.href='../review/reviewBoard'">리뷰쓰기</button>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

</body>
</html>