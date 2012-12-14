BEGIN;

-- Location data from http://www.ekidata.jp/

-- 中之島線
UPDATE "stations" SET "location" = POINT( 34.692829, 135.506594 ) WHERE "id" = 11540;
UPDATE "stations" SET "location" = POINT( 34.694296, 135.500412 ) WHERE "id" = 11530;
UPDATE "stations" SET "location" = POINT( 34.693916, 135.495420 ) WHERE "id" = 11520;
UPDATE "stations" SET "location" = POINT( 34.691504, 135.487373 ) WHERE "id" = 11510;
                                                    
-- 京阪本線                                         
UPDATE "stations" SET "location" = POINT( 35.009114, 135.772274 ) WHERE "id" = 12900;
UPDATE "stations" SET "location" = POINT( 35.003689, 135.771961 ) WHERE "id" = 12890;
UPDATE "stations" SET "location" = POINT( 34.995691, 135.768378 ) WHERE "id" = 12880;
UPDATE "stations" SET "location" = POINT( 34.989322, 135.767846 ) WHERE "id" = 12870;
UPDATE "stations" SET "location" = POINT( 34.981351, 135.769998 ) WHERE "id" = 12860;
UPDATE "stations" SET "location" = POINT( 34.973632, 135.770004 ) WHERE "id" = 12850;
UPDATE "stations" SET "location" = POINT( 34.968966, 135.769279 ) WHERE "id" = 12840;
UPDATE "stations" SET "location" = POINT( 34.964247, 135.770154 ) WHERE "id" = 12830;
UPDATE "stations" SET "location" = POINT( 34.956782, 135.770191 ) WHERE "id" = 12820;
UPDATE "stations" SET "location" = POINT( 34.948206, 135.769126 ) WHERE "id" = 12810;
UPDATE "stations" SET "location" = POINT( 34.938879, 135.765457 ) WHERE "id" = 12800;
UPDATE "stations" SET "location" = POINT( 34.932599, 135.764368 ) WHERE "id" = 12790;
UPDATE "stations" SET "location" = POINT( 34.926875, 135.760174 ) WHERE "id" = 12780;
UPDATE "stations" SET "location" = POINT( 34.904416, 135.718435 ) WHERE "id" = 12770;
UPDATE "stations" SET "location" = POINT( 34.884651, 135.699960 ) WHERE "id" = 12760;
UPDATE "stations" SET "location" = POINT( 34.882042, 135.684251 ) WHERE "id" = 12750;
UPDATE "stations" SET "location" = POINT( 34.861977, 135.675352 ) WHERE "id" = 12740;
UPDATE "stations" SET "location" = POINT( 34.843868, 135.665584 ) WHERE "id" = 12730;
UPDATE "stations" SET "location" = POINT( 34.829178, 135.653969 ) WHERE "id" = 12720;
UPDATE "stations" SET "location" = POINT( 34.816171, 135.648814 ) WHERE "id" = 12710;
UPDATE "stations" SET "location" = POINT( 34.811526, 135.639465 ) WHERE "id" = 12700;
UPDATE "stations" SET "location" = POINT( 34.797745, 135.630124 ) WHERE "id" = 12690;
UPDATE "stations" SET "location" = POINT( 34.784613, 135.630927 ) WHERE "id" = 12680;
UPDATE "stations" SET "location" = POINT( 34.763893, 135.620603 ) WHERE "id" = 12670;
UPDATE "stations" SET "location" = POINT( 34.747453, 135.611180 ) WHERE "id" = 12660;
UPDATE "stations" SET "location" = POINT( 34.742962, 135.602667 ) WHERE "id" = 12650;
UPDATE "stations" SET "location" = POINT( 34.739940, 135.591484 ) WHERE "id" = 12640;
UPDATE "stations" SET "location" = POINT( 34.738090, 135.583224 ) WHERE "id" = 12630;
UPDATE "stations" SET "location" = POINT( 34.737309, 135.575900 ) WHERE "id" = 12620;
UPDATE "stations" SET "location" = POINT( 34.735323, 135.565273 ) WHERE "id" = 12610;
UPDATE "stations" SET "location" = POINT( 34.730577, 135.559763 ) WHERE "id" = 12600;
UPDATE "stations" SET "location" = POINT( 34.727868, 135.557463 ) WHERE "id" = 12590;
UPDATE "stations" SET "location" = POINT( 34.723966, 135.554741 ) WHERE "id" = 12580;
UPDATE "stations" SET "location" = POINT( 34.719419, 135.551686 ) WHERE "id" = 12570;
UPDATE "stations" SET "location" = POINT( 34.712520, 135.546953 ) WHERE "id" = 12560;
UPDATE "stations" SET "location" = POINT( 34.707223, 135.543356 ) WHERE "id" = 12550;
UPDATE "stations" SET "location" = POINT( 34.697052, 135.532182 ) WHERE "id" = 12540;
UPDATE "stations" SET "location" = POINT( 34.690200, 135.516633 ) WHERE "id" = 12530;
UPDATE "stations" SET "location" = POINT( 34.691799, 135.506830 ) WHERE "id" = 12520;
UPDATE "stations" SET "location" = POINT( 34.692456, 135.501648 ) WHERE "id" = 12510;
                                                    
-- 鴨東線                                           
UPDATE "stations" SET "location" = POINT( 35.029613, 135.772440 ) WHERE "id" = 13520;
UPDATE "stations" SET "location" = POINT( 35.017669, 135.772161 ) WHERE "id" = 13510;
                                                    
-- 交野線(私市→枚方市)                             
UPDATE "stations" SET "location" = POINT( 34.813649, 135.656630 ) WHERE "id" = 14570;
UPDATE "stations" SET "location" = POINT( 34.807696, 135.659755 ) WHERE "id" = 14560;
UPDATE "stations" SET "location" = POINT( 34.801828, 135.664221 ) WHERE "id" = 14550;
UPDATE "stations" SET "location" = POINT( 34.794376, 135.669868 ) WHERE "id" = 14540;
UPDATE "stations" SET "location" = POINT( 34.786924, 135.675595 ) WHERE "id" = 14530;
UPDATE "stations" SET "location" = POINT( 34.773860, 135.685617 ) WHERE "id" = 14520;
UPDATE "stations" SET "location" = POINT( 34.767671, 135.686569 ) WHERE "id" = 14510;
                                                   
-- 宇治線(宇治→中書島)                             
UPDATE "stations" SET "location" = POINT( 34.928103, 135.768642 ) WHERE "id" = 15570;
UPDATE "stations" SET "location" = POINT( 34.931056, 135.783683 ) WHERE "id" = 15560;
UPDATE "stations" SET "location" = POINT( 34.932017, 135.793322 ) WHERE "id" = 15550;
UPDATE "stations" SET "location" = POINT( 34.925859, 135.796047 ) WHERE "id" = 15540;
UPDATE "stations" SET "location" = POINT( 34.914335, 135.802656 ) WHERE "id" = 15530;
UPDATE "stations" SET "location" = POINT( 34.898976, 135.806339 ) WHERE "id" = 15520;
UPDATE "stations" SET "location" = POINT( 34.894678, 135.806229 ) WHERE "id" = 15510;
                                                    
-- 鋼索線(男山山上→八幡市)                         
UPDATE "stations" SET "location" = POINT( 34.881061, 135.699796 ) WHERE "id" = 16510;

COMMIT;
