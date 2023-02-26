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
<style>
body{ font-family: Nanum Gothic;}
h2{ color: #2E2E2E; font-size: 30px; font-weight: 400; text-align: center;}
#more_list{
	width: 1000px;
	border-collapse: collapse;
	border: 1px solid #E6E6E6;
	margin: 5px auto;
	font-size: 14px;
}
thead tr td{
	text-align: center;
	border: 1px solid #E6E6E6;
	color: #141414;
	background-color: #FBFAFA;
}
tbody tr td{
	border-bottom: 1px solid #E6E6E6;
	color: #353535;
	margin: 0;
	padding: 5px 0 5px 8px;
}
.option{ color: #757575; font-size: 12px; margin: 2px 0;}
.right{text-align: right; margin: 10px;}
.state{text-align: center;}
button{
	background-color: #FFF;
	border: 1px solid #141414;
	border-radius: 3px;
	margin: 1px auto;
	text-align: center;
}
.stateInfo{
	padding: 2px;
}
.logInOut-box,.page-more{
	margin: 10px 0 10px 900px;
}
</style>

<link href="../resources/css/checkIndex.css" rel="stylesheet">
</head>
<body>
<!-- 사이드 -->
<jsp:include page="/WEB-INF/views/myPage/checkIndex.jsp" />

<div class="logInOut-box">
<c:if test="${empty sessionScope.loginid}">
   <a href="../member/loginform">login</a> 
   |  <a href="../member/joinform">join</a>

</c:if>
 <c:if test="${not empty sessionScope.loginid}">
    <a href="../member/logout">logout</a> 
 <br />
 ${sessionScope.loginid} 님, 로그인상태입니다 ദ്ദി*ˊᗜˋ*)
 </c:if>
 
 <div>
	<p class="go-productList" style="color: #336666;">
	<a href="../product/productList">상품둘러보기</a>
	</p>
 </div>
 <div>
 	<p>회원님의 현재 보유 캐시 : ${myList.m_cash}</p>
 </div>
</div>
 

 <h2>나의주문내역 </h2>
<form action="">
<input type="hidden" name="viewCount" id="viewCount" value="0" />
<input type="hidden" name="startCount" id="startCount" value="0" />

<table id="more_list">
	<thead>
		<tr>	
			<td width="1%">확인</td>
			<td width="10%">주문일자</td>
			<td width="10%">주문번호</td>
			<td width="40%" colspan="2">상품정보</td>
			<td width="10%">총액</td>
			<td  width="25%" colspan="2">주문상태</td>
		</tr>
	</thead>
	<tbody>
		<c:choose>
		<c:when test="${totRowcnt eq '0'}">
			<tr>
				<td colspan="7">
					<c:out value="주문내역이없습니다"></c:out>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
		
			<c:forEach items="${omdList}" var="mlist" varStatus="status">			
			<tr>
				<c:if test="${myListGroup[status.index].groupcnt eq '1'}">
				<td style="display: none;"></td>
				</c:if>
				<c:if test="${myListGroup[status.index].groupcnt ne '2'}">
				<td rowspan="${myListGroup[status.index].groupcnt}">${myListGroup[status.index].groupcnt}</td>
				</c:if>
				<td><fmt:formatDate value="${mlist.om_date}" pattern="yyyy.MM.dd hh:mm:ss"/></td>
				<td>${mlist.om_num}</td>
				<td><img src="../resources/img/productimg/${mlist.productDto.p_filesrc}.jpg" width="80" alt="상품사진" /></td>
				<td>
					${mlist.productDto.p_name} <br />
					<div class="option">${mlist.productDto.p_color} / ${mlist.productDto.p_size}</div>
					${mlist.u_cnt}개
				</td>
				<td><div class="right"><fmt:formatNumber value="${mlist.p_price}" pattern="###,###"/>원</div></td>
				<td><div class="state">${mlist.om_state}</div></td>
				<td class="stateInfo">
					<c:choose>
						<c:when test="${mlist.om_cancle eq 'N' && mlist.om_state eq '결제완료'}">
							<button type="button" onclick="myOrder_btn('myOrderCancel','${mlist.om_cntnum}')">결제취소</button>
						</c:when>
						<c:when test="${mlist.om_state eq '주문확정' || mlist.om_state eq '배송중'}">
							<button type="button" onclick="deliveryCheck('${mlist.om_cntnum}');">배송조회</button>
						</c:when>
						<c:when test="${mlist.om_cancle eq 'Y'}">
							<p>취소요청</p>
						</c:when>
						<c:when test="${mlist.om_state eq '배송완료' && mlist.om_delcancle eq 'N'}">
							<button type="button" onclick="myOrder_btn('myDelivCancel','${mlist.om_cntnum}')">반품요청</button> <br />
							<button type="button" onclick="myOrder_btn('myOrderConfirm','${mlist.om_cntnum}')">구매확정</button>
						</c:when>
						<c:when test="${mlist.om_state eq '구매확정'}">
							<button type="button" onclick="location.href='../review/reviewMylistview?account=${sessionScope.loginid}'">리뷰쓰기</button>
						</c:when>
						<c:when test="${mlist.om_state eq '반품완료'}">
							<p>감사합니다.</p>
						</c:when>
						<c:otherwise>
							<p>처리중입니다.</p>
						</c:otherwise>
					</c:choose>

				</td>
			</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
	</tbody>
</table>
</form>
<br />
<div class="page-more">
totCnt : ${totRowcnt} <br />
<c:if test="${searchVO.page<searchVO.totPage}">
<hr />
	<a href="myOrderList?page=${searchVO.page+1}">[더보기]</a>
<hr />
</c:if>
</div>
<br />

<script>
function myOrder_btn(type,omcntnum){
	/* alert(omnum); */
	var form = document.createElement('form'); // 폼객체 생성
	var objs;
	objs = document.createElement('input'); // 값이 들어있는 형식
	objs.setAttribute('type', 'hidden'); // 값이 들어있는 type
	objs.setAttribute('name', 'omcntnum'); // 객체이름
	objs.setAttribute('value', omcntnum); //객체값
	form.appendChild(objs);
	form.setAttribute('method', 'post'); //get,post 가능
	form.setAttribute('action', "../order/"+type); //보내는 url
	document.body.appendChild(form);
	form.submit();
	
}
</script>
<script>
function deliveryCheck(omcntnum){
	/* alert(omcntnum); */
	var win = window.open("", "Delivery", "width=500,height=600");
/* 	win.document.write("<p>새창에 표시될 내용 입니다.</p>"); */
	win.focus(); // 포커스를 준다음에
	win.document.body.innerHTML = `<p>이름은 ${name} 입니다</p>`;
}
</script>

</body>
</html>