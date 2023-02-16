<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
// 수량 플러스 ,마이너스
function fnCalCount(type, ths){
    var $input = $(ths).parents("td").find("input[name='pop_out']");
    var tCount = Number($input.val());
    var tEqCount = Number($(ths).parents("tr").find("td.c_cnt").html());
    
    if(type=='p'){
        if(tCount < tEqCount) $input.val(Number(tCount)+1);
        
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
        }
}
/* 옵션창 이동  */
function changeoption(ths) {
	var cartNum = Number($(ths).parents("tr").find("td.c_no").html());
	window.open('changeoption?c_no='+cartNum, '옵션변경', 'width=700px,height=800px,scrollbars=yes');
}
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>cart</h3>
장바구니 상품 ${fn:length(list) } 개 <br />
${list.size() } <br />
<a href="alldeleteCart">전체삭제</a> 
<form action="order" name="cart">
<div class="Cart_list">
<table border="1" width="800">
		  <tr>
			<th>상품정보</th>
			<th>수량</th>
			<th>주문금액</th>
		  </tr>
		<c:forEach  var="cart" items="${list }">
		  <tr>
		    <!-- 상품의 재고 -->
		    <td class="c_cnt" style="display: none;">${cart.productDto.p_cnt }</td>
		    <td class="c_no" style="display: none;">${cart.c_no }</td>
		    <td>
		    	<!-- 상품의 상세정보로 이동 -->
		    	<a href="#"><img src="../resources/img/productimg/${cart.productDto.p_filesrc }.jpg" alt="img_link" width="100px" height="100px"/></a>
		    	${cart.productDto.p_name } <br />
		    	${cart.productDto.p_size }/${cart.productDto.p_no } <br />
		    	제품선택수량 : ${cart.c_cnt } <br />    	
		    	제품재고 : ${cart.productDto.p_cnt } <br />    	
		    	장바구니번호 : ${cart.c_no }				
		    </td>
		    <td>
		    	<!-- +,- update -->
				<a href="plusCartcount?p_no=${cart.p_no }&c_no=${cart.c_no }">
					<button type ="button" onclick="fnCalCount('p',this);">+</button>
				</a> 
       				<input type="text" name="pop_out" value="${cart.c_cnt }" readonly="readonly" style="text-align:center;" size=2/> 
       			<a href="minusCartcount?p_no=${cart.p_no }&c_no=${cart.c_no }">
        			<button type="button" onclick="fnCalCount('m', this);">-</button> <br />
        		</a>
		    	<!-- 사이즈, 색상 변경으로인해 제품번경 -->
		    	<input type="button" value="옵션변경" onclick="changeoption(this);" />	
		    </td>
		    <td>
		    	<!-- p_no는 화면유지 c_no는 쿼리문에사용 -->
		    	<a href="deleteCart?p_no=${cart.p_no }&c_no=${cart.c_no }"><img src="../resources/img/icon_delete.png" alt="현재 장바구니 삭제" /></a> <br />
		    	<!-- 상품 갯수증가에 따른가격조정 -->
<%-- 		    	<c:set value="${cart.productDto.p_price*cart.c_cnt }" var="cntprice" scope="application"/> --%>
		    	<strong>${cart.productDto.p_price}</strong><span><b>원</b></span>
		    </td>
		  </tr>
		</c:forEach>		 
	</table>
	
</div>

<div class="Order_left">

	<dl>
		<dt>주문 금액</dt>	
		
		<dd>
			<ul>
				<li>
					<em>상품금액</em><em>${totalprice }</em><span>원</span>
				</li>
				<li>
					<em>배송비</em><em>0</em><span>원</span>
				</li>
				<li>
					<em>상품 핳인금액</em><em>9,860</em><span>원</span>
				</li>
				<li>
					<em>주문 할인금액</em><em>0</em><span>원</span>
				</li>
			</ul>
		</dd>
	</dl>
	<em>총 결제금액</em> <em>${totalprice }</em><span>원</span>
</div>
<!-- 제품,사이즈,수량,가격,구매자  -->
<a href="#">주문하기</a>

<input type="submit" value="주문" />
</form>
</body>
</html>