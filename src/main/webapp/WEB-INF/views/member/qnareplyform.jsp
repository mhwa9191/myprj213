<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String loginid = (String)session.getAttribute("loginid"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>qnareplyform.jsp</h3>
<h1>문의글답변화면</h1>
<form action="qnareply">
<input type="hidden" name="q_mno" value="${qnadetail.q_mno }" />
<%-- <input type="hidden" name="q_mynn" value="${qnadetail.q_mynn }" /> --%>
<input type="hidden" name="q_mdate" value="${qnadetail.q_mdate }" />
<input type="hidden" name="q_mgroup" value="${qnadetail.q_mgroup }" />
<input type="hidden" name="q_mstep" value="${qnadetail.q_mstep }" />
<input type="hidden" name="q_mindent" value="${qnadetail.q_mindent }" />

<table>
	<tr>
		<td class = "left">제목</td>
		<td><input type="text" name="q_mtitle" value="${qnadetail.q_mtitle }" readonly/></td>
	</tr>
	<tr>
		<td class = "left">내용</td>
		<td><textarea name="q_mcontent" readonly>${qnadetail.q_mcontent }</textarea></td>
	</tr>
	<%-- <tr>
		<td class = "left">아이디</td>
		<td><input type="text" name="q_mid" value="<%=session.getAttribute("loginid") %>" readonly /></td>
	</tr> --%>
	<tr>
		<td class = "left">아이디</td>
		<td><input type="text" name="q_mid" value="${qnadetail.q_mid }" readonly /></td>
	</tr>
	<tr>
		<td class = "left">답변</td>
		<td><textarea name="q_mreply" ></textarea></td>
	</tr>
	<tr>
		<td colspan = "2">
		<input type="submit" value="답변하기" /> &nbsp;&nbsp;
		<a href="adminqnalist">관리자게시판의 문의글목록</a> &nbsp;&nbsp;
		<!-- <a href="#">삭제</a> &nbsp;&nbsp;
		<a href="#">답변폼으로</a> &nbsp;&nbsp; -->
		</td>
	</tr>
</table>
</form>
</body>
</html>