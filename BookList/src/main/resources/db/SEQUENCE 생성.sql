--시퀀스 생성
--CREATE SEQUENCE [시퀀스명]
--INCREMENT BY [증감숫자] --증감숫자가 양수면 증가 음수면 감소 디폴트는 1
--START WITH [시작숫자] -- 시작숫자의 디폴트값은 증가일때 MINVALUE 감소일때 MAXVALUE
--NOMINVALUE OR MINVALUE [최솟값] -- NOMINVALUE : 디폴트값 설정, 증가일때 1, 감소일때 -1028 
                                 -- MINVALUE : 최소값 설정, 시작숫자와 작거나 같아야하고 MAXVALUE보다 작아야함
--NOMAXVALUE OR MAXVALUE [최대값] -- NOMAXVALUE : 디폴트값 설정, 증가일때 1027, 감소일때 -1
                                 -- MAXVALUE : 최대값 설정, 시작숫자와 같거나 커야하고 MINVALUE보다 커야함
--CYCLE OR NOCYCLE --CYCLE 설정시 최대값에 도달하면 최소값부터 다시 시작 NOCYCLE 설정시 최대값 생성 시 시퀀스 생성중지
--CACHE OR NOCACHE --CACHE 설정시 메모리에 시퀀스 값을 미리 할당하고 NOCACHE 설정시 시퀀스값을 메로리에 할당하지 않음

SELECT EX_SEQ.CURRVAL FROM DUAL; --해당 시퀀스 값 조회

SELECT * FROM USER_SEQUENCES ;

CREATE SEQUENCE HomeList_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

CREATE SEQUENCE Categorie_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

CREATE SEQUENCE addInfo_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

CREATE SEQUENCE addContent_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

CREATE SEQUENCE userInfo_seq
INCREMENT BY 1
START WITH 1
NOCACHE;