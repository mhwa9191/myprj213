<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
<script>
function fnCalCount(type, ths){
    var $input = $(ths).parents("div").find("input[name='c_cnt']");
    var tCount = Number($input.val());
    var tEqCount = Number($(ths).parents("div").find("p.c_cnt").html());
    
    if(type=='p'){
        if(tCount < tEqCount) $input.val(Number(tCount)+1);
        
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
         }
}
function daupdate() {
	var p_no=forms.p_no.value;
	var p_color=forms.p_color.value;
	var p_size=forms.p_size.value;
	var c_cnt=forms.c_cnt.value;
	var c_no=forms.c_no.value;
	$.ajax({
		url:'modifycartoption?p_no='+p_no+'&p_color='+p_color+'&p_size='+p_size+'&c_cnt='+c_cnt+'&c_no='+c_no,
		async:true,
		type:'GET',
		data: {
		},
		success: function( result ) {
	        	opener.document.location.reload();
	        	window.close();
	     },
	     error: function() {
	        console.log( "joinForm의 ajax 에러" )
	     }
	});
}
function selectsize(type){
	var result="";
	if(type=='xs'){
		result="085XS";
    }else if(type=='s'){
    	result="090S";
    }else if(type=='m'){
    	result="095M";
    }else {
    	result="100L";
    }
	document.getElementById("result").value=result;
}
function test() {
	var dd=document.getElementById("test").value
	alert(dd);
}
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>옵션 변경</h3>
<hr />
<form name="forms">
<div><img src="../resources/img/productimg/${list.productDto.p_filesrc }.jpg" alt="img" width="100px" height="100px"/></div>
<div>
	${list.productDto.p_no } <br />	
	<b>${list.productDto.p_name }</b>  <a href="#">상품상세</a><br /><!-- 상품의 디테일로가는링크 -->
	
	${list.productDto.p_price } <span>원</span> <br />     
	<hr />
	리뷰 ★★★★★<br />
	<hr />
	<!-- 상품의색상의 이미지를 클릭하면 그 상품으로 변환  -->
	${list.productDto.p_color } <br />
		<img src="../resources/reviewupload/${list.productDto.p_filesrc }" alt="상품이미지들."  /> <br />
	<hr />
	<!-- 사이즈 변경시 같은색의 선택한 사이즈의 상품으로 변환 -->
	사이즈 
		<p class="count">담기</p>
		<input type="button" name="size" value="085(XS)" onclick="selectsize('xs');"/>
		<input type="button" name="size" value="090(S)" onclick="selectsize('s');"/>
		<input type="button" name="size" value="095(M)" onclick="selectsize('m');"/>
<!-- 		<input type="button" name="size" value="105(XL)" onclick="selectsize('xl');"/> -->	
	 <br />
	수량
	<p class="c_cnt" style="display: none;">${list.productDto.p_cnt }</p> <br />
	<!-- +,-에 update달기 -->
		<input type="text" name="c_cnt" value="${list.c_cnt }" readonly="readonly" style="text-align:center;" size=2/>
		<button type="button" onclick="fnCalCount('m', this);">-</button>
		<button type ="button" onclick="fnCalCount('p',this);">+</button>
</div>
	<input type="text" name="p_no" value="${list.productDto.p_no }">
	<input type="text" name="p_color" value="${list.productDto.p_color }">
	<input type="text" id="result" name="p_size" value="${list.productDto.p_size }">
	<input type="text" name="c_no" value="${list.c_no }">
	<input type="button" value="선택완료" onclick="daupdate();" />	
<!-- 만약 변견된 값만 부모 view에 보내주면 -->	
</form>

</body>
</html>