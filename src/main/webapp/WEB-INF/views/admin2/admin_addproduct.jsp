<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>admin_addproduct</h3>

<form action="adminProductInsert" method="post" enctype="multipart/form-data">
<!-- 	상품번호  -->
<!-- 	<input type="text" name="p_no" /> <br /> -->
	상품명 
	<input type="text" name="p_name" /> <br />
	가격 
	<input type="text" name="p_price" /><br />
	재고 
	<input type="text" name="p_cnt" /><br />
<!-- 	상품등록일  -->
<!-- 	<input type="date" name="p_date" /><br /> -->
	색상 
	<input type="text" name="p_color" /><br />
	사이즈 
	<select name="p_size">
		<optgroup label="size">
			<option>085XS</option>
			<option>090S</option>
			<option selected>095M</option>
			<option>100L</option>
			<option>105XL</option>
		</optgroup>
	</select><br />
	상품이미지  
	<input type="file" name="p_filesrc" /><br />
	상품카테고리  
	<input type="text" name="p_category" /><br />
	상품내용  
	<textarea name="p_info"></textarea><br />
	<input type="submit" value="상품등록" /><br />
</form>	
	
</body>
</html>