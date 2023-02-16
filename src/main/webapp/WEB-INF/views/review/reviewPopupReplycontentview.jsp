<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%String loginid = (String)session.getAttribute("loginid"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/reviewstyle.css" />
<script src="../resources/js/jquery-3.6.1.min.js"></script>
<script src="../resources/js/jquery.bpopup.min.js"></script>


</head>
<body>
<h3>reviewPopupReplycontentview</h3>
<h1>리뷰 답글달기</h1>
<input type="button" value="리뷰작성" onclick="rWrite();" />


<div id="styleID_ReviewWriteview" class="styleClassReviewWriteview">
	<div id="title_content">
		<!-- <form action="reviewPopupcontentupdate" method="post" enctype="multipart/form-data"> -->
		<form action="reviewPopupreply" method="post">
			<input type="hidden" name="r_no" value="${replyview.r_no }" />
			<input type="hidden" name="r_group" value="${replyview.r_group }" />
			<input type="hidden" name="r_step" value="${replyview.r_step }" />
			<input type="hidden" name="r_indent" value="${replyview.r_indent }" />
			<input type="hidden" name="r_score" value="${replyview.r_score }" />
			<h3 class="popup_review_title">답글쓰기</h3>
			<div>
				<strong>리뷰 리워드 혜택 제공</strong> <br />
				텍스트 리뷰 : 500M | 사진 첨부 리뷰 : 1,000M 적립
			</div>
			<br />
			<br />
				<table>
					<tr>
						<td class="left">작성자</td>
						<td>${replyview.m_id }</td>
					</tr>
					<tr>
						<td class="left">관리자</td>
						<td><input type="text" name="r_id" /></td>
					</tr>
					<!-- <tr>
						reviewdao.xml에서 'TEMP'로 사용 중
					
						작성자는 session으로 받아올 것, 이후 작성자란은 삭제
						<td class="left">작성자</td>
						<td><input type="text" name="m_id" /></td>
					</tr> -->
					<tr>
						<td class="left">제목</td>
						<td>
							<input type="text" name="r_retitle" value="${replyview.r_title }" />
						</td>
					</tr>
					<tr>
						<td class="left">내용</td>
						<td>
							<textarea name="r_recontent" rows="10">${replyview.r_content }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="작성하기" />
						</td>
					</tr>
				</table>
		</form>
	</div>
</div>
</body>
<script>
	function rWrite(){
		$(".styleClassReviewWriteview").bPopup();
	}
</script>
</html>