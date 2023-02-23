<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편번호 카카오 -->
<link rel="stylesheet" href="../resources/css/orderPageStyle.css"/>
</head>
<body>
<div> ${sessionScope.loginid } 님, 로그인상태입니다 ദ്ദി*ˊᗜˋ*)</div>
<div>
	<h3>주문하기 </h3>
	<div>
		<span>현재 ${sessionScope.loginid } 님, 남은 캐시는 <fmt:formatNumber value="${ordersMember.m_cash}" pattern="###,###"/>원 입니다.</span>
	</div>
	<hr />

	<div class="deliveryform">
	<p>배송지</p>
		<form action="../order/payment" name="sub_addr" method="post">
		 	<label class="label" for="receipt_name">수령인</label>
		 	<input type="text" name="receipt_name" id="receipt_name" placeholder="수령인을 입력하세요" onclick="$('.message-no-addr-name').css('display','none')"/>  <br />
		 
		 	<label class="label" for="receipt_phone">전화번호</label>
		 	<input type="text" name="receipt_phone" id="receipt_phone" placeholder="전화번호를 입력하세요" onclick="$('.message-no-addr-phone').css('display','none')"/>
		 	<input type="button" value="확인" name="btn_checkPhone" id="btn_checkPhone"onclick="checkPhone();"/>
		 	<p id="checkPhoneMessage"></p>		 	
		 	<label class="label" for="addr1">우편번호</label>
		 	<input type="text" name="addr1" id="addr1" size="5" readonly placeholder="우편번호" onclick="$('.message-no-addr').css('display','none')"/>
		 	<input type="button" value="검색" name="btn_addr" id="btn_addr" onclick="$('.message-no-addr').css('display','none')"/> <br />
		 	<label class="label" for="addr2">주소</label>
		 	<input type="text" name="addr2" id="addr2" readonly placeholder="주소"/> <br />
		 	<label class="label" for="addr2">상세주소</label>
		 	<input type="text" name="addr3" id="addr3" placeholder="상세주소를 입력하세요"/>
		</form>
	</div>
	
	
	<h5>구매할 상품</h5>
	
	<div class="orderSelectList">
		<c:forEach items="${orderPSelectList}" var="slist" varStatus="status">
			<div class="selectlist">
				<img src="../resources/img/productimg/${slist.p_filesrc}.jpg" width="50" alt="" /> <br />
				<div id="p_name">
					<span>상품명</span> <span>${slist.p_name}</span>
				</div> <br />
				<div id="p_color">
					<span>색상</span> <span>${slist.p_color}</span>
				</div> <br />
				<div id="p_size">
					<span>사이즈</span> <span>${slist.p_size}</span>
				</div> <br />
				<div id="cnt">
					<span>수량</span> <span>${cnt[status.index]}</span>
				</div> <br />
				<div id="totPrice">
					<span>총액</span> <span><fmt:formatNumber value="${cnt[status.index]*slist.p_price}" pattern="###,###"/>원</span>	
				</div>	
			</div>	
			<hr />
		</c:forEach>
		<div>
			<p>총 결제 금액</p>
			<span class="totPrices"><fmt:formatNumber value="${totPrices}" pattern="###,###"/>원</span>
		</div>
		
		<button class="btn_payment">결제하기</button>
		<!-- 결제 금액이 부족한 경우 -->
		<div>
			<p class="message-no-cash" style="display: none; color: #CC0099;">결제할 캐시가 부족합니다.</p>
		</div>
		<!-- 수령인 번호 주소 없는 경우 -->
		<div>
			<p class="message-no-addr-name" style="display: none; ">수령인을 입력해주세요.</p>
			<p class="message-no-addr-phone" style="display: none; ">전화번호를 입력해주세요.</p>
			<p class="message-no-addr" style="display: none; ">주소를 입력해주세요.</p>
		</div>
	</div>
	
	<hr />
	<!-- 주문페이지에서 결제로 넘어가지 않고 다시 상품페이지로 돌아가기 -->
	<a href="../product/productList"><button>취소</button></a>
	
	<hr />
</div>
<script>
	$('.btn_payment').click(function(){
		var m_cash = ${ordersMember.m_cash };
		var totPrices=${totPrices};
		/* alert(totPrices); */
		if (m_cash < totPrices){
			$('.message-no-cash').css('display','block');
			return false;
		}else if(document.getElementById('receipt_name').value==''){
			$('.message-no-addr-name').css('display','block');
			return false;
		}else if(document.getElementById('receipt_phone').value=='' || document.getElementById("checkPhoneMessage").innerText != 'OK'){
			$('.message-no-addr-phone').css('display','block');
			return false;
		}else if(document.getElementById('addr3').value==''){
			$('.message-no-addr').css('display','block');
			return false;
		}else{
			var receipt_name=document.getElementById('receipt_name').value;
			var receipt_phone=document.getElementById('receipt_phone').value;
			var addr1=document.getElementById('addr1').value;
			var addr2=document.getElementById('addr2').value;
			var addr3=document.getElementById('addr3').value;
			/* alert("확인돤"); */
			var link='../order/payment?receipt_name='+receipt_name+'&receipt_phone='+receipt_phone+'&addr1='+addr1+'&addr2='+addr2+'&addr3='+addr3;
			/* document.sub_addr.submit(); */
			location.replace(link);
		}
	});
</script>

<script type="text/javascript">
/* 전화번호 유효성검사 */ 
function checkPhone(){
	var receipt_phone=document.getElementById('receipt_phone').value;
	/* alert(receipt_phone); */
	if (/^[0-9]{3}[0-9]{3,4}[0-9]{4}$/.test(receipt_phone)){
		document.getElementById("checkPhoneMessage").innerText = "OK";
	}else {
		document.getElementById("checkPhoneMessage").innerText = "전화번호를 확인해주세요";
	}
}
</script>
<script>
<!-- 우편번호 카카오 -->
$(document).ready(function(){
    $('#btn_addr').on('click',function(){
    	
    	new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다. 
                // 내려오는 변수가 값이 없는 경우엔 공백(”)값을 가지므로, 이를 참고하여 분기 한다. 
                var fullAddr = ''; // 최종 주소 변수 
                var extraAddr = ''; // 조합형 주소 변수 
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다. 
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우 
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J) 
                    fullAddr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다. 
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다. 
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다. 
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ',' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다. 
                    fullAddr += (extraAddr !== '' ?' ('+ extraAddr +')' : '');
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다. 
                document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용 
                document.getElementById('addr2').value = fullAddr; // 커서를 주소 필드로 이동한다. 
                document.getElementById('addr3').focus();
            }
        }).open();
    });
});
</script>

</body>
</html>