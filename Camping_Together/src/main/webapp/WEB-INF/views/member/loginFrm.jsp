<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<style>
.tab-content > div:last-child {
  display:none;
}

label.active {
  transform:translateY(50px);
  left:2px;
  font-size:14px;
  .req {
    opacity:0;
  }
}
@font-face {
  font-family: ng-bold;
  src: url(../font/Nanum_Gothic/NanumGothic-Bold.ttf);
}
@font-face {
  font-family: ng-extra-bold;
  src: url(../font/Nanum_Gothic/NanumGothic-ExtraBold.ttf);
}
@font-face {
  font-family: ng-regular;
  src: url(../font/Nanum_Gothic/NanumGothic-Regular.ttf);
}
.active{
	transition-duration: 0.5s;
	background-color: rgba(173, 139, 115, 1) !important;
}
input {
	height: 40px;
    width: 100%;
    margin: 20px auto;
    border-left: none;
    border-right: none;
    border-top: none;
    color: white;
    background: rgba(173, 139, 115, 0.5);
    padding-left:5px;
    font-family: FontAwesome, "Open Sans", Verdana, sans-serif;
    font-style: normal;
    font-weight: normal;
    text-decoration: inherit;
    }
button {
	height:50px;
	width: 80%;
	border-radius: 4px;
	margin-bottom: 20px;
    border: none;
    background: #CEAB93;
    color: #ffffff;
    font-family: sans-serif;
    font-weight: 700;
    font-size: 14pt;
    cursor: pointer;
}
form {
	width: 90%;
	margin: 40px auto;
	text-align: center;
	    	
}
    
input:focus {
	outline: none
}
.logo {
	color: white;
	font-family: sans-serif;
	font-size: 15pt;
	font-weight: 600;
	text-align: center;
	padding-top: 40px
	}
.tab-group{
	list-style-type: none;
	display: block;
	padding: 15px;
	display: flex;
	text-align: center;
	
	
}
.tab-group>li{
	margin: 20px;
	width: calc(100%/2);
	background-color: #CEAB93;
	text-align: center;
	border-radius: 8px;
	padding: 12px;
}
.signup-input{
	border: none;
}
.mail-confirmation{
	height: 40px;
	width: 150px;
	background-color: #CEAB93;
	text-decoration: none;
	text-align: center;
	cursor: pointer;
	display: block;
	float: right;
	border-radius: 4px;
	line-height: 40px;
	margin: 5px auto;
}
    
    .myform {
    	
        background: url(/resources/image/loginBackground1.jpeg);
        background-color:#0b2144;
        width: 40%;
        margin: auto;
        height: 600px;
        -webkit-box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
        -moz-box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
        box-shadow: 0px 30px 60px -6px #000;
        max-width: 500px;
    	min-width: 400px;
    	display: inline-table;
    }
    
    .myform a {
        text-decoration: none;
        color: white;
        font-family: ng-extra-bold;
        font-size: 20px;
        
    }
    .myform a:hover {
        text-decoration: underline;
        color: white;
        font-family: ng-extra-bold;
        font-size: 20px;
        
    }
    
     ::-webkit-input-placeholder {
        /* Chrome/Opera/Safari */
         color: #fbfbfb;
       
    }
	.fa-cloud-upload{
  		font-size:90px;
  
	}
    
    ::-moz-placeholder {
        /* Firefox 19+ */
        color: #cccccc;
          }
    
    :-ms-input-placeholder {
        /* IE 10+ */
         color: #cccccc;
         }
    
    :-moz-placeholder {
        /* Firefox 18- */
        color: #cccccc;
      
    }
  @media screen and (max-width:500px){
        .myform{
            width:80%;
        }
    }
    @media screen and (max-width:800px){
        .myform{
            width:60%;
        }
    }
    .searchBox{
    	text-align: center;
    	width: 80%;
    	display: inline-block;
    	min-width: 250px;
    	height: 60px;
    	line-height: 60px;
    }
    .searchPw{
    	float: right;
    }
    .searchId{
    	float: left;
    }
    .formBox{
    	padding: 20px;
    	display: grid;
    }
    .signup-input{
    	margin: 5px auto;
    	border: none;
    }
    .signup-input:focus{
    	background-color: rgba(173, 139, 115, 1);
    }
    .signup{
    text-align: left;
    }
    .addrbtn{
    	cursor: pointer;
    }
    .mail-check-input{
    	border: none;
    	margin-right: 30px;
    }
    .mail-confirmBox{
    	width: 150px;
    }
    .btn-primary{
    	width: 150px;
    }
    .btn-primatypuls{
    	width: 120px;
    	height: 40px;
	    padding-bottom: 5px;
	    line-height: 20px;
	    margin-left: 30px;
	 }
    .memberGrade{
    	width: 100px;
    	font-family: ng-extra-bold;
    	font-weight:bold;
        font-size: 15px;
        border: none;
        border-radius: 5px;
    }
    .memberGrade>option{
    	width: 100px;
    	text-align: center;
    	font-family: ng-extra-bold;
    	font-weight:bold;
        font-size: 15px;
        border: none;
    }
    .confirm{
    	transition-duration: 0.5s;
    	background-color: rgba(173, 139, 115, 0.5);
    }
    .cancel{
    	transition-duration: 0.5s;
    	background-color: rgba(173, 139, 115, 0.5);
    }
    .confirm:hover{
    	transition-duration: 0.5s;
    	background-color: #CEAB93;
    }
    .cancel:hover{
    	transition-duration: 0.5s;
    	background-color: #CEAB93;
    }
    .mail-cofirmation{
    	height: 40px;
    	margin-bottom: 0px;
    }
 /* 모달창 스타일 */
