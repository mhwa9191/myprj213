<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Micky Sports Wear</title>
 <style>

header{
	background: #2c2a29;
	position: fixed;
	top: 0;
 	width: 100%;
	display: flex;
	flex-direction: row;
	align-items: center;
}
  header .head-wrap{
	border: solid 0px black;
	height: 120px;
	width: 1100px;
} 
 header .head-wrap .head-wrap-inner{
	height: 120px;
	width: 1100px;
	position: relative; 
	border: solid 0px black;
} 
header .head-wrap .head-wrap-inner .head-logo{
	position: absolute;
	top: 20px;
	width: 75px;
	height: 75px;
}
 header .head-wrap .head-wrap-innter .head-menu-top-nav{
	position: absolute;
	left: 552px;
	top: 21px;
} 
header .head-wrap.head-wrap-innter .head-menu-top-nav ul{
	list-style: none;
}
 header .head-wrap.head-wrap-innter .head-menu-top-nav ul li{
	float: left;
	color: white;
	font-size: 13px;
	text-align: center;
	height: 20px;
	border: solid 0px black;
} 
header .head-wrap .head-wrap-innter .head-menu-top-nav ul li a{
	text-decoration: none;
	color: white;
}
header .head-wrap .head-wrap-innter .head-menu-top-nav ul li a:hover{
	text-decoration: underline;
	color: #bcbcbc;
}
 header .head-wrap .head-wrap-innter .head-menu-top-nav ul .top-nav1{
	width: 76px;
}
header .head-wrap .head-wrap-innter .head-menu-top-nav ul .top-nav2{
	width: 106px;
}
header .head-wrap .head-wrap-innter .head-menu-top-nav ul .top-nav3{
	width: 181px;
}  
 header .head-wrap-sub{
	display: flex;
	justify-content: flex-end;
}  
 header .head-wrap-sub ul{
	list-style: none;
	width: 737px;
	display: flex;
	justify-content: space-between;
	border: solid 0px black;
} 
 header .head-wrap-sub ul li a{
	text-decoration: none;
	display: block;
	border: solid 0px black;
	text-transform: uppercase;
	font-size: 13px;
	padding-top: 10px;
	height: 66px;
} 
header .head-wrap-sub ul li a:hover{
	text-decoration: underline;
	color: #bcbcbc;
}

</style>
</head>
<body>
<header>
    <div class="head-wrap">
    <div class="head-wrap-inner">
      <img class="head-logo" src="resources/img/admin/mickylogo_icon.png">
	<nav class="head-menu-top-nav">
   		<ul>
	   		<li class="top-nav1"><a href="#">home</a></li>
	   		<li class="top-nav3"><a href="#">logout</a></li>
	   		<li class="top-nav2"><a href="#">My admin page</a></li>
   		</ul>
 	</nav>
    </div>
    
    <div class="head-wrap-sub">
    <nav class="head-menu-main-nav">
    	<ul>
	      <li class="main-nav1"><a href="#">회원관리</a></li>
	      <li class="main-nav2"><a href="#">상품관리</a></li>
	      <li class="main-nav3"><a href="#">주문관리</a></li>
	      <li class="main-nav4"><a href="#">chart</a></li>
    	</ul>
    </nav>
    </div>
    
  </div>
</header>

</body>
</html>