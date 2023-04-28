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
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="reservation-wrap">
        <h3 class="h3">예약조회</h3>
        <span>
            객실 예약시에 입력하셨던 예약자명과 전화번호를 입력하시면
            고객님의 객실 예약 현황을 확인 하실 수 있습니다.
        </span>
        <div class="reservation-content">
            <form action="/campingReservationCheck.do" method="post">
                <div class="reservation-name">
                    <input type="text" name="memberName" placeholder="예약자명" required>
                </div>
                <div class="reservation-phone">
                    <input type="text" name="memberPhone" placeholder="전화번호('-'포함 / 예:010-0000-0000)" required>
                </div>
                <div class="reservation-btn">
                    <button type="submit" class="btn3">예약조회</button>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<style>
    .reservation-wrap{
        width: 420px;
        margin: 0 auto;
        text-align: center;
        margin-top: 250px;
    }
    .h3{
        font-size: 30px;
    }
    .reservation-content{
        width: 400px;
        height: 250px;
        margin: 0 auto;
        margin-top: 20px;
        background-color: #E3CAA5;
        border-radius: 5px;
    }
    .reservation-name input{
        margin-top: 40px;
        
    }
    .reservation-phone input{
        margin-top: 20px;
    }
    .reservation-content input{
        width: 300px;
        height: 40px;
        border: 1px solid #eee;
        border-radius: 5px;
    }
    .btn3{
        width: 300px;
        height: 40px;
        margin: 20px;
        border-radius: 5px;
        border: none;
    }
    input{
    	padding-left: 10px;
    	font-size: 14px;
    }
</style>
</html>
</body>
</html>