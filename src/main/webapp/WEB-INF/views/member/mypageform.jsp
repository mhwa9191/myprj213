<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String loginid = (String)session.getAttribute("loginid"); %> <!-- 로그인된아이디 스트링으로가져오기 -->   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>mypageform.jsp</h3>
<h1>마이페이지</h1>

현재로그인된아이디 확인용: <%=session.getAttribute("loginid") %> <br /> <!-- 로그인아이디 확인용 -->
<%if(!loginid.equals("admintest")){ %>
<input type="button" value="문의페이지" onclick="location.href='qnalist'" />
<input type="button" value="내정보수정" onclick="location.href='infoupdateform'" />
<input type="button" value="회원탈퇴" onclick="window.open('memberdropcheckform','','width=500,height=500')" />
<%
}
%>
<input type="button" value="메인페이지" onclick="location.href='main'" />

</body>
</html>