<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<div style="display : none;">
		<div id="title">${title }</div>
		<div id="msg">${msg }</div>
		<div id="icon">${icon }</div>
		<div id="loc">${loc }</div>
	</div>
	<script>
		const title = $('#title').text()
		const msg = $('#msg').text()
		const icon = $('#icon').text()
		const loc = $('#loc').text()
		Swal.fire({
		  icon: icon,
		  title: title,
		  text: msg
		}).then(function () {
		  window.location = loc
		})
	</script>
</body>
</html>