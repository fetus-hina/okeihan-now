CREATE TABLE "lines_stations" (
    "line_id"       INTEGER NOT NULL REFERENCES "lines" ( "id" ),
    "station_id"    INTEGER NOT NULL REFERENCES "stations" ( "id" ),
    "sort"          INTEGER NOT NULL,
    UNIQUE ( "line_id", "station_id" ),
    UNIQUE ( "line_id", "sort" )
);

BEGIN;

-- 中之島線
INSERT INTO "lines_stations" VALUES ( 10, 11510, 10 );
INSERT INTO "lines_stations" VALUES ( 10, 11520, 20 );
INSERT INTO "lines_stations" VALUES ( 10, 11530, 30 );
INSERT INTO "lines_stations" VALUES ( 10, 11540, 40 );
INSERT INTO "lines_stations" VALUES ( 10, 12530, 50 );

-- 京阪本線
INSERT INTO "lines_stations" VALUES ( 20, 12510,  10 );
INSERT INTO "lines_stations" VALUES ( 20, 12520,  20 );
INSERT INTO "lines_stations" VALUES ( 20, 12530,  30 );
INSERT INTO "lines_stations" VALUES ( 20, 12540,  40 );
INSERT INTO "lines_stations" VALUES ( 20, 12550,  50 );
INSERT INTO "lines_stations" VALUES ( 20, 12560,  60 );
INSERT INTO "lines_stations" VALUES ( 20, 12570,  70 );
INSERT INTO "lines_stations" VALUES ( 20, 12580,  80 );
INSERT INTO "lines_stations" VALUES ( 20, 12590,  90 );
INSERT INTO "lines_stations" VALUES ( 20, 12600, 100 );
INSERT INTO "lines_stations" VALUES ( 20, 12610, 110 );
INSERT INTO "lines_stations" VALUES ( 20, 12620, 120 );
INSERT INTO "lines_stations" VALUES ( 20, 12630, 130 );
INSERT INTO "lines_stations" VALUES ( 20, 12640, 140 );
INSERT INTO "lines_stations" VALUES ( 20, 12650, 150 );
INSERT INTO "lines_stations" VALUES ( 20, 12660, 160 );
INSERT INTO "lines_stations" VALUES ( 20, 12670, 170 );
INSERT INTO "lines_stations" VALUES ( 20, 12680, 180 );
INSERT INTO "lines_stations" VALUES ( 20, 12690, 190 );
INSERT INTO "lines_stations" VALUES ( 20, 12700, 200 );
INSERT INTO "lines_stations" VALUES ( 20, 12710, 210 );
INSERT INTO "lines_stations" VALUES ( 20, 12720, 220 );
INSERT INTO "lines_stations" VALUES ( 20, 12730, 230 );
INSERT INTO "lines_stations" VALUES ( 20, 12740, 240 );
INSERT INTO "lines_stations" VALUES ( 20, 12750, 250 );
INSERT INTO "lines_stations" VALUES ( 20, 12760, 260 );
INSERT INTO "lines_stations" VALUES ( 20, 12770, 270 );
INSERT INTO "lines_stations" VALUES ( 20, 12780, 280 );
INSERT INTO "lines_stations" VALUES ( 20, 12790, 290 );
INSERT INTO "lines_stations" VALUES ( 20, 12800, 300 );
INSERT INTO "lines_stations" VALUES ( 20, 12810, 310 );
INSERT INTO "lines_stations" VALUES ( 20, 12820, 320 );
INSERT INTO "lines_stations" VALUES ( 20, 12830, 330 );
INSERT INTO "lines_stations" VALUES ( 20, 12840, 340 );
INSERT INTO "lines_stations" VALUES ( 20, 12850, 350 );
INSERT INTO "lines_stations" VALUES ( 20, 12860, 360 );
INSERT INTO "lines_stations" VALUES ( 20, 12870, 370 );
INSERT INTO "lines_stations" VALUES ( 20, 12880, 380 );
INSERT INTO "lines_stations" VALUES ( 20, 12890, 390 );
INSERT INTO "lines_stations" VALUES ( 20, 12900, 400 );

-- 鴨東線
INSERT INTO "lines_stations" VALUES ( 30, 12900, 10 );
INSERT INTO "lines_stations" VALUES ( 30, 13510, 20 );
INSERT INTO "lines_stations" VALUES ( 30, 13520, 30 );

-- 交野線
INSERT INTO "lines_stations" VALUES ( 40, 14510, 10 );
INSERT INTO "lines_stations" VALUES ( 40, 14520, 20 );
INSERT INTO "lines_stations" VALUES ( 40, 14530, 30 );
INSERT INTO "lines_stations" VALUES ( 40, 14540, 40 );
INSERT INTO "lines_stations" VALUES ( 40, 14550, 50 );
INSERT INTO "lines_stations" VALUES ( 40, 14560, 60 );
INSERT INTO "lines_stations" VALUES ( 40, 14570, 70 );
INSERT INTO "lines_stations" VALUES ( 40, 12710, 80 );

-- 宇治線
INSERT INTO "lines_stations" VALUES ( 50, 15510, 10 );
INSERT INTO "lines_stations" VALUES ( 50, 15520, 20 );
INSERT INTO "lines_stations" VALUES ( 50, 15530, 30 );
INSERT INTO "lines_stations" VALUES ( 50, 15540, 40 );
INSERT INTO "lines_stations" VALUES ( 50, 15550, 50 );
INSERT INTO "lines_stations" VALUES ( 50, 15560, 60 );
INSERT INTO "lines_stations" VALUES ( 50, 15570, 70 );
INSERT INTO "lines_stations" VALUES ( 50, 12780, 80 );

-- 鋼索線 上り下りが物理的な上り下りに対応するようにする（たぶん本当は逆）
INSERT INTO "lines_stations" VALUES ( 90, 12760, 10);
INSERT INTO "lines_stations" VALUES ( 90, 16510, 20);

COMMIT;
