<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.1.min.js"></script>
<script src="../resources/js/jquery.bpopup.min.js"></script>
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
 myOrderCancel
 
 <div>
	<p class="go-productList" style="color: #336666;">
	<a href="../order/myOrderList">이전으로</a>
	</p>
 </div>
 <div>
 	<p>회원님의 현재 보유 캐시 : ${myList.m_cash }</p>
 </div>
 

<h3>취소요청 상품 </h3>
<form action="myOCancleOffer" method="post">
	<input type="hidden" name="calcleOfferomcntnum" id="calcleOfferomcntnum" value="${myOrderCancelOffer.om_cntnum }" />
	<table width="800" border="1" id="more_list">
		<thead>
			<tr>
				<td>주문일자</td>
				<td>주문번호</td>
				<td colspan="2">상품정보</td>
				<td>주문수량</td>
				<td>총액</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><fmt:formatDate value="${myOrderCancelOffer.om_date }" pattern="yyyy.MM.dd"/></td>
				<td>${myOrderCancelOffer.om_num }</td>
				<td>
				<img src="../resources/img/productimg/${myOrderCancelOffer.productDto.p_filesrc }.jpg" width="50" alt="상품사진" /></td>
				<td>
					${myOrderCancelOffer.productDto.p_name } <br />
					${myOrderCancelOffer.productDto.p_color } <br />
					${myOrderCancelOffer.productDto.p_size }
				</td>
				<td>${myOrderCancelOffer.u_cnt }</td>
				<td>${myOrderCancelOffer.p_price }</td>
			</tr>
			<tr>
				<td colspan="8">
					<textarea name="myOrderCancelReason" id="myOrderCancelReason" cols="100" rows="5" onclick="this.value='';">주문취소사유를 작성해주세요.</textarea>
				</td>
			</tr>
		</tbody>
	</table>
	<input type="submit" value="취소요청하기" />
</form>
<br />
</body>
</html>