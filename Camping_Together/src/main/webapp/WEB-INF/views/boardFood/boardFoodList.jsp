<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: black;
}

.div-posting-wrap {
	width: 1200px;
	margin: 0 auto;
}

.posting-item {
	border: 1px solid #e3e4e5;
	border-radius: 8px;
}

.posting-content {
	margin-top: 20px;
}

.posting-img img {
	border-radius: 8px;
}

.posting-wrap {
	display: flex;
	flex-wrap: wrap;
}

.posting-wrap .posting-item {
	box-sizing: border-box;
	width: calc(90%/ 4);
	padding: 20px;
	margin-right: 30px;
}

.posting-wrap .posting-item .posting-img img {
	width: 100%;
	height: 220px;
}

.posting-wrap .posting-item:hover {
	box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
}

.posting-title {
	padding-left: 10px;
	font-size: 18px;
	padding-top: 10px;
	box-sizing: border-box;
	height: 50px;
}

.posting-detail {
	text-align: right;
	position: relative;
	padding-top: 15px;
}

.posting-icon {
	/* background-color: #236cda; */
	display: inline-block;
	position: absolute;
	left: 0;
	padding-top: 5px;
}

.posting-info {
	margin-right: 5px;
	/* background-color: #2f9746; */
	height: 30px;
	line-height: 30px;
	font-size: 14px;
}

.posting-info>span {
	color: #3b3b3b;
}

.posting-icon>div {
	display: inline-block;
	margin-right: 20px;
}

.heart-div {
	position: relative;
}

.comment-div {
	position: relative;
}

.posting-icon>.heart-div>.material-symbols-outlined {
	font-variation-settings: 'FILL' 1, 'wght' 200, 'GRAD' 0, 'opsz' 48;
	color: #e92626;
	font-size: 20px;
}

.posting-icon>.comment-div>.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 0, 'opsz' 48;
	color: #252a34;
	font-size: 20px;
}

.heart-count, .comment-count {
	position: absolute;
	top: 1px;
	left: 23px;
	font-size: 13px;
	color: #3b3b3b;
}
.posting-item{
	margin-bottom: 50px;
}
p{
	color: black;
	
}
.writeBtn{
	background-color: #CEAB93;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    width: 100px;
    height:30px;
    line-height:30px;
    display: block;
    text-align: center;
    margin-left: 1070px;
    margin-bottom: 5px;
}
a:hover{
		color:#fff !important;
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
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="div-posting-wrap" style="margin-top: 250px;">
		<h3 class="page-title">자유게시판</h3>
        <c:if test="${not empty sessionScope.m }">
			<a class="writeBtn" href="/boardFoodWriteFrm.do" style="font-family: none;">글쓰기</a>			
		</c:if>
        <div class="posting-wrap">   
           
        <c:forEach items="${list }" var="b">
                <div class="posting-item">
                    <a href="/boardFoodView.do?boardFoodNo=${b.boardFoodNo }">
            		        <c:if test="${fn:length(b.filepath) > 0}">
			                        <div class="posting-img">
<%-- 		    	                    	<img src="/resources/upload/boardFood/${b.filepath }"> --%>
		    	                    	<img src="/resources/upload/boardFood/${b.filepath }">
			                        </div>
			                     </c:if>
            		        <c:if test="${fn:length(b.filepath) < 1}">
			                        <div class="posting-img">
		                           		 <img src="/resources/image/chatting/camping-g3d79aec66_640.jpg">
			                        </div>
			                </c:if>
                        <div class="posting-content">
                            <p class="posting-title">${b.boardFoodTitle }</p>
                            <div class="posting-detail">
                                <div class="posting-icon">
                                    <div class="comment-div">
                                        <span class="material-symbols-outlined" style="color:#4e4e4e;">visibility</span>
                                        <span class="heart-count">${b.readCount }</span>
                                    </div>
                                </div> 
                                <div class="posting-info">
                                    <span class="posting-time">${b.enrollDate }</span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
        </c:forEach>
            </div>
		<div id="pageNavi">${pageNavi }</div>
	 
        </div>
       <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>