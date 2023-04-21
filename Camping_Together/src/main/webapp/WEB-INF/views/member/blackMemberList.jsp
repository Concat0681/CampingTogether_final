<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/adminMenu.jsp" />
	
	
	<div class="content-wrap">
		<div class="admin-content">
			<div class="admin-title">
				<h3>신고당한 회원</h3>
			</div>
		</div>	
		<div class="list">
			<table>
				<tr>
					<td style="border-top-left-radius: 10px;">구분</td>
					<td>피신고자</td>
					<td>게시글</td>
					<td>작성일</td>
					<td style="border-top-right-radius: 10px;">처리상태</td>
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