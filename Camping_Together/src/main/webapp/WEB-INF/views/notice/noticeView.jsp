<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
*{
	text-decoration: none;
	margin: 0px;
	padding: 0px;
}

.page-content {
  width: 1200px;
  margin: 200px auto;
  margin-bottom: 100px;
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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="page-content">
		<h3 class="page-title">공지사항</h3>
		<table class="tbl" id="noticeView">
			<tr class="tr-1">
				<th class="td-3">제목</th>
				<td colspan="6">${n.noticeTitle }</td>
			<tr class="tr-1">
				<th class="td-3">글번호</th>
				<td>${n.noticeNo }</td>
				<th class="td-3">작성자</th>
				<td>${n.noticeWriter }</td>
				<th class="td-3">작성일</th>
				<td>${n.enrollDate }</td>
			</tr>
			<tr class="tr-1">
				<td colspan="4">
					<div id="noticeContent" style="text-align:left;">
						${n.noticeContent }
					</div>
				</td>
			</tr>
			<%--로그인이 되어있고 로그인한 아이디랑 작성자가 같은 사람 --%>
			<c:if
				test="${not empty sessionScope.m && sessionScope.m.memberId eq n.noticeWriter }">
				<tr class="tr-1">
					<th colspan="6">
						<a class="cancelBtn" href="/noticeUpdateFrm.do?noticeNo=${n.noticeNo }">수정</a>
						<a class="cancelBtn" href="/noticeDelete.do?noticeNo=${n.noticeNo }">삭제</a>
					</th>
				</tr>
			</c:if>
		</table>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>