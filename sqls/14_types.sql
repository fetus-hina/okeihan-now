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

INSERT INTO "types" VALUES ( 800, '臨時',         '臨時',                 '臨時',         TRUE );
INSERT INTO "types" VALUES ( 810, '臨時区間急行', '臨時区間急行',         '(臨)区間急行', TRUE );
INSERT INTO "types" VALUES ( 820, '臨時準急',     '臨時準急',             '(臨)準急',     TRUE );
INSERT INTO "types" VALUES ( 830, '臨時通勤準急', '臨時通勤準急',         '(臨)通勤準急', TRUE );
INSERT INTO "types" VALUES ( 840, '臨時急行',     '臨時急行',             '(臨)急行',     TRUE );
INSERT INTO "types" VALUES ( 850, '臨時深夜急行', '臨時深夜急行',         '(臨)深夜急行', TRUE );
INSERT INTO "types" VALUES ( 860, '臨時快速急行', '臨時快速急行',         '(臨)快速急行', TRUE );
INSERT INTO "types" VALUES ( 870, '臨時通勤快急', '臨時通勤快急',         '(臨)通勤快急', TRUE );
INSERT INTO "types" VALUES ( 880, '臨時特急',     '臨時特急',             '(臨)特急',     TRUE );
INSERT INTO "types" VALUES ( 890, '臨時快速特急', '臨時快速特急',         '(臨)快速特急', TRUE );
INSERT INTO "types" VALUES ( 891, '臨時K特急',    '臨時K特急',            '(臨)K特急',    TRUE );
INSERT INTO "types" VALUES ( 895, '臨時快速特急', '臨時快速特急「洛楽」', '(臨)洛楽',     TRUE );

INSERT INTO "types" VALUES ( 990, '団体',         '団体',                 '(臨)団体',     TRUE );
INSERT INTO "types" VALUES ( 999, '回送',         '回送',                 '回送',         FALSE );

COMMIT;
