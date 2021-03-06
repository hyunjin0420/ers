--유저 정보
INSERT INTO U_MEMBER
   (M_INDEX, M_ID, M_PWD, M_NAME, M_JOINDATE, M_COMPANYTEL, M_MOBILE, M_EMAIL, M_ETCINFO, M_LASTVISITE, M_LEVEL, M_G_FLAG, M_WORKGROUP, ERSMON_MENU_FLAG, M_QA_F, 
    M_AGT_F, M_AGTID, M_TMON_F, M_CTI_ID, M_CTI_PWD, M_CTI_DN, SERVERIP, CONNECTION_TYPE, TEMPID, PWDCHANGEDATE, AUTHCNT, M_NO, VIEWCHECK)
 VALUES
   (1, 'ecstel', '6210538C56FD33215CF9F1BBD45F4065AF2FDFBB834EF550389D72BF7672C70', 'Admin', sysdate, 
    NULL, NULL, NULL, '시스템 관리자', sysdate, '0', NULL, 'CQ', '1111', '1', NULL, NULL, '0', NULL, NULL, 
    NULL, NULL, '1', 'ecstel', sysdate, 0, NULL, '1');
INSERT INTO U_MEMBER
   (M_INDEX, M_ID, M_PWD, M_NAME, M_JOINDATE, M_COMPANYTEL, M_MOBILE, M_EMAIL, M_ETCINFO, M_LASTVISITE, M_LEVEL, M_G_FLAG, M_WORKGROUP, ERSMON_MENU_FLAG, M_QA_F, 
    M_AGT_F, M_AGTID, M_TMON_F, M_CTI_ID, M_CTI_PWD, M_CTI_DN, SERVERIP, CONNECTION_TYPE, TEMPID, PWDCHANGEDATE, AUTHCNT, M_NO, VIEWCHECK)
 VALUES
   (2, 'admin', '6210538C56FD33215CF9F1BBD45F4065AF2FDFBB834EF550389D72BF7672C70', 'admin', sysdate, 
    NULL, NULL, NULL, '관리자', sysdate, '2', NULL, 'OTH', '1111', '0', NULL, NULL, '0', NULL, NULL, 
    NULL, NULL, '1', 'admin', sysdate, 0, NULL, '1');
INSERT INTO U_MEMBER
   (M_INDEX, M_ID, M_PWD, M_NAME, M_JOINDATE, M_COMPANYTEL, M_MOBILE, M_EMAIL, M_ETCINFO, M_LASTVISITE, M_LEVEL, M_G_FLAG, M_WORKGROUP, ERSMON_MENU_FLAG, M_QA_F, 
    M_AGT_F, M_AGTID, M_TMON_F, M_CTI_ID, M_CTI_PWD, M_CTI_DN, SERVERIP, CONNECTION_TYPE, TEMPID, PWDCHANGEDATE, AUTHCNT, M_NO, VIEWCHECK)
 VALUES
   (3, 'test2', '6210538C56FD33215CF9F1BBD45F4065AF2FDFBB834EF550389D72BF7672C70', 'test2', sysdate, 
    NULL, NULL, NULL, '일반 사용자', sysdate, '9', NULL, 'OTH', '1111', '0', NULL, NULL, '0', NULL, NULL, 
    NULL, NULL, '1', 'test2', sysdate, 0, NULL, '1');

-- 권한정보
INSERT INTO FW_AUTH_INFO VALUES ('ROLE_ANONYMOUS'               ,'모든 사용자'      , '', SYSDATE);
INSERT INTO FW_AUTH_INFO VALUES ('IS_AUTHENTICATED_ANONYMOUSLY' ,'스프링시큐리티 내부사용(롤부여 금지)'      , '', SYSDATE);
INSERT INTO FW_AUTH_INFO VALUES ('IS_AUTHENTICATED_REMEMBERED'  ,'스프링시큐리티 내부사용(롤부여 금지)', '', SYSDATE);
INSERT INTO FW_AUTH_INFO VALUES ('IS_AUTHENTICATED_FULLY'       ,'스프링시큐리티 내부사용(롤부여 금지)'    , '', SYSDATE);
INSERT INTO FW_AUTH_INFO VALUES ('ROLE_USER'                    ,'일반 사용자'      , '', SYSDATE);
INSERT INTO FW_AUTH_INFO VALUES ('ROLE_ADMIN'                   ,'관리자'           , '', SYSDATE);
INSERT INTO FW_AUTH_INFO VALUES ('ROLE_SYSTEM'                   ,'시스템관리자'           , '', SYSDATE);


-- 롤 계층구조
INSERT INTO FW_ROLE_HIERARCHY VALUES ('ROLE_ANONYMOUS'               ,'IS_AUTHENTICATED_ANONYMOUSLY');
INSERT INTO FW_ROLE_HIERARCHY VALUES ('IS_AUTHENTICATED_ANONYMOUSLY' ,'IS_AUTHENTICATED_REMEMBERED');
INSERT INTO FW_ROLE_HIERARCHY VALUES ('IS_AUTHENTICATED_REMEMBERED'  ,'IS_AUTHENTICATED_FULLY');
INSERT INTO FW_ROLE_HIERARCHY VALUES ('IS_AUTHENTICATED_FULLY'       ,'ROLE_USER');
INSERT INTO FW_ROLE_HIERARCHY VALUES ('ROLE_USER'                    ,'ROLE_ADMIN');
INSERT INTO FW_ROLE_HIERARCHY VALUES ('ROLE_ADMIN'                    ,'ROLE_SYSTEM');

