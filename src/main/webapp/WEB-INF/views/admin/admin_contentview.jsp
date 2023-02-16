<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin_contentviewstyle.css" />
</head>

<body>
<div class="jumbotron text-center">
	<h1 class="content_h1" align="center">관리자 주문내역 상세</h1>
	<h3 class="content_h3" align="center">관리자 주문/결제 수정</h3>
</div>

<script>
//var selectValue = document.getElementById('1').value;
var selectValue = document.getElementById('select').value = '1';
document.querySelector('select').onchange();
alert(selectValue);
</script>


<form action="modify" method="post">
<input type="hidden" name="om_cntnum" value="${acontent_view.om_cntnum }" />
  <table border="1">
		 <tr bgcolor="#CCCCCC">
		 	<th colspan="4">주문상세</th>
		 	
		 	
		 	
		 </tr>
		 <tr bgcolor="#e8e8e8">
		 	<th>주문일자</th>
		 	<th>ID</th>
		 	<th colspan="2">주문번호</th>
		 </tr>
		 <tr>
		 	<td><fmt:formatDate value="${acontent_view.om_date }" pattern="yyyy-MM-dd"/></td>
		 	<td>${acontent_view.m_id }</td>
		 	<td colspan="2">${acontent_view.om_num }</td>
		 </tr>	
		 <tr bgcolor="#CCCCCC">
		 	<th colspan="4">제품정보</th>
		 	
		 	
		 	
		 </tr>
		 <tr bgcolor="#e8e8e8">
		    <th>상품주문번호</th>
		    <th>상품번호</th>
		    <th>총액</th>
		    <th>처리상태</th>
		 </tr>	 
		 <tr>
		     <td>${acontent_view.om_cntnum }</td>
		     <td>${acontent_view.p_no }</td>
		     <td><fmt:formatNumber type="currency" value="${acontent_view.p_price }" /></td>
		     <td>
		     <label>결제완료</label>
		     <select id="om_state" name="om_state" onchange="alert(this.value)">
		       <option value="" selected>-- 결제완료 --</option>
		      <%--  <option id="1" value="${acontent_update.om_state }">주문취소</option>	 --%>              
		       <option id="1" value="주문취소">주문취소</option>	              
		     </select>
		    </td>
		 </tr>
		 <tr bgcolor="#e8e8e8">
		 	 <th>주문취소일자</th> 
		 	<th>주문취소사유</th>
		 	<th colspan="2">주문취소승인</th>
		 </tr>
		 <tr>
		    <td><fmt:formatDate value="${acontent_view.om_cdate }" pattern="yyyy-MM-dd"/></td>
		    <td>${acontent_view.c_reason }</td>
		 	<td colspan="2"><input type="submit" id="admin_cancle" value="주문취소"/></td>
		 </tr>
	</table>
	<br />
	
	<div class="a">
	<a href="admin_olist" class="returnolist">목록</a>
	</div>
	
</form>

</body>
</html>