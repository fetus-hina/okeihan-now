-- びわこ号復活プロジェクトギャラリートレイン
-- http://www.keihan.co.jp/traffic/specialtrain-goods/exp_gallerytrain-biwako/
-- 2207-2257
-- 2012-10-17～2013-03-31
UPDATE "formations"
    SET "nickname" = 'びわこ号復活プロジェクトギャラリートレイン'
    WHERE "id" = 2207;

-- 13000 系ギャラリートレイン
-- http://www.keihan.co.jp/traffic/specialtrain-goods/event_13000debut/
-- 2012-04-14～2013-04-14
UPDATE "formations"
    SET "nickname" = 'ギャラリートレイン'
    WHERE "id" = 13001;

-- トーマスラッピング
-- http://www.keihan.co.jp/traffic/railfan/thomas2013/
-- 10006F, 3006F
-- 2013-03-02～2014-03-23
UPDATE "formations"
    SET "nickname" = 'THOMAS&FRIENDS'
    WHERE "id" IN (3006, 10006);
