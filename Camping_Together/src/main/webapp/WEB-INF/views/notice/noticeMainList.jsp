<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="notice-Box"> 
					공지사항 <span><a href="/noticeList.do?reqPage=1">+</a></span> 
					<ul class="notice-list">
						<c:forEach items="${mainList }" var="n">
							<li><a href="/noticeView.do?noticeNo=${n.noticeNo }">${n.noticeTitle }</a> <span style="font-size: 12px;">${n.enrollDate }</span></li>
						
						</c:forEach>
						
					</ul>
</div>
	
<a class="mainlist" href="/noticeMainList.do"></a>
<script>
$(document).ready(function(){
	$(".mainlist").click();
});
</script>
</body>
</html>