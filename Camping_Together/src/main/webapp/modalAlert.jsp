<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
         crossorigin="anonymous"
      />
</head>
<body>
<button class="btn btn-primary m-2" id="alertStart">Alert 실행</button>
<button class="btn btn-secondary m-2" id="confirmStart">Confirm 실행</button>
<button class="btn btn-success m-2" id="promptStart">Prompt 실행</button>
<button class="btn btn-danger m-2" id="toastStart">Toast 실행</button>
<button class="btn btn-warning m-2" id="ajaxStart">Ajax 실행 (깃헙 아이디 검색)</button>
<script>
//Alert Modal Type
$().ready(function () {
  
  $("#alertStart").click(function () {
    Swal.fire({
      icon: 'success',
      title: 'Alert가 실행되었습니다.',
      text: '이곳은 내용이 나타나는 곳입니다.',
    });
  });
  
  
  $("#confirmStart").click(function () {
    Swal.fire({
      title: '정말로 그렇게 하시겠습니까?',
      text: "다시 되돌릴 수 없습니다. 신중하세요.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '승인',
      cancelButtonText: '취소',
      reverseButtons: true, // 버튼 순서 거꾸로
      
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire(
          '승인이 완료되었습니다.',
          '화끈하시네요~!',
          'success'
        )
      }
    })
  });
  
  
  $("#promptStart").click(function () {
    
    (async () => {
        const { value: getName } = await Swal.fire({
            title: '당신의 이름을 입력하세요.',
            text: '그냥 예시일 뿐이니 정보유출 같은건 없습니다.',
            input: 'text',
            inputPlaceholder: '이름을 입력..'
        })

        // 이후 처리되는 내용.
        if (getName) {
            Swal.fire(`: ${getName}`)
        }
    })()
  });
  
  
  $("#toastStart").click(function () {
    const Toast = Swal.mixin({
      toast: true,
      position: 'center-center',
      showConfirmButton: false,
      timer: 3000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })

    Toast.fire({
      icon: 'success',
      title: 'toast 알림이 정상적으로 실행 되었습니다.'
    })
  });
  
  
  $("#ajaxStart").click(function () { 
    Swal.fire({
      title: 'Submit your Github username',
      input: 'text',
      inputAttributes: {
        autocapitalize: 'off'
      },
      showCancelButton: true,
      confirmButtonText: 'Look up',
      showLoaderOnConfirm: true,
      preConfirm: (login) => {
        return fetch(`//api.github.com/users/${login}`)
          .then(response => {
            if (!response.ok) {
              throw new Error(response.statusText)
            }
            return response.json()
          })
          .catch(error => {
            Swal.showValidationMessage(
              `Request failed: ${error}`
            )
          })
      },
      allowOutsideClick: () => !Swal.isLoading()
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: `${result.value.login}'s avatar`,
          imageUrl: result.value.avatar_url
        })
      }
    })
  });
  
});
</script>
</body>
</html>