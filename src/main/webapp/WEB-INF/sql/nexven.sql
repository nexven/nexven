/* 글 */
CREATE TABLE board (
	bNum NUMBER NOT NULL, /* 글번호 */
	bName VARCHAR2(20), /* 게시판이름 */
	bTitle VARCHAR2(200), /* 제목 */
	bCategory VARCHAR2(50), /* 카테고리 */
	mId VARCHAR2(20), /* 아이디 */
	bDate DATE, /* 작성시간 */
	bHit NUMBER, /* 조회수 */
	bGood NUMBER, /* 추천 */
	bContent VARCHAR2(2000 char), /* 내용 */
	bFile VARCHAR2(200), /* 첨부파일 */
	bState VARCHAR2(20), /* 거래상태 */
	mIp VARCHAR2(20), /* 아이피 */
	mTel VARCHAR2(50), /* 연락처 */
	bPrice NUMBER /* 물품금액 */
);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			bNum
		);

COMMENT ON TABLE board IS '글';

COMMENT ON COLUMN board.bNum IS '글번호';

COMMENT ON COLUMN board.bName IS '게시판이름';

COMMENT ON COLUMN board.bTitle IS '제목';

COMMENT ON COLUMN board.bCategory IS '카테고리';

COMMENT ON COLUMN board.mId IS '아이디';

COMMENT ON COLUMN board.bDate IS '작성시간';

COMMENT ON COLUMN board.bHit IS '조회수';

COMMENT ON COLUMN board.bGood IS '추천';

COMMENT ON COLUMN board.bContent IS '내용';

COMMENT ON COLUMN board.bFile IS '첨부파일';

COMMENT ON COLUMN board.bState IS '거래상태';

COMMENT ON COLUMN board.mIp IS '아이피';

COMMENT ON COLUMN board.mTel IS '연락처';

COMMENT ON COLUMN board.bPrice IS '물품금액';

/* 게시판설정 */
CREATE TABLE boardManager (
	bName VARCHAR2(20) NOT NULL, /* 게시판이름 */
	bSubject VARCHAR2(50), /* 게시판제목 */
	bReadLevel NUMBER(3), /* 읽기권한레벨 */
	bWriteLevel NUMBER(3), /* 쓰기권한레벨 */
	bUploadLevel NUMBER(3), /* 업로드가능레벨 */
	bDownloadLevel NUMBER(3), /* 다운로드가능레벨 */
	bUseCategory NUMBER(3), /* 카테고리사용여부 */
	bCategoryList CLOB, /* 카테고리목록 */
	bUseFile NUMBER(3), /* 첨부파일여부 */
	bUseRss NUMBER(3), /* rss가용가능여부 */
	bUseGood NUMBER(3), /* 추천기능사용여부 */
	bUseIp NUMBER(3), /* 아이피표시여부 */
	bUseState NUMBER(3), /* 거래상태표시여부 */
	bUseTel NUMBER(3), /* 연락처표시여부 */
	bUsePrice NUMBER(3), /* 금액표시여부 */
	bRowPerPage NUMBER, /* 페이지당 행개수 */
	bUseNew NUMBER(3), /* 새글표시여부 */
	bUseHot NUMBER(3), /* hot표시여부 */
	bNumberOfPosts NUMBER, /* 글갯수 */
	bNHumberOfReply NUMBER, /* 덧글갯수 */
	bFilepath VARCHAR2(100) /* 업로드 파일 경로 */
);

ALTER TABLE boardManager
	ADD
		CONSTRAINT PK_boardManager
		PRIMARY KEY (
			bName
		);

COMMENT ON TABLE boardManager IS '게시판설정';

COMMENT ON COLUMN boardManager.bName IS '게시판이름';

COMMENT ON COLUMN boardManager.bSubject IS '게시판제목';

COMMENT ON COLUMN boardManager.bReadLevel IS '읽기권한레벨';

COMMENT ON COLUMN boardManager.bWriteLevel IS '쓰기권한레벨';

COMMENT ON COLUMN boardManager.bUploadLevel IS '업로드가능레벨';

COMMENT ON COLUMN boardManager.bDownloadLevel IS '다운로드가능레벨';

COMMENT ON COLUMN boardManager.bUseCategory IS '카테고리사용여부';

COMMENT ON COLUMN boardManager.bCategoryList IS '카테고리목록';

COMMENT ON COLUMN boardManager.bUseFile IS '첨부파일여부';

