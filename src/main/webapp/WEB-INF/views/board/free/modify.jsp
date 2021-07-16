<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../../layout/header.jsp"/>
<script>
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
        });
    }

</script>

<style>
    .spad {
        padding-top: 150px;
        padding-bottom: 100px;
    }

    .cont-spad {
        padding-top: 50px;
        padding-bottom: 50px;
    }

    .summernote, .dt-quote {
        color: #666666;
    }

    .title {
        width: 75%;
        border: none;
        background-color: #252525;
        color: white;
    }

    .card {
        background-color: black;
    }

    .card-header {
        border: 1px solid #666666;
    }

    .submit {
        font-size: 15px;
        color: #ffffff;
        font-weight: 600;
        text-transform: uppercase;
        background: #252525;
        border: none;
        width: 100%;
        padding: 12px 0;
    }

    .submit-box, .tag-box {
        padding-top: 10px;
    }

    .modal-header, .modal-bottom, .modal-footer, .modal-title {
        background-color: #252525;
        color: #252525;
    }

    .modal-body {
        background-color: #000000;
        color: #ffffff;
    }

    .tags {
        width: 100%;
        background-color: black;
        border: 1px solid #000000;
        color: white;
        font-size: 12px;
    }

    .noticeYn {
        font-size: 12px;
        color: #ffffff;
    }

</style>

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 p-0">
                <form method="post">
                    <div class="contact-text">
                        <div class="contact-form">
                            <div class="dt-leave-comment">
                                <c:if test="${permit_level eq 9 }">
                                    <div class="noticeCheck">
                                        <label class="noticeYn"><input type="checkbox" name="noticeYn" value="y"
                                                <c:if test="${freeVO.noticeYn eq 'y'}">
                                                    checked
                                                </c:if>
                                        /> &nbsp;&nbsp;공지사항여부</label>
                                    </div>
                                </c:if>
                                <div class="dt-quote input-list">
                                    <span>제목</span>&nbsp;
                                    <input type="text" value="${freeVO.title}" class="title" id="title" name="title"
                                           required="required"/>
                                </div>
                                <div class="content">
                                    <textarea class="summernote" name="content" id="content"
                                              required="required">${freeVO.content}</textarea>
                                </div>
                                <div class="tag-box">
                                    <input type="text" value="${freeVO.tags}" class="tags" id="tags" name="tags"/>
                                </div>
                                <div class="submit-box">
                                    <input type="submit" value="수정완료" class="submit"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../../layout/footer.jsp"/>