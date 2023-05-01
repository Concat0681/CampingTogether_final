<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <script src="https://code.jquery.com/jquery-3.6.1.js"></script>  -->


<!--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

-->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/resources/css/bootStrap.css" rel="stylesheet"/>
<link href="/resources/css/default.css" rel="stylesheet"/>	
<link href="/resources/css/message.css" rel="stylesheet"/> 
<link href="/resources/css/header.css" rel="stylesheet"/> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<body>	
<!--  쪽지함 modal -->
<div class="message-comset" style="display: none;">
	<div class="message-modal-wrapper">
	  <div class="wrapper-header">
	    <div class="material-symbols-outlined filler" id="modal-cancle1">cancel</div><span style="line-height: 40px;margin-right: 20px;">${sessionScope.m.memberName }님! 읽지 않은 쪽지가 [<span id="messageCount"></span>]개 있어요!</span>

	  </div>
	  <hr style="margin: 0px;">
		<div class="wrapper-body">
			      <ul class="tab-group">
				       <li class="tab active"><a href="#receiveBox">받은 쪽지</a></li>
				       <li class="tab"><a href="#sendBox">보낸 쪽지</a></li>
				       <li class="tab"><a href="#sendMessage-modal">쪽지 보내기</a></li>
			      </ul>
			<!-- 쪽지 보내기 -->
			<div class="tab-content">
			  <div id="sendMessage-modal" class="endtreed">
						<div class="modal-content1">
							<div class="sendMessageFrm">
								<div class="message-inputBox"><input type="text" name="receiver" id="receiver" placeholder="받는사람" style="width: 100%;"></div>
								<div class="message-inputBox"><input type="text" id="messageTitle" name="messageTitle" placeholder="제목" style="width: 100%;"></div>
								<textarea name="messageContent" placeholder="내용"></textarea>
								<input type="hidden" id="sender" name="sender" value="${sessionScope.m.memberId }">
								<button onclick="messageSend();" class="sender"><span style="font-family: ng-extra-bold; color: #fff;">보내기</span></button>
							</div>
						</div>
				</div>
				<!-- 받은 쪽지 -->
				<div class="endtreed" id="receiveBox">
				<table class="receiveTbl">
					<thead>
						<tr>
							<th>발신자</th>
							<th>제목</th>
							<th>내용</th>
							<th>시간</th>
							<th class="readCheck">읽음여부</th>
						</tr>
					</thead>
					
					<tbody></tbody>
				</table>
			  </div>
				<!-- 보낸 쪽지 -->
				<div class="endtreed" id="sendBox">
					<table class="sendTbl">
						<thead>
						<tr>
							<th>수신자</th>
							<th>제목</th>
							<th>내용</th>
							<th>시간</th>
						</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</div>
<!-- 상세 보기  -->
	<div class="messageDetail-wrapper" id="messageDetail">
		<div class="messageDetail-modal">
			<div class="messageDetail-header">
				<h2>쪽지내용</h2>
				<button class="close-btn">&times</button>
			</div>
			<hr style="margin: 0px;">
			<div class="messageDetail-content3">
				<div class="messageFrm">
					<div>
						<span>발신자: </span> <span id="detailSender"></span>
					</div>
					<div>
						<span>날짜: </span> <span id="detailDate"></span>
					</div>
					<div>
						<span>내용: </span> <span id="detailContent"></span>
					</div>
					<button onclick="closeDetail();">닫기</button>
					<button onclick="replyMessage();">답장</button>
				</div>
			</div>
		</div>
	</div>