COMMENT ON COLUMN boardManager.bUseRss IS 'rss가용가능여부';

COMMENT ON COLUMN boardManager.bUseGood IS '추천기능사용여부';

COMMENT ON COLUMN boardManager.bUseIp IS '아이피표시여부';

COMMENT ON COLUMN boardManager.bUseState IS '거래상태표시여부';

COMMENT ON COLUMN boardManager.bUseTel IS '연락처표시여부';

COMMENT ON COLUMN boardManager.bUsePrice IS '금액표시여부';

COMMENT ON COLUMN boardManager.bRowPerPage IS '페이지당 행개수';

COMMENT ON COLUMN boardManager.bUseNew IS '새글표시여부';

COMMENT ON COLUMN boardManager.bUseHot IS 'hot표시여부';

COMMENT ON COLUMN boardManager.bNumberOfPosts IS '글갯수';

COMMENT ON COLUMN boardManager.bNHumberOfReply IS '덧글갯수';

COMMENT ON COLUMN boardManager.bFilepath IS '업로드 파일 경로';

/* 회원 */
CREATE TABLE member (
	mNum NUMBER NOT NULL, /* 회원번호 */
	mId VARCHAR2(20) NOT NULL, /* 아이디 */
	mPass VARCHAR2(20), /* 패스워드 */
	mName VARCHAR2(20), /* 이름 */
	mNick VARCHAR2(20), /* 닉네임 */
	mEmail VARCHAR2(50), /* 이메일 */
	mAuthLevel NUMBER, /* 회원권한레벨 */
	mGender VARCHAR2(10), /* 성별 */
	mBirth DATE, /* 생년월일 */
	mTel VARCHAR2(50), /* 연락처 */
	mZipcode VARCHAR2(5 char), /* 우편번호(신) */
	mAddr1 VARCHAR2(50), /* 도로명주소 */
	mAddr2 VARCHAR2(50), /* 나머지주소 */
	mLevel NUMBER, /* 회원레벨 */
	mExp NUMBER, /* 회원EXP */
	mRecentLoginDate DATE, /* 최종접속시간 */
	mIp VARCHAR2(20), /* 아이피 */
	mOut DATE, /* 탈퇴일시 */
	mIsOut NUMBER(3), /* 탈퇴여부 */
	mJoinDate DATE /* 회원가입일 */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			mId
		);

COMMENT ON TABLE member IS '회원';

COMMENT ON COLUMN member.mNum IS '회원번호';

COMMENT ON COLUMN member.mId IS '아이디';

COMMENT ON COLUMN member.mPass IS '패스워드';

COMMENT ON COLUMN member.mName IS '이름';

COMMENT ON COLUMN member.mNick IS '닉네임';

COMMENT ON COLUMN member.mEmail IS '이메일';

COMMENT ON COLUMN member.mAuthLevel IS '회원권한레벨';

COMMENT ON COLUMN member.mGender IS '성별';

COMMENT ON COLUMN member.mBirth IS '생년월일';

COMMENT ON COLUMN member.mTel IS '연락처';

COMMENT ON COLUMN member.mZipcode IS '우편번호(신)';

COMMENT ON COLUMN member.mAddr1 IS '도로명주소';

COMMENT ON COLUMN member.mAddr2 IS '나머지주소';

COMMENT ON COLUMN member.mLevel IS '회원레벨';

COMMENT ON COLUMN member.mExp IS '회원EXP';

COMMENT ON COLUMN member.mRecentLoginDate IS '최종접속시간';

COMMENT ON COLUMN member.mIp IS '아이피';

COMMENT ON COLUMN member.mOut IS '탈퇴일시';

COMMENT ON COLUMN member.mIsOut IS '탈퇴여부';

COMMENT ON COLUMN member.mJoinDate IS '회원가입일';

/* 게임DB */
CREATE TABLE gameDb (
	gNum NUMBER NOT NULL, /* 게임번호 */
	gName VARCHAR2(100), /* 게임이름 */
	gStartDate DATE, /* 서비스일자 */
	gMaker VARCHAR2(50), /* 개발사 */
	gPublisher VARCHAR2(50), /* 유통사 */
	gServiceType VARCHAR2(20), /* 서비스형태 */
	gPlatform VARCHAR2(20), /* 플랫폼 */
	gGenre VARCHAR2(20), /* 장르 */
	gHomepage VARCHAR2(50), /* 홈페이지 */
	gRating NUMBER, /* 평점 */
	gIntroduce VARCHAR2(2000 char) /* 게임소개 */
);

