CREATE TABLE "stations" (
    "id"        INTEGER     NOT NULL    PRIMARY KEY,
    "name"      TEXT        NOT NULL,
    "location"  POINT       NOT NULL,
    "is_principal" BOOLEAN NOT NULL
);

BEGIN;

-- 中之島線
INSERT INTO "stations" VALUES ( 11510, '中之島',     POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 11520, '渡辺橋',     POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 11530, '大江橋',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 11540, 'なにわ橋',   POINT(0.0, 0.0), FALSE );

-- 京阪本線
INSERT INTO "stations" VALUES ( 12510, '淀屋橋',     POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12520, '北浜',       POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12530, '天満橋',     POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12540, '京橋',       POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12550, '野江',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12560, '関目',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12570, '森小路',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12580, '千林',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12590, '滝井',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12600, '土居',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12610, '守口市',     POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12620, '西三荘',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12630, '門真市',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12640, '古川橋',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12650, '大和田',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12660, '萱島',       POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12670, '寝屋川市',   POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12680, '香里園',     POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12690, '光善寺',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12700, '枚方公園',   POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12710, '枚方市',     POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12720, '御殿山',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12730, '牧野',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12740, '樟葉',       POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12750, '橋本',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12760, '八幡市',     POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12770, '淀',         POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12780, '中書島',     POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12790, '伏見桃山',   POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12800, '丹波橋',     POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12810, '墨染',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12820, '藤森',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12830, '深草',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12840, '伏見稲荷',   POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12850, '鳥羽街道',   POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12860, '東福寺',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 12870, '七条',       POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12880, '清水五条',   POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12890, '祇園四条',   POINT(0.0, 0.0), TRUE );
INSERT INTO "stations" VALUES ( 12900, '三条',       POINT(0.0, 0.0), TRUE );

-- 鴨東線
INSERT INTO "stations" VALUES ( 13510, '神宮丸太町', POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 13520, '出町柳',     POINT(0.0, 0.0), TRUE );

-- 交野線(私市→枚方市)
INSERT INTO "stations" VALUES ( 14510, '私市',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 14520, '河内森',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 14530, '交野市',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 14540, '郡津',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 14550, '村野',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 14560, '星ヶ丘',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 14570, '宮之阪',     POINT(0.0, 0.0), FALSE );

-- 宇治線(宇治→中書島)
INSERT INTO "stations" VALUES ( 15510, '宇治',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 15520, '三室戸',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 15530, '黄檗',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 15540, '木幡',       POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 15550, '六地蔵',     POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 15560, '桃山南口',   POINT(0.0, 0.0), FALSE );
INSERT INTO "stations" VALUES ( 15570, '観月橋',     POINT(0.0, 0.0), FALSE );

-- 鋼索線(男山山上→八幡市)
INSERT INTO "stations" VALUES ( 16510, '男山山上',   POINT(0.0, 0.0), FALSE );

COMMIT;
