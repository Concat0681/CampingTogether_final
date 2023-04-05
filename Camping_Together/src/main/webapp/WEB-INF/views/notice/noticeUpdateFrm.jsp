<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	
<style>
* {
	text-decoration: none;
	margin: 0px;
	padding: 0px;
}

.page-content {
	width: 1200px;
	margin: 30px auto;
	margin-bottom: 10px;
	flex-grow: 1;
}

.page-title {
	font-family: ns-bold;
	padding: 20px 0px;
	font-size: 1.5rem;
}

.tbl {
	width: 100%;
	border-spacing: 0px;
	border-collapse: collapse;
}

.tbl th, .tbl td {
	padding: 10px;
	text-align: center;
}

.tbl .tr-1 {
	background-color: rgba(255, 255, 255, 1);
	border: 1px solid #e3e4e5;
}

.tbl .tr-2 {
	border: 1px solid #e3e4e5;
	background-color: #E3CAA5;
}

.btn {
	border: none;
	padding: 5px;
	display: inline-block;
	box-sizing: border-box;
	transition-duration: 0.5s;
	font-size: 16px;
	font-family: ns-light;
	font-weight: bold;
}

.bc4 {
	background-color: #AD8B73;
	color: #fff;
	border: 2px solid #AD8B73;
}

.tbl .td-3 {
	background-color: #E3CAA5;
	color: #fff
}

.input-form {
	width: 100%;
	height: 30px;
	display: block;
	background-color: #fff;
	outline: none;
	border: 1px solid #ccc;
	box-sizing: border-box;
	text-align: center;
	border: none;
}
p{
	text-align: left;
}
</style>
	<form action="/noticeUpdate.do" method="post">
		<div class="page-content">
			<h3 class="page-title">공지사항 수정</h3>
			<table class="tbl">
				<th class="td-3" colspan="6">제목</th>
				<tr class="tr-1">
					<th colspan="6">
						<input type="text" name="noticeTitle"value="${n.noticeTitle }" class="input-form">
					</th>
				</tr>
				<tr class="tr-1">
					<th class="td-3">글번호</th>
					<td>${n.noticeNo }</td>
					<th class="td-3">작성자</th>
					<td>${n.noticeWriter }</td>
					<th class="td-3">작성일</th>
					<td>${n.enrollDate }</td>
				</tr>
				<tr class="tr-1">
					<td colspan="6">
						<div id="noticeContent" style="height: 400px; text-align: left;">
							<textarea name="noticeContent">${n.noticeContent}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="수정하기">
					</th>
				</tr>
			</table>
		</div>
	</form>
		<script>
		//써머노트 태그제거
		const t = $("[name=noticeContent]").text();
		$("#noticeContent").html(t);
		
		$("#noticeContent").summernote({
			height : 400,
			lang : "ko-KR"
		});
		
	</script>
</body>
</html>