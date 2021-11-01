<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
<div class="d-flex justify-content-center">
	<div class="mb-4">
		<div class="d-flex justify-content-center">
			<img src="https://cdn-icons-png.flaticon.com/128/2949/2949010.png" width="62px" height="62px">
			<div class="font-weight-bold ml-3 mt-3">자신만의 행성을 만들어 보세요.</div>
		</div>
		
		<div id="signUpPlace" method="post" class="mt-4" action="/user/sign_up">
			<%-- 아이디 --%>
			
			<h6 class="font-weight-bold my-3">* 아이디</h6>
            <div class="d-flex">
            	<input type="text" name="loginId" class="form-control" placeholder="ID를 입력해주세요.">
            	<button type="button" id="idCheckBtn" class="btn btn-success">중복확인</button>
			</div>
            <div>
            <div id="idLengthWarn" class="small font-weight-bold text-danger d-none">아이디를 6자 이상 입력하세요.</div>
            <div id="idConflicted" class="small font-weight-bold text-danger d-none">이미 사용중인 ID입니다.</div>
			<div id="idCheckOk" 	class="small font-weight-bold text-success d-none">사용 가능한 ID 입니다.</div>
            </div>
            <%-- 비밀번호 --%>
            <h6 class="font-weight-bold my-3">* 비밀번호</h6>
            <input type="password" name="password" class="form-control">
            
            <%-- 비밀번호 확인 --%>
            <h6 class="font-weight-bold my-3">* 비밀번호 확인</h6>
            <input type="password" name="confirmPassword" class="form-control">
            
            <%-- 이름 --%>
            <h6 class="font-weight-bold my-3">* 이름</h6>
            <input type="text" name="name" class="form-control">
            
            <%-- 이메일 --%>
            <h6 class="font-weight-bold my-3">* 이메일</h6>
            	<div class="d-flex"> 
                        <input type="text" name="email" class="form-control col-5">
                        <span class="mt-2 ml-1 mr-1">@</span>

                        <input type="text" id="emailInput" class="form-control d-none">

                    <select id="emailAddress" class="form-control">
                       <option>naver.com</option>
                       <option>daum.net</option>
                       <option>gmail.com</option>
                       <option>nate.com</option>
                       <option>zum.com</option>
                       <option>직접 입력</option>
                    </select>
                </div>
           
          <button id="signUpBtn" type="button" class="btn btn-dark w-100 mt-5 font-weight-bold">가입하기</button>
		</div>
	</div>
</div>

<script>
$(document).ready(function () {
	
	$('#idCheckBtn').on('click', function(e) {
		let loginId = $('input[name=loginId]').val().trim();
		
		if (loginId.length < 6) {
			$('#idLengthWarn').removeClass('d-none'); 
			$('#idConflicted').addClass('d-none'); 
			$('#idCheckOk').addClass('d-none'); 
			return;
		}
		
		$.ajax({
			type:'get'
			, url: '/user/is_comflicted_id'
			, data: {'loginId': loginId}
			, success: function(data) {
				alert(data.result);
				
				if (data.result) {
					$('#idLengthWarn').addClass('d-none'); 
					$('#idConflicted').removeClass('d-none'); 
					$('#idCheckOk').addClass('d-none'); 
				} else {
					$('#idLengthWarn').addClass('d-none'); 
					$('#idConflicted').addClass('d-none'); 
					$('#idCheckOk').removeClass('d-none'); 
				}
			}, error: function(e) {
				alert("아이디 중복확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	
	
	$('#signUpBtn').on('click', function(e) {
		e.preventDefault();
		
		let loginId = $('input[name=loginId]').val().trim();
		if (loginId == '') {
			alert("아이디를 입력하세요.");
			return;
		}
		
		let password = $('input[name=password]').val().trim();
		let confirmPassword = $('input[name=confirmPassword]').val().trim();
		if (password == '' || confirmPassword == '') {
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		
		if (password != confirmPassword) {
			alert("비밀번호가 서로 일치하지 않습니다. 다시 입력하세요.");
			$('input[name=confirmPassword]').val('');
			return;
		}
		
		let name = $('input[name=name]').val().trim();
		if (name == '') {
			alert("이름을 입력하세요.");
			return;
		}
		
		let email = $('input[name=email]').val().trim();
		if (email == '') {
			alert("이메일 주소를 입력하세요.");
			return;
		}
		
		if ($('#idCheckOk').hasClass('d-none') == true) {
			alert("아이디 중복확인을 해주세요.");
			return;
		}
		
		alert("회원정보 입력이 완료됐습니다. 가입하시겠습니까?");
		alert("회원가입이 완료됐습니다.");
	});
	
	$('#emailAddress').on('change', function() {
        if ($('#emailAddress').val() == '직접 입력') {
            $(this).addClass('d-none');
            $('#emailInput').removeClass('d-none');
        }
    });
});
</script>