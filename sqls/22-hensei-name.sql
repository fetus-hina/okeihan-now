-- トーマスラッピング
-- http://www.keihan.co.jp/traffic/railfan/thomas2013/
-- 10006F, 3006F
-- 2013-03-02～2014-03-23
UPDATE "formations"
    SET "nickname" = 'THOMAS&FRIENDS'
    WHERE "id" IN (3006, 10006);
