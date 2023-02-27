<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <meta content="Page description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">

  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
  
  <link href="../resources/images/apple-icon-180x180.png" rel="apple-touch-icon">
  <link href="../resources/images/favicon.ico" rel="icon">



  <title>Title page</title>  

<link href="../resources/css/checkIndex.css" rel="stylesheet">
</head>

<body>

<div class="loginJoin-box">
<c:if test="${empty sessionScope.loginid}">
   <a href="../member/loginform">login</a> 
   |  <a href="../member/joinform">join</a>

로그인이 필요합니다.
</c:if>
</div>
 <c:if test="${not empty sessionScope.loginid}">
    <a href="../member/logout">logout</a> 
 <br />
 ${sessionScope.loginid} 님, 로그인상태입니다 ദ്ദി*ˊᗜˋ*)


<!-- Add your content of header -->
<header class="">
  <div class="navbar navbar-default visible-xs">
    <button type="button" class="navbar-toggle collapsed">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a href="./index.html" class="navbar-brand">Mashup Template</a>
  </div>

  <nav class="sidebar">
    <div class="navbar-collapse" id="navbar-collapse">
      <div class="site-header hidden-xs">
          <a class="site-brand" href="./checkIndex" title="">
            <img class="img-responsive site-logo" alt="" src="../resources/images/mashup-logo.svg">
            MICKY SHOP
          </a>
        <p>마이페이지</p>
      </div>
      <ul class="nav">
        <li><a href="../order/myOrderList" title="">나의주문내역</a></li>
        <li><a href="../review/reviewMylistview" title="">나의리뷰보기</a></li>
        <li><a href="../product/productList" title="">확인작업productList</a></li>
        <li><a href="#" title="">회원정보수정란?</a></li>
        <li><a href="#" title="">추가하기</a></li>

      </ul>

      <nav class="nav-footer">
        <p class="nav-footer-social-buttons">
          <a class="fa-icon" href="https://www.instagram.com/" title="">
            <i class="fa fa-instagram"></i>
          </a>
          <a class="fa-icon" href="https://dribbble.com/" title="">
            <i class="fa fa-dribbble"></i>
          </a>
          <a class="fa-icon" href="https://twitter.com/" title="">
            <i class="fa fa-twitter"></i>
          </a>
        </p>
        <p>Â© Untitled | Website created with <a href="http://www.mashup-template.com/" title="Create website with free html template">Mashup Template</a>/<a href="https://www.unsplash.com/" title="Beautiful Free Images">Unsplash</a></p>
      </nav>  
    </div> 
  </nav>
</header>
<main class="" id="main-collapse">

<!-- Add your site or app content here -->
 
<div class="hero-full-wrapper">
  <div class="grid">
  <div class="gutter-sizer"></div>
    <div class="grid-sizer"></div>
    
    <div class="grid-item">
      <img class="img-responsive" alt="" src="../resources/images/img-12.jpg">
      <a href="./project.html" class="project-description">
        <div class="project-text-holder">
          <div class="project-text-inner">
            <h3>Vivamus vestibulum</h3>
            <p>Discover more</p>
          </div>
        </div>
      </a>
    </div>

    


    
  </div>
</div>



<script>
  document.addEventListener("DOMContentLoaded", function (event) {
     masonryBuild();
  });
</script>

</main>

<script>
document.addEventListener("DOMContentLoaded", function (event) {
  navbarToggleSidebar();
  navActivePage();
});
</script>

<!-- Google Analytics: change UA-XXXXX-X to be your site's ID 

<script>
  (function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
      (i[r].q = i[r].q || []).push(arguments)
    }, i[r].l = 1 * new Date(); a = s.createElement(o),
      m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
  })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
  ga('create', 'UA-XXXXX-X', 'auto');
  ga('send', 'pageview');
</script>

--><script type="text/javascript" src="../resources/js/checkIndex.js"></script>

 </c:if>
</body>


</html>