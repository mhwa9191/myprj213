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
var m_idd = document.getElementById("m_id").value; //input id값
console.log('완성된 이메일 : '+ eamil); //확인용 (f12콘솔창 확인가능)
console.log('아이디입력한거 : '+m_idd); //확인용
		
	$.ajax({
		type:'GET',
		url:'/shop/member/findpw?email=' +eamil+ '&m_id=' + m_idd,
		success:function(result){
			alert(result)
			
			if(result==0){
				alert("해당이메일로가입한아이디가없습니다")
			}else if(result==1){
				alert("임시비밀번호 보낼이메일확인완료")
				$.ajax({
					type : 'GET',
					url : '/shop/member/sendpwemail?email=' + eamil, //email주소를 controller emailcheck()으로
					success : function(data){
						console.log("data : "+data); //인증번호확인용 (f12콘솔창 확인가능)
						code=data; //인증번호를 code에 저장
						alert('임시비밀번호발송 및 해당아이디 비밀번호변경완료') //확인용
						window.location.href="/shop/member/loginform"
					}
				})
			}else{
				alert("오류")
			}
		}
	})


	
}
</script>
<h3>findpwform.jsp</h3>
<h1>비밀번호찾기화면</h1>
<!-- 이름 : <input type="text" name="m_name" id="m_name" /> <br /> -->
아이디 : <input type="text" name="m_id" id="m_id" />
이메일 : <input type="text" name="m_email" id="m_email" />
		<select name="m_email2" id="m_email2">
		<option>@naver.com</option>
		<option>@daum.net</option>
		<option>@gmail.com</option>
		<option>@hanmail.com</option>
		<option>@yahoo.co.kr</option>
		</select> 
		<input type="button" onclick="email()" value="임시비밀번호발송"/> <br />
		<input type="button" value="로그인화면" onclick="location.href='loginform'" />
</body>
</html>