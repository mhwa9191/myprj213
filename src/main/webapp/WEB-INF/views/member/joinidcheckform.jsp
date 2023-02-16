<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function checkid(){
	var userid = jf.m_id.value;
	if(userid.length==0 || userid==""){
		alert("아이디를입력하세요");
		jf.m_id.focus();
	}else{
		window.open("/micky_SportsWear/member/joinidcheck?checkid=" + userid,"","width=500, height=300");
		window.close();
	}
	

}
function checkid2(){
	var userid = jf.m_id.value;
	if(userid.length==0 || userid==""){
		alert("아이디를입력하세요");
		jf.m_id.focus();
	}
	
	if(document.jf.result.value=="N"){
		alert("다른아이디를입력하세요");
		jf.m_id.focus();
	}else{
		window.close();
	}
}

</script>
<h3>joinidcheckform.jsp</h3>
<h1>아이디중복확인</h1>
중복확인 : ${checkid } <br />
입력한 아이디 : ${userid }  <br />
<form name="jf">
	<input type="text" id="m_id" name="m_id" value="${userid }"/><input type="button" value="중복확인" onclick="checkid()"/> <br />

<c:choose>
	<c:when test="${checkid==1 }">
		<p>이미 사용중인 아이디</p>
		<input type="hidden" name="result" value="N" />
	</c:when>
	<c:when test="${checkid==0 }">
		<p>사용가능한 아이디</p>
		<input type="hidden" name="result" value="Y" />
	</c:when>
	<c:otherwise>
		<p>오류발생(-1)</p>
		<input type="hidden" name="result" value="N" />
	</c:otherwise>
</c:choose>
<input type="button" value="사용하기" onclick="checkid2()" />
<input type="button" value="취소" onclick="window.close()" />
</form>

</body>
</html>