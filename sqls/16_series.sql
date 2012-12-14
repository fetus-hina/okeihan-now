CREATE TABLE "series" (
    "id"        INTEGER NOT NULL PRIMARY KEY,
    "name"      TEXT NOT NULL UNIQUE,
    "nickname"  TEXT NULL,
    "group"     INTEGER NOT NULL
);

BEGIN;
INSERT INTO "series" VALUES (  8000,  '8000系', 'ELEGANT SALOON',   1);
INSERT INTO "series" VALUES (  8030,  '8000系30番台', NULL,         1);
INSERT INTO "series" VALUES (  3000,  '3000系', 'COMFORT SALOON',   2);
INSERT INTO "series" VALUES ( 13000, '13000系', NULL,               3);
INSERT INTO "series" VALUES ( 10000, '10000系', NULL,               3);
INSERT INTO "series" VALUES (  9000,  '9000系', NULL,               3);
INSERT INTO "series" VALUES (  7200,  '7200系', NULL,               3);
INSERT INTO "series" VALUES (  7000,  '7000系', NULL,               3);
INSERT INTO "series" VALUES (  6000,  '6000系', NULL,               3);
INSERT INTO "series" VALUES (  5000,  '5000系', '三つ五郎',         3);
INSERT INTO "series" VALUES (  2600,  '2600系', NULL,               3);
INSERT INTO "series" VALUES (  2400,  '2400系', NULL,               3);
INSERT INTO "series" VALUES (  2200,  '2200系', NULL,               3);
INSERT INTO "series" VALUES (  1000,  '1000系', NULL,               3);
INSERT INTO "series" VALUES (     1, '鋼索客車', NULL,              9);
COMMIT;
