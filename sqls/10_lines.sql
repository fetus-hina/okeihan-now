CREATE TABLE "line_group" (
    "id"        INTEGER     NOT NULL PRIMARY KEY,
    "name"      TEXT        NOT NULL
);

CREATE TABLE "lines" (
    "id"        INTEGER     NOT NULL PRIMARY KEY,
    "group_id"  INTEGER     NOT NULL REFERENCES "line_group" ( "id" ),
    "sort"      INTEGER     NOT NULL UNIQUE,
    "name"      TEXT        NOT NULL
);

BEGIN;

INSERT INTO "line_group" VALUES ( 10, '京阪線' );
INSERT INTO "line_group" VALUES ( 20, '交野線' );
INSERT INTO "line_group" VALUES ( 30, '宇治線' );
INSERT INTO "line_group" VALUES ( 40, '鋼索線' );

INSERT INTO "lines" VALUES ( 10, 10, 10, '中之島線' );
INSERT INTO "lines" VALUES ( 20, 10, 20, '京阪本線' );
INSERT INTO "lines" VALUES ( 30, 10, 30, '鴨東線' );
INSERT INTO "lines" VALUES ( 40, 20, 40, '交野線' );
INSERT INTO "lines" VALUES ( 50, 30, 50, '宇治線' );
INSERT INTO "lines" VALUES ( 90, 40, 90, '鋼索線' );

COMMIT;
