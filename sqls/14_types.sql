CREATE TABLE "types" (
    "id"            INTEGER     NOT NULL PRIMARY KEY,
    "name"          TEXT        NOT NULL,
    "name_disp"     TEXT        NOT NULL,
    "name_ui"       TEXT        NOT NULL UNIQUE,
    "is_special"    BOOLEAN     NOT NULL
);

BEGIN;
INSERT INTO "types" VALUES ( 100, '普通',     '普通',     '普通',     FALSE );
INSERT INTO "types" VALUES ( 110, '区間急行', '区間急行', '区間急行', FALSE );
INSERT INTO "types" VALUES ( 120, '準急',     '準急',     '準急',     FALSE );
INSERT INTO "types" VALUES ( 130, '通勤準急', '通勤準急', '通勤準急', FALSE );
INSERT INTO "types" VALUES ( 140, '急行',     '急行',     '急行',     FALSE );
INSERT INTO "types" VALUES ( 150, '深夜急行', '深夜急行', '深夜急行', FALSE );
INSERT INTO "types" VALUES ( 160, '快速急行', '快速急行', '快速急行', FALSE );
INSERT INTO "types" VALUES ( 170, '通勤快急', '通勤快急', '通勤快急', FALSE );
INSERT INTO "types" VALUES ( 180, '特急',     '特急',     '特急',     FALSE );

INSERT INTO "types" VALUES ( 500, '区間急行', '区間急行(N)',          '区間急行(外側)', FALSE );
INSERT INTO "types" VALUES ( 550, '通勤快急', '通勤快急「おりひめ」', 'おりひめ',       FALSE );
INSERT INTO "types" VALUES ( 560, '快速急行', '快速急行「ひこぼし」', 'ひこぼし',       FALSE );

INSERT INTO "types" VALUES ( 900, '臨時特急',     '臨時特急',             '(臨)特急',     TRUE );
INSERT INTO "types" VALUES ( 910, '臨時快速特急', '臨時快速特急',         '(臨)快速特急', TRUE );
INSERT INTO "types" VALUES ( 920, '臨時K特急',    '臨時K特急',            '(臨)K特急',    TRUE );
INSERT INTO "types" VALUES ( 930, '臨時快速特急', '臨時快速特急「洛楽」', '(臨)洛楽',     TRUE );
INSERT INTO "types" VALUES ( 990, '団体',         '団体',                 '(臨)団体',     TRUE );
INSERT INTO "types" VALUES ( 999, '回送',         '回送',                 '回送',         FALSE );

COMMIT;
