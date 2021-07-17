/* Drop Tables */

DROP TABLE black_userr CASCADE CONSTRAINTS;
DROP TABLE black_list CASCADE CONSTRAINTS;
DROP TABLE black_reason CASCADE CONSTRAINTS;
DROP TABLE bluemarble CASCADE CONSTRAINTS;
DROP TABLE BROWNIE_BOARD_LIKE CASCADE CONSTRAINTS;
DROP TABLE BROWNIE_BOARD_REPLY_LIKE CASCADE CONSTRAINTS;
DROP TABLE BROWNIE_BOARD_REPLY CASCADE CONSTRAINTS;
DROP TABLE BROWNIE_BOARD CASCADE CONSTRAINTS;
DROP TABLE BROWNIE_FILE CASCADE CONSTRAINTS;
DROP TABLE EXP CASCADE CONSTRAINTS;
DROP TABLE permit CASCADE CONSTRAINTS;
DROP TABLE report CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE chat CASCADE CONSTRAINTS;
DROP TABLE teamgame CASCADE CONSTRAINTS;
DROP TABLE BROWNIE_USER CASCADE CONSTRAINTS;


/* Create Tables */

CREATE TABLE black_list
(
    -- 신고 순번
    report_seq number       NOT NULL,
    -- 용의자
    user_id    varchar2(30) NOT NULL,
    result     varchar2(4000),
    -- 작성일
    in_date    date,
    -- 작성자
    in_user_id varchar2(30),
    -- 수정일
    up_date    date,
    -- 수정자
    up_user_id varchar2(30),
    -- 제재 항목 순번
    black_seq  number       NOT NULL UNIQUE,
    PRIMARY KEY (report_seq, user_id)
);


CREATE TABLE black_reason
(
    -- 제재 항목 순번
    black_seq    number NOT NULL,
    -- 제재 분류
    black_kind_1 varchar2(100),
    -- 제재 종류
    black_kind_2 varchar2(100),
    -- 작성일
    in_date      date,
    -- 수정일
    up_date      date,
    -- 작성자
    in_user_id   varchar2(30),
    -- 수정자
    up_user_id   varchar2(30),
    PRIMARY KEY (black_seq)
);


CREATE TABLE black_userr
(
    -- 신고 순번
    report_seq number       NOT NULL UNIQUE,
    -- 용의자
    user_id    varchar2(30) NOT NULL UNIQUE,
    -- 정지 기한
    end_date   date,
    -- 상태
    status     char,
    -- 작성일
    in_date    date,
    -- 수정일
    up_date    date,
    -- 작성자
    in_user_id varchar2(30),
    -- 수정자
    up_user_id varchar2(30),
    PRIMARY KEY (report_seq, user_id)
);


CREATE TABLE bluemarble
(
    -- 회원 아이디
    user_id    varchar2(30) NOT NULL,
    -- 말 위치
    position   number,
    -- 작성일
    in_date    date,
    -- 작성자
    in_user_id varchar2(30),
    -- 수정일
    up_date    date,
    -- 수정자
    up_user_id varchar2(30),
    PRIMARY KEY (user_id)
);


CREATE TABLE BROWNIE_BOARD
(
    -- 게시글 번호
    board_seq  number NOT NULL,
    -- 게시판 종류
    board_kind varchar2(30),
    -- 제목
    title      varchar2(200),
    -- 내용
    content    varchar2(4000),
    -- 공지 여부
    notice_yn  varchar2(1),
    -- 상태
    status     varchar2(1),
    -- 작성일
    in_date    date,
    -- 작성자
    in_user_id varchar2(30),
    -- 수정일
    up_date    date,
    -- 수정자
    up_user_id varchar2(30),
    -- 파일 순번
    file_seq   number,
    -- 보조 순번
    -- 한 게시글에 여러개의 파일이 올라갈 경우 카운트 됨
    sub_seq    number,
    PRIMARY KEY (board_seq)
);


CREATE TABLE BROWNIE_FILE
(
    -- 파일 순번
    file_seq      number NOT NULL UNIQUE,
    -- 보조 순번
    -- 한 게시글에 여러개의 파일이 올라갈 경우 카운트 됨
    sub_seq       number NOT NULL,
    -- 파일 경로
    file_path     varchar2(2000),
    -- 원본 명
    original_name varchar2(2000),
    -- 저장 명
    save_name     varchar2(1000),
    -- 작성일
    in_date       date,
    -- 작성자
    in_user_id    varchar2(30),
    -- 수정일
    up_date       date,
    -- 수정자
    up_user_id    varchar2(30),
    PRIMARY KEY (file_seq, sub_seq)
);


