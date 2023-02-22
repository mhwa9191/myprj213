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
<jsp:include page="/WEB-INF/views/member/main.jsp" />
<c:if test="${empty sessionScope.loginid}">
   <a href="../member/loginform">login</a> 
   |  <a href="../member/joinform">join</a>

</c:if>
 <c:if test="${not empty sessionScope.loginid}">
    <a href="../member/logout">logout</a> 
 <br />
 ${sessionScope.loginid} 님, 로그인상태입니다 ദ്ദി*ˊᗜˋ*)
  	 <div>
		<p class="go-myOrderList" style="color: #336666;">
		<a href="../order/myOrderList">나의 주문내역보기</a>
		</p>
	</div>
 </c:if>
 
 

<h3>상품</h3>

<div>
	<c:forEach items="${productMain}" var="pm">
		<div>
			<input type="hidden" name="pname" value="${pm.p_name}" />
			<input type="hidden" name="pfilesrc" value="${pm.p_filesrc}" /> 
		<!-- 상품사진을 누를때마다 새로운 값을 보내서 아랫단의 ${product } 값을 지정하게됨 -->
			<a href="productDetail?pname=${pm.p_name}&pfilesrc=${pm.p_filesrc}">
			<img src="../resources/img/productimg/${pm.p_filesrc}.jpg" width="150" class="product_img" alt="" />
			</a>
			<input type="hidden" name="pcolor" value="${pm.p_color}" />
		</div>		
	</c:forEach>
</div>

<div>
	<div>
	<c:forEach items="${product}" var="p" begin="1" end="1">
		<span>색상</span>
		<span>${p.p_color}</span>
	</c:forEach>
	</div>
	<div>
	<p>사이즈</p>
		<c:forEach items="${product}" var="p">
		<div class="productSelect">
			<c:if test="${p.p_cnt eq 0}">
				${p.p_size } <span style="font-size:12pt; font-family:맑은 고딕;">품절</span>
			</c:if>
			<c:if test="${p.p_cnt > 0}">
				<input type="radio" class="sizeNo" name="sizeNo" value="${p.p_no}" onclick="sizeNo('${p.p_no}','${p.p_color}','${p.p_size}',${p.p_cnt});" />${p.p_size}
			</c:if>
		</div>
		</c:forEach>
	</div>
</div>

<!-- 상품을 선택하지 않은 경우-->
<div>
	<p class="print-message-no-opt" style="display: none; color: #CC0099;">옵션을 선택해 주세요.</p>
</div>

<form action="../order/orderPage" method="post" class="order_form">
	<!-- 선택시 목록쌓이는 곳 -->
	<div class="choicelist">
		<!-- name="choice_cnt"
 			 name="choice_pno" value="pno" -->
	</div>
	<input type="submit" id="order_form" value="바로구매" />
</form>

<script>
	/* 수량-+버튼생성시 해당 재고량에 맞게 확인 */
	/* -+버튼 눌렀을때 수량 변화 */
	function Count(type,pno,totcnt) { /* ths [object HTMLButtonElement] */
		/* alert(type+"***"+pno+"***"+totcnt); */
		var cnt=".cnt_"+pno;
		var tCount = Number($(cnt).val());
		if (type == 'plus') {
			if (tCount < totcnt)
				$(cnt).val(Number(tCount) + 1);
		} else {
			if (tCount > 0)
				$(cnt).val(Number(tCount) - 1);
		}
	}
</script>
<script>
	/* 상품선택 후 목록에서 다시 지우기 */
	function deletechoice(pno){
		var pnoid="choice_"+pno;
		$("#"+pnoid).remove();
	}
</script>
<script>
	/* 사이즈 선택시 */
	/* 수량선택하면 바로 해당 내용이 구매선택목록이됨 */
	function sizeNo(pno,pcolor,psize,totcnt) {
		$('.print-message-no-opt').css('display','none');
	 	/* alert("초이스 확인창"); */
/* 중복클릭 if else 처리 필요함 */
	 	var elems= document.getElementsByName('choice');	 	
	 	/* alert(elems.length); */
	 	var html='<div name="choice" id="choice_'+pno+'">'+pcolor+'&nbsp;'+psize+'&nbsp;&nbsp;'
	 	+'<span>수량</span>'
	 	+'<input type="hidden" class="cnttot" name="재고수량" value="'+totcnt+'" />'
	    +'<input type="text" class="cnt_'+pno+'" name="choice_cnt" value="1" size="1" readonly="readonly" style="text-align: center;" />'
	 	+'<input type="hidden" name="choice_pno" id="choice_pno" value="'+pno+'" />'
	    +'<button type="button" onclick="Count(\'minus\',\''+pno+'\','+totcnt+');">-</button>'
	 	+'<button type="button" onclick="Count(\'plus\',\''+pno+'\','+totcnt+');">+</button>'
	 	+'&nbsp;&nbsp;&nbsp; <button type="button" onclick="deletechoice(\''+pno+'\');">x</button>'
	 	+'</div>';
	 	
	 	if (elems.length==0) {
			$('.choicelist').append(html);
		}
 		for (var i = 0; i < elems.length; i++) {
			var elem =elems[i].id;
			if (('choice_'+pno)==elem){
				html='';
			}
		}
	 	$('.choicelist').append(html);	
	};
</script>
<!-- 선택 null 일때 창 -->
<script>
$('#order_form').click(function(){
	var userid='<%=(String)session.getAttribute("loginid")%>';
	if(userid=='null'){
		alert("로그인이 필요합니다.");
		return false;
	}
	if($('#choice_pno').val()==null ){
		$('.print-message-no-opt').css('display','block');
		return false;
	}

});
</script>

	장바구니
	
	<br />
	<br />
	<br />
	
<h3>이동확인하기</h3>
<div class="pdp-anchor-wrap">
    <ul class="flex-center" style="top: 97px;">
        <li class="active">
            <a href="#product-info">상품정보</a>
        </li>
        <li class="">
            <a href="#product-review">리뷰</a>
        </li>
        <li>
            <a href="#product-size">사이즈정보</a>
        </li>
        <li>
            <a href="#product-delivery">배송정보</a>
        </li>
    </ul>
</div>


<div class="pdp-section pdp-section-review" id="product-review">
<br />
<br />
<a href="../review/reviewBoard">reviewBoard</a>
<br />
<c:set var="pname" value="${param.pname }" scope="application"/> <br />
<c:set var="pfilesrc" value="${param.pfilesrc }" scope="application"/> <br />
<br />
<br />
<jsp:include page="/WEB-INF/views/review/reviewBoard.jsp" />

</div>

</body>
</html>