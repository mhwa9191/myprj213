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
 
 
 <div>
	<p class="go-productList" style="color: #336666;">
	<a href="../product/productList">상품둘러보기</a>
	</p>
 </div>
 <div>
 	<p>회원님의 현재 보유 캐시 : ${myList.m_cash }</p>
 </div>
 

 <h3>나의주문내역 </h3>
<form action="">
<input type="hidden" name="viewCount" id="viewCount" value="0" />
<input type="hidden" name="startCount" id="startCount" value="0" />

<table width="800" border="1" id="more_list">
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
		<c:choose>
		<c:when test="${totRowcnt eq '0' }">
			<tr>
				<td colspan="8">
					<c:out value="주문내역이없습니다"></c:out>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
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
					<td>${mlist.om_state }</td>
					<td>
						<c:if test="${mlist.om_cancle eq 'N' }">
							<button type="button" onclick="myOrderCancel('${mlist.om_cntnum }')">결제취소</button>
							<button type="button" onclick="location.href='../review/reviewMylistview?account=${sessionScope.loginid}'">리뷰쓰기</button>
						</c:if>
						<c:if test="${mlist.om_cancle eq 'Y' }">
							취소요청 사유 <br />
							${mlist.c_reason }
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
	</tbody>
</table>
</form>
<br />
totCnt : ${totRowcnt } <br />
현재페이지/토탈페이지 : ${searchVO.page }/ ${searchVO.totPage } <br />

<c:if test="${searchVO.page>1 }">
	<a href="myOrderList?page=1">[처음]</a>
	<a href="myOrderList?page=${searchVO.page-1 }">[이전]</a>
</c:if>
<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
	<c:choose>
		<c:when test="${i eq searchVO.page }">
			<span style="color:red; font-weight: bold">
			${i }&nbsp;
			</span>
		</c:when>
		<c:otherwise>
			<a href="myOrderList?page=${i }" style="text-decoration: none">
			${i }&nbsp;
			</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${searchVO.page<searchVO.totPage }">
	<a href="myOrderList?page=${searchVO.page+1 }">[다음]</a>
	<a href="myOrderList?page=${searchVO.totPage }">[마지막]</a>
</c:if>

<script>
function myOrderCancel(omcntnum){
	/* alert(omnum); */
	var form = document.createElement('form'); // 폼객체 생성
	var objs;
	objs = document.createElement('input'); // 값이 들어있는 형식
	objs.setAttribute('type', 'hidden'); // 값이 들어있는 type
	objs.setAttribute('name', 'omcntnum'); // 객체이름
	objs.setAttribute('value', omcntnum); //객체값
	form.appendChild(objs);
	form.setAttribute('method', 'post'); //get,post 가능
	form.setAttribute('action', "../order/myOrderCancel"); //보내는 url
	document.body.appendChild(form);
	form.submit();
}
</script>

</body>
</html>