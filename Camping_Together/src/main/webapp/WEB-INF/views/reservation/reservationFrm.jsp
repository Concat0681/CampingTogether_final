<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <!--폰트어썸 최신 CDN-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<style>
    .reserve-wrap{
        width: 1200px;
        height: 500px;
        margin: 0 auto;
        padding-top: 70px;
        display: flex;
    }
    
    .reserve-wrap .reserve-right{
        width:300px;
        height: 550px;
        background-color: rgb(250,250,250);
    }
    .reserve-wrap .reserve-left{
        width:800px;
        height: 100%;
    }
    .reserve-left{
        margin-right: 100px;
    }
    .reserve-info{
        border-bottom: 1px solid #eee;
        padding-bottom: 50px;
        margin-bottom: 50px;
    }
    .reserve-info input{
        box-sizing: border-box;
        padding: 8px 14px 8px 16px;
        width: 100%;
        height: 48px;
        border: none;
        border: 1px solid rgba(0,0,0,.08);
        border-radius: 4px;
        font-weight: 400;
        font-size: 18px;
        color: rgba(0,0,0,.56);
    }
    .fc-red{
    color: #e61c51;
    margin-left: 5px;
}
input[type=checkbox]+label{
    font-size: 16px;
    color: #0000008f;

}
#allAgreement+label{
    color: #000000de;
    font-weight: bold;
}
input[type="checkbox"] {
    display: none;
}

input[type="checkbox"] + label{
  cursor:pointer;
 }
/*input 바로 다음의 label:before 에 체크하기 전 CSS 설정*/

input[type="checkbox"] + label:before{
  content:"";
  display:inline-block;
  width:17px;
  height:17px;
  line-height:17px;
  border:1px solid #cbcbcb;
  vertical-align:middle;/*체크 전과 체크 후 높이 차이 때문에 설정*/
  }
  
/*checked된 input 바로 다음의 label:before 에 체크 후 CSS 설정*/  

input[type="checkbox"]:checked + label:before{
  content:"\f00c";/*폰트어썸 유니코드*/
  font-family:"Font Awesome 5 free"; /*폰트어썸 아이콘 사용*/
  font-weight:900;/*폰트어썸 설정*/
  color:#fff;
  background-color:#AD8B73;
  border-color:#AD8B73;
  font-size:13px;
  text-align:center;
  }
  .checkboxMg{
    margin-left: 8px;
  }
  .reserve-agrre{
    margin-bottom: 10px;
  }
.checkboxText{
    text-decoration : underline;
}
.reserve-phone{
  margin-top:10px;
  color:  rgba(0,0,0,0.56); 
}
.reserve-name{
    color:  rgba(0,0,0,0.56); 
}
.camping-p{
    color:  rgba(0,0,0,0.56); 
}
.camping-info{
    width: 250px;
    border-bottom: 1px solid #eee;
    margin: 0 auto;
    padding-top: 10px
}
.payment{
    width: 250px;
    margin: 0 auto;
    margin-top: 10px;
}
.li{
    font-size: 14px;
}
.ul{
    padding-left: 20px;
    margin-top: 10px;

}
.payBtn{
    width: 100%;
    height: 56px;
    line-height: 56px;
    border: none;
    color: #fff;
    text-align: center;
    font-size: 15px;
    background-color: #AD8B73;
    cursor: pointer;
}
.camping-pp{
    font-weight: bold;
}
.reserve-wrap{
	margin-top: 200px; 
}

</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <div class="reserve-wrap">
        <div class="reserve-left">
            <div class="reserve-info">
                <h3>예약자 정보</h3>
                <div class="reserve-name">
                    <p>예약자 이름</p>
                    <input type="text" class="memberId"value="${sessionScope.m.memberName }">
                    <input type="hidden" class="memberEmail" value="${sessionScope.m.memberEmail }">
                    <input type="hidden" class="memberNo" value="${sessionScope.m.memberNo }">
                   
                </div>
                <div class="reserve-phone">
                    <p>휴대폰 번호</p>
                    <input type="text" class="memberPhone" value="${sessionScope.m.memberPhone }">
                </div>
            </div>
            <div class="reserve-agrre-Box">
                <div class="reserve-agrre">
                    <input type="checkbox" id="allAgreement">
                    <label for="allAgreement" class="font"><span class="checkboxMg">전체동의</span></label>
                </div>
                <div class="reserve-agrre">
                    <input type="checkbox" id="lodgingAgreement" class="agreeCheck" name="agreeCheck">  
                    <label for="lodgingAgreement"><span class="checkboxMg checkboxText">숙소 이용규칙 및 취소/환불규정 동의</span><span class="fc-red">(필수)</span></label>
                </div>
                <div class="reserve-agrre">
                    <input type="checkbox" id="privacyAgreement" class="agreeCheck" name="agreeCheck">  
                    <label for="privacyAgreement"><span class="checkboxMg checkboxText">개인정보 수집 및 이용에 동의</span><span class="fc-red">(필수)</span></label>
                </div>
                <div class="reserve-agrre">
                    <input type="checkbox" id="optionalAgreement" class="agreeCheck" name="agreeCheck">
                    <label for="optionalAgreement"><span class="checkboxMg checkboxText">개인정보 제3자 제공 동의</span><span class="fc-red">(필수)</span></label>
                </div>
            </div>
        </div>
        <div class="reserve-right">
            <div class="camping-info">
                <div class="caming-name">
                    <p class="camping-p">숙소이름</p>
                    <p class="camping-pp campingTitle">${campingTitle }</p>
                    <input type="hidden" class="campingAddr" value="${addr }">
                    <input type="hidden" class="campingRoomNo" value="${campingRoomNo }">
                </div>
                <div class="caming-type">
                    <p class="camping-p">객실타입</p>
                    <p class="camping-pp campingType">${campingType }</p>
                </div>
                <div class="caming-checkIn">
                    <p class="camping-p">체크인</p>
                    <p class="camping-pp checkIn">${checkIn1 }</p>
                </div>
                <div class="caming-checkOut">
                    <p class="camping-p">체크아웃</p>
                    <p class="camping-pp checkOut">${checkOut1 }</p>
                </div>
            </div>
            <div class="payment">
                <div class="payment-total">
                    <span style="font-weight: bold; font-size: 20px;">결제 금액</span><span style="margin-left: 5px;">(VAT포함)</span>
                    <p style="color: #e61c51; font-weight: bold; font-size: 24px; margin: 0px; margin-top: 10px;" class="price"><fmt:formatNumber value="${price }"/>원</p>
                    <input type="hidden" class="campingRoomPrice" value="${price }">
                </div>
                <ul class=ul>
                    <li class=li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
                    <li class=li>결제완료 후 예약자 이름으로 바로 체크인 하시면 됩니다</li>
                </ul>
            </div>
            <button type="button" class="payBtn">결제하기</button>
        </div>
    </div>