ALTER TABLE gameDb
	ADD
		CONSTRAINT PK_gameDb
		PRIMARY KEY (
			gNum
		);

COMMENT ON TABLE gameDb IS '게임DB';

COMMENT ON COLUMN gameDb.gNum IS '게임번호';

COMMENT ON COLUMN gameDb.gName IS '게임이름';

COMMENT ON COLUMN gameDb.gStartDate IS '서비스일자';

COMMENT ON COLUMN gameDb.gMaker IS '개발사';

COMMENT ON COLUMN gameDb.gPublisher IS '유통사';

COMMENT ON COLUMN gameDb.gServiceType IS '서비스형태';

COMMENT ON COLUMN gameDb.gPlatform IS '플랫폼';

COMMENT ON COLUMN gameDb.gGenre IS '장르';

COMMENT ON COLUMN gameDb.gHomepage IS '홈페이지';

COMMENT ON COLUMN gameDb.gRating IS '평점';

COMMENT ON COLUMN gameDb.gIntroduce IS '게임소개';

/* 덧글 */
CREATE TABLE reply (
	rNum NUMBER NOT NULL, /* 덧글번호 */
	mId VARCHAR2(20), /* 아이디 */
	rDate DATE, /* 작성일자 */
	mIp VARCHAR2(20), /* 아이피 */
	rContent VARCHAR2(200 char), /* 내용 */
	bNum NUMBER /* 글번호 */
);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			rNum
		);

COMMENT ON TABLE reply IS '덧글';

COMMENT ON COLUMN reply.rNum IS '덧글번호';

COMMENT ON COLUMN reply.mId IS '아이디';

COMMENT ON COLUMN reply.rDate IS '작성일자';

COMMENT ON COLUMN reply.mIp IS '아이피';

COMMENT ON COLUMN reply.rContent IS '내용';

COMMENT ON COLUMN reply.bNum IS '글번호';

/* 게임DB덧글 */
CREATE TABLE dbReply (
	dbReplyNum NUMBER NOT NULL, /* 게임DB덧글번호 */
	mId VARCHAR2(20), /* 아이디 */
	dbReplyDate DATE, /* 작성일자 */
	mIp VARCHAR2(20), /* 아이피 */
	dbReplyContent VARCHAR2(200 char), /* 내용 */
	dbRate NUMBER, /* 평점 */
	gNum NUMBER /* 게임번호 */
);

ALTER TABLE dbReply
	ADD
		CONSTRAINT PK_dbReply
		PRIMARY KEY (
			dbReplyNum
		);

COMMENT ON TABLE dbReply IS '게임DB덧글';

COMMENT ON COLUMN dbReply.dbReplyNum IS '게임DB덧글번호';

COMMENT ON COLUMN dbReply.mId IS '아이디';

COMMENT ON COLUMN dbReply.dbReplyDate IS '작성일자';

COMMENT ON COLUMN dbReply.mIp IS '아이피';

COMMENT ON COLUMN dbReply.dbReplyContent IS '내용';

COMMENT ON COLUMN dbReply.dbRate IS '평점';

COMMENT ON COLUMN dbReply.gNum IS '게임번호';

/* 게임일정게시판 */
CREATE TABLE gameSchedule (
	sNum NUMBER NOT NULL, /* 게임일정번호 */
	sName VARCHAR2(100), /* 게임이름 */
	sStart DATE, /* 시작일자 */
	sEnd DATE, /* 종료일자 */
	sType VARCHAR2(20), /* 구분 */
	gNum NUMBER /* 게임번호 */
);

ALTER TABLE gameSchedule
	ADD
		CONSTRAINT PK_gameSchedule
		PRIMARY KEY (
			sNum
		);

COMMENT ON TABLE gameSchedule IS '게임일정게시판';

COMMENT ON COLUMN gameSchedule.sNum IS '게임일정번호';

COMMENT ON COLUMN gameSchedule.sName IS '게임이름';

COMMENT ON COLUMN gameSchedule.sStart IS '시작일자';

COMMENT ON COLUMN gameSchedule.sEnd IS '종료일자';

COMMENT ON COLUMN gameSchedule.sType IS '구분';

COMMENT ON COLUMN gameSchedule.gNum IS '게임번호';