-- 사용자보안설정
INSERT INTO FW_AUTH_MAP (M_LEVEL, AUTHOR_CODE, ETC) VALUES ('0', 'ROLE_SYSTEM', '시스템관리자');
INSERT INTO FW_AUTH_MAP (M_LEVEL, AUTHOR_CODE, ETC) VALUES ('2', 'ROLE_ADMIN', '관리자');
INSERT INTO FW_AUTH_MAP (M_LEVEL, AUTHOR_CODE, ETC) VALUES ('9', 'ROLE_USER', '일반 사용자');


-- 롤 등록
INSERT INTO FW_ROLE_INFO (ROLE_CODE, ROLE_NM, ROLE_PTTRN, ROLE_DC, ROLE_TY, ROLE_SORT, ROLE_CREAT_DE) VALUES('web-000001', '로그인롤', '\A/login/.*\.do.*\Z', '로그인허용을 위한 롤', 'url', '1', SYSDATE);
INSERT INTO FW_ROLE_INFO (ROLE_CODE, ROLE_NM, ROLE_PTTRN, ROLE_DC, ROLE_TY, ROLE_SORT, ROLE_CREAT_DE) VALUES('web-000002', '좌측메뉴', '/EgovLeft.do', '좌측 메뉴에 대한 접근 제한 롤', 'url', '2', SYSDATE);
INSERT INTO FW_ROLE_INFO (ROLE_CODE, ROLE_NM, ROLE_PTTRN, ROLE_DC, ROLE_TY, ROLE_SORT, ROLE_CREAT_DE) VALUES('web-000003', '모든접근제한', '\A/.*\.do.*\Z', '모든자원에 대한 접근 제한 롤', 'url', '3', SYSDATE);
INSERT INTO FW_ROLE_INFO (ROLE_CODE, ROLE_NM, ROLE_PTTRN, ROLE_DC, ROLE_TY, ROLE_SORT, ROLE_CREAT_DE) VALUES('web-000004', '회원관리', '\A/uss/umt/.*\.do.*\Z', '회원관리에 대한 접근 제한 롤', 'url', '1', SYSDATE);
INSERT INTO FW_ROLE_INFO (ROLE_CODE, ROLE_NM, ROLE_PTTRN, ROLE_DC, ROLE_TY, ROLE_SORT, ROLE_CREAT_DE) VALUES('web-000005', '파일다운로드', '\A/sym/ccm/zip/.*\.do.*\Z', '파일다운로드에 대한 접근 제한 롤', 'url', '1', SYSDATE);
INSERT INTO FW_ROLE_INFO (ROLE_CODE, ROLE_NM, ROLE_PTTRN, ROLE_DC, ROLE_TY, ROLE_SORT, ROLE_CREAT_DE) VALUES('web-000006', '상단메뉴', '/EgovTop.do', '상단메뉴에 대한 접근 제한 롤', 'url', '1', SYSDATE);
INSERT INTO FW_ROLE_INFO (ROLE_CODE, ROLE_NM, ROLE_PTTRN, ROLE_DC, ROLE_TY, ROLE_SORT, ROLE_CREAT_DE) VALUES('web-000007', '하단메뉴', '/EgovBottom.do', '하단메뉴에 대한 접근 제한 롤', 'url', '1', SYSDATE);

-- 권한 롤 매핑
INSERT INTO FW_ROLE_AUTH_RELATE (AUTHOR_CODE, ROLE_CODE, CREAT_DT) VALUES ('ROLE_ANONYMOUS', 'web-000001', SYSDATE);
INSERT INTO FW_ROLE_AUTH_RELATE (AUTHOR_CODE, ROLE_CODE, CREAT_DT) VALUES ('ROLE_ANONYMOUS', 'web-000002', SYSDATE);
INSERT INTO FW_ROLE_AUTH_RELATE (AUTHOR_CODE, ROLE_CODE, CREAT_DT) VALUES ('ROLE_ANONYMOUS', 'web-000004', SYSDATE);
INSERT INTO FW_ROLE_AUTH_RELATE (AUTHOR_CODE, ROLE_CODE, CREAT_DT) VALUES ('ROLE_ANONYMOUS', 'web-000005', SYSDATE);
INSERT INTO FW_ROLE_AUTH_RELATE (AUTHOR_CODE, ROLE_CODE, CREAT_DT) VALUES ('ROLE_ANONYMOUS', 'web-000006', SYSDATE);
INSERT INTO FW_ROLE_AUTH_RELATE (AUTHOR_CODE, ROLE_CODE, CREAT_DT) VALUES ('ROLE_ANONYMOUS', 'web-000007', SYSDATE);
INSERT INTO FW_ROLE_AUTH_RELATE (AUTHOR_CODE, ROLE_CODE, CREAT_DT) VALUES ('ROLE_USER', 'web-000003', SYSDATE);