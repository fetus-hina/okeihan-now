UPDATE "formations" SET "nickname" = NULL WHERE "nickname" IS NOT NULL;
UPDATE "formations" SET "nickname" = '宇治・伏見ギャラリートレイン' WHERE "id" = 10005;
UPDATE "formations" SET "nickname" = 'たまこラブストーリーHM' WHERE "id" IN ( 7001, 7002 );
