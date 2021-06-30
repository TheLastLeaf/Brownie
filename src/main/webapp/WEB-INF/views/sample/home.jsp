<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>SummerNoteExample</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 서머노트를 위해 추가해야할 부분 -->
    <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
    <!--  -->

</head>
<body>
<div class="container">
    <textarea class="summernote"></textarea>
</div>
<script>
    $(document).ready(function () {
		const toolbar = [
			// 글꼴 설정
			['fontname', ['fontname']],
			// 글자 크기 설정
			['fontsize', ['fontsize']],
			// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
			['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
			// 글자색
			['color', ['forecolor', 'color']],
			// 표만들기
			['table', ['table']],
			// 글머리 기호, 번호매기기, 문단정렬
			['para', ['ul', 'ol', 'paragraph']],
			// 줄간격
			['height', ['height']],
			// 그림첨부, 링크만들기, 동영상첨부
			['insert', ['picture', 'link', 'video']],
			// 코드보기, 확대해서보기, 도움말
			['view', ['codeview', 'fullscreen', 'help']]
		];

		const setting = {
			height: 300,
			minHeight: null,
			maxHeight: null,
			focus: true,
			lang: 'ko-KR',
			toolbar: toolbar,
			callbacks: { //여기 부분이 이미지를 첨부하는 부분
				onImageUpload: function (files, editor, welEditable) {
					for (let i = files.length - 1; i >= 0; i--) {
						uploadSummernoteImageFile(files[i], this);
					}
				}
			}
		};

		$('.summernote').summernote(setting);
    });

    function uploadSummernoteImageFile(file, el) {
		const data = new FormData();
		data.append("file", file);
        $.ajax({
            data: data,
            type: "POST",
            url: "uploadSummernoteImageFile",
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: function (data) {
                $(el).summernote('editor.insertImage', data.url);
            }
        });
    }
</script>
</body>
</html>