<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
// function clickevent() {
// 	var text = form.q.value
// 	if (text == "상품명") {
// 		$("input[name=q]").val("");
// 	}
	
// function test(ths) {
// 	var pNum = $(ths).parents("tr").find("td#p_no").html();
//   	alert(pNum)
// }
function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('checkbox');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
// check된 상품 삭제 success의 location.reload를 지우면 로그를볼수있음	
function adminProductDelete() {
	var checkBoxArr = []; 
	  $("input:checkbox[name='checkbox']:checked").each(function() {
	  checkBoxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
	  console.log(checkBoxArr);
	})
	$.ajax({
		type : "POST",
		url :'adminProductDelete',
		data : {
			checkBoxArr : checkBoxArr
		},
		success : function(result){
			location.reload();
			console.log(result);
		},
		error : function(xhr, status, error) {
			alert(error);
		}
		});
	}
//	수정하기 미완성	
function modify() {
// 	document.getElementById("p_nametext").style.display="none";
	
	var target=document.getElementsByClassName("aa")[1]
	target.style.color = "red";
// 	a.style.display="none";
// 	a.style.color="red";
}	
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>admin_product</h3>

<div class="container">
	<form action="admin_product" id="form">
	<!-- 검색 -->		
		<input type="text" id="q" name="q" value="${search}" />
		<input type="submit" value="검색"/>
		
		<select name="price">
			<option >가격순</option>
			<option >가격높은순</option>
			<option >가격낮은순</option>
		</select>
		<select name="size">
			<option >사이즈</option>
			<option>085XS</option>
			<option>090S</option>
			<option >095M</option>
			<option>100L</option>
			<option>105XL</option>
		</select>
	</form>
		총 상품수 : ${searchVo.totRow }	
		<table width="1100" border="1">
			<tr>
				<td>
				<input type='checkbox' name='checkbox' value='selectall' onclick='selectAll(this)'/> 
				</td>
				<td>상품번호</td>
				<td>상품명</td>
				<td>가격</td>
				<td>재고</td>
				<td>색상</td>
				<td>사이즈</td>
				<td>첨부파일</td>
				<td>상품카테고리</td>
				<td>상품등록일</td>
				<td>수정</td>
			</tr>
			<c:forEach items="${plist }" var="list">
				<tr >
					<td>
						<input type="checkbox" name="checkbox" value="${list.p_no }"/>
					</td>
					<td id="p_no">${list.p_no }</td>
					<td>
						<em >${list.p_name }</em><input type="text" class="aa" value="${list.p_name }" />
					</td>
<!-- 					<td  id="p_nametext" class="aa"> -->
<%-- 						<input type="text" na value="${list.p_name }" /> --%>
<!-- 					</td> --> 
					<td>${list.p_price }</td>
					<td>${list.p_cnt }</td>
					<td>${list.p_color }</td>
					<td>${list.p_size }</td>
					<td><a href="detaillist?p_no=${list.p_no }">${list.p_filesrc }</a></td>
					<td>${list.p_category }</td>
					<td>${list.p_date }</td>
					<td><input type="button" value="수정하기" onclick="modify();"/></td>
				</tr>
			</c:forEach>
		</table>
		<a href="admin_addproduct">등록</a>	
		<a href="#" onclick="adminProductDelete();">삭제</a>
<!-- 		<button onclick="adminProductDelete();">삭제</button> -->
		<a href="admin_productModify">수정</a>
	
	<br />
	<br />
	<!-- 페이지 처리 -->
	<div>
		<c:if test="${searchVo.page > 1 }">
			<a href="admin_product?page=1&q=${search}&price=${price }&size=${size }">[처음]</a>
			<a href="admin_product?page=${searchVo.page-1 }&q=${search}&price=${price }&size=${size }">[이전]</a>
		</c:if>
	
		<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }"
			var="i">
			<c:choose>
				<c:when test="${i eq searchVo.page }">
					<span style="color: red; font-weight: bold">${i }&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="admin_product?page=${i }&q=${search}&price=${price }&size=${size }" style="text-decoration: none;">${i }&nbsp;</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:if test="${searchVo.page < searchVo.totPage }">
			<a href="admin_product?page=${searchVo.page+1 }&q=${search}&price=${price }&size=${size }">[다음]</a>
			<a href="admin_product?page=${searchVo.totPage }&q=${search}&price=${price }&size=${size }">[마지막]</a>
		</c:if>
	</div>
</div>
</body>
</html>