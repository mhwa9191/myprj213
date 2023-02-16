<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
</head>
<body>
<script>
var code = ""; //이메일전송 인증번호 저장을 위한 코드


function checkid(){ //아이디중복확인
	var overlapcheck_id = jf.m_id.value; //input id의 value
	let valcheck_id = /^[a-z]+[a-z0-9]{5,19}$/g; //아이디 정규식
	
	if(overlapcheck_id.length==0 || overlapcheck_id==""){ //input id를 타이핑하지않으면
		alert("중복검사할아이디를입력하세요")
		jf.m_id.focus();
	}else if(!valcheck_id.test(overlapcheck_id)||overlapcheck_id.length<6){ //input id가 정규식에 벗어나면
		alert("아이디정규표현식XXXX신호")
		jf.m_id.focus();
	}else { //제대로된 input id가 타이핑되면
		//window.location.href="/micky_SportsWear/member/joinidcheck?overlapcheck_id=" + overlapcheck_id;
		$.ajax({
			url: '/shop/member/joinidcheck?overlapcheck=' + overlapcheck_id, //input id를 controller의 joinidcheck()으로
			type: 'GET',
			success: function( result ) { 
				
				if( result==0) { //아이디가 중복하지않을때
					//alert(result);
					alert("사용가능한아이디입니다 : "+result)
					$("input[name=checkid_YESorNO]").val('YES'); //아이디중복확인진행 유무(기본값은 NO)
				} else if( result==1 ) { //아이디가 중복일때
					//alert(result);
					alert("이미있는아이디입니다 : "+result)
				}
			},
			error: function() {
				console.log( "joinForm의 ajax 에러" )
			}
		})
	}
	
}
function checknickname(){ //닉네임중복확인
	var overlapcheck_nickname = jf.m_name2.value; //input nickname 값
	
	if(overlapcheck_nickname==0 || overlapcheck_nickname==""){ //input nickname을 타이핑하지않았을때
		alert("중복검사할닉네임을입력하세요")
		jf.m_name2.focus();
		return false;
	}else{
		$.ajax({
			url: '/shop/member/joinnicknamecheck?overlapcheck=' + overlapcheck_nickname, //input nickname을 controller joinnicknamecheck()으로
			type: 'GET',
			success: function( result ) {
				
				if( result==0) { //닉네임이 중복하지않을때
					//alert(result);
					alert("사용가능한닉네임입니다 : "+result)
					$("input[name=checkname2_YESorNO]").val('YES'); //닉네임중복확인진행 유무(기본값은 NO)
				} else if( result==1 ) { //닉네임이 중복할때
					//alert(result);
					alert("이미있는닉네임입니다 : "+result)
				}
			},
			error: function() {
				console.log( "joinForm의 ajax 에러" )
			}
		})
	}
}
function checkinfo(){ //가입하기form 적용 전에 필수 항목 값 확인
	var m_id = jf.m_id.value; //input id값
	var m_pw = jf.m_pw.value; //input pw값
	var m_name = jf.m_name.value; //input name값
	var m_tel = jf.m_tel.value; //input tel값
	var m_name2 = jf.m_name2.value; //input nickname값
	var m_email = jf.m_email.value; //input email값
	var checkid_YESorNO = jf.checkid_YESorNO.value; //id중복확인진행 유무(기본값은 NO)
	var checkname2_YESorNO = jf.checkname2_YESorNO.value; //nickname중복확인진행 유무(기본값은 NO)
	var checkemail_YESorNO = jf.email_check_input_result.value; //email인증진행 유무(기본값은 NO)
	//var m_grade = jf.m_grade.value;
	var m_age = jf.m_age.value; //input age값
	var m_gender = jf.m_gender.value; //input gender값
	//var m_cash = jf.m_cash.value;
	let valcheck_pw = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/; //pw 정규식
	//let valcheck_tel = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/; //tel 정규식
	//let valcheck_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(m_id==0 || m_id==""){
		alert("아이디를입력하세요")
		return false;
	}else if(checkid_YESorNO=="NO"){
		alert("아이디중복확인하세요")
		return false;
	}else if(m_pw==0 ||m_pw==""){
		alert("비밀번호를입력하세요")
		return false;
	}else if(!valcheck_pw.test(m_pw)||m_pw.length<8){
		alert("비번정규표현식XXXX신호")
		jf.m_pw.focus();
		return false;
	}else if(m_name==0 || m_name==""){
		alert("이름을입력하세요")
		return false;
	}else if(m_tel==0 || m_tel==""){
		alert("전화번호를입력하세요")
		return false;
	}/* else if(!valcheck_tel.test(m_tel)){
		alert("전번정규표현식XXXX신호")
		jf.m_tel.focus();
		return false;
	} */else if(m_name2==0 || m_name2==""){
		alert("닉네임을입력하세요")
		return false;
	}else if(checkname2_YESorNO=="NO"){
		alert("닉네임중복확인하세요")
		return false;
	}else if(m_email==0 || m_email==""){
		alert("이메일을입력하세요")
		return false;
	}else if(checkemail_YESorNO=="NO"){
		alert("이메일인증하세요")
		return false;
	}/* else if(!valcheck_email.test(m_email)){
		alert("메일정규표현식XXXX신호")
		jf.m_email.focus();
		return false;
	} */else if(m_age==0 || m_age==""){
		alert("나이를입력하세요")
		return false;
	}else if(m_gender==0 || m_gender==""){
		alert("성별을입력하세요")
		return false;
	}else{
		return true;
		alert("가입진행신호")
	}	
}
function readURL(input) { //프로필사진 업로드 (아직잘모름)
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
 	}
