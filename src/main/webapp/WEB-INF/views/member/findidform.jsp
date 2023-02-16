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
var code="";

function email(){ //이메일인증번호발송
const eamil = $('#m_email').val()+$('#m_email2').val(); //input email + select(option 메일주소)
var m_namee = document.getElementById("m_name").value; //input id값
console.log('완성된 이메일 : '+ eamil); //확인용 (f12콘솔창 확인가능)
console.log('아이디입력한거 : '+m_namee); //확인용
		
	$.ajax({
		type:'GET',
		url:'/shop/member/findid?email=' +eamil+ '&m_name=' + m_namee,
		success:function(result){
			alert("ajax응답완료확인 : "+result)
			
			if(result==""){
				alert("해당이메일로가입한아이디가없습니다")
			}else if(result!=""){
				alert("확인완료")
				alert("찾은 아이디 : "+result)
			}else{
				alert("오류")
			}
		}
	})


	
}
</script>
<h3>findidform.jsp</h3>
<h1>아이디찾기화면</h1>
<!-- 이름 : <input type="text" name="m_name" id="m_name" /> <br /> -->
이름 : <input type="text" name="m_name" id="m_name" />
이메일 : <input type="text" name="m_email" id="m_email" />
		<select name="m_email2" id="m_email2">
		<option>@naver.com</option>
		<option>@daum.net</option>
		<option>@gmail.com</option>
		<option>@hanmail.com</option>
		<option>@yahoo.co.kr</option>
		</select> 
		<input type="button" onclick="email()" value="아이디찾기"/> <br />
		<input type="button" value="로그인화면" onclick="location.href='loginform'" />
</body>
</html>