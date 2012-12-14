CREATE TABLE "formations" (
    "id"        INTEGER NOT NULL PRIMARY KEY,
    "series_id" INTEGER NOT NULL REFERENCES "series" ( "id" ),
    "name"      TEXT NOT NULL UNIQUE,
    "nickname"  TEXT NULL
);

CREATE TABLE "cars" (
    "number"        INTEGER NOT NULL PRIMARY KEY,
    "formation_id"  INTEGER NOT NULL REFERENCES "formations" ( "id" ),
    "position"      INTEGER NOT NULL,
    UNIQUE ( "formation_id", "position" )
);

INSERT INTO "formations" VALUES ( 1, 1, '1号', NULL );
INSERT INTO "formations" VALUES ( 2, 1, '2号', NULL );
INSERT INTO "cars" VALUES ( 1, 1, 1 );
INSERT INTO "cars" VALUES ( 2, 2, 1 );
