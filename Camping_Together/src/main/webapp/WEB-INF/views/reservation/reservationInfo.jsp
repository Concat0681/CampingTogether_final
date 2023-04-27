<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    .reserve-wrap{
/*     	margin-top:150px; */
        width: 1200px;
        margin: 200px auto;
    }
    
    .reserve-wrap .reserve-left{
        width:500px;
        height: 100%;
    }
    .reserve-left{
        margin: 0 auto;
    }
    .reserve-info{
        padding-bottom: 10px;
    }
    .reserve-info input{
        box-sizing: border-box;
        width: 100%;
        height: 30px;
        border-top: none;
        border-left: none;
        border-right: none;
        font-weight: 400;
        border-color: #eee;
        font-size: 18px;
    }

  .reserve-agrre{
    margin-bottom: 10px;
  }
.checkboxText{
    text-decoration : underline;
}
.reserve-phone{
  color:  rgba(0,0,0,0.56); 
}
.reserve-name{
    color:  rgba(0,0,0,0.56); 
}
.reserve-room{
    color:  rgba(0,0,0,0.56); 
}
.reserve-addr{
    color:  rgba(0,0,0,0.56); 
}
.camping-p{
    color:  rgba(0,0,0,0.56); 
}
.camping-info{
    width: 250px;
    border-bottom: 1px solid #eee;
    margin: 0 auto;
}

.btn1{
    width: 50%;
    height: 56px;
    line-height: 56px;
    border: none;
    color: #fff;
    text-align: center;
    font-size: 15px;
    background-color: #AD8B73;
    cursor: pointer;
    border-radius: 8px;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="reserve-wrap">
        <div class="reserve-left">
        	<p style="border-bottom: 1px solid #eee; margin: 0; padding-bottom: 10px; font-size:24px; font-weight: bold;">예약내역</p>
            <div class="reserve-info">
                <p style="font-size:18px; font-weight: bold">예약자 정보<p>
                <div class="reserve-name">
                    <p>예약자 이름</p>
                    <input type="text" value="${sessionScope.m.memberName } " readonly>
                </div>
                <div class="reserve-phone">
                    <p style="margin-top: 15px;">휴대폰 번호</p>
                    <input type="text" value="${sessionScope.m.memberPhone } " readonly>
                </div>
                <div class="reserve-phone">
                    <p style="margin-top: 15px;">결제일</p>
                    <input type="text" value="${campingPaymentDate }" readonly>
                </div>
                <div class="reserve-phone">
                    <p style="margin-top: 15px;">체크인</p>
                    <input type="text" value="${checkIn }" readonly>
                </div>
                <div class="reserve-phone">
                    <p style="margin-top: 15px;">체크아웃</p>
                    <input type="text" value="${checkOut }" readonly>
                </div>
            </div> 
            <div class="reserve-info">
                <p style="font-size:18px; font-weight: bold">숙소 정보</p>
                <div class="reserve-room">
                    <p style="margin-top: 15px;">숙소명</p>
                    <input type="text" value="${campingTitle }" readonly>
                </div>
                <div class="reserve-addr">
                    <p style="margin-top: 15px;">주소</p>
                    <input type="text" value="${campingAddr }" readonly>
                </div>
            </div>
            <div style="display:flex;">
	            <div>
	            	<a href="/">
	            		<button type="button" class="btn1" style="width: 500px; margin-right: 10px;">홈으로</button>
	            	</a>
	            </div>
            </div>
        </div>
    </div>    
</body>

</html>
</body>
</html>