<!--  헤더 nav -->
<div class="headerBox">
	<c:choose>
		<c:when test="${empty sessionScope.m }"> 
		<div class="wrapper-top" style="background-color: rgba(173, 139, 115, 1);" >
        <div class="nav-top" style="color: #fff;">
            <ul class="login">
            	<li><a class="nav-linkT" href="/noticeList.do?reqPage=1">공지사항</a></li>
                <li><a class="nav-linkT" href="/joinFrm.do">로그인</a></li>
                <li><a class="nav-linkT" href="/joinFrm.do">회원가입</a></li>
            </ul>
        </div>
    </div>
    </c:when>
		<c:otherwise>
	<div class="wrapper-top" style="background-color: rgba(173, 139, 115, 1);">
        <div class="nav-top" style="color: #fff;">
            <ul class="login">
                <!-- <li><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">쪽지보내기</button></li> -->
                <li><a class="nav-linkT" href="/noticeList.do?reqPage=1">공지사항</a></li>
                <li><a class="nav-linkT messageBtn" id="messageBtn" href ="#">쪽지함</a></li>
                <c:choose>
                	<c:when test="${sessionScope.m.memberGrade eq 'c' }">
		                <li><a class="nav-linkT" href = "/cmapingPayList.do?reqPage=1&memberNo=${sessionScope.m.memberNo }">[${sessionScope.m.memberName }]</a></li>
               			 <li><a class="nav-linkT" href="/shopWishList.do?reqPage=1&memberId=${sessionScope.m.memberId }">장바구니</a></li>
                	</c:when>
                	<c:when test="${sessionScope.m.memberGrade eq 's' }">
		                <li><a class="nav-linkT" href = "/sellList.do?reqPage=1&memberId=${sessionScope.m.memberId }">[${sessionScope.m.memberName }]</a></li>
                	</c:when>
                	<c:when test="${sessionScope.m.memberGrade eq 'a' }">
		                <li><a class="nav-linkT" href = "/shopProductList.do?reqPage=1&memberId=${sessionScope.m.memberId }">[${sessionScope.m.memberName }]</a></li>
                	</c:when>
                </c:choose>
                <li><a class="nav-linkT" href="/logout.do">로그아웃</a></li>
            </ul>
        </div>
    </div>
		</c:otherwise>
	</c:choose>
    <nav class="wrapper-bottom navbar navbar-expand-lg" style="background-color: rgba(255, 255, 255, 1);">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/"><img src="/resources/image/logo/logo250x80.png" width="250px" height="80px"></a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" href="/campingListMain.do?memberId=${sessionScope.m.memberId }">캠핑</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/campingReservationCheckFrm.do">예약조회</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/usedBoardList.do?reqPage=1&memberId=${sessionScope.m.memberId }">중고장터</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/shopMainList.do">투게더SHOP</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	자유게시판
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="/boardFoodList.do?reqPage=1">캠핑 레시피</a></li>
	            <li><a class="dropdown-item" href="#">캠핑 Tip</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="allMemberChatFrm.do">채팅</a></li>
	            <li><a class="dropdown-item" href="/inquiryList.do?reqPage=1">문의사항</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
</div>

<!-- 로그인이 필요한 모달 창 -->
	<div id="modalVer1" class="modalVer1">
	  <div class="modal-content4">
	    <div class="closeBox">
	    <span class="close">&times;</span>
	    </div>
	    <h3>로그인이 필요한 서비스입니다.</h3>
	    <span class="five-second"></span>
		    <div class="circle-container">
			    <span class="material-symbols-outlined">circle</span>
			    <span class="material-symbols-outlined">circle</span>
			    <span class="material-symbols-outlined">circle</span>
			    <span class="material-symbols-outlined">circle</span>
			    <span class="material-symbols-outlined">circle</span>
		    </div>
	    <button type="button" class="modal-login">로그인하기</button>
	  </div>
	</div>
	
<!--  헤더 스크립트 -->
<script>
	