CREATE TABLE BROWNIE_USER
(
    -- 회원 아이디
    user_id     varchar2(30) NOT NULL,
    -- lol_id
    lol_id      varchar2(50),
    -- 닉네임
    nick_name   varchar2(30),
    -- 경고 횟수
    black_stack number,
    -- 활성화 여부
    status      char DEFAULT 'Y',
    -- 작성일
    in_date     date,
    -- up_date
    up_date     date,
    -- in_user_id
    in_user_id  varchar2(30),
    -- 수정자
    up_user_id  varchar2(30),
    PRIMARY KEY (user_id)
);


CREATE TABLE chat
(
    -- 채팅 순번
    chat_seq     number       NOT NULL,
    -- 채팅 내역
    content      varchar2(4000),
    -- 작성일
    in_date      date,
    -- 작성자
    in_user_id   varchar2(30),
    -- 수정일
    up_date      date,
    -- 수정자
    up_user_id   varchar2(30),
    -- 모집 순번
    teamgame_sep number       NOT NULL,
    -- 회원 아이디
    user_id      varchar2(30) NOT NULL,
    PRIMARY KEY (chat_seq)
);


CREATE TABLE EXP
(
    -- 회원 아이디
    user_id    varchar2(30) NOT NULL,
    -- 경험치
    exp        number DEFAULT 0,
    -- 레벨
    USER_LEVEL number DEFAULT 0,
    -- 작성일
    in_date    date,
    -- 작성자
    in_user_id varchar2(30),
    -- 수정일
    up_date    date,
    -- 수정자
    up_user_id varchar2(30),
    PRIMARY KEY (user_id)
);


CREATE TABLE like_board
(
    -- 게시글 번호
    board_seq  number                  NOT NULL,
    -- 좋아요 0 싫어요 1
    kind       varchar2(1) DEFAULT '0' NOT NULL,
    -- 작성일
    in_date    date,
    -- 작성자
    in_user_id varchar2(30),
    -- 수정일
    up_date    date,
    -- 수정자
    up_user_id varchar2(30),
    PRIMARY KEY (board_seq)
);


CREATE TABLE like_reply
(
    -- 댓글 번호
    reply_seq  number                  NOT NULL,
    -- 좋아요 0 싫어요 1
    kind       varchar2(1) DEFAULT '0' NOT NULL,
    -- 작성일
    in_date    date,
    -- 작성자
    in_user_id varchar2(30),
    -- 수정일
    up_date    date,
    -- 수정자
    up_user_id varchar2(30),
    PRIMARY KEY (reply_seq)
);


CREATE TABLE permit
(
    -- 회원 아이디
    user_id      varchar2(30) NOT NULL,
    -- 권한 레벨
    permit_level number,
    -- 작성일
    in_date      date,
    -- 작성자
    in_user_id   varchar2(30),
    -- 수정일
    up_date      date,
    -- 수정자
    up_user_id   varchar2(30),
    PRIMARY KEY (user_id)
);


CREATE TABLE reply
(
    -- 댓글 번호
    reply_seq      number NOT NULL,
    -- 댓글 내용
    reply_content  varchar2(4000),
    -- 작성일
    in_date        date,
    -- 작성자
    in_user_id     varchar2(30),
    up_date        date,
    -- 수정자
    up_user_id     varchar2(30),
    -- 게시글 번호
    board_seq      number,
    -- 댓글 번호
    head_reply_seq number,
    PRIMARY KEY (reply_seq)
);


CREATE TABLE report
(
    -- 신고 순번
    report_seq  number       NOT NULL,
    -- 신고 내용
    content     varchar2(4000),
    -- 피의자 아이디
    report_name varchar2(30),
    -- 회원 아이디
    user_id     varchar2(30) NOT NULL,
    -- 작성일
    in_date     date,
    -- 수정일
    up_date     date,
    -- 작성자
    in_user_id  varchar2(30),
    -- 수정자
    --
    up_user_id  varchar2(30),
    PRIMARY KEY (report_seq)
);


