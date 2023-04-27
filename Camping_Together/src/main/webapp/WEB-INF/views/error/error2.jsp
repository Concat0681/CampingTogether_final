<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
	.error-wrap{
		width: 100%;
		height: 100vh;
		background-image: url(/resources/image/main/errorBack2.gif);
	    background-repeat: no-repeat;
	    background-size: cover;
		position: absolute;
		top: 0;
		left: 0;
		z-index: -1;
	}
	
	.wrap{
		width: 1200px;
		margin: 0 auto;
	}
	
	.error-header{
		text-align: center;
		font-size: 50px;
		color: #fff;
		margin-top: 250px;
	}
	
	.error-content{
		text-align: center;
		font-size: 20px;
		color: #fff;
	}
	
	.error-btn{
		text-align: center;
		background-color : #E3CAA5;
		border : none;
		color : white;
		border-radius : 5px;
		margin: 0 auto;
		width: 150px;
		height: 50px;
		line-height: 50px;
	}
	
	.error-btn:hover{
		background-color : #AD8B73;
		cursor: pointer;
	}
	
	.home-btn{
		text-decoration: none;
		color: #fff;
	}
</style>
</head>
<body>
	<div class="error-wrap">
		<div class="wrap">
			<div class="error-header">
				<h1>PAGE NOT FOUND</h1>
			</div>
			<div class="error-content">
				페이지의 주소가 잘못 입력되었거나,
				<br>
				주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.
				<br>
				<br>
			</div>
			<div class="error-btn">
				<a href="/" class="home-btn">GO HOME</a>
			</div>
		</div>
	</div>
	
	<script>
		$('.error-btn').click(function() {
		  window.location.href = '/';
		});
	</script>
</body>
</html>