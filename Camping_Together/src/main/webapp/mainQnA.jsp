<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous"/>
<link rel="stylesheet" href="style.css" />
<style>
@import url('https://fonts.googleapis.com/css?family=Muli&display=swap');

* {
  box-sizing: border-box;
}

body {
  font-family: 'Muli', sans-serif;
  background: url(/resources/image/main/CampingAtNight.jpg);
}

h1 {
  margin: 50px 0 30px;
  text-align: center;
  color: #fff;
}
h3{
	color: #fff;
}
.faq-container {
  max-width: 600px;
  margin: 0 auto;
}

.faq {
  background-color: transparent;
  border: 1px solid #9fa4a8;
  border-radius: 10px;
  margin: 20px 0;
  padding: 30px;
  position: relative;
  overflow: hidden;
  transition: 0.3s ease;
}

.faq.active {
  background-color: #fff;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1), 0 3px 6px rgba(0, 0, 0, 0.1);
}

.faq.active::before,
.faq.active::after {
  content: '\f075';
  font-family: 'Font Awesome 5 Free';
  color: #2ecc71;
  font-size: 7rem;
  position: absolute;
  opacity: 0.2;
  top: 20px;
  left: 20px;
  z-index: 0;
}

.faq.active::before {
  color: #3498db;
  top: -10px;
  left: -30px;
  transform: rotateY(180deg);
}

.faq-title {
  margin: 0 35px 0 0;
}

.faq-text {
  display: none;
  margin: 30px 0 0;
}

.faq.active .faq-text {
  display: block;
  color: black;
}

.faq-toggle {
  background-color: #fff;
  border: 0;
  border-radius: 50%;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  padding: 0;
  position: absolute;
  top: 30px;
  right: 30px;
  height: 30px;
  width: 30px;
}

.faq-toggle:focus {
  outline: 0;
}

.faq-toggle .fa-times {
  display: none;
}

.faq.active .faq-toggle .fa-times {
  color: #fff;
  display: block;
}

.faq.active .faq-toggle .fa-chevron-down {
  display: none;
}

.faq.active .faq-toggle {
  background-color: #9fa4a8;
}
</style>
</head>
<body>
	<div style="padding-top: 50px; width:100%; text-align:center;"><a href="/"><img src="/resources/image/logo/logo250x80.png"></a></div>
	    <h1>자주 묻는 질문</h1>
    <div class="faq-container">
      <div class="faq">
        <h3 class="faq-title">로그인이 안되요</h3>
        <p class="faq-text">신고 3회 이상 누적 당한경우 제재 대상 회원이 되어 서비스 이용이 제한됩니다.
        					업보 청산 당하셨네요? 평소행실을 되돌아 보시길..</p>
        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
      </div>
      <div class="faq">
        <h3 class="faq-title">중고장터에서 억울하게 사기 당했어요</h3>

        <p class="faq-text">유감입니다.</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
      </div>
      <div class="faq">
        <h3 class="faq-title">캠핑장 등록은 어디서 하나요?</h3>

        <p class="faq-text">캠핑장 등록은 회원가입시 "사업자"일 경우 가능하며 그외에는 저도 모릅니다. </p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
      </div>
      <div class="faq">
        <h3 class="faq-title">질문및 문의는 어디서 하나요!?</h3>

        <p class="faq-text">그만하세요 이제 안받습니다.</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
      </div>
    </div>
	
<script>
$(".faq-toggle").click(function() {
	  $(this).parent().toggleClass("active");
	});
</script>
</body>
</html>