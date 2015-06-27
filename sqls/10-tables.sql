CREATE TABLE "line_group" (
    "id"        INTEGER     NOT NULL PRIMARY KEY,
    "name"      TEXT        NOT NULL
);
INSERT INTO "line_group" VALUES
    ( 1, '京阪線' ),
    ( 2, '交野線' ),
    ( 3, '宇治線' ),
    ( 4, '鋼索線' );

CREATE TABLE "line" (
    "id"        INTEGER     NOT NULL PRIMARY KEY,
    "group_id"  INTEGER     NOT NULL REFERENCES "line_group" ( "id" ),
    "sort"      INTEGER     NOT NULL UNIQUE,
    "name"      TEXT        NOT NULL
);
INSERT INTO "line" VALUES
    ( 1, 1, 1, '京阪本線' ),
    ( 2, 1, 2, '中之島線' ),
    ( 3, 1, 3, '鴨東線' ),
    ( 4, 2, 4, '交野線' ),
    ( 5, 3, 5, '宇治線' ),
    ( 6, 4, 6, '鋼索線' );

CREATE TABLE "station" (
    "id"        INTEGER     NOT NULL PRIMARY KEY,
    "number"    CHAR(2)     NULL UNIQUE,
    "name"      TEXT        NOT NULL UNIQUE,
    "location"  POINT       NOT NULL,
    "is_principal"  BOOLEAN NOT NULL
);

-- 京阪本線・鴨東線
INSERT INTO "station" VALUES
    (  1, 'KH01', '淀屋橋',     POINT(0.0, 0.0), TRUE  ),
    (  2, 'KH02', '北浜',       POINT(0.0, 0.0), TRUE  ),
    (  3, 'KH03', '天満橋',     POINT(0.0, 0.0), TRUE  ),
    (  4, 'KH04', '京橋',       POINT(0.0, 0.0), TRUE  ),
    (  5, 'KH05', '野江',       POINT(0.0, 0.0), FALSE ),
    (  6, 'KH06', '関目',       POINT(0.0, 0.0), FALSE ),
    (  7, 'KH07', '森小路',     POINT(0.0, 0.0), FALSE ),
    (  8, 'KH08', '千林',       POINT(0.0, 0.0), FALSE ),
    (  9, 'KH09', '滝井',       POINT(0.0, 0.0), FALSE ),
    ( 10, 'KH10', '土居',       POINT(0.0, 0.0), FALSE ),
    ( 11, 'KH11', '守口市',     POINT(0.0, 0.0), TRUE  ),
    ( 12, 'KH12', '西三荘',     POINT(0.0, 0.0), FALSE ),
    ( 13, 'KH13', '門真市',     POINT(0.0, 0.0), FALSE ),
    ( 14, 'KH14', '古川橋',     POINT(0.0, 0.0), FALSE ),
    ( 15, 'KH15', '大和田',     POINT(0.0, 0.0), FALSE ),
    ( 16, 'KH16', '萱島',       POINT(0.0, 0.0), TRUE  ),
    ( 17, 'KH17', '寝屋川市',   POINT(0.0, 0.0), TRUE  ),
    ( 18, 'KH18', '香里園',     POINT(0.0, 0.0), TRUE  ),
    ( 19, 'KH19', '光善寺',     POINT(0.0, 0.0), FALSE ),
    ( 20, 'KH20', '枚方公園',   POINT(0.0, 0.0), TRUE  ),
    ( 21, 'KH21', '枚方市',     POINT(0.0, 0.0), TRUE  ),
    ( 22, 'KH22', '御殿山',     POINT(0.0, 0.0), FALSE ),
    ( 23, 'KH23', '牧野',       POINT(0.0, 0.0), FALSE ),
    ( 24, 'KH24', '樟葉',       POINT(0.0, 0.0), TRUE  ),
    ( 25, 'KH25', '橋本',       POINT(0.0, 0.0), FALSE ),
    ( 26, 'KH26', '八幡市',     POINT(0.0, 0.0), TRUE  ),
    ( 27, 'KH27', '淀',         POINT(0.0, 0.0), TRUE  ),
    ( 28, 'KH28', '中書島',     POINT(0.0, 0.0), TRUE  ),
    ( 29, 'KH29', '伏見桃山',   POINT(0.0, 0.0), FALSE ),
    ( 30, 'KH30', '丹波橋',     POINT(0.0, 0.0), TRUE  ),
    ( 31, 'KH31', '墨染',       POINT(0.0, 0.0), FALSE ),
    ( 32, 'KH32', '藤森',       POINT(0.0, 0.0), FALSE ),
    ( 33, 'KH33', '深草',       POINT(0.0, 0.0), FALSE ),
    ( 34, 'KH34', '伏見稲荷',   POINT(0.0, 0.0), TRUE  ),
    ( 35, 'KH35', '鳥羽街道',   POINT(0.0, 0.0), FALSE ),
    ( 36, 'KH36', '東福寺',     POINT(0.0, 0.0), FALSE ),
    ( 37, 'KH37', '七条',       POINT(0.0, 0.0), TRUE  ),
    ( 38, 'KH38', '清水五条',   POINT(0.0, 0.0), TRUE  ),
    ( 39, 'KH39', '祇園四条',   POINT(0.0, 0.0), TRUE  ),
    ( 40, 'KH40', '三条',       POINT(0.0, 0.0), TRUE  ),
    ( 41, 'KH41', '神宮丸太町', POINT(0.0, 0.0), FALSE ),
    ( 42, 'KH42', '出町柳',     POINT(0.0, 0.0), TRUE  );

-- 中之島線
INSERT INTO "station" VALUES
    ( 43, 'KH54', '中之島',     POINT(0.0, 0.0), TRUE  ),
    ( 44, 'KH53', '渡辺橋',     POINT(0.0, 0.0), TRUE  ),
    ( 45, 'KH52', '大江橋',     POINT(0.0, 0.0), FALSE ),
    ( 46, 'KH51', 'なにわ橋',   POINT(0.0, 0.0), FALSE );

-- 交野線
INSERT INTO "station" VALUES
    ( 47, 'KH67', '私市',       POINT(0.0, 0.0), FALSE ),
    ( 48, 'KH66', '河内森',     POINT(0.0, 0.0), FALSE ),
    ( 49, 'KH65', '交野市',     POINT(0.0, 0.0), FALSE ),
    ( 50, 'KH64', '郡津',       POINT(0.0, 0.0), FALSE ),
    ( 51, 'KH63', '村野',       POINT(0.0, 0.0), FALSE ),
    ( 52, 'KH62', '星ヶ丘',     POINT(0.0, 0.0), FALSE ),
    ( 53, 'KH61', '宮之阪',     POINT(0.0, 0.0), FALSE );

-- 宇治線
INSERT INTO "station" VALUES
    ( 54, 'KH77', '宇治',       POINT(0.0, 0.0), FALSE ),
    ( 55, 'KH76', '三室戸',     POINT(0.0, 0.0), FALSE ),
    ( 56, 'KH75', '黄檗',       POINT(0.0, 0.0), FALSE ),
    ( 57, 'KH74', '木幡',       POINT(0.0, 0.0), FALSE ),
    ( 58, 'KH73', '六地蔵',     POINT(0.0, 0.0), FALSE ),
    ( 59, 'KH72', '桃山南口',   POINT(0.0, 0.0), FALSE ),
    ( 60, 'KH71', '観月橋',     POINT(0.0, 0.0), FALSE );

-- 鋼索線
INSERT INTO "station" VALUES
    ( 61, NULL,   '男山山上',   POINT(0.0, 0.0), FALSE );