const navbarTop = document.querySelector('.wrapper-top');
const navbarBottom = document.querySelector('.navbar');
const navLinkt = document.querySelectorAll('.nav-linkT');
const navLink =  document.querySelectorAll('.nav-link');
	
	function init() {
		document.addEventListener('load', function() {
			navbarTop.style.backgroundColor = 'rgba(173, 139, 115, 0.2)';
			navbarBottom.style.backgroundColor = 'rgba(173, 139, 115, 0.2)';
			for(let i=0; i < navLink.length; i++){
	        	  navLink[i].style = 'color';
	        	  navLink[i].style.color = 'rgb(255, 255, 255)';
			}
			
		});
		  window.addEventListener('scroll', function() {
		      // 현재 스크롤 위치를 가져옴
		      var scrollTop = window.pageYOffset || document.documentElement.scrollTop;

		      // 현재 스크롤 위치가 300px 이상인 경우에만 실행
		      if (scrollTop >= 300) {
		        // 네비바의 배경색을 1초 동안 투명도 1로 변경
		        navbarTop.style.transition = 'background-color 1s';
		        navbarTop.style.backgroundColor = 'rgba(255, 255, 255, 1)';
		        
		      } else {
		        // 네비바의 배경색을 원래대로 복원
		        navbarTop.style.transition = 'background-color 1s';
		        navbarTop.style.backgroundColor = 'rgba(173, 139, 115, 0.2)';
		       
		      }
		      if (scrollTop >= 300) {
		          // 네비바의 배경색을 1초 동안 투명도 1로 변경
		          navbarBottom.style.transition = 'background-color 1s';
		          navbarBottom.style.backgroundColor = 'rgba(255, 255, 255, 1)';
		        } else {
		          // 네비바의 배경색을 원래대로 복원
		          navbarBottom.style.transition = 'background-color 1s';
		          navbarBottom.style.backgroundColor = 'rgba(173, 139, 115, 0.2)';
		          
		        }
		      if (scrollTop >= 300) {
		          //네비바의 컨텐츠 글자색을 흰색으로
		          for(let i=0; i < navLink.length; i++){
		        	  navLink[i].style = 'color';
		        	  navLink[i].style.color = '#AD8B73';
		        	  
		          }
		          
		        } else {
		          // 네비바의 컨텐츠 글자색을 원래대로 복원
		          for(let i=0; i < navLink.length; i++){
		        	  navLink[i].style = 'color';
		        	  navLink[i].style.color = 'rgb(255, 255, 255)';
		          }
		      
		        }
		      if (scrollTop >= 300) {
		          //네비바의 컨텐츠 글자색을 컨셉 컬러로
		          for(let i=0; i < navLink.length; i++){
		        	  navLink[i].style = 'color';
		        	  navLink[i].style.color = '#AD8B73';
		          }
		          
		        } else {
		          // 네비바의 컨텐츠 글자색을 원래대로 복원
		          for(let i=0; i < navLink.length; i++){
		        	  navLink[i].style = 'color';
		        	  navLink[i].style.color = 'rgb(255, 255, 255)';
		          }
		      
		        }
		        if (scrollTop >= 300) {
			          //네비바의 컨텐츠 글자색을 흰색으로
			          for(let i=0; i < navLinkt.length; i++){
			        	  navLinkt[i].style = 'color';
			        	  navLinkt[i].style.color = '#AD8B73';
			          }
			          
			        } else {
			          // 네비바의 컨텐츠 글자색을 원래대로 복원
			          for(let i=0; i < navLinkt.length; i++){
			        	  navLinkt[i].style = 'color';
			        	  navLinkt[i].style.color = 'rgb(255, 255, 255)';
			          }
			        }
		    });
	}
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('li:has(ul)').forEach(function(element) {
            element.addEventListener('mouseenter', function() {
                this.querySelector('ul').style.display = 'block';
            });
            element.addEventListener('mouseleave', function() {
                this.querySelector('ul').style.display = 'none';
            });
        });
    });

    
    
    
</script>
<!-- 쪽지 모달 스크립트 -->
<script>

//웹소켓 사용 안읽은 쪽지 불러오기

$('.messageRecTdContent').click(function() {

    // 모달창을 보여줍니다.
    $('#messageDetail').css('display', 'block');
});

$('.close-btn').click(function() {
	$('#messageDetail').css('display', 'none');
});

$(".messageBtn").on("click", function() {
	  $(".message-comset").css("display", "block");
	});
	
$("#modal-cancle1").click(function() {
    $(".message-comset").css("display", "none");
    $(".endtreed").css("display", "none");
  });

//탭 변경창
$('.tab a').on('click', function (e) {
  e.preventDefault();
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  target = $(this).attr('href');
  $('.tab-content > div').not(target).hide();
  $(target).fadeIn(1000);
});


