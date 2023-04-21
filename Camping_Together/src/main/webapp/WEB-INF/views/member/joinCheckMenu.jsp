<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
.accordion-container{
  position: relative;
  max-width: 500px;
  height: auto;
}
.accordion-container > h2{
  text-align: center;
  color: #black;
  padding-bottom: 5px;
  margin-bottom: 20px;
}
.set{
  position: relative;
  width: 100%;
  height: auto;
  background: #CEAB93;
}
.set > a{
  display: block;
  padding: 10px 15px;
  text-decoration: none;
  color: #555;
  font-weight: 600;
  border-bottom: 1px solid #ddd;
  -webkit-transition:all 0.2s linear;
  -moz-transition:all 0.2s linear;
  transition:all 0.2s linear;
}
.set > a i{
  float: right;
  margin-top: 2px;
}
.set > a.active{
  background-color:#3399cc;
  color: #fff;
}
.content{
  background-color: #fff;
  border-bottom: 1px solid #ddd;
  display:none;
}
.content p{
  padding: 10px 15px;
  margin: 0;
  color: #333;
}
</style>
</head>
<body>
  <div class="accordion-container">
  <div class="set">
    <a> 캠핑투게더 이용약관 동의 (필수) <input type="checkbox" style="width: 20px; height: 20px; margin: 0;" class="checkBox fir-chek" value="fir-chek"> <i class="fa fa-plus"></i> </a>
    <div class="content">
      <p>여러분을 환영합니다. 캠핑투게더 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 캠핑투게더 서비스의 이용과 관련하여 캠핑투게더 서비스를 제공하는 캠핑투게더 주식회사(이하 ‘캠핑투게더’)와 이를 이용하는 캠핑투게더 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 캠핑투게더 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
			캠핑투게더 서비스를 이용하시거나 캠핑투게더 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.</p>
    	
    </div>
  </div>
  <div class="set"><a>  개인정보 수집 및 이용 동의 (필수) <input type="checkbox" style="width: 20px; height: 20px; margin: 0;" class="checkBox sec-chek" value="sec-chek"> <i class="fa fa-plus"></i></a>
    <div class="content">
      <div><span> 개인정보보호법에 따라 캠핑투게더에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</span></div>
    </div>
  </div>
  <div class="set"><a>  프로모션 정보 수신 동의(선택)  <input type="checkbox" style="width: 20px; height: 20px; margin: 0;" class="checkBox thr-chek" value="thr-chek"> <i class="fa fa-plus"></i></a>
    <div class="content">
      <div><span> 개인정보보호법에 따라 캠핑투게더에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</span></div>
   </div>
  </div>
</div>

</body>
<script>
$(document).ready(function() {
	  $(".set > a").on("click", function() {
	    if ($(this).hasClass("active")) {
	      $(this).removeClass("active");
	      $(this)
	        .siblings(".content")
	        .slideUp(200);
	      $(".set > a i")
	        .removeClass("fa-minus")
	        .addClass("fa-plus");
	    } else {
	      $(".set > a i")
	        .removeClass("fa-minus")
	        .addClass("fa-plus");
	      $(this)
	        .find("i")
	        .removeClass("fa-plus")
	        .addClass("fa-minus");
	      $(".set > a").removeClass("active");
	      $(this).addClass("active");
	      $(".content").slideUp(200);
	      $(this)
	        .siblings(".content")
	        .slideDown(200);
	    }
	  });
	  $(".confirm").click(function(){
		  if($(".checkBox") == false ){
			alert("이용약관을 확인해주세요.");
		  }
			  
	  });
	});
</script>
</html>