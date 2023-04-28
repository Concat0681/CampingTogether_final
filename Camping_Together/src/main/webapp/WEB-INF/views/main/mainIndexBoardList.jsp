<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.bottom-content{
	width: 90%;
	margin: 0 auto;
	padding-top: 50px;
	
}
.bottom-content ul li ol{
	list-style-type: none;
}
.boardBox>ul{
	border-left: 1px solid black;
	display: flex;
}
.title{
	width: calc(100%/3);
	float: left;
}
.boardBox{
	display: block;
}
.n-title>h3{
	width: max-content;
	margin-bottom: 40px;
}
.n-title>span{
	font-weight: bolder;
	font-size: 14px;
	margin-right: 20px;
}
.n-title{
	display: flex;
	justify-content: space-between;
}
.boardBox>li:not(li:first-child){
	padding-bottom: 10px;
	font-size: 18px;
}
</style>
<title>Insert title here</title>

</head>
<body>
	<div class="bottom-content">
		<ul style="list-style-type: none;">
			<li class="title">
				<ol class="boardBox">
					<li class="n-title Tip-title"><h3>많이 묻는 질문</h3><span><a href="/mainQnA.jsp">더보기</a></span></li>
						<li><span>${bf.boardFoodTitle }</span>
					
				</ol>
			</li>
			<li class="title">
				<ol class="boardBox">
					<li class="n-title Food-title"><h3>캠핑Food</h3><span><a href="/boardFoodList.do?reqPage=1">더보기</a></span></li>
					
					<c:forEach items="${foodlist}" var="bf">
						<li><a href="/boardFoodView.do?boardFoodNo=${bf.boardFoodNo }"><span>${bf.boardFoodTitle }</span></a><span style="font-size: 12px;"> +${bf.foodCommentRef }</span> </li>
					</c:forEach>
				</ol>
			</li>
			<li class="title">
				<ol class="boardBox">
					<li class="n-title Free-title"><h3>자유게시판</h3><span>더보기</span></li>
					<c:forEach items="${foodlist}" var="bf">
						<li><a href="/boardFoodView.do?boardFoodNo=${bf.boardFoodNo }"><span>${bf.boardFoodTitle }</span></a> </li>
					</c:forEach>
				</ol>
			</li>
		</ul>
	</div>
</body>
<script>
</script>
</html>