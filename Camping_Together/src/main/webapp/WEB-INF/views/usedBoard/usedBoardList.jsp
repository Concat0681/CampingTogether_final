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
<style>
	a{
   	   color: var(--text-color);
       color: black;
       text-decoration: none;
     }
   .material-symbols-outlined {
       font-variation-settings:
       'FILL' 0,
       'wght' 300,
       'GRAD' 0,
       'opsz' 48
   }
   .fill-icon{
   		color: red;
    	font-variation-settings: 'FILL' 1
	}
   .page-content{
       width: 1200px;
       margin: 0 auto;
       padding-top: 180px;
   }
   .content-top h2{
       margin: 20px;
       font-family: ng-bold;
       margin-right: 5px;
   }
   .content-top-title{
   		display: flex;
   }
   .category-wrap{
       margin: 20px;
       padding: 20px;
       border-top: 1px solid #000;
       border-bottom: 1px solid #000;
       overflow: hidden;
       margin-bottom: 8px;
       margin-top: 8px;
   }
   .category{
       float: left;
   }
   .category>select{
       height: 30px;
       border-radius: 5px;
   }
   .used-category{
       width: 200px;    
   }
   .used-location{
       width: 100px;
   }
   .usedBoardWrite{
       float: right; 
       width: 100px;
       height: 30px;
       line-height: 30px;
   }
   .usedBoardWrite>span{
       font-size: 25px;
   }
   .write>a{
   		font-family: ng-extra-bold;
   }
   .write>a:hover{
		color: #E3CAA5;
   }
   .post{
       float: left;
       margin-right: 5px;
       line-height: 30px;
   }
   .content-mid-wrap{
       padding: 20px;
       overflow: hidden;
   }
   .wish-list{
   		font-family: ng-extra-bold;
   		color: #AD8B73;
   		cursor: pointer;
   		font-size: 15px;
   		padding-top: 32px;
   }
   .wish-list:hover{
   		color: #E3CAA5;
   }
   #wish-board-title{
   		text-overflow: ellipsis;
   		white-space: nowrap;
   }
   .product-wrap{
       width: calc(100%/3);
       float: left;
       padding:20px;
       box-sizing: border-box;
       margin-top: 20px;
       margin-bottom: 30px;
   }
   .product{
	   width: 90%;
       border: 1px solid #ccc;
       border-radius: 5px;
       box-sizing: border-box;
   }
   .product:hover{
       box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
   }
   .product-img{
       width: 100%;
       height: 250px;
       margin: 0 auto;
       padding: 20px;
       box-sizing: border-box;  
       position: relative;    
   }
   .sel-status{
   		position:absolute;
   		margin-top: 18px;
   		margin-left: 185px;
   		padding: 6px;
   		background-color: #E3CAA5;
   		font-size: 14px;
   		font-weight: bold;
   		border-radius: 5px;
   		color: #FFFBE9;
   }
   .product-img>img{
       width: 100%;
       height: 100%;
       border: 1px solid #ccc;
       border-radius: 5px;
   }
   .product_title, .product_location{
   		width: 240px;
   		margin: 0 auto;
   		overflow: hidden;
   		text-align: center;
   		text-overflow: ellipsis;
   		white-space: nowrap;
   }
   .product_location{
   		font-size: 15px;
   		color: #ccc;
   }
   .product_title>span{
       font-size: 17px;
       font-family: ng-extra-bold;
   }
   .product_title:hover{
   		cursor:pointer;
   		color: #E3CAA5;
   }
   .zero{
       height: 30px;
       border-bottom: 4px double #ccc;
   }
	.product_mid{
		width: 90%;
		margin: 10px auto;
		display: flex;
		position: relative;
	}
	.product-price>span{
		font-size: 15px;
		font-family: ng-extra-bold;
	}
	.product-wish{
		position: absolute;
		right: 5px;
	}
   .product-regDate{
       display: inline-block;
   }
   .product-etc{
       float: right;
       display: flex;
       margin-right: 8px;
       font-size: 16px;
       color: #ccc;
   }
   .product-etc div{
       float: left;
       height: 30px;
   }
   .product-etc>div{
       height: 30px;
       margin-left: 8px;
   }
   .icon{
       font-size: 17px;
       line-height: 25px;
   }
   .icon:last-child{
   		font-size: 18px;
   }
   #favorite{
   		cursor: pointer;
   }
   <%-- 모달css --%>
     .my-wishlist-modal-wrap{
    	width: 1200px;
    	height: 800px;
    	border: 4px double #ccc;
    	border-radius: 5px;
    	display: none;
    	position: absolute;
    	top: 230px;
    	background-color: #fff;
    	box-shadow: 0px 0px 60px -10px #ccc;
    	z-index: 100;
    }
    .wishlist-modal-top{
    	text-align: center;
    	padding-bottom: 20px;
    	height: 10%
    }
    .title{
    	line-height: 80px;
    }
    .title>span{
    	font-family: ng-extra-bold;
    	color: #AD8B73;
    }
    .wishlist-modal-content{
    	height: 80%;
    	border: 1px solid #ccc;
    	overflow-x: hidden;
    	overflow-y: scroll;
    	padding: 30px;
    	box-sizing: border-box;
    }
    .wishlist-modal-content>table{
    	width: 90%;
    	margin: 0 auto;
    	border-top-left-radius: 5px;
    	border-top-right-radius: 5px;
    }
    .wishlist-modal-content>table>tr:first-child{
    	background-color: #E3CAA5;
    	border-top-left-radius: 10px;
    }
    .wishlist-modal-content>table>tr{
    	border-bottom: 1px solid #E3CAA5;
    }
    .wishlist-modal-content>table>tr:not(tr:first-child):hover{
    	background-color: #ad8b7318;
    }
    .wishlist-modal-content>table>tr>td{
    	padding: 12px;
    	text-align: center;
    	font-size: 14px;
    	font-family: ng-bold;
    	color: #AD8B73;
    }
    .wishlist-modal-content>table>tr:first-child>td{
    	font-family: ng-extra-bold;
    	color: #FFFBE9;
    	font-size: 15px;
    }
    .wishlist-modal-content>table>tr>td>a:hover{
    	color: #CEAB93;
    	text-decoration: underline !important;
    }
    /* 스크롤바 */
    .wishlist-modal-content::-webkit-scrollbar {
    	width: 12px;  /* 스크롤바의 너비 */
	}	
	.wishlist-modal-content::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
	    background: #CEAB93; /* 스크롤바의 색상 */ 
	    border-radius: 5px;   
	}
	
	.wishlist-modal-content::-webkit-scrollbar-track {
	    background: rgba(173, 139, 115, .1);  /*스크롤바 뒷 배경 색상*/
	}
	.wishlist-modal-bottom{
		text-align: right;
		padding: 15px;
	}
	.wishlist-modal-bottom>button{
		width: 100px;
    	height: 50px;
	}
	.wishlist-modal-bottom>button>span{
		font-family: ng-extra-bold;
		font-size: 16px;
		color: #FFFBE9;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="page-content">
        <div class="content-top">
        	<div class="content-top-title">
	            <h2>중고장터</h2>
	            <c:if test="${not empty sessionScope.m }">
	            	<span class="wish-list" onclick="myWishList('${sessionScope.m.memberId}');">찜목록 확인</span>
	            </c:if>
        	</div>
        	<div class="my-wishlist-modal-wrap">
				<div class="wishlist-modal-top">
					<div class="title"><span>[ ${sessionScope.m.memberName } ]님 찜목록 조회</span></div>
				</div>
				<div class="wishlist-modal-content"></div>
				<div class="wishlist-modal-bottom">
					<button type="button" class="btn1" onclick="wishlistClose();"><span>close</span></button>
				</div>
			</div>  	
            <div class="category-wrap">
                <div class="category">
                    <select class="used-category" name="usedBoardCategory">
                        <option value="0">전체종류</option>
                        <option value="1">전기/전자제품</option>
                        <option value="2">캠핑카/카라반용품</option>
                        <option value="3">화로/버너/BBQ</option>
                        <option value="4">안전/위생용품</option>
                        <option value="8">텐트/타프</option>
                        <option value="5">침낭/매트</option>
                        <option value="6">차박용품</option>
                        <option value="7">조명기구</option>
                        <option value="8">기타캠핑용품</option>
                        <option value="9">기타생활용품</option>
                        
                    </select>
                    <select class="used-location" name="usedTradeLocation">
                        <option value="지역설정안함">전국</option>
                        <option value="서울">서울</option>
                        <option value="인천">인천</option>
                        <option value="경기">경기</option>
                        <option value="대전">대전</option>
                        <option value="대구">대구</option>
                        <option value="부산">부산</option>
                        <option value="강원">강원</option>
                        <option value="광주">광주</option>
                        <option value="울산">울산</option>
                        <option value="경남">경남</option>
                        <option value="경북">경북</option>
                        <option value="전남">전남</option>
                        <option value="전북">전북</option>
                        <option value="제주">제주</option>
                    </select>
                </div>
                <div class="usedBoardWrite">
                	<c:if test="${not empty sessionScope.m }">
	                    <div class="material-symbols-outlined post">post_add</div>
	                    <div class="write"><a href="/usedBoardWriteFrm.do">작성하기</a></div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="content-mid-wrap">
            <div class="content-mid">
            	<c:forEach items="${list }" var="ub" varStatus="i">
            	<input type="hidden" id="usedBoardNo" value="${ub.usedBoardNo }">
            	<div class="product-wrap">
                    <div class="product">
                        <div class="product-img">
                        <c:choose>
                        	<c:when test="${ub.usedBoardStatus eq 0}">
                        	<div class="sel-status">
	                        	<span>판매중</span>                    		
                        	</div>                      
                       		</c:when>
                       		<c:otherwise>
                       		<div class="sel-status" style="background-color: #ccc; color:#fff;">
	                        	<span>판매완료</span>                    		
                        	</div>
                       		</c:otherwise>
                       	</c:choose>
                        <c:choose>
                        	<c:when test="${empty ub.thumbnail }">
                        		<img src="/resources/image/usedBoard/noImg.gif">
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/resources/upload/usedBoard/${ub.thumbnail }">
                        	</c:otherwise>
                        </c:choose>
                         
                        </div>
                        <div class="product_title" onclick="location.href='/usedBoardView.do?usedBoardNo=${ub.usedBoardNo}'">
                            <span>${ub.usedBoardTitle }</span>
                        </div>
                        <div class="product_location">
                        	<c:choose>
                        		<c:when test="${ub.usedTradeLocation eq '지역설정안함'}">
                        			<span>전국</span>
                        		</c:when>
                        		<c:otherwise>
		                            <span>${ub.usedTradeLocation }</span>
                        		</c:otherwise>
                        	</c:choose>
                        	:: ${ub.regDate }
                        </div>
                        <div class="zero"></div>
                        <div class="product_mid">
                            <div class="product-price">
                                <span><fmt:formatNumber value="${ub.usedProductPrice }" pattern="#,###" /></span><span>원</span>
                            </div>
  							<c:choose>
  								<c:when test="${ub.wishChk eq 0 }">
  									<span id="favorite" class="material-symbols-outlined product-wish" >favorite</span>
  								</c:when>
  								<c:otherwise>
  									<span id="favorite" class="material-symbols-outlined product-wish fill-icon" >favorite</span>
  								</c:otherwise>
  							</c:choose>
                            <input type="hidden" value="${sessionScope.m.memberId }" id="loginMemberId">
                            <input type="hidden" value="${ub.usedBoardNo }">
                        </div>
                    </div>
                </div>
            	</c:forEach>   
            </div>
        </div>
        <div class="pagenation">
	        ${pageNavi }
        </div>
        <%-- 찜목록 모달창 --%>
    </div>  
    <script>
    	$(".product-wish").on("click", function(){
    		const memberId = $("#loginMemberId").val();
    		const usedBoardNo = $(this).next().next().val();
    		const obj = $(this);
    		if(memberId == ""){
    			alert("로그인 후 이용가능합니다.");
    			return false;
    		}else{
    			if(obj.hasClass("fill-icon")){
    				//찜취소
    				$.ajax({
    					url: "/wishDelete.do",
    					type: "get",
    					data: {memberId : memberId, usedBoardNo : usedBoardNo},
    					success: function(data){
    						obj.removeClass("fill-icon");		
    					}
    				});				
    			}else{
    				$.ajax({
    					url: "/wishInsert.do",
    					type: "get",
    					data: {memberId : memberId, usedBoardNo : usedBoardNo},
    					success: function(data){
	    					obj.addClass("fill-icon");		
    					}
    				});
    			}
    		}
    	});
    	
    	function myWishList(memberId){
    		$(".my-wishlist-modal-wrap").show();
    		$.ajax({
				url : "/myWishlist.do",
				type : "get",
				data : {memberId : memberId},
				success : function(data){
					$(".wishlist-modal-content").empty();
					console.log(data);
					const table = $("<table>");
					const titleTr = $("<tr>");
					titleTr.html("<td style='width:10%'>No</td><td style='width:30%' id='wish-board-title'>게시글</td><td style='width:20%'>작성자</td><td style='width:20%'>작성일</td><td style='width:20%'>판매상태</td>");
					table.append(titleTr);
					for(let i=0; i<data.length; i++){
						/*
							ub.used_board_no as usedBoardNo,
							used_board_title as usedBoardTitle,
							used_board_writer as usedBoardWriter
							reg_date as regDate,
							used_board_status as usedBoardStatus,
						*/
						const tr = $("<tr>");
						tr.append("<td>"+data[i].usedBoardNo+"</td>");
						tr.append("<td id='wish-board-title'><a href='/usedBoardView.do?usedBoardNo="+data[i].usedBoardNo+"'>"+data[i].usedBoardTitle+"</a></td>");
						tr.append("<td>"+data[i].usedBoardWriter+"</td>");
						tr.append("<td>"+data[i].regDate+"</td>");
						if(data[i].usedBoardStatus == 0){
							tr.append("<td>판매중</td>");
						}else{
							tr.append("<td>판매완료</td>");
						}
						table.append(tr);
					}
					$(".wishlist-modal-content").append(table);
				}
			});
    	}
    	
    	function wishlistClose(){
    		$(".my-wishlist-modal-wrap").hide();
    	}
    	
   		$(".category>select").on("change", function(){
   			alert("ㅠㅠ");
   		});
    
    </script>
</body>
</html>