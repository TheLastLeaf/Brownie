function commentReplyButton(replySeq) {
    $(".sub_reply_form").remove();

    const form =
        "<div class=\"dt-leave-comment sub_reply_form\">"
        + "<form method=\"POST\">"
        + "<input type=\"hidden\" name=\"headReplySeq\" value=\"" + replySeq + "\"/>"
        + "<textarea name=\"message\" placeholder=\"Message\" required></textarea>"
        + "<button type=\"submit\">Submit</button>"
        + "</form>"
        + "</div>"
    $("#" + replySeq).append(form);
}

function boardLike(boardSeq, kind) {
    $.ajax({
        url: "/board/like/like.ajax",
        type: "POST",
        data: {
            boardSeq: boardSeq,
            kind: kind
        },
        dataType: "json",
        success: function (data) {
            if (data.status === "ng") {
                alert(data.message);

                return;
            }

            const likeButton = $(".board-like>.like");
            likeButton.html("<i class=\"far fa-thumbs-up\"></i> " + data.boardLikeCount.likeCnt);
            if (data.message === "1") {
                likeButton.removeClass("btn-outline-primary").addClass("btn-primary");
            } else {
                likeButton.addClass("btn-outline-primary").removeClass("btn-primary");
            }

            const unlikeButton = $(".board-like>.unlike");
            unlikeButton.html("<i class=\"far fa-thumbs-up fa-flip-vertical\"></i> " + data.boardLikeCount.unlikeCnt);
            if (data.message === "0") {
                unlikeButton.removeClass("btn-outline-danger").addClass("btn-danger");
            } else {
                unlikeButton.addClass("btn-outline-danger").removeClass("btn-danger");
            }
        },
        error: function () {
            alert("문제가 발생하였습니다.");
        }
    })
}

function replyLike(replySeq, kind) {
    $.ajax({
        url: "/board/reply/like/like.ajax",
        type: "POST",
        data: {
            replySeq: replySeq,
            kind: kind
        },
        dataType: "json",
        success: function (data) {
            console.log(data)
            if (data.status === "ng") {
                alert(data.message);

                return;
            }
            const likeButton = $("div#" + replySeq + " .like");
            likeButton.html("<i class=\"far fa-thumbs-up\"></i> " + data.replyLikeCount.likeCnt);
            if (data.message === "1") {
                likeButton.removeClass("btn-outline-primary").addClass("btn-primary");
            } else {
                likeButton.addClass("btn-outline-primary").removeClass("btn-primary");
            }

            const unlikeButton = $("div#" + replySeq + " .unlike");
            unlikeButton.html("<i class=\"far fa-thumbs-up fa-flip-vertical\"></i> " + data.replyLikeCount.unlikeCnt);
            if (data.message === "0") {
                unlikeButton.removeClass("btn-outline-danger").addClass("btn-danger");
            } else {
                unlikeButton.addClass("btn-outline-danger").removeClass("btn-danger");
            }
        },
        error: function () {
            alert("문제가 발생하였습니다.");
        }
    })
}

function boardWrite() {
    const noticeYn = $("input[name=noticeYn]:checked");
    const SelectBoardCategory = $("select[name=boardCategory] option:selected");
    const boardCategory = $("input[name=boardCategory]");

    const data = {
        title: $("input[name=title]").val(),
        content: $("textarea[name=content]").val()
    }
    if (noticeYn.length) {
        data.noticeYn = noticeYn.val();
    }
    if (SelectBoardCategory.length) {
        data.boardCategory = SelectBoardCategory.val();
    } else if (boardCategory.length) {
        data.boardCategory = boardCategory.val();
    }

    $.ajax({
        url: "/board/write.ajax",
        type: "POST",
        data: data,
        dataType: "json",
        success: function (data) {
            if (data.status === "ng") {
                alert(data.message);

                return;
            }

            location.href = "./list";
        },
        error: function () {
            alert("문제가 발생하였습니다.");
        }
    })
}

function boarModify(boardSeq) {
    const noticeYn = $("input[name=noticeYn]:checked");
    const SelectBoardCategory = $("select[name=boardCategory] option:selected");
    const boardCategory = $("input[name=boardCategory]");

    const data = {
        title: $("input[name=title]").val(),
        content: $("textarea[name=content]").val(),
        boardSeq: boardSeq
    }
    if (noticeYn.length) {
        data.noticeYn = noticeYn.val();
    }
    if (SelectBoardCategory.length) {
        data.boardCategory = SelectBoardCategory.val();
    } else if (boardCategory.length) {
        data.boardCategory = boardCategory.val();
    }

    $.ajax({
        url: "/board/modify.ajax",
        type: "POST",
        data: data,
        dataType: "json",
        success: function (data) {
            if (data.status === "ng") {
                alert(data.message);

                return;
            }

            location.href = "../list";
        },
        error: function () {
            alert("문제가 발생하였습니다.");
        }
    })
}

function searchList() {
    const type = $(".board-search>select>option:selected").val();
    const query = $(".board-search>input[name=query]").val();

    location.href = "?type=" + type + "&query=" + query;
}