</body>
<script>
  const allAgreement = document.querySelector("#allAgreement");
    //체크 박스에 값 변화가 발생하면..
    allAgreement.addEventListener("change",function(){
        // 체크 박스 3개이므로 all
        const agreeCheck = document.querySelectorAll(".agreeCheck");
        // 체크드라는 속성이 들어있는지..
        const status = allAgreement.checked;
        
        agreeCheck.forEach(function(agree){
            agree.checked = status;
        });
    });



    
//     			console.log(campingTitle);
//     			console.log(campingType);
//     			console.log(price);
//     			console.log(addr);
//     			console.log(memberEmail);
//     			console.log(memberId);
  const payBtn = $(".payBtn").on("click",function(){
        var chk = $("input[name=agreeCheck]:checked").length;
        // status 가 참이면 실행..
//         console.log(chk);
       		var campingRoomNo = $(".campingRoomNo").val();
    		var campingRoomPrice = $(".campingRoomPrice").val();
    		var campingTitle = $(".campingTitle").text();
    		var campingType = $(".campingType").text();
    		var campingAddr = $(".campingAddr").val();
    		var checkIn = $(".checkIn").text();
    		var checkOut = $(".checkOut").text();
    		var memberEmail = $(".memberEmail").val();
    		var memberId = $(".memberId").val();
    		var memberPhone = $(".memberPhone").val();
    		var memberNo =$(".memberNo").val();
    		console.log(campingRoomNo);
        if(chk==3){
//         	$(".payBtn").on(, function(){
    			const d = new Date(); //현재시간
    			const date = d.getFullYear()+"년"+(d.getMonth()+1)+"월"+d.getDate()
    			+"일"+d.getHours()+""+d.getMinutes()+""+d.getSeconds(); //문자열 덧셈 ""(빈문자열)
//     			console.log(price);
//     			console.log(date);
    			
    			IMP.init("imp22068625");
    			
    			IMP.request_pay({//결제요청
    				pg : "html5_inicis",
    				pay_method : "card", //카드결제
    				merchant_uid : "상품번호_"+date, //상점에서 관리하는 주문번호
    				name : "결제 테스트",//결제이름
    				amount : 100, //결제금액(콤마금지)
    				buyer_email : memberEmail,
    				buyer_name : memberId,
    				buyer_tel : memberPhone,
    				buyer_addr : "서울시 영등포구 당산동",
    				buyer_postcode : "12345"
    			},function(rsp){//결제정보
    				if(rsp.success){
    					alert("결제성공");
//     					location.href="/reservationInfo.do";
    					const form = $("<form action='/reservationInfo.do' method='post'></form>");
    					const campingTitleInput = $("<input type='hidden' name='campingTitle'>");
    					campingTitleInput.val(campingTitle);
    					const campingTypeInput = $("<input type='hidden' name='campingType'>");
    					campingTypeInput.val(campingType);
    					const campingAddrInput = $("<input type='hidden' name='campingAddr'>");
    					campingAddrInput.val(campingAddr);
    					const campingRoomPriceInput = $("<input type='hidden' name='campingRoomPrice'>");
    					campingRoomPriceInput.val(campingRoomPrice);
    					const checkInInput = $("<input type='hidden' name='checkIn'>");
    					checkInInput.val(checkIn);
    					const checkOutInput = $("<input type='hidden' name='checkOut'>");
    					checkOutInput.val(checkOut);
    					const campingRoomNoInput = $("<input type='hidden' name='campingRoomNo'>");
    					campingRoomNoInput.val(campingRoomNo);
    					const memberNoInput = $("<input type='hidden' name='memberNo'>");
    					memberNoInput.val(memberNo);
    					form.append(campingTitleInput).append(campingTypeInput).append(campingAddrInput).append(campingRoomPriceInput).append(checkInInput).append(checkOutInput).append(campingRoomNoInput).append(memberNoInput);
    					$("body").append(form);
    					form.submit();
    				}else{
    					alert("결제실패");
    				}
    			});
    			
//     		});
        }else{
            alert("필수 이용 동의 항목에 동의(체크)해주세요.");
        }
    });
    </script>
    
    <script>
		
	</script>
</html>