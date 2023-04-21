<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/adminMenu.jsp" />
	
	<div class="content-wrap">
		<div class="admin-content">
			<div class="admin-title">
				<h3>SHOP 판매 상품</h3>
				<div class="insert-btn" id="insertBtn"><span class="material-symbols-outlined">edit_note</span><a href="/insertShopFrm.do">상품 등록</a></div>
			</div>
		</div>
		
		<div class="list">
			<table>
				<tr>
					<td style="border-top-left-radius: 10px;">No</td>
					<td>상품 명</td>
					<td>가격</td>
					<td>이미지</td>
					<td style="border-top-right-radius: 10px;">평점</td>
				</tr>
				<tr>
					<td>1</td>
					<td>1</td>
					<td>3</td>
					<td>3</td>
					<td>4</td>
				</tr>
			</table>
		  <div class="pagination all-navi">
				${navi }
		  </div>
		</div>
		
		
	</div>
	
</body>
</html>