<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<div class="signInPlace">
	<form id="signInPlace" class="d-flex" method="post" action="/user/sign_in">
	<div class="mt-5 justify-content-center">
		<img src="https://cdn-icons-png.flaticon.com/128/2949/2949010.png">
	</div>
	
	<div class="ml-5">
		<h6 class="font-weight-bold my-3">* 아이디</h6>
        <input type="text" name="loginId" class="form-control">
        
        <h6 class="font-weight-bold my-3">* 비밀번호</h6>
        <input type="password" name="password" class="form-control">
        
        <button id="submit" type="button" class="btn btn-dark w-100 mt-5 mb-4 font-weight-bold">로그인</button>
        
        <a href="/user/sign_up_view" class="text-dark">회원가입</a>
        </div>
	</form>
</div>

<script>
$(document).ready(function() {
	$('#submit').on('click', function(e) {
		e.preventDefault();
		
		var loginId = $('input[name=loginId]').val().trim();
		if (loginId == '') {
			alert("아이디를 입력해주세요.");
			return;
		}
	
	
		var password = $('input[name=password]').val().trim();
		if (password == '') {
			alert("비밀번호를 입력해주세요.");
			return;
		}	
		
		let url = $(this).attr('action');
		let data = $(this).serialize(); 
		console("url:" + url);
		console("data:" + data);
		
		$.post(url, data)
		.done(function(data) {
				if (data.result == 'success') {
					location.href = '/post/post_list_view';
				}	else {
					alert("로그인에 실패했습니다. 다시 시도해주세요.");
				}
			});
	});
});
</script>

