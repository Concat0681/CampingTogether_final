<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
*{
	text-decoration: none;
	margin: 0px;
	padding: 0px;
}

.page-content {
  width: 1200px;
  margin: 30px auto;
  margin-top:200px;
  flex-grow: 1;
  position: relative;
}
.page-title {
  font-family: ns-bold;
  font-size: 1.5rem;
}
.tbl {
  width: 1200px;
  margin : 0 auto;
  border-spacing: 0px;
  border-collapse: collapse;
}
.tbl th,
.tbl td {
  padding: 1rem;
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
.tr-1>td>a{
	list-style-type: none;
}
.bc4 {
  background-color: #AD8B73;
  color: #fff;
  border: 2px solid #AD8B73;
}
.tr-1>td>a{
	color: black;
}
.divder{
    width: 1px;
    height: 18px;
    line-height:15px;
    background-color: #e0e0e0;
    margin: 0 12px;
    display: inline-block;
}
/*모달*/
.modal-bg {
    background-color: rgba(0, 0, 0, 0.0);
    position: fixed;
    width: 1200px;
    height: 100vh;
    display: none;
    align-items: center;
    flex-direction: column;
}

.modal-wrap {
	background-color: #f8f7f9;
    box-shadow:rgba(0, 0, 0, 0.2) 0px 2px 8px 3px;	
    border-radius: 8px;
	margin : 0 auto;   
    width: 600px;
    background: #fff;
    height: 620px;
}

.modal-wrap div {
    padding: 1rem;
}

.modal-wrap div:not(:last-child) {
    border-bottom: 1px solid #ccc;
}

.modal-wrap .modal-foot {
    text-align: right;
}

.modal-wrap div.modal-head {
    position: relative;
}
.modal-foot{
	margin-top: 5px;
}
.close-icon {
    position: absolute;
    top: 16px;
    right: 16px;
    font-size: 30px;
}

.close-icon:hover {
    cursor: pointer;
}

.update-box{
    width: 100%;
    padding: 0px 15px;
    display: flex;
    -webkit-box-pack: end;
    justify-content: flex-end;
}
.update-box button{
	border: none;
	background-color: transparent;
}
.content-box{
	display: flex;
	padding: 10px 10px 0px 0px;
	margin-bottom: 50px;
}
.adminAnswer{
	display: flex;
	padding: 10px 10px 0px 0px;
}
.update-box-btn{
	width:60px;
	border:none;
	background-color: #E3CAA5;
	color: #fff;
	font-weight: 300;
	padding: 10px
}
.modal-title span{
 margin-right: 20px;
 font-size: 14px; 
 font-weight: bold;
}
.modal-title input{
	width: 100%;
	height: 35px;
	margin-bottom: 15px;
}
.inquiryBtn-wrap{
	margin-left: 1100px;
}
.inquiryBtn{
	width : 100px; 
	height : 30px;
}
.pageNavi{
	margin-top: 30px;
}
</style>
<body>	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="page-content">
	<%--insert 모달창 --%>
			<div id="insert-modal" class="modal-bg insert-wrap">
			<div class="modal-wrap">
				<div class="modal-head">
					<h4>문의사항</h4>
					<span class="material-icons close-icon modal-close">close</span>
				</div>
				<div class="modal-content">
					<div class=modal-title>
						<span>제목</span><input type="text" class="inquiryTitle" name="inquiryTitle" placeholder="제목을 입력해 주세요." style="border: 1px solid #ccc; border-radius: 5px;">
						<input type="hidden" class="inquiryWriter" name="inquiryWriter" value="${sessionScope.m.memberId }">
						<span>내용</span><textarea class="inquiryContent" name="inquiryContent" style="width: 100%; height: 250px; resize: none; border: 1px solid #ccc; border-radius: 5px;" placeholder="내용을 입력해 주세요."></textarea>
					</div>
					<div class="secretCheck">
						<label for="checkbox">
						<input type="checkbox" class="checkbox" id="checkbox" name="checkbox" value="1">
						<span>비밀글로 문의하기</span>
						</label>
					</div>
				</div>
				<div class="modal-foot">
					<button onclick="insertInquiry();" class="modalCheck update-box-btn">확인</button>
					<button class="modal-close update-box-btn">취소</button>
				</div>
			</div>
			</div>
			<%--update 모달창 --%>
		<div id="update-modal" class="modal-bg update-wrap">
			<div class="modal-wrap">
				<div class="modal-head">
					<h4>수정하기</h4>
					<span class="material-icons close-icon modal-close">close</span>
				</div>
				<div class="modal-content">
					<div class=modal-title>
						<span>제목</span><input type="text" class="updateInquiryTitle" name="updateInquiryTitle" >
						
						<span>내용</span><textarea class="updateInquiryContent" name="updateInquiryContent" style="width: 100%; height: 300px; resize: none;"></textarea>
					</div>
				</div>
				<div class="modal-foot">
					<button onclick="updateInquiry();" class="modalCheck update-box-btn">확인</button>
					<button class="modal-close update-box-btn">취소</button>
				</div>
			</div>
		</div>
		
		<!-- 답변 모달창 -->
		<div id="answer-modal" class="modal-bg answer-wrap">
			<div class="modal-wrap">
				<div class="modal-head">
					<h4>답변하기</h4>
					<span class="material-icons close-icon modal-close">close</span>
				</div>
				<div class="modal-content">
					<div class=modal-title>
						<span>문의 내용</span><textarea class="InquiryContent" name="InquiryContent" style="width: 100%; height: 170px; resize: none;"></textarea>
						<span>답변 내용</span><textarea class="adminInquiryAnswer" name="adminInquiryAnswer" style="width: 100%; height: 170px; resize: none;"></textarea>
					</div>
				</div>
				<div class="modal-foot">
					<%--답변하기 클릭한 Inquiry number --%>
					<input type="hidden" class="adminInquiryNo" value="">
					<button onclick="admingInquiry();" class="modalCheck update-box-btn">확인</button>
					<button class="modal-close update-box-btn">취소</button>
				</div>
			</div>
		</div>
	
		<h3 class="page-title">문의사항</h3>
		<c:if test="${not empty sessionScope.m}">
		<dlv class="inquiryBtn-wrap">
			<button type="button" class="modal-open-insert-btn inquiryBtn btn3" target="insert-modal">문의하기</button>
		</dlv>
		</c:if>
		<table class="tbl">
			<tr class="tr-2">
				<th style="width:45%; ">제목</th>
				<th style="width:15%">작성자</th>
				<th style="width:15%">작성일</th>
				<th style="width:15%">답변상태</th>
			</tr>	
			
			<c:forEach items="${list }" var="i">
				
         <tr class="tr-1">
         <c:if test="${i.secret eq '1' }">
	         <c:choose>
	         	<c:when test="${not empty sessionScope.m && sessionScope.m.memberId eq i.inquiryWriter || sessionScope.m.memberGrade eq 'a' }">
		         	<th class="Title" style="text-align: left;">${i.inquiryTitle }</th>
	         	</c:when>
	         	<c:otherwise>
		         	<th class="secretBoard" style="text-align: left; color: rgb(153, 153, 153);">
		         	<span class="material-symbols-outlined">lock</span>
		         	비밀글입니다.
		         	</th>	         	
	         	</c:otherwise>
	         </c:choose>
         </c:if>
          <c:if test="${i.secret eq '0' }">
		         	<th class="Title" style="text-align: left;">${i.inquiryTitle }</th>
          </c:if>
	         <td>${ i.inquiryWriter }</td>
	         <td>${ i.regDate }</td>
	         <input type="hidden" class="InquiryNo" name="InquiryNo" value="${i.inquiryNo }">
	         <input type="hidden" class="InquiryNo" id="InquiryWriter" value="${i.inquiryWriter }">
	         <td>
	         	<c:choose>
	         		<c:when test="${i.status eq '0'}">
	         			<span style="color: rgb(153, 153, 153);">답변대기</span>
	         		</c:when>
	         		<c:when test="${i.status eq '1'}">
	         			<span style="font-weight: bold;">답변완료</span>
	         		</c:when>
	         	</c:choose>
	         </td>
       	</tr>
       	<tr class="test"style="display:none;">
       	 	<td colspan="5" class="tr-1" style="background-color:#f7f7f7; ">
       	 		<div>
       	 			<div  class="content-box">
       	 				<div>
       	 					<span><img src="/resources/image/inquiry/q.png" style="width:20px; margin-right:10px;"></span>
       	 				</div>
			       		<div>${i.inquiryContent }</div>
       	 			</div>
       	 			<div class="adminAnswer">
       	 				<div>
       	 					<c:if test="${i.status eq 1 }">
		       	 				<span><img src="/resources/image/inquiry/a.png" style="width:20px; margin-right:10px;"></span>
       	 					</c:if>
       	 				</div>
       	 			</div>
		       		 <c:if test="${not empty sessionScope.m && sessionScope.m.memberId eq i.inquiryWriter }">
	       	 			<div class="update-box">
	     
	       	 				<button type="button" class="modal-open-update-btn updateBtn" target="update-modal">수정</button>
	       	 				<span class="divder"></span>
	       	 				<button onclick="deleteInquiry(this,${i.inquiryNo });">삭제</button>
	       	 			</div>
			       	</c:if>
			       	<c:if test="${not empty sessionScope.m && sessionScope.m.memberGrade eq 'a' }">
			       		<div class="update-box">
			       			<input type="hidden" value="${i.inquiryNo }">
			       			<input type="hidden" value="${i.inquiryContent }">
	       	 				<button onclick="" class="modal-open-answer-btn answerBtn" >답변하기</button>
	       	 				<span class="divder"></span>
	       	 				<button onclick="deleteInquiry(this,${i.inquiryNo });">삭제</button>
	       	 			</div>
			       	</c:if>
       	 		</div>
	       		
       		</td>
       </tr>
    </c:forEach>   

	</table>
	</div>
	
	<div id="pageNavi" class="pageNavi">${pageNavi }</div>
	<!--값을 가져오기 위한 input hidden 값들  -->	
	<input type="hidden" id="memberId" value="${sessionScope.m.memberId }">
	
			
	
	<!--  -->
	<script>
		//제목 클릭시 내용, 관리자 답변 select
		$(".Title").on("click",function(){
			$(this).parent().next().toggle();
			var inquiryNo = $(this).next().next().next().val();
			//무한반복 제거...
			$(this).parent().next().children().children().children().eq(1).children().next().remove();
			$.ajax({
				url : "/selectAdminInquiry.do",
				type : "POST",
				dataType : "JSON",
				data : {inquiryNo : inquiryNo},
				context : this,
				success : function(data) {
					$(this).parent().next().children().children().children().eq(1).append("<div class=>"+data.adminInquiryAnswer+"</div");
				}
				});
			
				
		});
		//비밀글 alert 함수
		$(".secretBoard").on("click", function(){
			alert("비밀글입니다.")
			});
		//모달 창 띄우기
		$(".modal-open-insert-btn").on("click",function(){
					$(".insert-wrap").show();
					
			});
		//모달 창 닫기
		$(".modal-close").on("click",function(){
			$(".insert-wrap").hide();	
			})
		
		//insert
		function insertInquiry(){
			var inquiryWriter = $("[name=inquiryWriter]").val();
			var inquiryTitle = $("[name=inquiryTitle]").val();
			var inquiryContent = $("[name=inquiryContent]").val();
			var secret = $("[name=checkbox]:checked").val();
			$.ajax({
				url : "/insertInquriry.do",
				type : "post",
				dataType : "JSON",
				data : {inquiryWriter : inquiryWriter, inquiryTitle: inquiryTitle,  inquiryContent: inquiryContent, secret : secret},
				success : function(data){
									
					if(data==1){
						location.reload();
					}else{
					}
					
				},
			});
		}
		//update
		function updateInquiry(){
			var inquiryNo = $("[name=InquiryNo]").val();
			var inquiryTitle = $("[name=updateInquiryTitle]").val();
			var inquiryContent = $("[name=updateInquiryContent]").val();
			$.ajax({
				url : "/updateInquiry.do",
				type : "post",
				dataType : "JSON",
				data : {inquiryNo : inquiryNo, inquiryTitle : inquiryTitle, inquiryContent : inquiryContent},
				success : function(data){
					if(data==1){ 
						console.log(data)
						location.reload();
						
					}else{
					}
				},
			});
		}
		//답변하기 
		function admingInquiry() {
			var adminInquiryAnswer = $("[name=adminInquiryAnswer]").val();
			var adminInquiryNo = $(".adminInquiryNo").val();
			console.log(adminInquiryAnswer);
			console.log(adminInquiryNo);
			$.ajax({
				url : "/insertAdminInquiry.do",
				type : "post",
				dataType : "JSON",
				data : {inquiryNo : adminInquiryNo, adminInquiryAnswer : adminInquiryAnswer},
				success : function(data){
					console.log(data);
					if(data==1){
						location.reload();
					}else{
						
					}
				},
			});
		}
		//모달창 띄우기
		$(".modal-open-update-btn").on("click",function(){
				$(".update-wrap").show();
			});
		// 모달창 닫기
		$(".modal-close").on("click",function(){
			$(".update-wrap").hide();	
			})
		
		// 수정 밸류 값 찾기
		$(".updateBtn").on("click",function(){
				var inquiryContent = $(this).parent().prev().children().next().text();
				$("[name=updateInquiryContent]").val(inquiryContent);
				var inquiryTitle =$(this).parent().parent().parent().parent().prev().children().eq(0).text();
				$("[name=updateInquiryTitle]").val(inquiryTitle);
				
			});
		
		//delete
		function deleteInquiry(obj, inquiryNo){
			if(confirm("삭제하시겠습니까?")){
				location.href="/deleteInquiry.do?inquiryNo="+inquiryNo;
		}
	}
		$(".modal-open-answer-btn").on("click",function(){
			$(".answer-wrap").show();
		});
		$(".modal-close").on("click",function(){
			$(".answer-wrap").hide();	
			})
	$(".answerBtn").on("click",function(){
		
	//사용자가 작성한 문의내용을 답글창에 띄우기 위한 코드
			var inquiryContent = $(this).prev().val();		
			$("[name=InquiryContent]").val(inquiryContent)
			var inquiryNo = $(this).prev().prev().val();
			$(".adminInquiryNo").val(inquiryNo);
// 			var adminInquiryAnswer = 
		console.log(inquiryNo);
		});	
		
		
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>