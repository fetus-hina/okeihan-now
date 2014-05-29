UPDATE "formations" SET "nickname" = NULL WHERE "nickname" IS NOT NULL;
UPDATE "formations" SET "nickname" = '宇治・伏見ギャラリートレイン' WHERE "id" = 10005;
UPDATE "formations" SET "nickname" = 'いなり、こんこん、恋いろは。HM #いなこん' WHERE "id" IN ( 2226, 2624, 6001 );
