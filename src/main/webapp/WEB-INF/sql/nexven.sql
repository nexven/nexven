
/* 글 */
CREATE TABLE board (
	b_num NUMBER NOT NULL, /* 글번호 */
	b_name VARCHAR2(20), /* 게시판이름 */
	p_title VARCHAR2(200), /* 제목 */
	p_category VARCHAR2(50), /* 카테고리 */
	m_id VARCHAR2(20), /* 아이디 */
	b_date TIMESTAMP, /* 작성시간 */
	b_hit NUMBER, /* 조회수 */
	b_good NUMBER, /* 추천 */
	b_content VARCHAR2(2000 char), /* 내용 */
	b_file VARCHAR2(200), /* 첨부파일 */
	b_state VARCHAR2(20), /* 거래상태 */
	m_ip VARCHAR2(20), /* 아이피 */
	m_tel VARCHAR2(50), /* 연락처 */
	b_price NUMBER /* 물품금액 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			b_num
		);

COMMENT ON TABLE board IS '글';

COMMENT ON COLUMN board.b_num IS '글번호';

COMMENT ON COLUMN board.b_name IS '게시판이름';

COMMENT ON COLUMN board.p_title IS '제목';

COMMENT ON COLUMN board.p_category IS '카테고리';

COMMENT ON COLUMN board.m_id IS '아이디';

COMMENT ON COLUMN board.b_date IS '작성시간';

COMMENT ON COLUMN board.b_hit IS '조회수';

COMMENT ON COLUMN board.b_good IS '추천';

COMMENT ON COLUMN board.b_content IS '내용';

COMMENT ON COLUMN board.b_file IS '첨부파일';

COMMENT ON COLUMN board.b_state IS '거래상태';

COMMENT ON COLUMN board.m_ip IS '아이피';

COMMENT ON COLUMN board.m_tel IS '연락처';

COMMENT ON COLUMN board.b_price IS '물품금액';

/* 게시판설정 */
CREATE TABLE board_manager (
	b_name VARCHAR2(20) NOT NULL, /* 게시판이름 */
	b_subject VARCHAR2(50), /* 게시판제목 */
	b_read_level NUMBER(3), /* 읽기권한레벨 */
	b_write_level NUMBER(3), /* 쓰기권한레벨 */
	b_upload_level NUMBER(3), /* 업로드가능레벨 */
	b_download_level NUMBER(3), /* 다운로드가능레벨 */
	b_use_category NUMBER(3), /* 카테고리사용여부 */
	b_category_list CLOB, /* 카테고리목록 */
	b_use_file NUMBER(3), /* 첨부파일여부 */
	b_use_rss NUMBER(3), /* rss가용가능여부 */
	b_use_good NUMBER(3), /* 추천기능사용여부 */
	b_use_ip NUMBER(3), /* 아이피표시여부 */
	b_use_state NUMBER(3), /* 거래상태표시여부 */
	b_use_tel NUMBER(3), /* 연락처표시여부 */
	b_use_price NUMBER(3), /* 금액표시여부 */
	b_row_per_page NUMBER, /* 페이지당 행개수 */
	b_use_new NUMBER(3), /* 새글표시여부 */
	b_use_hot NUMBER(3), /* hot표시여부 */
	b_number_of_posts NUMBER, /* 글갯수 */
	b_number_of_reply NUMBER, /* 덧글갯수 */
	b_filepath VARCHAR2(100) /* 업로드 파일 경로 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

ALTER TABLE board_manager
	ADD
		CONSTRAINT PK_board_manager
		PRIMARY KEY (
			b_name
		);

COMMENT ON TABLE board_manager IS '게시판설정';

COMMENT ON COLUMN board_manager.b_name IS '게시판이름';

COMMENT ON COLUMN board_manager.b_subject IS '게시판제목';

COMMENT ON COLUMN board_manager.b_read_level IS '읽기권한레벨';

COMMENT ON COLUMN board_manager.b_write_level IS '쓰기권한레벨';

COMMENT ON COLUMN board_manager.b_upload_level IS '업로드가능레벨';

COMMENT ON COLUMN board_manager.b_download_level IS '다운로드가능레벨';

COMMENT ON COLUMN board_manager.b_use_category IS '카테고리사용여부';

COMMENT ON COLUMN board_manager.b_category_list IS '카테고리목록';

COMMENT ON COLUMN board_manager.b_use_file IS '첨부파일여부';

COMMENT ON COLUMN board_manager.b_use_rss IS 'rss가용가능여부';

COMMENT ON COLUMN board_manager.b_use_good IS '추천기능사용여부';

COMMENT ON COLUMN board_manager.b_use_ip IS '아이피표시여부';

COMMENT ON COLUMN board_manager.b_use_state IS '거래상태표시여부';

COMMENT ON COLUMN board_manager.b_use_tel IS '연락처표시여부';

COMMENT ON COLUMN board_manager.b_use_price IS '금액표시여부';

COMMENT ON COLUMN board_manager.b_row_per_page IS '페이지당 행개수';

COMMENT ON COLUMN board_manager.b_use_new IS '새글표시여부';

COMMENT ON COLUMN board_manager.b_use_hot IS 'hot표시여부';

COMMENT ON COLUMN board_manager.b_number_of_posts IS '글갯수';

COMMENT ON COLUMN board_manager.b_number_of_reply IS '덧글갯수';

COMMENT ON COLUMN board_manager.b_filepath IS '업로드 파일 경로';

/* 회원 */
CREATE TABLE member (
	m_num NUMBER NOT NULL, /* 회원번호 */
	m_id VARCHAR2(20) NOT NULL, /* 아이디 */
	m_pass VARCHAR2(20), /* 패스워드 */
	m_name VARCHAR2(20), /* 이름 */
	m_nick VARCHAR2(20), /* 닉네임 */
	m_email VARCHAR2(50), /* 이메일 */
	m_auth_level NUMBER, /* 회원권한레벨 */
	m_gender VARCHAR2(10), /* 성별 */
	m_birth DATE, /* 생년월일 */
	m_tel VARCHAR2(50), /* 연락처 */
	m_zipcode VARCHAR2(5 char), /* 우편번호(신) */
	m_addr1 VARCHAR2(50), /* 도로명주소 */
	m_addr2 VARCHAR2(50), /* 나머지주소 */
	m_level NUMBER, /* 회원레벨 */
	m_exp NUMBER, /* 회원EXP */
	m_recent_login_date TIMESTAMP, /* 최종접속시간 */
	m_ip VARCHAR2(20), /* 아이피 */
	m_out TIMESTAMP, /* 탈퇴일시 */
	m_is_out NUMBER(3), /* 탈퇴여부 */
	m_join_date DATE /* 회원가입일 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			m_id
		);

COMMENT ON TABLE member IS '회원';

COMMENT ON COLUMN member.m_num IS '회원번호';

COMMENT ON COLUMN member.m_id IS '아이디';

COMMENT ON COLUMN member.m_pass IS '패스워드';

COMMENT ON COLUMN member.m_name IS '이름';

COMMENT ON COLUMN member.m_nick IS '닉네임';

COMMENT ON COLUMN member.m_email IS '이메일';

COMMENT ON COLUMN member.m_auth_level IS '회원권한레벨';

COMMENT ON COLUMN member.m_gender IS '성별';

COMMENT ON COLUMN member.m_birth IS '생년월일';

COMMENT ON COLUMN member.m_tel IS '연락처';

COMMENT ON COLUMN member.m_zipcode IS '우편번호(신)';

COMMENT ON COLUMN member.m_addr1 IS '도로명주소';

COMMENT ON COLUMN member.m_addr2 IS '나머지주소';

COMMENT ON COLUMN member.m_level IS '회원레벨';

COMMENT ON COLUMN member.m_exp IS '회원EXP';

COMMENT ON COLUMN member.m_recent_login_date IS '최종접속시간';

COMMENT ON COLUMN member.m_ip IS '아이피';

COMMENT ON COLUMN member.m_out IS '탈퇴일시';

COMMENT ON COLUMN member.m_is_out IS '탈퇴여부';

COMMENT ON COLUMN member.m_join_date IS '회원가입일';

/* 게임DB */
CREATE TABLE game_db (
	g_num NUMBER NOT NULL, /* 게임번호 */
	g_name VARCHAR2(100), /* 게임이름 */
	g_start_date DATE, /* 서비스일자 */
	g_maker VARCHAR2(50), /* 개발사 */
	g_publisher VARCHAR2(50), /* 유통사 */
	g_service_type VARCHAR2(20), /* 서비스형태 */
	g_platform VARCHAR2(20), /* 플랫폼 */
	g_genre VARCHAR2(20), /* 장르 */
	g_homepage VARCHAR2(50), /* 홈페이지 */
	g_rating NUMBER, /* 평점 */
	g_introduce VARCHAR2(2000 char) /* 게임소개 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

ALTER TABLE game_db
	ADD
		CONSTRAINT PK_game_db
		PRIMARY KEY (
			g_num
		);

COMMENT ON TABLE game_db IS '게임DB';

COMMENT ON COLUMN game_db.g_num IS '게임번호';

COMMENT ON COLUMN game_db.g_name IS '게임이름';

COMMENT ON COLUMN game_db.g_start_date IS '서비스일자';

COMMENT ON COLUMN game_db.g_maker IS '개발사';

COMMENT ON COLUMN game_db.g_publisher IS '유통사';

COMMENT ON COLUMN game_db.g_service_type IS '서비스형태';

COMMENT ON COLUMN game_db.g_platform IS '플랫폼';

COMMENT ON COLUMN game_db.g_genre IS '장르';

COMMENT ON COLUMN game_db.g_homepage IS '홈페이지';

COMMENT ON COLUMN game_db.g_rating IS '평점';

COMMENT ON COLUMN game_db.g_introduce IS '게임소개';

/* 덧글 */
CREATE TABLE reply (
	r_num NUMBER NOT NULL, /* 덧글번호 */
	m_id VARCHAR2(20), /* 아이디 */
	r_date DATE, /* 작성일자 */
	m_ip VARCHAR2(20), /* 아이피 */
	r_content VARCHAR2(200 char), /* 내용 */
	b_num NUMBER /* 글번호 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			r_num
		);

COMMENT ON TABLE reply IS '덧글';

COMMENT ON COLUMN reply.r_num IS '덧글번호';

COMMENT ON COLUMN reply.m_id IS '아이디';

COMMENT ON COLUMN reply.r_date IS '작성일자';

COMMENT ON COLUMN reply.m_ip IS '아이피';

COMMENT ON COLUMN reply.r_content IS '내용';

COMMENT ON COLUMN reply.b_num IS '글번호';

/* 게임DB덧글 */
CREATE TABLE db_reply (
	db_reply_num NUMBER NOT NULL, /* 게임DB덧글번호 */
	m_id VARCHAR2(20), /* 아이디 */
	db_reply_date DATE, /* 작성일자 */
	m_ip VARCHAR2(20), /* 아이피 */
	db_reply_content VARCHAR2(200 char), /* 내용 */
	db_rate NUMBER, /* 평점 */
	g_name NUMBER /* 게임번호 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

ALTER TABLE db_reply
	ADD
		CONSTRAINT PK_db_reply
		PRIMARY KEY (
			db_reply_num
		);

COMMENT ON TABLE db_reply IS '게임DB덧글';

COMMENT ON COLUMN db_reply.db_reply_num IS '게임DB덧글번호';

COMMENT ON COLUMN db_reply.m_id IS '아이디';

COMMENT ON COLUMN db_reply.db_reply_date IS '작성일자';

COMMENT ON COLUMN db_reply.m_ip IS '아이피';

COMMENT ON COLUMN db_reply.db_reply_content IS '내용';

COMMENT ON COLUMN db_reply.db_rate IS '평점';

COMMENT ON COLUMN db_reply.g_name IS '게임번호';

/* 게임일정게시판 */
CREATE TABLE game_schedule (
	s_num NUMBER NOT NULL, /* 게임일정번호 */
	s_name VARCHAR2(100), /* 게임이름 */
	s_start DATE, /* 시작일자 */
	s_end DATE, /* 종료일자 */
	s_type VARCHAR2(20), /* 구분 */
	g_num NUMBER /* 게임번호 */
)
	STORAGE (
		BUFFER_POOL DEFAULT
	)
	LOGGING
	NOCOMPRESS
	NOCACHE
	NOPARALLEL
	NOROWDEPENDENCIES
	DISABLE ROW MOVEMENT;

ALTER TABLE game_schedule
	ADD
		CONSTRAINT PK_game_schedule
		PRIMARY KEY (
			s_num
		);

COMMENT ON TABLE game_schedule IS '게임일정게시판';

COMMENT ON COLUMN game_schedule.s_num IS '게임일정번호';

COMMENT ON COLUMN game_schedule.s_name IS '게임이름';

COMMENT ON COLUMN game_schedule.s_start IS '시작일자';

COMMENT ON COLUMN game_schedule.s_end IS '종료일자';

COMMENT ON COLUMN game_schedule.s_type IS '구분';

COMMENT ON COLUMN game_schedule.g_num IS '게임번호';

