<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 foorter{
	height: 200px;
	margin-top: 30px;
	background-color: #2c2a29;
	border: solid 1px black;
	position: absolute;
} 
#footer_box{
	height:200px;
	margin: 0 auto;
	background-color: #2c2a29;
	border: solid 1px black; 	
}
#footer_logo{
	float: left;
	margin: 30px 5px 30px 50px;
	/* border: solid 1px black; */
	/* background-color: white; */
}
#footer_box #footer_detail{
	float: right;
	margin: 30px 50px 0 5px;
/* 	border: solid 1px black; */
	color: white;
}
.homelink{
	text-decoration: none;
}
</style>
</head>
<body> 
<footer>
	<div id="footer_box">
		<div id="footer_logo">
			<img src="resources/img/admin/mickylogo_icon.png">
		</div>
		<div id="footer_detail">
			<span>(주)mickysportswear</span><span>  |  </span>
			<span>사업자등록번호 : 0000-00-0000</span><span>  |  </span>
			<span>대표:micky</span>
			<p>주소 : 서울특별시 구로구 시흥대로163길 33 주호타워 2층,3층</p>
			<span>온라인몰 고객지원실 02-837-9922</span><span>  |  </span>
			<span> 매장고객 및 A/S문의: 1111-0000</span>
			<p>Copyright © Micky Sports Wear 2023 All Rights Reserved.</p>
		</div>
	</div>
</footer>
</body>
</html>