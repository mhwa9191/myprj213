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
			$(this).toggleClass("u_content").toggleClass("u_contentGray");
		});
	});
	
	/* 별점 */		
	function redeptlist(target) {
		alert("target : "+target.value);
		$('#starInput[name=r_score]').attr('value',target.value);	
	}
	
	function getvalue(target) {
		alert(target.value);
	} 

	/* 리뷰작성 로그인 확인 */
	function fn_01(checked_id){
		if(fn_02(checked_id)==false){
			alert('로그인이 필요합니다.');
			$(location).attr('href','../member/loginform');
		}else{
			$(location).attr('href','reviewWriteview')
		}
	}
	function fn_02(checked_id){
		if(checked_id=='' || checked_id==null){
			return false;
		}else{
			return true;
		}
	}
	
	/* admin-답글 */
	$(document).ready(function(){
		  $('#reply_menu > div > a').off().on("click",function(){
		    $(this).next($('.snd_menu')).slideToggle();
		  });
		});
	
</script>
</head>

<body>

<h3>Reviewboard</h3>
<a href="../member/main">메인</a> <br />
<c:if test="${empty sessionScope.loginid }">
	<a href="../member/loginform">login</a> 
	<a href="">join</a>
</c:if>
<c:if test="${not empty sessionScope.loginid }">
	<a href="../member/logout">logout</a> 
	<a href="reviewMylistview?account=${sessionScope.loginid }">${sessionScope.loginid }님</a>
	
<br />
</c:if>

<br />


<style>
  .js-load {
    display: none;
}
.js-load.active {
    display: block;
}
.is_comp.js-load:after {
    display: none;
}
.btn-wrap, .lists, .main {
    display: block;
}
.main {
    max-width: 100%;
    margin: 0 auto;
}
.lists {
    margin-bottom: 4rem;
}
.lists__item {
    padding: 20px;
    /* background: #EEE; */
}
.lists__item:nth-child(2n) {
    /* background: #59b1eb;
    color: #fff; */
}
.btn-wrap {
    text-align: center;
}
  </style>

<div class="review_table">
		<div class="selectandsearch_box">
			<div class="select_box">
				<h3>리뷰</h3>
			</div>
			<div>
				<input type="button" value="리뷰작성" onclick="fn_01('${sessionScope.loginid }');" />
							
			<br />
			
			<div class="avg_star">
				<div class="tablerow">
					<div class="tablecell">
						<span class="user_date">
							<span class="reviewBoard_star">
								★★★★★
								<span id="star2" style="width:${avgScore*20}%">★★★★★</span>
							</span>
						</span>
					</div>
					<div class="tablerow">
						<b>&nbsp;&nbsp;&nbsp;&nbsp;${avgStar }  총점</b>
					</div>
				</div>
				<div>
					<b>${totalCount }개의 REVIEWS</b>
				</div>
			</div>
			<br />
		</div>
	
<hr />	
</div>
</div>
<div class="clear" ></div>

<div class="review_table">

		<!-- select, option, 검색 -->
		<form action="reviewBoard" method="get">
			<input type="hidden" name="pname" value="${pname }" />
			<input type="hidden" name="pfilesrc" value="${pfilesrc }" />
			<div class="row">
				<div class="cell col1">
				<!-- 검색기능 추가 -->
					<select name="selectType" >
						<option ${param.selectType=="r_recently"?"selected":"" } value="r_group">최신순</option>
						<option ${param.selectType=="r_score"?"selected":"" } value="r_score">별점순</option>
					</select>
				</div>
				
				<!-- 키워드 검색 -->
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

<div id="contents">
	<div id="js-load" class="main">
		<ul class="lists">
<c:forEach items="${review_list }" var="list">
			<li class="lists__item js-load">
	<div class="row">
		<div class="cell col1">
			<div class="review_total">
				<div class="review_box">
					<div class="review_label">
						<input type="hidden" value="${list.r_no }" />
						<span>${list.r_no }</span>
						<p>
							${list.memberDto.m_id }
						</p>
						<p>${list.productDto.p_name }</p>
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
								<span>&nbsp;&nbsp;&nbsp;&nbsp;${list.memberDto.m_id }</span>
							</div>
						</div>
						
						<div class="product_option">
							<strong>구매옵션</strong>&nbsp;<span>${list.productDto.p_color }</span>&nbsp;<span>${list.productDto.p_size }</span>
						</div>
						<div class="user_content" onclick="user_content()"> <!-- commend -->
							<p class="u_content">${list.r_content }</p> 
						</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 답변창 만들기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<style> /* css로 옮기면 적용되지 않음 */
							ul { padding: 0; }
							li {
							  list-style: none;
							  line-height: 34px;
							}
							.sub_menu { display: none; }
						</style>
						<div id="reply_menu">
							<div>
								<a class="${list.r_no }" href="#" onclick="return false">댓글()</a>
								<div class="snd_menu sub_menu">
									<div>${list.r_retitle }</div>
									<div>${list.r_recontent }</div>
								</div>
							</div>
						</div>
<c:if test="${sessionScope.loginid eq 'admintest' }">
						        <div id="reply_menu">
						          <div><a class="${list.r_no }" href="#" onclick="return false">댓글달기</a>
						            <div class="snd_menu sub_menu">
						            	<form action="reviewPopupreply">
						            		<input type="hidden" name="r_no" value="${list.r_no }" />
						            		<div><input type="hidden" name="r_id" value="${sessionScope.loginid }" />관리자</div>
						            		<div><input type="text" name="r_retitle" size="25" value="믹키 스포츠웨어 온라인 스토어" /></div>
							            	<div><textarea name="r_recontent" cols="100%" rows="3" placeholder="댓글을 입력하세요"></textarea></div>
							            	<input type="submit" value="답글" />
						            	</form>
						            </div>
						          </div>
								</div>
</c:if>
						<div>
						</div>
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
<c:if test="${sessionScope.loginid eq list.memberDto.m_id }">
				<a id="practice" href="reviewPopupcontentview?r_no=${list.r_no }">수정</a>
				<a href="reviewDelete?r_no=${list.r_no }">삭제</a>

</c:if>
				<!-- function 사용한 답글창 열기 -->
				<%-- <a class="atag" href="reviewPopupReplycontentview?r_no=${list.r_no }">답글</a> --%>
<c:if test="${sessionScope.loginid eq 'admintest' }">
				<a href="reviewDelete?r_no=${list.r_no }">삭제</a>
				<a class="" onclick="return false;" href="#">답글폼</a>
				
</c:if>
			</div>
		</div>
	</div>

	
			</li>
</c:forEach>
		</ul>
	<div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button">더보기</a></div>
</div>
</div>
totalStar : <c:out value="${totalStar }"/>

avgStar : <c:out value="${avgStar+(totalStar div totalCount) }"/>
<br />

	</div>
<br />
<br />
<br />
<br />

</body>
<script>
  $(window).on('load', function () {
    load('#js-load', '10');
    $("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '10', '#js-btn-wrap');
    })
});
 
function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $('.button').hide()
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}
</script>
</html>