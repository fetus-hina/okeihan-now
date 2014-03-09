-- トーマスラッピング
-- http://www.keihan.co.jp/traffic/railfan/thomas2013/
-- 10006F, 3006F
-- 2013-03-02～2014-03-23
UPDATE "formations"
    SET "nickname" = 'THOMAS&FRIENDS'
    WHERE "id" IN (3006, 10006);

UPDATE "formations" SET "nickname" = NULL WHERE "nickname" IS NOT NULL;
UPDATE "formations" SET "nickname" = 'きかんしゃトーマス号' WHERE "id" IN ( 10006, 3001 );
UPDATE "formations" SET "nickname" = 'きかんしゃパーシー号' WHERE "id" = 10001;
UPDATE "formations" SET "nickname" = 'いなり、こんこん、恋いろは。(ウカ) #いなこん ' WHERE "id" = 1506;
UPDATE "formations" SET "nickname" = 'いなり、こんこん、恋いろは。(丸太町) #いなこん ' WHERE "id" = 2455;
UPDATE "formations" SET "nickname" = 'いなり、こんこん、恋いろは。(三条) #いなこん ' WHERE "id" = 2634;
UPDATE "formations" SET "nickname" = 'いなり、こんこん、恋いろは。(丹波橋) #いなこん ' WHERE "id" = 5554;
UPDATE "formations" SET "nickname" = 'いなり、こんこん、恋いろは。(いなり) #いなこん ' WHERE "id" = 6004;
UPDATE "formations" SET "nickname" = 'いなり、こんこん、恋いろは。(墨染) #いなこん ' WHERE "id" = 7203;

