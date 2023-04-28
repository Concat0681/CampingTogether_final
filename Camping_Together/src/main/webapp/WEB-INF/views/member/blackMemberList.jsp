<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.list{
		position: relative;
	}
	.admin-content{
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.search-box input:first-child{
		border: 1px solid #AD8B73;
		border-radius: 5px;
		height: 30px;
		width: 180px;
		padding: 4px;
		box-sizing: border-box;
		font-size: 13px;
		font-family: ng-bold;
	}
	.search-box input:first-child::placeholder{
		color: #AD8B73;
	}
	.search-box input:first-child:focus{
		background-color: #ad8b7318;
	}
	.search-box input:last-child{
		height: 32px;
		width: 36px;
		font-size: 14px;
		font-family: ng-bold;
	}
	.blacklist-detail-modal-wrap{
		width: 900px;
		margin: 0 auto;
		border: 4px double #ccc;
		border-radius: 8px;
		display: none;
		position: absolute;
		top: 0px;
		left: 15px;
		background-color: #fff; 
		box-shadow: 0px 0px 60px 10px #ccc;
	}
	.blacklist-detail-modal-top{
		display: flex;
		justify-content: space-between;
		border-bottom: 1px solid #ccc; 
		padding: 18px;	
		background-color: #ad8b7318;	
	}
	.blacklist-file{
		border-bottom: 1px solid #ccc;
		padding: 12px;
		padding-left: 18px;
	}
	.blacklist-file>span{
		padding-right: 10px;
	}
	.blacklist-file>span:hover{
		color: #AD8B73;
		cursor: pointer;
	}
	.blacklist-detail-modal-mid{
		border-bottom: 1px solid #ccc;
	}
	.blacklist-usedBoard-info, .blacklist-writer-info{
		border-bottom: 1px solid #ccc;
		padding: 12px;
		padding-left: 18px;
	}
	.blacklist-detail-modal-bottom{
		padding: 10px;
		text-align: right;
	}
	.blacklist-detail-modal-bottom>button{
		width: 80px;
		height: 40px;
		font-family: ng-extra-bold;
	}
	.blacklist-detail-modal-bottom>button:hover{
		background-color: #CEAB93;	
	}
	.blacklist-content{
		padding: 18px;
	}
	.top-status-wrap>select{
		padding: 2px;
		font-size: 15px;
		color: #AD8B73;
		border: 1px solid #AD8B73;
		border-radius: 5px;
		height: 25px;
	}
	.top-status-wrap>button{
		font-size: 14px;
		padding: 3px;
		height: 25px;
	}
	.top-title>span{
		font-family: ng-extra-bold;
		color: #AD8B73;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/adminMenu.jsp" />	
	
	<div class="content-wrap">
		<div class="admin-content">
			<div class="admin-title">
				<h3>신고목록</h3>
			</div>
			<div class="search-box">
				<form action="/searchBlacklist.do" method="get">
					<input type="text" name="blacklistMemberId" placeholder="ID입력">
					<input type="submit" class="btn1" value="검색">
				</form>
			</div>
		</div>	
		<div class="list">
			<table>
				<tr>
					<td class="td1" style="border-top-left-radius: 10px;">No</td>
					<td class="td2">구분</td>
					<td class="td3">피신고자ID</td>
					<td class="td4">작성일</td>
					<td class="td5" style="border-top-right-radius: 10px;">처리상태</td>
				</tr>
				<c:forEach items="${list }" var="bl">
				<tr onclick="blacklistView(${bl.blacklistNo})">
					<td>${bl.rnum }</td>
					<td>${bl.getBlacklistTypeText() }</td>
					<td>
						${bl.blacklistMemberId }
						<input type="hidden" value="${bl.blacklistMemberId }" id="blacklistMemberId">
					</td>
					<td>${bl.regDate }</td>
					<td>${bl.getBlacklistStatusText() }</td>
				</tr>
				</c:forEach>
			</table>
		 <div class="pagination all-navi">
				${pageNavi }
		 </div>
		 		<div class="blacklist-detail-modal-wrap">
			<div class="blacklist-detail-modal-top">
				<input type="hidden" id="blacklistNo">
				<div class="top-title">
				</div>
				<div class="top-status-wrap">
					<select name="blacklistStatus">
						<option value="0">처리대기</option>
						<option value="1">처리완료</option>
						<option value="2">처리취소</option>
					</select>
					<button type="button" class="btn1" onclick="blacklistStatusUpdate(this)">확인</button>
				</div>				
			</div>
			<div class="blacklist-file"></div>
			<div class="blacklist-detail-modal-mid">
				<div class="blacklist-usedBoard-info"></div>
				<div class="blacklist-writer-info"></div>
				<div class="blacklist-content"></div>
			</div>
			<div class="blacklist-detail-modal-bottom">
				<button type="button" class="btn1" onclick="modalClose();">close</button>
			</div>
		</div>
		</div>
	</div>
	<script>
		function blacklistView(blacklistNo){
			$(".blacklist-detail-modal-wrap").show();
			
			const topTitle = $(".top-title");
			const blacklistFile = $(".blacklist-file");
			const blacklistUsedBoardInfo = $(".blacklist-usedBoard-info");
			const blacklistWriterInfo = $(".blacklist-writer-info");
			const blacklistContent = $(".blacklist-content");
			
			topTitle.empty();
			blacklistFile.empty();
			blacklistUsedBoardInfo.empty();
			blacklistWriterInfo.empty();
			blacklistContent.empty();
			
			$.ajax({
				url: "/blacklistView.do",
				type: "get",
				data: {blacklistNo : blacklistNo},
				success: function(data){
					$("#blacklistNo").val(data.blacklistNo);
					if(data.blacklistType == 0){
						topTitle.append("<span>[미발송] 신고내역</span>");
					}else if(data.blacklistType == 1){
						topTitle.append("<span>[상품불량] 신고내역</span>");
					}else if(data.blacklistType == 2){
						topTitle.append("<span>[기타] 신고내역</span>");
					}
					
					blacklistFile.append("<span>첨부파일 : </span>")
					for(let i=0; i<data.photolist.length; i++){
						let blacklistPhotoNo = data.photolist[i].blacklistPhotoNo;
						blacklistFile.append("<span onclick=filedownload('"+blacklistPhotoNo+"');>"+data.photolist[i].filename+"</span>");
					}
					blacklistUsedBoardInfo.append("<span>게시글 : ["+data.usedBoardNo+"]"+data.blackUsedBoardTitle+"</span><br>");
					blacklistUsedBoardInfo.append("<span>신고대상ID : "+data.blacklistMemberId+"</span>");
					blacklistWriterInfo.append("<span>작성자ID : "+data.memberId+"<span><br>");
					blacklistWriterInfo.append("<span>작성일 : "+data.regDate+"</span>");
					blacklistContent.append("<span>"+data.blacklistContent+"</span>");
				}
			});
		}
		function modalClose(){
			$(".blacklist-detail-modal-wrap").hide();
		}
		function filedownload(blacklistPhotoNo){
			location.href="/blacklistFiledownload.do?blacklistPhotoNo="+blacklistPhotoNo;
		}
		function blacklistStatusUpdate(obj){
			const blacklistNo = $("#blacklistNo").val();
			const blacklistStatus = $(obj).prev().val();
			const blacklistMemberId = $("#blacklistMemberId").val();
			location.href="/blacklistStatusUpdate.do?blacklistNo="+blacklistNo+"&blacklistStatus="+blacklistStatus+"&blacklistMemberId="+blacklistMemberId;
		}
	</script>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>