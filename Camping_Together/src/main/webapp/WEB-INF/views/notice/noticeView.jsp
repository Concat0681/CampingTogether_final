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
</style>
	<div class="page-content">
		<h3 class="page-title">공지사항</h3>
		<table class="tbl" id="noticeView">
			<th class="td-3" colspan="6">제목</th>
			<tr class="tr-1">
				<th colspan="6">${n.noticeTitle }</th>
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
					<div id="noticeContent" style="height:400px; text-align:left;">
						${n.noticeContent }
					</div>
				</td>
			</tr>
			<%--로그인이 되어있고 로그인한 아이디랑 작성자가 같은 사람 --%>
			<c:if
				test="${not empty sessionScope.m && sessionScope.m.memberId eq n.noticeWriter }">
				<tr class="tr-1">
					<th colspan="6">
					<a class="btn bc4" href="/noticeUpdateFrm.do?noticeNo=${n.noticeNo }">수정</a>
					<a class="btn bc4" href="/noticeDekete.do?noticeNo=${n.noticeNo }">삭제</a>
					</th>
				</tr>
			</c:if>
		</table>
	</div>
</body>
</html>