$("#sendMessage-modal").on("click", function(){
$.ajax({
        url : "/selectAllMemberId.do", //멤버 컨드롤러에서 만들겁니다
        success : function(list){
            $("[name=receiver]").empty(); //empty() 안넣어주면 중복으로 아이디가 들어감
            $("#sendMessage-modal").css("display","block");
        }
    });

})
	
function closeModal(){
    $("#sendMessage-modal").hide();
    $("textarea[name=messageContent]").val("");
}

function messageSend(){
    const receiver = $("[name=receiver]").val();
    const sender = $("#sender").val();
    const messageContent = $("[name=messageContent]").val();
    const messageTitle = $("[name=messageTitle]").val();
    
    $.ajax({
        url : "/insertMessage.do",
        type : "post",
        data : {receiver:receiver, sender:sender, messageContent:messageContent, messageTitle:messageTitle },
        success : function(data){
            if(data == "0"){
                alert("쪽지보내기 실패");
            }
            const sendData = {type:"sendMessage", receiver:receiver};
            getSendMessage();
            closeModal();
        }
    });
}

function getSendMessage(){
    const sender = $("#sender").val();
    $.ajax({
        url: "/myMessageList.do",
        data: {sender:sender},
        success : function(list){
            const tbody = $(".sendTbl>tbody");
            tbody.empty();
            for(let i=0;i<list.length;i++){
                const message = list[i];
                const tr = $("<tr style='border-bottom: 1px solid;' >");
                //보낸사람, ,제목,내용 , 시간, 읽음여부
                const td1 = $("<td style='border: none; width: 180px;'>");
                td1.text(message.sender);
                const td2 = $("<td>");
                td2.text(message.messageTitle);
                const td3 = $("<td>");
                td3.text(message.messageContent);
                const td4 = $("<td>");
                td4.text(message.messageDate);
                
                td1.addClass("messageTd");
                td2.addClass("messageTd");
                td3.addClass("messageTd");
                td4.addClass("messageTd");
                td2.addClass("messageTdTitle");
                td3.addClass("messageTdContent");
                
                
                tr.append(td1).append(td2).append(td3).append(td4);
                tbody.append(tr);
            }
        }
    });
}



function getReceiveMessage(){
    const receiver = $("#sender").val();
    $.ajax({
        url: "/myMessageList.do",
        data: {receiver:receiver},
        success : function(list){
            const tbody = $(".receiveTbl>tbody");
            tbody.empty();
            for(let i=0;i<list.length;i++){
                const message = list[i];
                const tr = $("<tr style='border-bottom: 1px solid;' >");
                //보낸사람, 내용 , 시간, 읽음여부
                const td1 = $("<td style='border: none; width: 180px;'>");
                td1.text(message.sender);
                const td2 = $("<td>");
                td2.text(message.messageTitle);
                const td3 = $("<td>");
                td3.text(message.messageContent);
                td3.attr("onclick","messageDetail("+message.messageNo+");");
                const td4 = $("<td>");
                td4.text(message.messageDate);
                const td5 = $("<td>");
                if(message.readCheck == 0 ){
                    tr.addClass("bold");
                	td5.text("읽지않음");


                }else{
                    td5.text("확인완료");
                }
                td1.addClass("messageTd");
                td2.addClass("messageTd");
                td3.addClass("messageTd");
                td3.addClass("messageRecTdContent");
                td4.addClass("messageTd");
                td5.addClass("messageTd");
                td2.addClass("messageRecTdTitle");
                tr.append(td1).append(td2).append(td3).append(td4).append(td5);
                tbody.append(tr);


			    

                
            }
        }
    });
    
    
}

