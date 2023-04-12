<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
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

input {
	height: 40px;
    width: 100%;
    margin: 20px auto;
    border-left: none;
    border-right: none;
    border-top: none;
    color: white;
    background: #0b2144;
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
    
    .myform {
        background: #0b2144;
        width: 40%;
        margin: auto;
        height: 600px;
        -webkit-box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
        -moz-box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
        box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
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
         color: #cccccc;
       
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
    }
    .searchPw{
    	float: right;
    }
    .searchId{
    	float: left;
    }
</style>
</head>
<body>
	<div class="myform">
    <div class="logo">Let`s Join Camping Together
    	<div><i class="fa fa-cloud-upload" aria-hidden="true"></i></div>
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
	</div>
</body>
</html>