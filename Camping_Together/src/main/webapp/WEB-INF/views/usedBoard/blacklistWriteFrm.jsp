<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	p{
		margin-bottom: 8px !important;
	}
	.page-content{
		width: 1200px;
		margin: 0 auto;
		padding-top: 130px;
	}
	.content-top>h2{
		margin: 20px;
		padding-top: 20px;
		font-family: ng-bold;
	}
	.detail-wrap{
   		width: 100%;
   		padding: 10px 20px;
   		margin: 30px auto;
   		border-bottom: 1px solid #ccc;
   }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-content">
		<div class="content-top">
			<h2>신고글 작성</h2>
			<hr>
		</div>
		<div class="detail-wrap">
			<div class="blacklist-guide">
				<p>
					선택한 게시물의 작성자를 신고합니다.<br>
					작성자 신고는 거래수칙에 맞지 않는 사용자를 신고하는 기능이며, 반대의견을 표시하는 것이 아닙니다.<br>
					[${sessionScope.m.memberName }]님의 관심과 신고가 건전하고 올바른 Camping Together문화를 만듭니다.<br>
					허위 신고의 경우 신고자가 제재받을 수 있음을 유념해주세요.<br>
				</p>
			</div>
			<div class="blacklist-write-wrap">
				<div class="blacklist-category">
					<div class="writer-title"><span>구분</span></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>