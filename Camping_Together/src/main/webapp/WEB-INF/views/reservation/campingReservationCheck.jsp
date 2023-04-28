<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a:hover{
		color: black !important;
	}
    .div-reservationCheck-wrap{
        width: 1200px;
        margin: 0 auto;
        margin-bottom: 370px;
    }
    .reservationCheck-wrap{
        width: 800px;
        height: 200px;
        margin: 0 auto;
    }
    .reservationCheck-img img{
        width: 200px;
        height: 200px;
        border-radius: 8px;
    }
    .reservationCheck-item{
        padding: 10px;
        border: 1px solid #e3e4e5;
        border-radius: 8px;
        display: flex;
    }
    .reservationCheck-content div{
        margin-top: 13px;
    }
    .reservationCheck-content{
        margin-left: 15px;
    }
 	.reservationCheck-wrap .reservationCheck-item:hover {
		box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
	}	
	.reservationCheck-wrap{
		margin-top: 250px;
	}
	.reservationCheck-item{
		margin-top: 30px;
	}
	.checkNull{
		padding-top:150px;
		text-align:center;
	}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="div-reservationCheck-wrap">
        <div class="reservationCheck-wrap">
    	<h3>예약내역 조회</h3>
    	  <c:if test="${member eq null }">
    	  <div class="checkNull-wrap">
    	  	<div class="checkNull">
    	  		조회된 내역이 없습니다.    	  	
    	  	</div>
    	  </div>
    	  </c:if>
		  <c:forEach items="${list }" var="crh">
			<a href="/reservationMyInfo.do?campingReservationNo=${crh.campingReservationNo }">
	            <div class="reservationCheck-item">
	                <div class="reservationCheck-img">
	                    <img src="/resources/upload/campingRoom/${crh.thumbnail }">
	                </div>
	                <div class="reservationCheck-content">
	                    <div style="font-weight: bold; font-size:18px;">${crh.campingTitle }</div>
	                    <div>캠핑 종류 : ${crh.campingRoomType }</div>
	                    <div><fmt:formatNumber value="${crh.campingRoomPrice }"/>원</div>
	                    <div>입실일 : ${crh.checkIn }</div>
	                    <div>퇴실일 : ${crh.checkOut }</div>
	                </div>
	            </div>
			</a>		  	
		  </c:forEach>
        </div>
    </div>
      <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>