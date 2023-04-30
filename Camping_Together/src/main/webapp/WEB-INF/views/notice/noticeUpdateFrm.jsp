<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	
<style>
.note-editable{
	text-align: left;
}
* {
	text-decoration: none;
	margin: 0px;
	padding: 0px;
}

.page-content {
	width: 1200px;
	margin: 200px auto;
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
.submitBtn{
	background-color: #CEAB93;
    color: white;
    border-radius: 5px;
    border:none;
    text-decoration: none;
    width: 100px;
    height:30px;
    line-height:30px;
    text-align: center;
}
.cancelBtn{
	background-color: #CEAB93;
    color: white;
    border-radius: 5px;
    border:none;
    text-decoration: none;
    width: 100px;
    height:30px;
    line-height:30px;
    text-align: center;
    display: inline-block;
}
.cancelBtn:hover{
		color:#fff !important;
	}
</style>

	<form action="/noticeUpdate.do" method="post">
		<div class="page-content">
			<h3 class="page-title">공지사항 수정</h3>
			<table class="tbl">
			
				<tr class="tr-1">
					<th class="td-3">제목</th>
					<th colspan="6">
						<input type="text" name="noticeTitle" id="noticeTitle" value="${n.noticeTitle }" class="input-form">
					</th>
				</tr>
				<tr class="tr-1">
					<th class="td-3">글번호</th>
					<td>
					<input type="hidden" name="noticeNo" value="${n.noticeNo }">
					${n.noticeNo }
					</td>
					<th class="td-3">작성자</th>
					<td>${n.noticeWriter }</td>
					<th class="td-3">작성일</th>
					<td>${n.enrollDate }</td>
				</tr>
				<tr class="tr-1">
					<td colspan="6">
						<div>
							<textarea name="noticeContent" id="noticeContent">${n.noticeContent}</textarea>
						</div>
					</td>
				</tr>
				<tr class="tr-1">
					<th colspan="6">
					<a>
						<button type="submit" class="submitBtn" style="cursor: pointer;">수정하기</button>
					</a>
						<a class="cancelBtn" href="/noticeView.do?noticeNo=${n.noticeNo }">취소</a>
						
					</th>
				</tr>
			</table>
		</div>
	</form>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
		<script>
	
		$("#noticeContent").summernote({
			height : 400,
			lang : "ko-KR"
		});
		
	</script>
</body>
</html>