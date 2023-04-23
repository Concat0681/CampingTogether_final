<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.blacklist-detail-modal-wrap{
		width: 900px;
		margin: 0 auto;
		border: 4px double #ccc;
		border-radius: 8px;
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
	.blacklist-detail-modal-mid{
		padding: 16px;
		border-bottom: 1px solid #ccc;
	}
	.blacklist-detail-modal-mid>div{
		margin-bottom: 15px;
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
					<td>${bl.blacklistMemberId }</td>
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
				<div class="top-title">
					<span>[구분] 신고내역</span>
				</div>
				<div class="top-status-wrap">
					<select>
						<option>처리대기</option>
						<option>처리완료</option>
						<option>처리취소</option>
					</select>
					<button type="button" class="btn1" onclick="blacklistStatusUpdate()">확인</button>
				</div>				
			</div>
			<div class="blacklist-file">
				<span> 첨부파일 : </span>
			</div>
			<div class="blacklist-detail-modal-mid">
				<div class="blacklist-usedBoard-info">
					<span>게시글 : [52] 이름이름</span><br>
					<span>신고대상ID : user01</span>
				</div>
				<div class="blacklist-writer-info">
					<span>작성자ID : user11</span>
					<span>작성일 : YYYY-MM-DD hh:mi:ss</span>
				</div>
				<div class="blacklist-content">
					<span> 내용내용 </span>
				</div>
			</div>
			<div class="blacklist-detail-modal-bottom">
				<button type="button" class="btn1">close</button>
			</div>
		</div>
		</div>
	</div>
	<script>
		
	</script>
</body>
</html>