<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<style>
*{
	text-decoration: none;
	margin: 0px;
	padding: 0px;
}

.page-content {
  top: 200px;
  width: 1200px;
  margin: 50px auto;
  margin-bottom: 10px;
  flex-grow: 1;
  position: relative;
  margin-bottom: 300px;
}
.page-title {
  font-family: ns-bold;
  font-size: 1.5rem;
}
.tbl {
  width: 100%;
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
.btn{
  border: none;
  padding: 5px;
  display: inline-block;
  box-sizing: border-box;
  transition-duration: 0.5s;
  font-size: 16px;
  font-family: ns-light;
  font-weight:bold;
  position: absolute;
  left:1199px;
  top:96px
}
.bc4 {
  background-color: #AD8B73;
  color: #fff;
  border: 2px solid #AD8B73;
}
.tr-1>td>a{
	color: black;
}
.pageNavi{
	margin-top: 30px;
}
.writeBtn-wrap{
	margin-left: 1100px;
}
.writeBtn-wrap .writeBtn{
	background-color: #CEAB93;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    width: 100px;
    height:30px;
    line-height:30px;
    display: block;
    text-align: center;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="page-content">
		
		<div class="page-title">공지사항</div>
		<c:if test="${not empty sessionScope.m && sessionScope.m.memberGrade eq 'a' }">
			<div class="writeBtn-wrap">
				<a class="writeBtn" href="/noticeWriteFrm.do" style="font-family: none;">글쓰기</a>			
			</div>
		</c:if>
		<table class="tbl">
			<tr class="tr-2">
				<th style="width:10%">번호</th>
				<th style="width:45%">제목</th>
				<th style="width:15%">작성자</th>
				<th style="width:35%">작성일</th>
			</tr>
			<c:forEach items="${list }" var="n">
				<tr class="tr-1">
					<td>${n.noticeNo }</td>
					<td><a href="/noticeView.do?noticeNo=${n.noticeNo }" style="font-family: none;">${n.noticeTitle }</a></td>
					<td>${n.noticeWriter }</td>
					<td>${n.enrollDate }</td>
				</tr>
			</c:forEach>

	</table>
	<div id="pageNavi" class="pageNavi">${pageNavi }</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>