function emailcheck(){ //이메일인증번호발송
const eamil = $('#m_email').val()+$('#m_email2').val(); //input email + select(option 메일주소)
console.log('완성된 이메일 : '+ eamil); //확인용 (f12콘솔창 확인가능)
const checkinput = $('.email_check_input') //인증번호입력란 (기본값 비활성화)

	$.ajax({
		type:'GET',
		url:'/shop/member/emailoverlapcheck?email=' +eamil,
		success:function(result){
			alert(result)
			if(result==1){
				alert("이미사용중인이메일입니다")
			}else if(result==0){
				alert("사용가능한이메일입니다")
				
				$.ajax({
					type : 'GET',
					url : '/shop/member/emailcheck?email=' + eamil, //email주소를 controller emailcheck()으로
					success : function(data){
						console.log("data : "+data); //인증번호확인용 (f12콘솔창 확인가능)
						checkinput.attr('disabled',false); //인증번호입력란 활성화
						code=data; //인증번호를 code에 저장
						alert('ajax신호신호이메일신호') //확인용
					}
				})
				
			}else{
				alert("오류")
			}
		}
	})

	
}
function emailinputcheck(){ //이메일인증번호확인
	var input_code = $(".email_check_input").val(); //input 인증번호
	alert("이메일인증번호확인 테스트") //확인용
	if(input_code == code){ //input 인증번호가 발급인증번호랑 일치하면
		$("input[name=email_check_input_result]").val('YES'); //이메일인증진행 유무 YES로 값을 변경
		alert("인증번호OO")
	}else{
		$("input[name=email_check_input_result]").val('NO'); //아니면 NO
		alert("인증번호XX")
	}
}
</script>
<h3>joinform.jsp</h3>
<h1>회원가입화면</h1>
<form action="join" name="jf" method="post" enctype="multipart/form-data" onsubmit="return checkinfo()">

<input type="hidden" name="checkid_YESorNO" value="NO" /><br /> <!-- 아이디중복체크유무 -->
<input type="hidden" name="checkname2_YESorNO" value="NO" /><br /> <!-- 닉네임중복체크유무 -->
<input type="hidden" name="checkemail_YESorNO" value="NO"/> <br /> <!-- 이메일인증유무 -->

아이디 : <input type="text" id="id" name="m_id" placeholder="영문자로 시작하는 영문자 또는 숫자 6~20자 " style="width:300px;"/><input type="button" value="중복확인" onclick="checkid()" /> <br />
비밀번호 : <input type="text" name="m_pw" placeholder="8 ~ 16자 영문, 숫자 조합"/> <br /> 
이름 : <input type="text" name="m_name" /> <br /> 
<!-- 전화번호 : <input type="text" id="m_tel" name="m_tel" placeholder="휴대폰번호를 입력해주세요" style="ime-mode:disabled"> <br /> -->
전화번호:
<td>
		<input type="text" name="m_tel" id="m_tel"/> - 
		<input type="text" name="m_tel" id="m_tel"/> - 
		<input type="text" name="m_tel " id="m_tel"/>
</td>
<br />
닉네임 : <input type="text" name="m_name2" value=""/><input type="button" value="중복확인" onclick="checknickname()"/> <br />
이메일 : <input type="text" name="m_email" id="m_email" />
		<select name="m_email2" id="m_email2">
		<option>@naver.com</option>
		<option>@daum.net</option>
		<option>@gmail.com</option>
		<option>@hanmail.com</option>
		<option>@yahoo.co.kr</option>
		</select> 
		<input type="button" onclick="emailcheck()" value="인증번호전송"/>
		<input class="email_check_input" placeholder="인증번호 6자리를 입력하세요" disabled="disabled" maxlength="6" />
		<input type="button" value="확인" onclick="emailinputcheck()" />
		<input type="text" name ="email_check_input_result" value="NO"  readonly/><br /> <!-- 이메일인증진행 유무 -->
등급 : hidden<input type="hidden" name="m_grade" value="bronze" readonly/> <br /> <!-- 확인용 -->
나이 : <input type="text" name="m_age" /> <br /> 
성별 : <input type="radio" name="m_gender" value="male" />남<input type="radio" name="m_gender" value="female" />여 <br /> <!-- 확인용 -->
캐시 : hidden<input type="hidden" name="m_cash" value="500000" readonly/> <br /> 
첨부파일 : <input type="file" name="m_filesrc" accept="image/png, image/jepg" onchange="readURL(this)"/> <br />
<img id="preview" width="150px" height="150px" /><br />
<input type="submit" value="가입" />
<input type="button" value="취소" onclick="location.href='loginform'" />
</form>
</body>
</html>