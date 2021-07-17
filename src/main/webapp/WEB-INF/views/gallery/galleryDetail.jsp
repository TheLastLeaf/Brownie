<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<script src="${pageContext.request.contextPath}/js/marvel.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/marvel.css" type="text/css">

<style>

    .dThumb {
        height: 100px;
    }

</style>

<script>
    function likeHateCheck(kind) {
        console.log(${ galleryVO.boardSeq })
        console.log(kind)

        $.ajax({
            url: "./ajax.gallerylikeHate",
            type: "get",
            data: {
                "boardSeq": ${ galleryVO.boardSeq },
                "inUserId": '1786827',
                "kind": kind
            },
            success: function (data) {
                $('#hateCnt').html(data.hateCnt);
                $('#likeCnt').html(data.likeCnt);
                console.log(data.hateCnt);
                console.log(data.likeCnt);
            },
            error: function () {
                alert("에러나요");
            }
        })
    }

    function fn_delete() {
        if (!confirm("정말 삭제하시겠습니까?")) {
            return;
        }

        $.ajax({
            url: "./ajax.gallerydelete",
            type: "post",
            data: {
                "boardSeq": ${galleryVO.boardSeq}
            },
            success: function (data) {
                if (data == 1) {
                    location.href = 'list'
                }
            },
            error: function () {
                alert("삭제실패");
            }
        })
    }

</script>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" style="height: 430px; padding-top:200px;"
         data-setbg="${pageContext.request.contextPath}/img/gallery/main/main${rnd}.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">

                <div class="breadcrumb-text" style="text-align: center">
                    <h3>
                        <div class="breadcrumb-text">
                            <h3>
                                <h1 data-heading="Brownie  Gallery" style="z-index: 5">
									<span data-heading="Brownie  Gallery" contenteditable>
										Brownie  Gallery </span>
                                </h1>
                            </h3>
                            <div class="bt-option"></div>
                        </div>
                    </h3>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 p-0">
                <div class="details-text gallery-page">
                    <div class="dt-title-gallery details-hero-text">
                        <h2 style="color: white">${ galleryVO.title }</h2>
                    </div>
                    <div class="dt-desc">
                        조회수 : ${ hit }
                        <input type="button"
                               onclick="location.href='${pageContext.request.contextPath}/gallery/update?boardSeq=${galleryVO.boardSeq}'"
                               value="수정"/>
                        <input type="button" onclick="fn_delete()" value="삭제"/>
                        ${ galleryVO.content }

                    </div>

                    <div class="dt-tags">
                        <c:forTokens items="${freeDetail.boardCategory }" delims="," var="tag">
                            <a href="#"><span>${tag }</span></a>
                        </c:forTokens>
                    </div>
                    <div class="dt-share" style="justify-content: center; align-content: center; text-align: center;">
                        <div class="ds-links">
                            <a href="javascript:likeHateCheck('1')" class="wide"><i class="far fa-heart"></i><span
                                    id="hateCnt">${likeHateCnt.hateCnt }</span></a>
                        </div>
                        <div class="ds-title">싫어요</div>
                        <div class="ds-links">
                            <a href="javascript:likeHateCheck('0')" class="wide"><i class="fas fa-heart"></i><span
                                    id="likeCnt">${likeHateCnt.likeCnt }</span></a>
                        </div>
                        <div class="ds-title">좋아요</div>
                    </div>

                    <div class="dt-related-post">
                        <div class="row">
                            <!-- 이전 게시글 안내 -->
                            <div class="col-lg-6">
                                <c:if test="${freePrev.title ne null}">
                                    <a href="${pageContext.request.contextPath}/gallery/detail?boardSeq=${freePrev.boardSeq}"
                                       class="rp-prev">
                                        <span>Prev</span>
                                        <div class="rp-pic">
                                            <img class="dThumb"
                                                 src="${pageContext.request.contextPath}${freePrev.fileSeq}" alt="">
                                        </div>
                                        <div class="rp-text">
                                            <h6>${freePrev.title }</h6>
                                            <ul>
                                                <li><i class="far fa-clock"></i> ${recentBoardReplyDate.beforeDate}</li>
                                                <li><i class="far fa-comment"></i> ${recentBoardReplyDate.beforeCnt}
                                                </li>
                                            </ul>
                                        </div>
                                    </a>
                                </c:if>
                            </div>

                            <!-- 다음 게시글 안내 -->
                            <div class="col-lg-6">
                                <c:if test="${freeNext.title ne null}">
                                    <a href="${pageContext.request.contextPath}/gallery/detail?boardSeq=${freeNext.boardSeq}"
                                       class="rp-next">
                                        <span>Next</span>
                                        <div class="rp-pic">
                                            <img class="dThumb"
                                                 src="${pageContext.request.contextPath}${freeNext.fileSeq}" alt="">
                                        </div>
                                        <div class="rp-text">
                                            <h6>${freeNext.title }</h6>
                                            <ul>
                                                <li><i class="far fa-clock"></i> ${recentBoardReplyDate.afterDate}</li>
                                                <li><i class="far fa-comment"></i> ${recentBoardReplyDate.afterCnt}</li>
                                            </ul>
                                        </div>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <div class="dt-author">
                        <div class="da-pic">
                            <img src="${pageContext.request.contextPath}/img/details/author-pic.jpg" alt="">
                        </div>
                        <div class="da-text">
                            <h5>Almil Hmaper</h5>
                            <p>글쓴이 소개</p>

                        </div>
                    </div>
                    <div class="dt-comment">
                        <h4>3 comment</h4>
                        <div class="dc-item">
                            <div class="dc-pic">
                                <img class="dThumb"
                                     src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>Brandon Kelley</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                    adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                    dolore magnam.</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                        <div class="dc-item reply-item">
                            <div class="dc-pic">
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-2.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>Brandon Kelley</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                    adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                    dolore magnam.</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                        <div class="dc-item">
                            <div class="dc-pic">
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-3.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>Matthew Nelson</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                    adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                    dolore magnam.</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="dt-leave-comment">
                        <h4>Leave a comment</h4>
                        <form action="#">
                            <div class="input-list">
                                <input type="text" placeholder="Name">
                                <input type="text" placeholder="Email">
                                <input type="text" placeholder="Website">
                            </div>
                            <textarea placeholder="Message"></textarea>
                            <button type="submit">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-7">
                <div class="sidebar-option">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp"/>