function getReceiveMessage(){
    const receiver = $("#sender").val();
    $.ajax({
        url: "/myMessageList.do",
        data: {receiver:receiver},
        success : function(list){
            const tbody = $(".receiveTbl>tbody");
            tbody.empty();
            let unreadCount = 0; // 읽지 않음 카운트
            for(let i=0;i<list.length;i++){
                const message = list[i];
                const tr = $("<tr style='border-bottom: 1px solid;' >");
                //보낸사람, 내용 , 시간, 읽음여부
                const td1 = $("<td style='border: none; width: 180px;'>");
                td1.text(message.sender);
                const td2 = $("<td>");
                td2.text(message.messageTitle);
                const td3 = $("<td>");
                td3.text(message.messageContent);
                td3.attr("onclick","messageDetail("+message.messageNo+");");
                const td4 = $("<td>");
                td4.text(message.messageDate);
                const td5 = $("<td>");
                if(message.readCheck == 0 ){
                    tr.addClass("bold");
                    td5.text("읽지않음");
                    unreadCount++; // 안 읽은 쪽지 갯수
                }else{
                    td5.text("확인완료");
                }
                td1.addClass("messageTd");
                td2.addClass("messageTd");
                td3.addClass("messageTd");
                td3.addClass("messageRecTdContent");
                td4.addClass("messageTd");
                td5.addClass("messageTd");
                td2.addClass("messageRecTdTitle");
                tr.append(td1).append(td2).append(td3).append(td4).append(td5);
                tbody.append(tr);
            }
            $("#messageCount").text(unreadCount); // 숫자 띄우기
        }
    });
}


$(".messageRecTdContent").on("click", function(){
	$(".modal-wrapper").css("display","block");
	
});

function messageDetail(messageNo){
	console.log(messageNo);
    $.ajax({
        url : "/messageDetail.do",
        data: {messageNo : messageNo},
        success : function(data){
        	console.log(data);
            $("#detailSender").text(data.sender);
            $("#detailDate").text(data.messageDate);
            $("#detailContent").text(data.messageContent);
            $("#messageDetail").css("display","block");
            getReceiveMessage();
            const sendData = {type:"readCheck", sender:data.sender, receiver:data.receiver};
            ws.send(JSON.stringify(sendData));

        }
    });
}

function closeDetail(){
    $("#messageDetail").hide();
}

$(function(){
	getSendMessage();
	getReceiveMessage();
});

</script>
<!--기본 모달 스크립트 -->
<script>


    // 모달창 열기 버튼 클릭 이벤트
    $(document).ready(function() {

    	  
    	  $(".loginBtn").click(function(event) { // a태그, 버튼 아이디,클래스 입력
    		if (event.stopPropagation) event.stopPropagation();
    		else event.cancelBubble = true; // IE 대응
    	    $("#modalVer1").css("display", "block"); 
    	    const circles = $('.circle-container span');
    		  let index = 0;

    		  setInterval(function() {
    		    circles.eq(index).addClass('active');
    		    index++;
    		    if (index >= circles.length) {
    		      clearInterval();
    		    }
    		  }, 1000);

    		  const countdown = $('.five-second');
    		  let count = 5; // 5초로 설정
    			
    		  const interval = setInterval(function() {
    		    countdown.text(count);
    		    countdown.css('opacity', count / 5);
    		    count--;

    		    if (count < 0) {
    		      clearInterval(interval);
    		      location.href = '/joinFrm.do';
    		      circles.removeClass('active');
    		    }
    		  }, 1000); //end interval , 1초로 설정
    		  
    		// 로그인 버튼 클릭 시 카운트다운 리셋
    		  $(".modal-login").click(function() {
    		    circles.removeClass('active');
    		    clearInterval(interval);
    		    count = 5;
    		    interval = setInterval(function() {
    		      countdown.text(count);
    		      countdown.css('opacity', count / 5);
    		      count--;

    		      if (count < 0) {
    		        clearInterval(interval);
    		        location.href = '/joinFrm.do';
    		      }
    		    }, 1000);
    		  });
    		// 모달 창이 닫혀있을 때 카운트 리셋
    		  $('#modalVer1').click(function() {
    		    $('#modalVer1').css('display', 'none');
    		    clearInterval(interval);
    		    count = 5;
    		    circles.removeClass('active');
    		  });
    	  
    	  });

    	  // 모달창 닫기
    	  $(".close").click(function() {
    	    $(".modalVer1").css("display", "none");
    	  });

    	  // 모달창 이외의 영역 클릭 시 모달창 닫기
    	  $(window).click(function(event) {
    	    if (event.target == $("#modalVer1")[0]) {
    	      $(".modalVer1").css("display", "none");
    	    }
    	  });
    });

    	
    $(".modal-login").click(function () {
    	location.href = '/joinFrm.do';		
    });

</script>
</body>
</html>