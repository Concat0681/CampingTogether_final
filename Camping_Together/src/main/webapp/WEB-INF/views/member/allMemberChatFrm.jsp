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
}
.chat-title>h3{
    font-size: 30px;
    font-weight: bold;
    text-align: center;
}
.chat-content{
    text-align: center;
}
.chat-content>img{
    width: 300px;
    height: 300px;
    margin-top: 40px;
}
.btn{
    width: 400px;
    height: 60px;
    line-height: 50px;
    text-align: center;
    background-color: #AD8B73;
    box-shadow:  rgba(0, 0, 0, 0.2) 0px 2px 8px 3px;
    margin: 0 auto;
    margin-top: 40px;
}
.btn>a{
    font-weight: bold;
    font-size: 17px;
    color: #fff;
    text-decoration: none;
    cursor: pointer;
}

</style>
</head>
<body>
	 <div class="chat-wrap">
        <div class="chat-title">
            <h3>CAMPING TOGETHER</h3>
        </div>
        <div class="chat-content">
            <img src="/resources/image/chatting/tent.png">
        </div>
        <div class="btn">
            <a class="chat-btn">채팅방 입장하기</a>
        </div>
    </div>
    
  <script>
  	$(".chat-btn").on("click",function(){
  		window.open("http://192.168.10.46/allMemberChat.do","","left=700px,top=300px,width=500px,height=510px,menubar=no,status=no,scrollbars=yes");
  	});
  </script>
</body>
</html>
