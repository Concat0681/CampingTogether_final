<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
	#boarFooddView th, #boarFooddView td{
		border : 1px solid #eee;
	}
	#boardFoodContent{
		text-align : left;
		min-height : 300px;
	}
	
	
	.inputCommentBox{
		margin: 50px;
	}
	.inputCommentBox>form>ul{
		list-style-type: none;
		display:flex;
	}
	.inputCommentBox>form>ul>li:first-child{
		width : 15%;
		display : flex;
		justify-content : center;
		align-items : center;
	}
	.inputCommentBox>form>ul>li:first-child>span{
		font-size : 80px;
		color : #ccc;
	}
	.inputCommentBox>form>ul>li:nth-child(2){
		width : 75%;
	}
	.inputCommentBox>form>ul>li:nth-child(2)>textarea{
		height : 96px;
		min-height : 96px;
	}
	.inputCommentBox>form>ul>li:last-child{
		width : 10%;
	}
	.commentBox{
		margin : 50px
	}
	.inputReCommentBox{
		margin : 30px 0px;
		display : none;
	}
	
	
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
}

.btn{
  border: none;
  padding: 5px;
  display: inline-block;
  box-sizing: border-box;
  transition-duration: 0.5s;
  font-size: 16px;
  font-family: ns-light;
  font-weight:bold;
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



.posting-comment {
  display: flex;
  border-top: 2px solid #ccc;

  list-style-type: none;
}
.posting-comment > li {
  box-sizing: border-box;
}
.posting-comment > li:first-child {
  width: 15%;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100px;
  border-right: 1px solid #ccc;
}
.posting-comment.reply > li:first-child {
  width: 20%;
}
.posting-comment > li:first-child .material-icons {
  font-size: 80px;
  color: #ccc;
}
.posting-comment.reply > li:first-child .material-icons:first-child {
  font-size: 40px;
  color: #ccc;
}
.posting-comment.reply > li:last-child {
  display: flex;
  flex-direction: column;
  width: 80%;
}
.posting-comment > li:last-child {
  display: flex;
  flex-direction: column;
  width: 85%;
}
.posting-comment > li:last-child > p {
  width: 100%;
  padding: 5px;
  box-sizing: border-box;
}
.posting-comment > li:last-child > .comment-info > span {
  padding: 0px 10px;
}
.posting-comment > li:last-child > .comment-info > span:not(:last-child) {
  border-right: 2px solid #ccc;
}
.posting-comment > li:last-child > .comment-content {
  padding: 0px 15px;
}
.posting-comment > li:last-child > .comment-link {
  text-align: right;
}
.posting-comment > li:last-child > .comment-link > a {
  margin: 0px 5px;
}
.posting-comment > li:last-child > .comment-link > a:hover {
  text-decoration: underline;
}

.input-form {
  width: 100%;
  display: block;
  padding: 0.8rem;
  background-color: #fff;
  outline: none;
  border: 1px solid #CEAB93;

  box-sizing: border-box;
}
.input-form:focus {
  box-shadow: 0 0 0 0.1rem #eee;
}

textarea.input-form {
  resize: none;
  min-height: 300px;
}
.input-form:read-only:not(select),
.input-form:disabled {
  background-color: #f7f7f9;
}

.bs4 {
  width: 100%;
  padding: 2rem;
  font-size: 1.2em;
}
.bc1 {
  background-color: #CEAB93 ;
  color: #fff;
  border: 2px solid #CEAB93;
}
.bc44 {
  color: rgba(0, 173, 181, 1);
  background-color: #fff;
  border: 2px solid rgba(0, 173, 181, 1);
}
button{
	cursor: pointer;
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
a{
	font-family: none;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-content">
		<div class="page-title">자유게시판</div>
		<table class="tbl" id="boarFooddView">
			<tr class="tr-3">
				<th class="td-3">제목</th>
				<th colspan="6">${bf.boardFoodTitle }</th>
			</tr>
			<tr class="tr-1">
				<th class="td-3">작성자</th>
				<td>${bf.boardFoodWriter }</td>
				<th class="td-3">작성일</th>
				<td>${bf.enrollDate }</td>
				<th class="td-3">조회수</th>
				<td>${bf.readCount }</td>
			</tr>
			<tr class="tr-1">
				<th class="td-3">첨부파일</th>
				<td colspan="5">
					<c:if test="${not empty bf.filepath}">
					<img src="/resources/image/file.png" width="16px">
					<a href="/boardFoodFileDown.do?fileNo=${bf.fileNo }" style="font-family: none;" >
						${bf.filepath }
					</a>
					<input type="hidden" name="imageFile" accept=".jpg,.png,.jpeg" onchange="loadImg(this);" >
					</c:if>
				</td>
			</tr>
<!-- 			<tr class="tr-1"> -->
<!-- 					<th class="td-3">이미지 미리보기</th> -->
<!-- 					<td colspan="5"> -->
<!-- 						<div id="img-viewer"> -->
<!-- 							<img id="img-view" width="300px"> -->
<!-- 						</div> -->
<!-- 					</td> -->
<!-- 				</tr> -->
			<tr class="tr-1">
				<td colspan="7">
					<div id="boardFoodContent">
						${bf.boardFoodContent }
					</div>
				</td>
			</tr>
			<%--로그인이 되어있고, 로그인한 아이디랑 작성자가 같은 사람 --%>
			<c:if test="${not empty sessionScope.m && sessionScope.m.memberId eq bf.boardFoodWriter }">
			<tr class="tr-1">
				<th colspan="7">
					<a class="cancelBtn" href="/boardFoodUpdateFrm.do?boardFoodNo=${bf.boardFoodNo }">수정</a>
					<a class="cancelBtn" href="/boardFoodDelete.do?boardFoodNo=${bf.boardFoodNo }">삭제</a>
				</th>
			</tr>
			</c:if>
		</table>
		
		<div class="commentBox">
			<c:forEach items="${fcList }" var="fc" varStatus="i">
			<ul class="posting-comment">
				<li>
					<span class="material-icons">account_box</span>
				</li>
				<li>
					<p class="comment-info">
						<span>${fc.foodCommentWriter }</span>
						<span>${fc.foodCommentDate }</span>
					</p>
					<p class="comment-content">${fc.foodCommentContent }</p>
					<textarea name="foodCommentContent" class="input-form" style="min-height:96px;display:none;">${fc.foodCommentContent }</textarea>
					<p class="comment-link">
						<c:if test="${not empty sessionScope.m}">
							<%--로그인한 아이디와 작성자가 같은사람 --%>
							<c:if test="${sessionScope.m.memberId eq fc.foodCommentWriter }">
								<a href="javascript:void(0)" onclick="modifyComment(this,${fc.foodCommentNo },${bf.boardFoodNo });" style="font-family: none;">수정</a>
                          		<a href="javascript:void(0)" onclick="deleteComment(this,${fc.foodCommentNo },${bf.boardFoodNo });" style="font-family: none;">삭제</a>
							</c:if>
							 <a href="javascript:void(0)" class="recShow" style="font-family: none;">답글달기</a>
						</c:if>
					</p>
				</li>				
			</ul>
			
			 <%--대댓글 출력 --%>
            <c:forEach items="${fcreList }" var="fcc" varStatus="i">
            	<c:if test="${fcc.foodCommentRef eq fc.foodCommentNo }">
            	<ul class="posting-comment reply">
            		<li>
            			<span class="material-icons">subdirectory_arrow_right</span>
            			<span class="material-icons">account_box</span>
            		</li>
            		<li>
            			<p class="comment-info">
            				<span>${fcc.foodCommentWriter }</span>
            				<span>${fcc.foodCommentDate }</span>
            			</p>
            			<p class="comment-content">${fcc.foodCommentContent }</p>
            			
            			<textarea name="foodCommentContent" class="input-form" style="min-height:96px;display:none;">${fcc.foodCommentContent }</textarea>
            			
            			<p class="comment-link">
            				<c:if test="${sessionScope.m.memberId eq fc.foodCommentWriter }">
            				<a href="javascript:void(0)" onclick="modifyComment(this,${fcc.foodCommentNo },${bf.boardFoodNo });" style="font-family: none;"> 수정</a>
                            <a href="javascript:void(0)" onclick="deleteComment(this,${fcc.foodCommentNo },${bf.boardFoodNo });" style="font-family: none;">삭제</a>
            				</c:if>
            			</p>
            		</li>
            	</ul>
            	</c:if>
          </c:forEach> 
            
            <%-- 댓글에 대한 대댓글 입력양식 --%>
            <c:if test="${not empty sessionScope.m }">
            	<div class="inputCommentBox inputReCommentBox">
            		<form action="/insertFoodComment.do" method="post">
            			<ul>
            				<li>
            					<span class="material-icons">subdirectory_arrow_right</span>
            				</li>
            				<li>
            					<input type="hidden" name="foodCommentWriter" value="${sessionScope.m.memberId }">
            					<input type="hidden" name="boardFoodRef" value="${bf.boardFoodNo }">
            					<input type="hidden" name="foodCommentRef" value="${fc.foodCommentNo }"><%--현재 출력하고 있는 번호 --%>
            					<textarea name="foodCommentContent" class="input-form"></textarea>
            				</li>
            				<li>
            					<button type="submit" class="btn bc1 bs4">등록</button>
            				</li>
            			</ul>
            		</form>
            	</div>
            	</c:if>
        </c:forEach> <% //댓글 출력 for문 끝나는 위치 %>
      </div>
		<%--댓글창 
		로그인 되어있는 경우에만 댓글 작성 화면을 띄움
		--%>
		<c:if test="${not empty sessionScope.m }">
		<div class="inputCommentBox">
			<form action="/insertFoodComment.do" method="post">
				<%--content만 입력 받음 --%>
				<ul>
					<li>
						<span class="material-icons">account_box</span>
					</li>
					<li>
						<%--작성자는 로그인한 회원정보에서 가져오기 --%>
						<input type="hidden" name="foodCommentWriter" value="${sessionScope.m.memberId }">
						<input type="hidden" name="boardFoodRef" value="${bf.boardFoodNo }">
						<%--null처리를 해야하지만 int형이라 일단은 0으로 대입.. --%>
						<input type="hidden" name="foodCommentRef" value="0">
						<textarea name="foodCommentContent" class="input-form"></textarea>
					</li>
					<li>
						<button type="submit" class="bc1 bs4">등록</button>
					</li>
				</ul>
			</form>
		</div>
			</c:if>
			
		<script>
	
		$(".recShow").on("click",function(){
			//몇번째 답글달기 버튼을 클릭한지
			const idx = $(".recShow").index(this);
			if($(this).text() == "답글달기"){
				$(this).text("취소");
			}else{
				$(this).text("답글달기");
			}
			$(".inputReCommentBox").eq(idx).toggle();
			$(".inputReCommentBox").eq(idx).find("textarea").focus();
		});
		function modifyComment(obj, foodCommentNo, boardFoodNo){
			//숨겨놓은 textarea를 화면에 보여줌
			$(obj).parent().prev().show();
			//화면에 있던 댓글내용(p태그)를 숨김
			$(obj).parent().prev().prev().hide();
			//수정 -> 수정완료
			$(obj).text("수정완료");
			$(obj).attr("onclick","modifyComplete(this,"+foodCommentNo+","+boardFoodNo+")");
			//삭제 -> 수정취소
			$(obj).next().text("수정취소");
			$(obj).next().attr("onclick","modifyCancel(this,"+foodCommentNo+","+boardFoodNo+")");
			//답글 달기 버튼 삭제
			$(obj).next().next().hide();
		}
		
		function modifyCancel(obj, foodCommentNo, boardFoodNo){
			$(obj).parent().prev().hide(); //textarea숨김
			$(obj).parent().prev().prev().show(); //기존댓글 다시 보여줌
			//수정완료 -> 수정
			$(obj).prev().text("수정");
			$(obj).prev().attr("onclick","modifyComment(this,"+foodCommentNo+","+boardFoodNo+")");
			//수정취소 -> 삭제
			$(obj).text("삭제");
			$(obj).attr("onclick","deleteComment(this,"+foodCommentNo+","+boardFoodNo+")");
			
			//답글달기 버튼 다시 보여줌
			$(obj).next().show();
		}
		function modifyComplete(obj,foodCommentNo,boardFoodNo){
			//form, a(location.href)
			//form태그를 생성해서 전송
			//댓글내용, 댓글번호, 공지사항번호
			//1. form태그 생성
			const form=$("<form style='display:none;' action='/updateFoodComment.do' method='post'></form>")
			//2. input태그 2개 숨김
			const foodCommentNoInput = $("<input type='text' name='foodCommentNo'>");
			foodCommentNoInput.val(foodCommentNo);
			const boardFoodNoInput = $("<input type='text' name='boardFoodNo'>");
			boardFoodNoInput.val(boardFoodNo);
			//3. textarea
			const foodCommentContent = $(obj).parent().prev().clone();
			//4. form태그에 input, textarea를 모두 포함
			form.append(foodCommentNoInput).append(boardFoodNoInput).append(foodCommentContent);
			//5. 생성된 form태그를 body태그에 추가
			$("body").append(form);
			//form태그를 전송
			form.submit();
		}
		function deleteComment(obj, foodCommentNo,boardFoodNo){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href="/deleteFoodComment.do?foodCommentNo="+foodCommentNo+"&boardFoodNo="+boardFoodNo;
		}
	
}
		</script>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>