<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	p{
		margin-bottom: 0px !important;
	}
	.page-content{
		width: 1200px;
		margin: 0 auto;
		padding-top: 130px;
	}
	.content-top>h2{
		margin: 20px;
		padding-top: 20px;
		font-family: ng-bold;
		display: inline-block;
		margin-bottom: 5px;
		margin-right: 5px;
	}
	.content-top>span{
		font-family: ng-bold;
		color: #AD8B73; 
		cursor: pointer;
		font-size: 15px;
	}
	.detail-wrap{
   		width: 90%;
   		padding: 10px 20px;
   		margin: 30px auto;
   		border-bottom: 1px solid #ccc;
   }
   .blacklist-guide{
   		border: 4px double #ccc;
   		padding: 10px;
   		text-align: center;
   		margin-bottom: 60px;
   }
   .blacklist-guide>p{
   		color: #AD8B73;
   		font-size: 14px;
   		padding: 8px 0px;
   }
	.write-wrap{
		width: 90%;
		margin: 30px auto;
		display: flex;
		border-bottom: 1px solid #ccc;
		padding-bottom: 30px;
	}
	.write-title{
		width: 20%;
		padding-left: 10px;
	}
	.write-title>span{
		font-family: ng-bold;
		color: #AD8B73;
		font-size: 20px;
	}
	.write-content{
		width: 80%;
	}
	.write-content>textarea{
		width: 90%;
		height: 300px;
		resize: none;
		border: 1px solid #ccc;
		border-radius: 5px;
		padding: 10px;
	}
   input[name=blacklistType]{
        display: none;
    }
    input[name=blacklistType]+label{
        width: 80px;
        height: 40px;
        text-align: center;
        cursor: pointer;
        border: 2px solid #E3CAA5;
        background-color: #E3CAA5;
        color: #FFFBE9;
        border-radius: 8px;
        margin-right: 10px;
        padding: 8px 10px;
        font-size: 14px;
        font-family: ng-bold;
        box-sizing: border-box;
    }
    input[name=blacklistType]:checked+label{
        background-color: #AD8B73;
        border: 2px solid #AD8B73;
    }
    .blacklist-category{
    	display: flex;
    }
    input[type=file]{
    	display: none;
    }
    input[type=file]+label{
    	
    	background-color: #AD8B73;
    	color: #FFFBE9;
    	font-family: ng-bold;
    	font-size: 15px;
    	border: 1px solid #AD8B73;
    	padding: 8px 10px;
    	border-radius: 5px;
    	cursor: pointer;
    }
    .img-wrap{
    	display: flex; 
    	margin-top: 10px;
    	         
    }
    .img-sub{
        width: 80px;
        height: 80px;
        border: 1px solid #ccc;
        position: relative;
        margin-right: 8px; 
    }
    .delete-img{
      	position: absolute;
		right: 0px;
		bottom: 0px;
      	cursor: pointer;
      	background-color: #000;
      	opacity: 75%;
      	font-size: 20px;
      	color: #fff;
      	font-variation-settings:'wght' 400
    }
    .btn-wrap{
    	text-align: center;
    	margin-bottom: 20px;
    }
    .btn-wrap>button{
    	width: 100px;
    	height: 50px;
    }
    .btn-wrap>button:hover{
    	background-color: #E3CAA5;
    }
    .btn-wrap>button>span{
    	font-family: ng-bold;
    	font-size: 16px;
    	color: #FFFBE9;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="page-content">
		<div class="content-top">
			<h2>신고글 작성</h2>
			<span onclick="blacklistView('${sessionScope.m.memberId}');">작성내역 조회</span>
			<hr>
		</div>
		<form action="/blacklistWriter.do" method="post" enctype="multipart/form-data">
			<div class="detail-wrap">
				<div class="blacklist-guide">
					<p>
						선택한 게시물의 작성자를 신고합니다.<br>
						작성자 신고는 거래수칙에 맞지 않는 사용자를 신고하는 기능이며, 반대의견을 표시하는 것이 아닙니다.<br>
						[${sessionScope.m.memberName }]님의 관심과 신고가 건전하고 올바른 Camping Together문화를 만듭니다.<br>
						허위 신고의 경우 신고자가 제재받을 수 있음을 유념해주세요.<br>
					</p>
				</div>
				<div class="blacklist-write-wrap">
					<div class="write-wrap">
						<div class="write-title"><span>구분</span></div>
						<div class="write-content">
							<input type="radio" name="blacklistType" id="type0" value="0" checked>
							<label for="type0">미발송</label>
							<input type="radio" name="blacklistType" id="type1" value="1">
							<label for="type1">상태불량</label>
							<input type="radio" name="blacklistType" id="type2" value="2">
							<label for="type2">기타</label>
						</div>
					</div>
					<div class="write-wrap">
						<div class="write-title">
							<span>게시글정보</span>
						</div>
						<div class="write-content">
							<span>제목 : </span><span>[${ub.usedBoardNo }] ${ub.usedBoardTitle }</span><br>
							<span>작성자 : </span><span>${ub.usedBoardWriter }</span>
							<input type="hidden" name="usedBoardNo" value="${ub.usedBoardNo }">
							<input type="hidden" name="blacklistMemberId" value="${ub.usedBoardWriter }">
							<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
						</div>
					</div>
					<div class="write-wrap">
						<div class="write-title">
							<span>첨부파일</span>
						</div>
						<div class="write-content">
							<input type="file" id="blacklist-Img" name="blacklistPhoto" multiple>
							<label for="blacklist-Img">파일 선택</label>
							<div class="img-wrap"></div>
						</div>
					</div>
					<div class="write-wrap">
						<div class="write-title">
							<span>상세내용</span>
						</div>
						<div class="write-content">
							<textarea name="blacklistContent" placeholder="신고내용을 자세히 입력해 주세요."></textarea>
						</div>
					</div>
				</div>
				<div class="btn-wrap">
					<button type="button" class="btn1" onclick="location.href='/'"><span>취소</span></button>
					<button type="submit" class="btn1"><span>작성완료</span></button>
				</div>
			</div>
		</form>
		<%-- 작성내역 모달창 --%>
		
	</div>
	<script>
		/* 이미지 관련 스크립트 */
		let sel_files = [];
		$(document).ready(function(){
			$("#blacklist-Img").on("change", function(e){
				let files = e.target.files;
				let filesArr = Array.prototype.slice.call(files);
				if($("#blacklist-Img")[0].files.length > 8){
					alert("상품이미지는 8개 이하만 첨부 가능합니다.");
					$($("#blacklist-Img")).val("");
					return false;
				}
				filesArr.forEach(function(f){
					$(".img-wrap").html("");
					let img = [];
					sel_files.push(f);
					const reader = new FileReader();
					reader.onload = function(e){
						img.push("<img style='width:100%;height:100%;'src=\""+e.target.result+"\" /><div class='material-symbols-outlined delete-img' onclick='delImg(this)'>close</div>");
						const div = $("<div class='img-sub'></div>");
						div.append(img);
						$(".img-wrap").append(div);	   
					}
				reader.readAsDataURL(f);
				});
			});
		});
		/* 선택한 이미지 제거 스크립트 */
		function delImg(obj){
			const index = $(".delete-img").index($(obj));
			
			const dataTransfer = new DataTransfer();
			let files = $("#blacklist-Img")[0].files;
			let fileArray = Array.from(files);
			fileArray.splice(index, 1);
			
			fileArray.forEach(function(file, items){
				dataTransfer.items.add(file);
			});
			
			$("#blacklist-Img")[0].files = dataTransfer.files;
			$(obj).parent().remove();
		}
		/* 내가 작성한 신고글 조회 */
		function blacklistView(memberId){
			alert("나너무많은일이있었어");
		}
	</script>
</body>
</html>