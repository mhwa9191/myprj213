<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/reviewstyle.css" />
<script src="../resources/js/jquery-3.6.1.min.js"></script>
<script src="../resources/js/jquery.bpopup.min.js"></script>
<script src="../resources/js/scriptjsp.js"></script>
<script>
	$(document).ready(function(){
		$(".u_content").click(function(){
			/* $(this).addClass("u_content"); */
			$(this).toggleClass("u_content").toggleClass("u_contentGray");
			
		});
		
		/* 답글버튼 눌렀을 때 작동하도록 */
		$(".atag_reply").click(function () {
			/* alert("하이") */
			/* $(this).hide(".reply_box"); */
		})
	});
	
</script>
</head>

<body>
<h3>Reviewboard</h3>
<!-- 오류 -->
<%-- <a href="reviewMylistview?account=${review_mylist.m_id }" >마이페이지</a> --%>
<!-- <a href="reviewListview">TEMP님</a> -->
<!-- 임시로 지정 -->
<a href="reviewMylistview" >마이페이지</a>
	
<div class="review_table">
		<div class="selectandsearch_box">
			<div class="select_box">
				<h3>리뷰</h3>
			</div>
			<div><a class="atag_reviewwrite" href="reviewWriteview">리뷰작성</a></div>
			<br />
			<div class="avg_star">
				<div class="tablerow">
					<div class="tablecell">
					<span class="user_date">
						<span class="star">
							★★★★★
							<span id="star2" style="width:${avgScore*20}%">★★★★★</span>
						</span>
					</span>
					</div>
					<div class="tablerow">
						<b>&nbsp;&nbsp;&nbsp;&nbsp;총점</b>
					</div>
				</div>
				<div>
					<b>${totRowcnt }개의 REVIEWS</b>
				</div>
			</div>
			<br />
		</div>
	
	<hr />	
</div>
<div class="clear" ></div>
<div class="review_table">
		<form action="reviewBoard" method="post">
	<div class="row">
		<div class="cell col1">
		<!-- 검색기능 추가 -->
			<select name="selectType" >
				<option ${param.selectType=="r_recently"?"selected":"" } value="r_recently">최신순</option>
				<option ${param.selectType=="r_score"?"selected":"" } value="r_score">별점순</option>
			</select>
		</div>
		<div class="cell col2">
			<div class="search_box">
				<input type="text" name="searchKeyword" placeholder="리뷰 키워드 검색" size="10" value="${resk }"/>
				<input type="submit" value="검색" />
			</div>
		</div>
	</div>
		</form>
		
<c:set var="totalStar" value="0" />
<c:set var="avgStar" value="0" />
<c:forEach items="${review_list }" var="list">
	<div class="row">
		<div class="cell col1">
			<div class="review_total">
				<div class="review_box">
					<div class="review_label">
						<input type="hidden" value="${list.r_no }" />
						<p>${list.memberDto.m_id }</p>
						<p>${list.r_title }</p>
						<div class="tablerow">
							<div class="tablecell">
							<span class="user_date">
								<span class="star">
									★★★★★
									<span id="star2" style="width:${list.r_score*20}%">★★★★★</span>
									<c:set var="totalStar" value="${totalStar+list.r_score }"/>
								</span>
							</span>
							</div>
							<div class="tablerow">
								<span>&nbsp;&nbsp;&nbsp;&nbsp;${list.m_id }</span>
							</div>
						</div>
						
						<div class="product_option">
							<strong>구매옵션</strong>&nbsp;<span>색상</span>&nbsp;<span>사이즈</span>
						</div>
						<div class="user_content" onclick="user_content()"> <!-- commend -->
							<p class="u_content">${list.r_content }</p> 
						</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 답변창 만들기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div class="reply_box">
							<p>답변창</p>
						</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						
						
					</div>
				</div>
			</div>
		</div>
		<div class="cell col2">
			<div>
				<span>
					<fmt:formatDate value="${list.r_date }" pattern="yyyy.MM.dd"/>
				</span>
			</div>
			<div class="img_box">
				<img src="../resources/reviewupload/${list.r_filesrc }" width="100" alt="" />
			</div>
			<div>
				<!-- 수정/삭제 -->
				<a class="atag" href="reviewPopupcontentview?r_no=${list.r_no }">수정</a>
				<a class="atag" href="reviewDelete?r_no=${list.r_no }">삭제</a>
				
				
				<!-- function 사용한 답글창 열기 -->
				<%-- <a class="atag" href="reviewPopupReplycontentview?r_no=${list.r_no }">답글</a> --%>
				<a class="atag" id="atag_reply" href="#">답글</a>

			</div>
		</div>
	</div>
	
</c:forEach>
totalStar : <c:out value="${totalStar }"/>
avgStar : <c:out value="${avgStar+(totalStar/list_r_score.length) }"/>
<br />

<!-- 페이징 처리 -->
총 게시글 : ${totRowcnt }건 <br />
현재페이지/전체페이지 : ${searchVO.page }/${searchVO.totPage } <br />
<hr />
<form action="reviewBoard" method="post">
	<div class="paging">
		<c:if test="${searchVO.page>1 }">
			<a href="reviewBoard?page=1">&lt;&lt;</a>
			<a href="reviewBoard?page=${searchVO.page-1 }">&nbsp;&nbsp;&lt;&nbsp;&nbsp;</a>
		</c:if>
		
		<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
			<c:choose>
				<c:when test="${i eq searchVO.page }">
					<span style="color:red; font-weight: bold;">${i }&nbsp;&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="reviewBoard?page=${i }&rb_recently=${r_recently}&rb_score=${r_score}&searchKeyword=${resk}" style="text-decoration: none">${i }&nbsp;&nbsp;</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${searchVO.page<searchVO.totPage }">
			<a href="reviewBoard?page=${searchVO.page+1 }">></a>
			<a href="reviewBoard?page=${searchVO.totPage }">&nbsp;&nbsp;&nbsp;&nbsp;>></a>
		</c:if>
	</div>
</form>
	</div>
<br />
<br />
<br />
<br />
</body>
</html>