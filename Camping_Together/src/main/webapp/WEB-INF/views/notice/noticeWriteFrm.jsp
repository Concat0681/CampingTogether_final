<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<style>
*{
	text-decoration: none;
	margin: 0px;
	padding: 0px;
}
.page-content {
  width: 1200px;
  margin: 200px auto;
  margin-bottom: 10px;
  flex-grow: 1;
  position: relative;
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
.tbl th,
.tbl td {
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
  color: #fff;
}
.input-form {
  width: 100%;
  height:30px;
  display: block;
  background-color: #fff;
  outline: none;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
textarea.input-form {
  resize: none;
}
.tbl .td-3 {
  background-color: #E3CAA5;
  color: #fff
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
</style>
<body>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="page-content">
		<h3 class="page-title">공지사항 작성</h3>
		<form action="/noticeWrite.do" method="post">
			<table class="tbl" id="noticeWrite">
				<tr class="tr-1">
					<th class="td-3">제목</th>
					<td colspan="3">
						<input type="text" name="noticeTitle" class="input-form">
					</td>
				</tr>
				<tr class="tr-1">
					<th class="td-3">작성자</th>
					<td>
						${sessionScope.m.memberId }
						
						<%--데이터 전송용(숨기기) --%>
						<input type="hidden" name="noticeWriter" value="${sessionScope.m.memberId }">
					</td>
				</tr>
				<tr class="tr-1">
					<td colspan="4" style="text-align:left;">
						<textarea id="noticeContent" name="noticeContent" class="input-form"></textarea>
					</td>
				</tr>
				<tr class="tr-1">
					<td colspan="4">
						<button type="submit" class="submitBtn">작성</button>
						<a class="cancelBtn" href="/noticeList.do?reqPage=1" style="font-family: none;">취소</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	//이미지 미리보기
	function loadImg(f){
		//첨부파일이 여러개일 수 있어서 항상 배열처리
		console.log(f.files);
		//파일 갯수가 0개가 아니고 && 첫 번째 파일이 정상파일이면
		if(f.files.length != 0 && f.files[0] !=0){
			const reader = new FileReader();//파일정보를 얻어올 수 있는 객체
			//선택한 파일 정보를 읽어옴
			reader.readAsDataURL(f.files[0]);
			//파일리더가 정보를 다 읽어오면 동작할 함수
			reader.onload = function(e){
				//읽어오면 결과가 e에 매개변수에 들어와있음 attr을 통해 src적용
				$("#img-view").attr("src",e.target.result);
			}
		}else{
			//src 값 삭제
			$("#img-view").attr("src","");
		}
	}
	
	//써머노트
	$(document).ready(function() {

var toolbar = [
  // 글꼴 설정
  ['fontname', ['fontname']],
  // 글자 크기 설정
  ['fontsize', ['fontsize']],
  // 글자색
  ['color', ['forecolor','color']],
  // 글머리 기호, 번호매기기, 문단정렬
  ['para', ['ul', 'ol', 'paragraph']],
  // 줄간격
  ['height', ['height']],
  // 그림첨부, 링크만들기, 동영상첨부
  ['insert',['picture','link','video']],
  // 코드보기, 확대해서보기, 도움말
  ['view', ['codeview','fullscreen', 'help']]
 ];

var setting = {
  height : 300,
  minHeight : null,
  maxHeight : null,
  focus : true,
  lang : 'ko-KR',
  toolbar : toolbar,
  callbacks : { //여기 부분이 이미지를 첨부하는 부분
     onImageUpload : function(files, editor, welEditable) {
        for (var i = files.length - 1; i >= 0; i--) {
           uploadSummernoteImageFile(files[i],this);
        }
     }
  }
};

$('#noticeContent').summernote(setting);
});

function uploadSummernoteImageFile(file, el) {
     data = new FormData();
     data.append("file", file);
     $.ajax({
        data : data,
        type : "POST",
        url : "/uploadSummernoteImageFile.do",
        contentType : false,
        enctype : 'multipart/form-data',
        processData : false,
        success : function(data) {
           $(el).summernote('editor.insertImage', data.url);
        }
     });
  }

	</script>
</body>
</html>