CREATE TABLE REVIEW
(
    -- 리뷰_seq
    review_seq number       NOT NULL,
    -- 회원 아이디
    user_id    varchar2(30) NOT NULL,
    -- 별 0~5개 평점
    star_cnt   number,
    -- 한줄코멘트
    reply      varchar2(200),
    -- date
    in_date    date,
    -- 수정일
    --
    up_date    date,
    -- 작성자
    in_user_id varchar2(30),
    -- 수정자
    up_user_id varchar2(30),
    PRIMARY KEY (review_seq)
);


CREATE TABLE teamgame
(
    -- 모집 순번
    teamgame_sep number       NOT NULL,
    -- 회원 아이디
    user_id      varchar2(30) NOT NULL,
    -- 모집 제목
    title        varchar2(100),
    -- 매치 모드
    match_mode   varchar2(10),
    -- 메시지
    message      varchar2(1000),
    -- 포지션
    position     char,
    -- 접속 상태
    status       char,
    -- 작성일
    in_date      date,
    -- 작성자
    in_user_id   varchar2(30),
    -- 수정일
    up_date      date,
    -- 수정자
    up_user_id   varchar2(30),
    PRIMARY KEY (teamgame_sep, user_id)
);


/* Create Foreign Keys */

ALTER TABLE black_userr
    ADD FOREIGN KEY (report_seq, user_id)
        REFERENCES black_list (report_seq, user_id)
;


ALTER TABLE black_list
    ADD FOREIGN KEY (black_seq)
        REFERENCES black_reason (black_seq)
;


ALTER TABLE BROWNIE_BOARD_LIKE
    ADD FOREIGN KEY (board_seq)
        REFERENCES BROWNIE_BOARD (board_seq)
;


ALTER TABLE BROWNIE_BOARD_REPLY
    ADD FOREIGN KEY (board_seq)
        REFERENCES BROWNIE_BOARD (board_seq)
;


ALTER TABLE BROWNIE_BOARD
    ADD FOREIGN KEY (file_seq, sub_seq)
        REFERENCES BROWNIE_FILE (file_seq, sub_seq)
;


ALTER TABLE black_list
    ADD FOREIGN KEY (user_id)
        REFERENCES BROWNIE_USER (user_id)
;


ALTER TABLE bluemarble
    ADD FOREIGN KEY (user_id)
        REFERENCES BROWNIE_USER (user_id)
;


ALTER TABLE EXP
    ADD FOREIGN KEY (user_id)
        REFERENCES BROWNIE_USER (user_id)
;


ALTER TABLE permit
    ADD FOREIGN KEY (user_id)
        REFERENCES BROWNIE_USER (user_id)
;


ALTER TABLE report
    ADD FOREIGN KEY (user_id)
        REFERENCES BROWNIE_USER (user_id)
;


ALTER TABLE REVIEW
    ADD FOREIGN KEY (user_id)
        REFERENCES BROWNIE_USER (user_id)
;


ALTER TABLE teamgame
    ADD FOREIGN KEY (user_id)
        REFERENCES BROWNIE_USER (user_id)
;


ALTER TABLE BROWNIE_BOARD_REPLY_LIKE
    ADD FOREIGN KEY (reply_seq)
        REFERENCES BROWNIE_BOARD_REPLY (reply_seq)
;


ALTER TABLE BROWNIE_BOARD_REPLY
    ADD FOREIGN KEY (head_reply_seq)
        REFERENCES reply (reply_seq)
;


ALTER TABLE chat
    ADD FOREIGN KEY (teamgame_sep, user_id)
        REFERENCES teamgame (teamgame_sep, user_id)
;


/* Comments */