.modal {
  display: none; /* 모달창 기본적으로는 안 보이도록 지정 */
  position: fixed; 
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto; 
  background-color: rgba(0,0,0,0.4); /* 배경 반투명 */
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

.modal-header h2 {
  margin-top: 0;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
    
    
/* 아이디 찾기 결과 모달 창 */
.searchIdResultModal {
  display: none;
  position: fixed;
  z-index: 999;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}
.searchIdResultModal .modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 50%;
  text-align: center;
}
.logo-Img:hover{
	display: inline;
	
	transition-duration: 0.5s;
	box-shadow: 0px 30px 60px -6px green;
}
.alert-danger {
  color: #721c24;
  background-color: #f8d7da;
  border-color: #f5c6cb;
  padding: .75rem 1.25rem;
  margin-bottom: 1rem;
  border: 1px solid transparent;
  border-radius: .25rem;
}

</style>
</head>
<body>


<div class="formBox">
	 
	<div class="myform">
    <div class="logo">Welcome Back! <br>
		<div class="logo-Img"><a href="/"><img src="/resources/image/logo/login_280x100.png"></a></div>
	 </div>
	    <form action="/login.do" method="post">
	        <input type="text" placeholder=" &#xf007;   UserId" name="memberId"/>
	        <input type="password" placeholder=" &#xf023;  Password" name="memberPw" />
	        <div>
		        <button type="submit">로그인 </button>
		        <button type="button" onClick="location.href='/joinFrm.do'">회원가입</button>
		        <div class="searchBox"> <a href="#" class="searchId">아이디 찾기</a> <a href="#" class="searchPw">비밀번호 찾기</a> </div>
		    </div>
		   
	    </form>
	            <c:if test="${alertMsg != null}">
		            <div class="alert-danger" role="alert">
		                <span>${alertMsg }</span>
		            </div>
		        </c:if>
		        <c:if test="${not empty alertMsg}">
				  <div class="alert alert-danger">${alertMsg}</div>
				</c:if>
						        
	</div>
	
</div>
<script>
    $(document).ready(function() {
        let message = "[[${alertMsg}]]";
        if (message != "") {
            alert("로그인이 실패하였습니다.");
        }else {
        }
    })
</script>
</body>

</html>