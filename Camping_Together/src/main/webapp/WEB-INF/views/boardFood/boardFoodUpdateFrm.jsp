<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.tbl .td-2 {
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
.cancelBtn:hover{
		color:#fff !important;
	}

</style>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="page-content">
		<div class="page-title">사진게시판 수정</div>
		<form action="/boardFoodUpdate.do" method="post" enctype="multipart/form-data" id="updateFrm">
			<table class="tbl">
				<tr class="tr-1">
					<th class="td-2">제목</th>
					<td colspan="3">
						<input type="text" name="boardFoodTitle" class="input-form" value="${bf.boardFoodTitle }">
						<input type="hidden" name="boardFoodNo" value="${bf.boardFoodNo }">
					</td>
				</tr>
				<tr class="tr-1">
					<th class="td-2">작성자</th>
					<td>
						${sessionScope.m.memberId }
						<input type="hidden" name="boardFoodWriter" value="${sessionScope.m.memberId }">
					</td>
					<th class="td-2">이미지</th>
					<td style="width:600px">
							<p>
								${bf.filepath }
								<!-- 파일 삭제 시 db는 fileno ,서버는 path 가 필요함 -->
								<button type="button" onclick="deleteFile(this,${bf.fileNo},'${bf.filepath }')">삭제</button>
							</p>
					</td>
				</tr>
				<tr class="tr-1">
					<th class="td-2">썸네일</th>
					<td colspan="3"><input type="file" name="imageFile" accept=".jpg,.png,.jpeg" onchange="loadImg(this);" multiple></td>
				</tr>
				<tr class="tr-1">
					<th class="td-2">이미지 미리보기</th>
					<td colspan="3">
						<div id="img-viewer">
							<img id="img-view" width="300px">
						</div>
					</td>
				</tr>
				<tr class="tr-1">
					<th class="td-2">내용</th>
					<td colspan="3">
						<textarea name="boardFoodContent" id="boardFoodContent" class="input-form">${bf.boardFoodContent }</textarea>
					</td>
				</tr>
				<tr class="tr-1">
					<th colspan="4">
						<a>
							<button type="submit" class="submitBtn" style="cursor: pointer;">수정하기</button>
						</a>
							<a class="cancelBtn" href="/boardFoodView.do?boardFoodNo=${bf.boardFoodNo }">취소</a>
					</th>
				</tr>
			</table>
		</form>
	</div>
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
		$("#boardFoodContent").summernote({
			height : 300,
			lang : "ko-KR"
		});
		
		
		function deleteFile(obj,fileNo, filepath){
			//fileNo, filepath input 만들어 준 후 숨기기 (form전송)
			//<input>
			const fileNoInput = $("<input>");
			//<input name="fileNo">
			fileNoInput.attr("name","fileNo");
			//<input name="fileNo" value="10">
			fileNoInput.val(fileNo);
			//<input name="fileNo" value="10" style="display:none;">
			fileNoInput.hide();
			
			const filepathInput = $("<input>");
			filepathInput.attr("name","filepath");
			filepathInput.val(filepath);
			filepathInput.hide();
			
			$("#updateFrm").append(fileNoInput).append(filepathInput);
			$(obj).parent().remove();
		}
	</script>
	 <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>