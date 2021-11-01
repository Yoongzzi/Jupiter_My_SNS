<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-between">
	<div class="col-6">
			<input type="file" id="image" accept=".jpg,.jpeg,.png,.gif" onchange="imgUpload(event);"/> 
			<div id="image_space"></div>

	</div>
	
	<div class="col-6">
	<input type="text" id="subject" class="form-control font-weight-bold" placeholder="제목을 입력해주세요.">
		<textarea id="content" rows="15" cols="100" class="form-control mt-2" placeholder="내용을 입력해주세요."></textarea>
		
		<button type="button" id="deleteBtn" class="btn btn-danger w-100 mt-3">전체삭제</button>
		<button type="button" id="saveBtn" class="btn btn-secondary w-100 mt-2">올리기</button> 
	</div>
</div>


<script>
$(document).ready(function() {
	$('#saveBtn').on('click', function() {
		let subject = $('#subject').val().trim();
		
		if (subject == '') {
			alert("제목을 입력해주세요.");
			return;
		}
		
		let content = $('#content').val().trim();
		
		if (content == '') {
			alert("내용을 입력해주세요.");
			return;
		}
		
		let file = $('#file').val();
		
		if (file != '') {
			let ext = file.split('.').pop().toLowerCase(); 
				if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val('');
					return;
				}
			}
	});
	
	$('#deleteBtn').on('click', function() {
		if (confirm("모두 지우시겠습니까?")) {
			$('#subject').val('');
			$('#content').val('');
		}
	});
});

































function imgUpload(event) { 
	let reader = new FileReader(); 
		reader.onload = function(event) { 
			let img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			document.querySelector("div#image_space").appendChild(img); 
		}
		reader.readAsDataURL(event.target.files[0]); 
	}

</script>