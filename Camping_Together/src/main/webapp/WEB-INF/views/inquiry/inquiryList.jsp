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
  margin-bottom: 10px;
  margin-top:200px;
  flex-grow: 1;
  position: relative;
}
.page-title {
  font-family: ns-bold;
  padding: 20px 0px;
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
    background-color: rgba(0, 0, 0, 0.3);
    position: fixed;
    width: 100%;
    height: 100vh;
    display: none;
    align-items: center;
    flex-direction: column;
}

.modal-wrap {
    margin-top: 150px;
    width: 600px;
    background: #fff;
    height: auto;
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

.close-icon {
    position: absolute;
    top: 16px;
    right: 16px;
    font-size: 30px;
}

.close-icon:hover {
    cursor: pointer;
}

.content-box{

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
	padding: 10px 50px 10px;
}
</style>
<body>	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="page-content">
	
	
<%-- 		<c:if test="${not empty sessionScope.m"> --%>
			
			
	
<%-- 		</c:if> --%>
		<h3 class="page-title">문의사항</h3>
		<table class="tbl">
			<tr class="tr-2">
				<th style="width:10%">번호</th>
				<th style="width:45%">제목</th>
				<th style="width:15%">작성자</th>
				<th style="width:15%">작성일</th>
				<th style="width:15%">답변상태</th>
			</tr>	
			
			<c:forEach items="${list }" var="i">
      		 <tr class="tr-1">
<%--          <td align="center">${ i.inquiryNo }</td> --%>
<!--          <td> -->
<%--          <c:choose> --%>
<%--          <c:when  test="${i.depth gt 0 }"> --%>
<%--          <c:forEach begin="1" end="${i.depth }" step="1"> --%>
<!--          	<span style="padding-left:20px;"></span> -->
<%--          </c:forEach> --%>
<!--          <span>└Re</span> -->
<%--          <a>${i.inquiryTitle }</a> --%>
<%--          	</c:when> --%>
<%--          	<c:otherwise> --%>
<%--          <a>${i.inquiryTitle }</a> --%>
<%--          	</c:otherwise> --%>
<%--          </c:choose> --%>
<!--          </td> -->
         
<%--            <c:if test="${ i.depth gt 0 }"> --%>
<!-- 				<span>&nbsp;&nbsp;&nbsp;&nbsp;└Re</span>              -->
<%--            </c:if> --%>
<%--            <a href="/">${ i.inquiryTitle }</a> --%>
<!--          </td> -->
         <td>${ i.inquiryNo }</td>
         <td class="Title">${ i.inquiryTitle }</td>
         <td>${ i.inquiryWriter }</td>
         <td>${ i.regDate }</td>
         <td>
         	<c:choose>
         		<c:when test="${i.status eq '0'}">
         			<span>답변대기</span>
         		</c:when>
         		<c:when test="${i.status eq '1'}">
         			<span>답변완료</span>
         		</c:when>
         	</c:choose>
         </td>
       </tr>
       <tr class="test"style="display:none;">
       	 	<td colspan="5" class="tr-1" style="background-color:#f7f7f7; ">
       	 		<div>
       	 			<div  class="content-box">
       	 				<div>
       	 					<span>아이콘</span>
       	 				</div>
			       		<div>
			       			${i.inquiryContent }
	       	 			</div>
       	 			</div>
		       		 <c:if test="${not empty sessionScope.m && sessionScope.m.memberId eq i.inquiryWriter }">
	       	 			<div class="update-box">
	       	 				<button>수정</button>
	       	 				<sapn class="divder"></sapn>
	       	 				<button>삭제</button>
	       	 			</div>
			       	</c:if>
			       	<c:if test="${not empty sessionScope.m && sessionScope.m.memberGrade eq 'a' }">
			       		<div class="update-box">
	       	 				<button onclick="">답변하기</button>
	       	 				<sapn class="divder"></sapn>
	       	 				<button onclick="">삭제</button>
	       	 			</div>
			       	</c:if>
       	 		</div>
	       		
       		</td>
       </tr>
    </c:forEach>   

	</table>
	</div>
	
	<div id="pageNavi">${pageNavi }</div>
	
	<button type="button" class="modal-open-btn" target="test-modal">문의하기</button>	
	
	
			<%--거래완료 모달창 --%>
			<div id="test-modal" class="modal-bg">
			<div class="modal-wrap">
				<div class="modal-head">
					<h2>구매평가</h2>
					<span class="material-icons close-icon modal-close">close</span>
				</div>
				<div class="modal-content">
					<div class=modal-title>
					</div>
				</div>
				<div class="modal-foot">
					<button class="btn bc11 modalCheck">확인</button>
					<button class="btn bc1 modal-close">취소</button>
				</div>
			</div>
			</div>
	
	
	<script>
		$(".Title").on("click",function(){
				$(this).parent().next().toggle();
		});

		$(".modal-open-btn").on("click",function(){
					$(".modal-bg").show();
					
			});
	</script>
</body>
</html>