COMMENT ON COLUMN black_list.report_seq IS '신고 순번';
COMMENT ON COLUMN black_list.user_id IS '용의자';
COMMENT ON COLUMN black_list.in_date IS '작성일';
COMMENT ON COLUMN black_list.in_user_id IS '작성자';
COMMENT ON COLUMN black_list.up_date IS '수정일';
COMMENT ON COLUMN black_list.up_user_id IS '수정자';
COMMENT ON COLUMN black_list.black_seq IS '제재 항목 순번';
COMMENT ON COLUMN black_reason.black_seq IS '제재 항목 순번';
COMMENT ON COLUMN black_reason.black_kind_1 IS '제재 분류';
COMMENT ON COLUMN black_reason.black_kind_2 IS '제재 종류';
COMMENT ON COLUMN black_reason.in_date IS '작성일';
COMMENT ON COLUMN black_reason.up_date IS '수정일';
COMMENT ON COLUMN black_reason.in_user_id IS '작성자';
COMMENT ON COLUMN black_reason.up_user_id IS '수정자';
COMMENT ON COLUMN black_userr.report_seq IS '신고 순번';
COMMENT ON COLUMN black_userr.user_id IS '용의자';
COMMENT ON COLUMN black_userr.end_date IS '정지 기한';
COMMENT ON COLUMN black_userr.status IS '상태';
COMMENT ON COLUMN black_userr.in_date IS '작성일';
COMMENT ON COLUMN black_userr.up_date IS '수정일';
COMMENT ON COLUMN black_userr.in_user_id IS '작성자';
COMMENT ON COLUMN black_userr.up_user_id IS '수정자';
COMMENT ON COLUMN bluemarble.user_id IS '회원 아이디';
COMMENT ON COLUMN bluemarble.position IS '말 위치';
COMMENT ON COLUMN bluemarble.in_date IS '작성일';
COMMENT ON COLUMN bluemarble.in_user_id IS '작성자';
COMMENT ON COLUMN bluemarble.up_date IS '수정일';
COMMENT ON COLUMN bluemarble.up_user_id IS '수정자';
COMMENT ON COLUMN BROWNIE_BOARD.board_seq IS '게시글 번호';
COMMENT ON COLUMN BROWNIE_BOARD.board_kind IS '게시판 종류';
COMMENT ON COLUMN BROWNIE_BOARD.title IS '제목';
COMMENT ON COLUMN BROWNIE_BOARD.content IS '내용';
COMMENT ON COLUMN BROWNIE_BOARD.notice_yn IS '공지 여부';
COMMENT ON COLUMN BROWNIE_BOARD.status IS '상태';
COMMENT ON COLUMN BROWNIE_BOARD.in_date IS '작성일';
COMMENT ON COLUMN BROWNIE_BOARD.in_user_id IS '작성자';
COMMENT ON COLUMN BROWNIE_BOARD.up_date IS '수정일';
COMMENT ON COLUMN BROWNIE_BOARD.up_user_id IS '수정자';
COMMENT ON COLUMN BROWNIE_BOARD.file_seq IS '파일 순번';
COMMENT ON COLUMN BROWNIE_BOARD.sub_seq IS '보조 순번
한 게시글에 여러개의 파일이 올라갈 경우 카운트 됨';
COMMENT ON COLUMN BROWNIE_FILE.file_seq IS '파일 순번';
COMMENT ON COLUMN BROWNIE_FILE.sub_seq IS '보조 순번
한 게시글에 여러개의 파일이 올라갈 경우 카운트 됨';
COMMENT ON COLUMN BROWNIE_FILE.file_path IS '파일 경로';
COMMENT ON COLUMN BROWNIE_FILE.original_name IS '원본 명';
COMMENT ON COLUMN BROWNIE_FILE.save_name IS '저장 명';
COMMENT ON COLUMN BROWNIE_FILE.in_date IS '작성일';
COMMENT ON COLUMN BROWNIE_FILE.in_user_id IS '작성자';
COMMENT ON COLUMN BROWNIE_FILE.up_date IS '수정일';
COMMENT ON COLUMN BROWNIE_FILE.up_user_id IS '수정자';
COMMENT ON COLUMN BROWNIE_USER.user_id IS '회원 아이디';
COMMENT ON COLUMN BROWNIE_USER.lol_id IS 'lol_id';
COMMENT ON COLUMN BROWNIE_USER.nick_name IS '닉네임';
COMMENT ON COLUMN BROWNIE_USER.black_stack IS '경고 횟수';
COMMENT ON COLUMN BROWNIE_USER.status IS '활성화 여부';
COMMENT ON COLUMN BROWNIE_USER.in_date IS '작성일';
COMMENT ON COLUMN BROWNIE_USER.up_date IS 'up_date';
COMMENT ON COLUMN BROWNIE_USER.in_user_id IS 'in_user_id';
COMMENT ON COLUMN BROWNIE_USER.up_user_id IS '수정자';
COMMENT ON COLUMN chat.chat_seq IS '채팅 순번';
COMMENT ON COLUMN chat.content IS '채팅 내역';
COMMENT ON COLUMN chat.in_date IS '작성일';
COMMENT ON COLUMN chat.in_user_id IS '작성자';
COMMENT ON COLUMN chat.up_date IS '수정일';
COMMENT ON COLUMN chat.up_user_id IS '수정자';
COMMENT ON COLUMN chat.teamgame_sep IS '모집 순번';
COMMENT ON COLUMN chat.user_id IS '회원 아이디';
COMMENT ON COLUMN EXP.user_id IS '회원 아이디';
COMMENT ON COLUMN EXP.exp IS '경험치';
COMMENT ON COLUMN EXP.USER_LEVEL IS '레벨';
COMMENT ON COLUMN EXP.in_date IS '작성일';
COMMENT ON COLUMN EXP.in_user_id IS '작성자';
COMMENT ON COLUMN EXP.up_date IS '수정일';
COMMENT ON COLUMN EXP.up_user_id IS '수정자';
COMMENT ON COLUMN BROWNIE_BOARD_LIKE.board_seq IS '게시글 번호';
COMMENT ON COLUMN BROWNIE_BOARD_LIKE.kind IS '좋아요 0 싫어요 1';
COMMENT ON COLUMN BROWNIE_BOARD_LIKE.in_date IS '작성일';
COMMENT ON COLUMN BROWNIE_BOARD_LIKE.in_user_id IS '작성자';
COMMENT ON COLUMN BROWNIE_BOARD_LIKE.up_date IS '수정일';
COMMENT ON COLUMN BROWNIE_BOARD_LIKE.up_user_id IS '수정자';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY_LIKE.reply_seq IS '댓글 번호';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY_LIKE.kind IS '좋아요 0 싫어요 1';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY_LIKE.in_date IS '작성일';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY_LIKE.in_user_id IS '작성자';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY_LIKE.up_date IS '수정일';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY_LIKE.up_user_id IS '수정자';
COMMENT ON COLUMN permit.user_id IS '회원 아이디';
COMMENT ON COLUMN permit.permit_level IS '권한 레벨';
COMMENT ON COLUMN permit.in_date IS '작성일';
COMMENT ON COLUMN permit.in_user_id IS '작성자';
COMMENT ON COLUMN permit.up_date IS '수정일';
COMMENT ON COLUMN permit.up_user_id IS '수정자';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY.reply_seq IS '댓글 번호';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY.reply_content IS '댓글 내용';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY.in_date IS '작성일';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY.in_user_id IS '작성자';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY.up_user_id IS '수정자';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY.board_seq IS '게시글 번호';
COMMENT ON COLUMN BROWNIE_BOARD_REPLY.head_reply_seq IS '댓글 번호';
COMMENT ON COLUMN report.report_seq IS '신고 순번';
COMMENT ON COLUMN report.content IS '신고 내용';
COMMENT ON COLUMN report.report_name IS '피의자 아이디';
COMMENT ON COLUMN report.user_id IS '회원 아이디';
COMMENT ON COLUMN report.in_date IS '작성일';
COMMENT ON COLUMN report.up_date IS '수정일';
COMMENT ON COLUMN report.in_user_id IS '작성자';
COMMENT ON COLUMN report.up_user_id IS '수정자
';
COMMENT ON COLUMN REVIEW.review_seq IS '리뷰_seq';
COMMENT ON COLUMN REVIEW.user_id IS '회원 아이디';
COMMENT ON COLUMN REVIEW.star_cnt IS '별 0~5개 평점';
COMMENT ON COLUMN REVIEW.reply IS '한줄코멘트';
COMMENT ON COLUMN REVIEW.in_date IS 'date';
COMMENT ON COLUMN REVIEW.up_date IS '수정일
';
COMMENT ON COLUMN REVIEW.in_user_id IS '작성자';
COMMENT ON COLUMN REVIEW.up_user_id IS '수정자';
COMMENT ON COLUMN teamgame.teamgame_sep IS '모집 순번';
COMMENT ON COLUMN teamgame.user_id IS '회원 아이디';
COMMENT ON COLUMN teamgame.title IS '모집 제목';
COMMENT ON COLUMN teamgame.match_mode IS '매치 모드';
COMMENT ON COLUMN teamgame.message IS '메시지';
COMMENT ON COLUMN teamgame.position IS '포지션';
COMMENT ON COLUMN teamgame.status IS '접속 상태';
COMMENT ON COLUMN teamgame.in_date IS '작성일';
COMMENT ON COLUMN teamgame.in_user_id IS '작성자';
COMMENT ON COLUMN teamgame.up_date IS '수정일';
COMMENT ON COLUMN teamgame.up_user_id IS '수정자';



