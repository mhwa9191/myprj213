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
					<div class="textLengthWrap">
						<span id="maxtext-display" style="display: none;">글자수는 100자까지 입력 가능합니다.</span>
						<p class="textCnt">0자</p>					
						<p class="textTot">/100자</p>					
					<textarea name="myOrderCancelReason" id="myOrderCancelReason" cols="100" rows="5" maxlength="100" placeholder="주문취소사유를 작성해주세요." style="resize: none;"></textarea>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<input type="submit" value="취소요청하기" />
</form>
<br />

<script>
	$('#myOrderCancelReason').keyup(function (e) {
		let content = $(this).val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCnt').text('0자');
	    } else {
	    	$('.textCnt').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length > 100) {
	    	// 100자 부터 제한
	        $(this).val($(this).val().substring(0, 100));
	        // 100자 넘으면 뜨도록
	        $('#maxtext-display').css("display","");
	    }else{
	    	//100자 안넘으면 다시 문구사라지기
	        $('#maxtext-display').css("display","none");	    	
	    }
	});
</script>

</body>
</html>