<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지함</title>
    <!-- 부트스트랩 CDN 추가 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

</head>
<body>
<div class="container mt-5">
    <ul class="nav nav-tabs" id="messageTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="sent-tab" data-toggle="tab" href="#sent" role="tab" aria-controls="sent" aria-selected="true">내가 보낸 쪽지</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="received-tab" data-toggle="tab" href="#received" role="tab" aria-controls="received" aria-selected="false">내가 받은 쪽지</a>
        </li>
    </ul>
    <div class="tab-content" id="messageTabContent">
        <div class="tab-pane fade show active" id="sent" role="tabpanel" aria-labelledby="sent-tab">
            <div id="sent-message-list"></div>
        </div>
        <div class="tab-pane fade" id="received" role="tabpanel" aria-labelledby="received-tab">
            <div id="received-message-list"></div>
        </div>
    </div>
</div>

<script>
/*
$(document).ready(function() {
    // 탭 클릭 시 해당하는 쪽지 리스트 가져오기
    $('#sent-tab').click(function() {
        $.ajax({
            url: 'myMessageList.do',
            type: 'get',
            data: {type: 'sent'},
            success: function(result) {
                $('#sent-message-list').html(result);
            }
        });
    });
    $('#received-tab').click(function() {
        $.ajax({
            url: 'myMessageList.do',
            type: 'get',
            data: {type: 'received'},
            success: function(result) {
                $('#received-message-list').html(result);
            }
        });
    });
});
*/
</script>
 

</body>
</html>