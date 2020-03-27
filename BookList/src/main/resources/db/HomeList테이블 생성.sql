-- 물품리스트
CREATE TABLE HomeList (
		H_No INTEGER NOT NULL,
		H_Name VARCHAR(200) NOT NULL,
		H_Price INTEGER NULL,
		H_GetDate DATE NULL,
		maker VARCHAR(100) NULL,
		del_Ck VARCHAR(10) NULL,
		CATE_NO INTEGER NULL
);

-- 물품리스트
ALTER TABLE HomeList
	ADD CONSTRAINT PK_HomeList -- 물품리스트 기본키
	PRIMARY KEY (
		H_No -- 물품 번호
	);

-- 카테고리
CREATE TABLE Categorie (
		cate_No INTEGER NOT NULL,
		cate_Name VARCHAR (100) NOT NULL,
		cate_Info VARCHAR(400) NULL
);

-- 카테고리
ALTER TABLE Categorie
	ADD CONSTRAINT PK_Categorie -- 카테고리 기본키
	PRIMARY KEY (
		CKTE_NO -- 카테고리 번호
	);
alter table Categorie add use_ck varchar(4); --사용여부 체크..
ALTER TABLE Categorie MODIFY (use_ck not null); --사용여부 체크 필수

-- 추가 정보
CREATE TABLE addInfo (
		CKTE_NO INTEGER NOT NULL,
		add_Info_No INTEGER NOT NULL,
		add_Info_Name VARCHAR(30) NULL,
		add_Info_Info VARCHAR(500) NULL
);

-- 추가 정보
ALTER TABLE addInfo
	ADD CONSTRAINT PK_addInfo -- 추가 정보 기본키
	PRIMARY KEY (
		CKTENO,    -- 카테고리 번호
		add_Info_No  -- 추가정보 번호
	);

-- 추가정보 내용
CREATE TABLE addContent (
		H_No INTEGER NOT NULL,
		add_Con_No INTEGER NOT NULL,
		add_Con_Info VARCHAR(500) NULL,
		CKTE_NO INTEGER NULL,
		add_Info_No INTEGER NULL
);

-- 추가정보 내용
ALTER TABLE addContent
	ADD CONSTRAINT PK_addContent -- 추가정보 내용 기본키
	PRIMARY KEY (
		H_No,      -- 물품 번호
		add_Con_No  -- 내용 번호
	);

-- 사용자
CREATE TABLE userInfo (
		no INTEGER NOT NULL,
		name VARCHAR(20) NOT NULL,
		birthday VARCHAR(12) NULL,
		tel VARCHAR(30) NULL,
		location VARCHAR(30) NULL,
		gender VARCHAR(10) NULL
);

-- 사용자
ALTER TABLE user
	ADD CONSTRAINT PK_user -- 사용자 기본키
	PRIMARY KEY (
		no -- 번호
	);

-- 물품리스트
ALTER TABLE HomeList
	ADD CONSTRAINT FK_Categorie_TO_HomeList -- 카테고리 -> 물품리스트
	FOREIGN KEY (
		CKTE_NO -- 카테고리 번호
	)
	REFERENCES Categorie ( -- 카테고리
		CKTE_NO -- 카테고리 번호
	);

-- 추가 정보
ALTER TABLE addInfo
	ADD CONSTRAINT FK_Categorie_TO_addInfo -- 카테고리 -> 추가 정보
	FOREIGN KEY (
		CKTE_NO -- 카테고리 번호
	)
	REFERENCES Categorie ( -- 카테고리
		CKTE_NO -- 카테고리 번호
	);

-- 추가정보 내용
ALTER TABLE addContent
	ADD CONSTRAINT FK_HomeList_TO_addContent -- 물품리스트 -> 추가정보 내용
	FOREIGN KEY (
		H_No -- 물품 번호
	)
	REFERENCES HomeList ( -- 물품리스트
		H_No -- 물품 번호
	);

-- 추가정보 내용
ALTER TABLE addContent
	ADD CONSTRAINT FK_addInfo_TO_addContent -- 추가 정보 -> 추가정보 내용
	FOREIGN KEY (
		CKTE_NO,    -- 카테고리 번호
		add_Info_No  -- 추가정보 번호
	)
	REFERENCES addInfo ( -- 추가 정보
		CKTE_NO,    -- 카테고리 번호
		add_Info_No  -- 추가정보 번호
	);