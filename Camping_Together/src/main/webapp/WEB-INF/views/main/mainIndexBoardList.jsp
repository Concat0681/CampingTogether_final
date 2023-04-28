<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.bottom-content{
	width: 65%;
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
	width: calc(100%/2);
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
						<li><a href="/mainQnA.jsp"><span>로그인이 안되요</span></a></li>
						<li><a href="/mainQnA.jsp"><span>중고장터 사기 신고</span></a></li>
						<li><a href="/mainQnA.jsp"><span>캠핑장 등록</span></a></li>
						<li><a href="/mainQnA.jsp"><span>캠핑 예약 및 결제</span></a></li>
						<li><a href="/mainQnA.jsp"><span>문의사항</span></a></li>
				</ol>
			</li>
			<li class="title">
				<ol class="boardBox" style="border-left: 1px solid #b3b3b3;">
					<li class="n-title Food-title"><h3>캠핑Food</h3><span><a href="/boardFoodList.do?reqPage=1">더보기</a></span></li>
					
					<c:forEach items="${foodlist}" var="bf">
						<li><a href="/boardFoodView.do?boardFoodNo=${bf.boardFoodNo }"><span>${bf.boardFoodTitle }</span></a><span style="font-size: 12px;"> +${bf.foodCommentRef }</span> </li>
					</c:forEach>
				</ol>
			</li>
		</ul>
	</div>
</body>
<script>
</script>
</html>