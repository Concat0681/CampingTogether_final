<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
.chat-wrap{
    width: 1000px;
    height: 400px;
    margin: 0 auto;
    margin-top : 250px;
    margin-bottom: 170px;
}
.chat-title>h3{
    font-size: 30px;
    font-weight: bold;
    margin: 0 atuo;
}
.chat-content{
    text-align: center;
}
.chat-content>img{
    width: 300px;
    height: 300px;
    margin-top: 40px;
}
.btn3{
    width: 400px;
    height: 60px;
    line-height: 60px;
    text-align: center;
    background-color: #AD8B73;
    box-shadow:  rgba(0, 0, 0, 0.2) 0px 2px 8px 3px;
    margin: 0 auto;
    margin-top: 40px;
    cursor: pointer;
}
.btn>a{
    font-weight: bold;
    font-size: 17px;
    color: #fff;
    text-decoration: none;
    cursor: pointer;
}
a:hover{
	color: #fff !important
}

</style>
</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 <div class="chat-wrap">
        <div class="chat-title">
            <img src="/resources/image/cam-pro.png" style="margin-left:250px;">
        </div>
        <div class="chat-content">
            <img src="/resources/image/chatting/tent.png">
        </div>
        <div class="btn3">
            <a class="chat-btn">채팅방 입장하기</a>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script>
  	$(".chat-btn").on("click",function(){
  		window.open("http://192.168.10.52/allMemberChat.do","","left=700px,top=300px,width=500px,height=510px,menubar=no,status=no,scrollbars=yes");
  	});
  </script>
</body>
</html>
