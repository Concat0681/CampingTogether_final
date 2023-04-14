<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
	P{
		margin-bottom: 8px !important;
	}
	.material-symbols-outlined {
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 300,
	  'GRAD' 0,
	  'opsz' 48
	}
	.fill{
		font-variation-settings: 'FILL' 1
	}
	.wght{
		font-variation-settings: 'wght' 600
	}
	.detail-content-wrap{
		position: relative;
	}
	.detail-content-wrap a{
		font-family: ng-bold;
	}
	.detail-content-wrap a:hover{
		color: #CEAB93;
	}
   .page-content{
   		width: 1200px;
        margin: 0 auto;
   		padding-top: 130px;
   }
   .content-top>h2{
        margin: 20px;
        font-family: ng-bold;
   }
   .category-info>p{
   		margin: 0;
   		margin-left: 3px;
   		color: #CEAB93;
   }
   .detail-wrap{
   		width: 80%;
   		margin: 30px auto;
   		border-bottom: 1px solid #ccc;
   }
   .detail-title{
   		display: flex;
   }
   .detail-title>h3{
   		margin-bottom: 0;
   		font-family: ng-extra-bold;
   		color: #AD8B73;
   }
   .detail-title>.sell-status{
   		background-color: #CEAB93; 
   		padding: 6px 8px;;
   		text-align: center;
   		border-radius: 20px;
   		margin-left: 10px;
   		color: #FFFBE9;
   		font-size: 13px;
   }
   .detail-title>.sell-status>span{
   		font-family: ng-extra-bold;
   }
   .detail-info{
   		display: flex;
   }
   .detail-top-wrap, .detail-price-wrap, .comment-list-wrap{
   		padding-left: 20px;
   		padding-bottom: 10px;
   		padding-top: 15px;
   		border-bottom: 1px solid #ccc;
   }
   .detail-top-wrap{
   		padding-bottom: 5px;
   		border-bottom: 3px double #AD8B73;
   }
   .detail-price-wrap{
   		border-bottom: 3px double #AD8B73;
   		border-radius: 5px;
   		padding-bottom: 0;
   }
   .comment-list-wrap{
   		border: 0;
   		margin-top: 10px;
   }
   .detail-price-wrap{
   		position: relative;
   }
   #phone-check{
   		font-size: 14px;
   		color: #AD8B73;
   }
   #phone-check:hover{
   		cursor: pointer;
   		color: #E3CAA5;
   }
   .wish-list{
		position: absolute;
		margin-left: 890px;
		top: 50px;
   }
   .wish-list>span{
   		font-size: 30px;
   		font-weight: 100;
   		color: #AD8B73;
   		cursor: pointer;
   }
   .detail-content-wrap{
   		padding: 10px;
   }
   .detail-content-wrap div{
   		margin-bottom: 20px;
   }
   .detail-content{
   		display: flex;
   }
   .detail-content-img{
   		margin-top: 30px;
   		width: 500px;
   		height: 500px;
   }
   .detail-content-img img{
   		width: 500px;
   		height: 500px;
   		border-radius: 6px;
   		border: 1px solid #ccc;
   }
   .detail-content-text{
   		width: 400px;
   		padding-top: 50px;
   		padding-left: 50px;
   }
   .comment-wrap{
   		width: 80%;
   		margin: 50px auto;
   }
   .comment-box-wrap{
   		overflow: hidden;
   }
	.comment-box{
		width: 95%;
		display: flex;
		margin: 0 auto;
	}
   #comment-box{
   		width: 800px;
   		height: 80px;
   		border: 1px solid #ccc;
   		resize: none;
   		padding: 8px;
   		box-sizing: border-box;
   		border-radius: 5px;
   }
   #comment-box:focus{
   		border: 2px solid #CEAB93;
   }
   .btn2{
		width: 100px;
		height: 80px;
		font-weight: bold;
   }
   .btn2:hover{
   		background-color: #CEAB93;
   }
   .font-bold{
   		font-weight: bold;
   }
   .comment-list{
   		display: flex;
   		min-height: 80px;
   		margin-top: 30px;
   		margin-bottom: 50px;
   }
   .comment-writer-wrap{
   		width: 10%;
   		text-align: center;
   		padding-top: 13px;
   }
   .user-profile{
   		width: 50px;
   		height: 50px;
   		margin: 0 auto; 		
   }
   .user-profile>img{
   		width: 100%;
   		border-radius: 50px;
   }
   .user-id{
   		display: inline-block;
   }
   .user-id>p{
   		font-family: ng-extra-bold;
   		color: #AD8B73;
   		margin-bottom: 0;
   }
   .comment-write-content{
   		width: 85%;
   		border: 1px solid #ccc;
   		padding: 10px;
   		border-radius: 8px;
   		word-break:break-all;
   		overflow: hidden;
   }
   .comment-write-info{
   		display: inline-block;
   		float: right;
   		color: #ccc;
   		font-family: ng-bold;
   		font-size: 13px;
   }
   .comment-write-info>a:hover{
   		color: #E3CAA5;
   }
   .comment-write-content>p{
   		margin-bottom: 0;
   }
   .comment-modify-link{
   		color: #CEAB93;
   		font-size: 13px;
   		text-align: right;
   }
   .comment-modify-link>a{
   		margin-left: 5px;
   }
   .comment-modify-link>a:hover{
   		color: #E3CAA5;
   }
   /*모달 css*/
	.modal-phone-wrapper{
		position: absolute;
		border-radius: 8px;
		z-index: 998;
		background-color: #CEAB93;
		box-sizing: border-box;
		height: 200px;
		top: 40px;
		padding: 15px;
		left: 1px;
		display: none;
		border: 4px double #FFFBE9;
		width: 300px;
	}
	.sell-user{
		display: flex;
		width: 90%;
		margin: 0 auto;
	}
	.sell-user-info{
		margin-bottom: 3px;
	}
	.sell-user-info>.sell-user-id{
		text-align: center;
		margin-bottom: 3px;
	}
	.sell-user-info>.user-phone{
		margin-bottom: 3px;
	}
	.sell-user-info>.user-blacklist-info{
   		text-align: center;
   }
	.modal-phone-header{
		border-bottom: 4px double #FFFBE9;
	}
	.modal-phone-header>.header-title>p{
		font-family: ng-extra-bold;
		color: #FFFBE9;
		font-size: 18px;
		margin-bottom: 10px;
	}
	.modal-phone-header>.header-title{
		margin-bottom: 0;
		display: inline-block;
	}
	#modal-cancle{
   		cursor: pointer;
   		color: #FFFBE9;
		margin-bottom: 0;
		padding-top: 4px;
		float: right;
   }
   .sell-user-wrap>.sell-user-img{
   		width: 50px;
   		height: 50px;
   		margin-bottom: 0;   
   		margin-top: 20px;		
   }
   .sell-user-img>img{
   		border-radius: 50%;
   		width: 100%;
   }
   .sell-user-info{
   		margin-left: 30px;
   }
   .user-phone{
   		display: flex;
   }
   .user-phone>div{
   		color: #FFFBE9;
   		font-size: 20px;
   		line-height: 25px;
   		margin-right: 5px;
   }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-content">
		<div class="content-top">
            <h2>상품정보</h2>
            <hr>
        </div>
        <div class="detail-wrap">
        	<div class="detail-top-wrap">
        		<div class="category-info">
        			<p class="font-bold">${ub.getUsedBoardCategoryText() }</p>
        		</div>
        		<div class="detail-title">
        			<h3>${ub.usedBoardTitle }</h3>
        			<div class="sell-status"><span>판매중</span></div>
        		</div>
        		
        	</div>
        	<div class="detail-price-wrap">
        		<div class="detail-info">
	        			<p class="font-bold" style="color:#AD8B73;">${ub.usedBoardWriter }</p>
	        			<p style="color:#ccc;">&nbsp; :: &nbsp;</p>
	        			<p style="color:#ccc;">${ub.regDate }</p>
	        			<p style="color:#ccc;">&nbsp; :: &nbsp;</p>
	        			<p class="material-symbols-outlined" style="color:#ccc;">visibility</p>
	        			<p style="color:#ccc;">${ub.readCount }</p>
        		</div>
        		<div class="detail-price">
        			<p class="font-bold" style="color:#AD8B73;">판매금액 : <fmt:formatNumber value="${ub.usedProductPrice }" pattern="#,###" /></p>
        			<div class="detail-info">
        				<p class="font-bold" style="color:#AD8B73;">상품상태 : </p><p>&nbsp;${ub.getUsedProductStatusText() }&nbsp;&nbsp;&nbsp;&nbsp;</p>
        				<p class="font-bold" style="color:#AD8B73;">교환여부 :</p> <p>&nbsp;${ub.getExchangeStatusText() }&nbsp;&nbsp;&nbsp;&nbsp;</p>
        				<p class="font-bold" style="color:#AD8B73;">거래지역 :</p><p>&nbsp;${ub.usedTradeLocation }</p>
        			</div>
        		</div>
        		<div class="wish-list">
        			<span class="material-symbols-outlined">favorite</span>
        		</div>
        	</div>
        	<div class="detail-content-wrap">
        		<div class="seller-phone">
        			<span id="phone-check" class="font-bold" onclick="sellUserCheck('${ub.usedBoardWriter}')">연락처를 확인하려면 클릭하세요.</span>
        		</div>
        		<%-- 연락처 모달 --%>
        		<div class="modal-phone-wrapper">
        			<div class="modal-wrap">
        				<div class="modal-phone-header">
        					<div class="header-title">
	        					<p>판매자 정보</p>
        					</div>
        					<div class="material-symbols-outlined fill" id="modal-cancle">cancel</div>
        				</div>
        				<div class="sell-user">
        					<div class="sell-user-wrap">
	        					<div class="sell-user-img">
	        						<img src="/resources/image/member/img.jpeg">
	        					</div>
	        				</div>
	        				<div class="sell-user-info">
		        				<div class="sell-user-id">
	        						<p style="font-family: ng-extra-bold; color:#FFFBE9;margin-bottom: 0;">user01</p>
	        					</div>
	        					<div class="user-phone">
	        						<div class="material-symbols-outlined wght">phone_in_talk</div>
	        						<span style="font-family: ng-extra-bold;color:#FFFBE9;">010-0000-0000</span>
	        					</div>
	        					<div class="user-blacklist-info">
	        						<span style="color:#FFFBE9;">신고건수 0건</span>
	        					</div>
	        				</div>
        				</div>
        			</div>
        		</div>
        		<script>
        			function sellUserCheck(usedBoardWriter){
        			/* 필요한 회원정보 : 아이디, 사진, 연락처, 판매중인물품 */
        			/* 사기조회 : 신고건수 */
        				$(".modal-phone-wrapper").slideToggle();
        				
        			}
        			$("#modal-cancle").on("click", function(){
        				$(".modal-phone-wrapper").slideUp();
        			});
        		</script>
        		<div class="detail-content">
					<div class="detail-content-img">
						<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
						  <div class="carousel-inner">
						  	<c:choose>
						  		<c:when test="${empty ub.usedBoardPhotoList }">
						  			<div class="carousel-item">
						      			<img src="/resources/image/usedBoard/noImg.gif" class="d-block w-100" alt="...">
						    		</div>
						  		</c:when>
						  		<c:otherwise>
						  		<c:forEach items="${ub.usedBoardPhotoList}" var="ubp">
						  			<div class="carousel-item">
						      			<img src="/resources/upload/usedBoard/${ubp.filepath }" class="d-block w-100" alt="...">
						    		</div>
						  		</c:forEach>	
						  		</c:otherwise>
						  	</c:choose>
						  </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div>
					</div>  
					<script>
						$(".carousel-item").eq(0).addClass("active");
					</script>
        			<div class="detail-content-text">
        				<span>${ub.usedBoardContent }</span>
        			</div>
        		</div>      		
        			<c:choose>
        				<c:when test="${sessionScope.m.memberId eq ub.usedBoardWriter }">
        				<div style="text-align: right;" class="usedBoard-link">
							<a href="#">수정</a>
							<a href="#">삭제</a>
						</div>        				
        				</c:when>
        				<c:otherwise>
        				<div style="text-align: right" class="blackList-report">
		        			<a href="#">신고하기</a>
		        		</div>
        				</c:otherwise>
        			</c:choose>
        	</div>
        </div>
        <div class="comment-wrap">
        	<div class="comment-box-wrap">
    			<form action="/usedBoardCommentWrite.do" method="post">
    				<div class="comment-box">
     				<div class="comment-content">
 	    				<textarea placeholder="내용을 입력해 주세요." name="usedBoardCommentContent" id="comment-box"></textarea>
     				</div>
	    				<input type="hidden" name="usedBoardCommentWriter" value="${sessionScope.m.memberId }">
	    				<input type="hidden" name="usedBoardNo" value="${ub.usedBoardNo }">
	    				<div class="comment-submit">
 	    				<input type="submit" value="작성" class="btn2">
	    				</div>
    				</div>
   				</form>
        	</div>
        	<script>
        		if($("[name='usedBoardCommentWriter']").val() == ""){
        			$("#comment-box").text("");
        			$("#comment-box").attr("disabled", true);
        			$("#comment-box").text("로그인 후 이용할 수 있습니다.");
        			$("#comment-box").css("color", "#ccc");
        			$("[type='submit']").on("click", function(){
        				alert("로그인 후 이용할 수 있습니다.");
        				return false;
        			});
        		}
        	</script>
        	<div class="comment-list-wrap">
        		<div class="comment-count">
        			<span>댓글(${commentCount })</span>
        		</div>
        		<c:forEach items="${list }" var="ubc">
	        		<div class="comment-list">	        			
	        			<div class="comment-writer-wrap">
	        				<div class="user-profile">
	        					<img src="/resources/image/member/img.jpeg">
	        				</div>
	        			</div>	
	        			   
	        			<div class="modify-wrap" style="display:none;">     			
        					<textarea name="usedBoardCommentContent" id="comment-box">${ubc.usedBoardCommentContent }</textarea>
        					<div class="comment-modify-link">
        						<a href="javascript:void(0)" onclick="modifyComplete(this, ${ubc.usedBoardCommentNo }, ${ub.usedBoardNo });">수정완료</a>
        						<a href="javascript:void(0)" onclick="modifyCancle(this, '${ubc.usedBoardCommentContent}');">수정취소</a>
        					</div>
        				</div>
	        			<div class="comment-write-content">
	        				<div class="user-id">
	        					<p>${ubc.usedBoardCommentWriter }</p>
	        				</div>
	        				<div class="comment-write-info">
	        					<c:choose>
	        						<c:when test="${not empty sessionScope.m && sessionScope.m.memberId eq ubc.usedBoardCommentWriter }">
	        							<a href="javascript:void(0)" onclick="modifyComment(this);">수정</a>
	        							<a href="javascript:void(0)" onclick="deleteComment(${ubc.usedBoardCommentNo}, ${ubc.usedBoardNo });">삭제</a>
	        							::
	        						</c:when>
	        					</c:choose>
	        					${ubc.regDate }
	        				</div>
	        				<p>${ubc.getUsedBoardCommentContentBr() }</p>
	        			</div>
	        		</div>        		
        		</c:forEach>
        	</div>
        </div>
	</div>
	<script>
		<%-- 댓글수정 --%>
		function modifyComment(obj){
			$(obj).parent().parent().prev().show();
			$(obj).parent().parent().hide();			
		}
		<%-- 댓글 수정 완료 --%>
		function modifyComplete(obj, usedBoardCommentNo, usedBoardNo){
			const form = $("<form action='/usedBoardCommentUpdate.do' method='post'></form>");
			const commentNoInput = $("<input type='text' name='usedBoardCommentNo'>");
			commentNoInput.val(usedBoardCommentNo);
			const usedBoardNoInput = $("<input type='text' name='usedBoardNo'>");
			usedBoardNoInput.val(usedBoardNo);
			
			const usedBoardCommentContent = $(obj).parent().prev().clone();
			form.append(commentNoInput).append(usedBoardNoInput).append(usedBoardCommentContent);
			$("body").append(form);
			form.submit();
		}
		<%-- 댓글 수정 취소 --%>
		function modifyCancle(obj, currentContent){
			$(obj).parent().parent().next().show();
			$(obj).parent().prev().val(currentContent);
			$(obj).parent().parent().hide();
		}
		<%-- 댓글삭제 --%>
		function deleteComment(usedBoardCommentNo, usedBoardNo){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href="/usedBoardCommentDelete.do?usedBoardCommentNo="+usedBoardCommentNo+"&usedBoardNo="+usedBoardNo;
			}
		}
	</script>
</body>
</html>