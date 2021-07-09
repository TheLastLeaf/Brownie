<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<!--  -->

<script>
    /*   $(function(){
           $('.notice_content').html(
               $('.notice_content').html().replaceAll('\r','').replaceAll('\n','<br>'))
       });*/
       $(function () {
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
           const reg = /(.*?)\/(tiff|pjp|jfif|bmp|gif|svg|png|xbm|dib|jxl|jpeg|svgz|jpg|webp|ico|tif|pjpeg|avif)$/;
           if (!file.type.match(reg)) {
               alert("확장자는 이미지 확장자만 가능합니다.");
               return;
           }
           const data = new FormData();
           data.append("file", file);
           $.ajax({
               data: data,
               type: "POST",
               url: "${pageContext.request.contextPath}/uploadSummernoteImageFile",
               contentType: false,
               enctype: 'multipart/form-data',
               processData: false,
               success: function (data) {
                   $(el).summernote('editor.insertImage', '${pageContext.request.contextPath}' + data.url);
               }
           );       }
</script>
<style>
    .spad{
        padding-top: 150px;
        padding-bottom: 100px;
    }
    .cont-spad{
        padding-top: 50px;
        padding-bottom: 50px;
        height: 100%;
    }
    .title{
        width: 100%;
        background-color: black;
        border: 1px solid #666666;
        color:white;
    }
    .summernote{
        color: #666666;
        
    }
    .card{
        background-color: black;
    }
    .card-header{
        border: 1px solid #666666;
    }
    .submit{
        width: 100%;
        background-color: black;
        border: 1px solid #666666;
        color:white;
    }
    .galleryCon{
        border:1px solid #666666;
        height: 600px;
    }
    .note-editable{
    	height: 100%;
    }
    
    .pad{
        padding-top: 10px;
    }

</style>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${pageContext.request.contextPath}/img/lol/lolChamp/Ari.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>공지사항 등록</h3>
                    <div class="bt-option">
                        <a href="/index" style="color: black;">Home</a>
                        <span>notice Add</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Contact Section Begin -->
<section class="contact-section cont-spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <form method="post">
                    <div class="contact-text">
                        <div class="contact-form">
                            <div class="dt-leave-comment">
                                <input type="hidden" name="inUserId" value="${id}" id="inUserId">
                                <div class="input-list" style="padding-bottom: 10px;">
                                    <input type="text" placeholder="Title" class="title"  id="title" name="title" required="required">
                                </div>
                                <div class="galleryCon">
								    <textarea style="height: height: 100%;" class="summernote"></textarea>
								</div>
                                <div class="pad">
                                    <input type="submit" value="등록"  class="submit">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- Contact Section End -->
<c:import url="../layout/footer.jsp"/>