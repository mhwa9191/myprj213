<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
</head>
<body>
<script>
function checkValue(){
	inputPw = document.getElementById("m_pw").value; //input password값
	
	if(!inputPw){
		alert("비밀번호입력하세요")
	}else{
		$.ajax({
			url:'/shop/member/memberdropcheck?m_pw=' + inputPw,
			type:'GET',
			success:function(result){
				if( result==0) { 
					alert("본인인증실패")
				} else if( result==1 ) {
					alert("본인인증완료")
					self.close();
					opener.location.href="memberdrop";
				}
			},
			error: function() {
				console.log( "에러" )
			}
		})
	}
}
</script>
<h3>memberdropcheckform.jsp</h3>
<h1>회원탈퇴 진입 전 비밀번호로 본인인증하는 화면</h1>
아이디 : <input type="text" value="<%=session.getAttribute("loginid") %>" name="m_id" readonly/> <br />
비밀번호 : <input type="text" name="m_pw" id="m_pw" /> <br />
<input type="button" value="확인" onclick="checkValue()" />
</body>
</html>