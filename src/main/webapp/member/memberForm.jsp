<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <style>
    #id-error{
      color:red;
    }
  </style>
</head>
<body>
  <h2>회원 가입 화면</h2>
  
  <form action="memberRegist.jsp" method="post">
    아이디 : <input type="text" name="id"> <span id="id-error"></span> <br>
    비밀번호 : <input type="password" name="password"> <span id="pw-error"> </span><br>
    이름 : <input type="text" name="name"><br>
    이메일 : <input type="text" name="email"><br>
    나이 : <input type="text" name="age"><br>
    <input type ="submit" value="회원가입">
    <input type ="reset" value="취소">
  </form>
  <p id="message"></p>
  <script>
    document.querySelector("form").addEventListener("submit", serverSubmit)

    function serverSubmit(event) {
      //서버로 입력 데이터 전송 전 데이터 유효성 체크
      const form = event.target;

      let userId = form.id.value; //BOM으로 접근
      if(!userId){ // 사용자 아이디가 입력되지 않았을 때
        // alert("아이디를 입력해주세요");
        console.error("아이디를 입력해주세요");
        form.id.focus();
        //서버로 전송하면 되지 않기 때문에 디폴트 이벤트 실행x
        event.preventDefault();
      }
    }

    if(form.password.value){ // 사용자 비밀번호가 입력되지 않았을 때
      errorMessage("#pw-error", "비밀번호를 입력해주세요");
      form.password.focus();
      event.preventDefault();

    }
    // checkbox 유효성 검증
    let isChecked = false;
    let hobbys = form.hobbys;
    hobbys.forEach(hobby =>{
      if(hobby.checked){
        isChecked=true;
      }
      if(!hobby.checked){
        errorMessage("#hobby-error", "취미를 선택해주세요");
      }
    })

    function errorMessage(selector, errorMessage) {
      document.querySelector("selector").innerHTML = errorMessage;
    }
  </script>

</body>
</html>