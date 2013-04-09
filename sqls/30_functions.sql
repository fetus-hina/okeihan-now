CREATE OR REPLACE FUNCTION "is_nobori" ( INTEGER, TEXT ) RETURNS BOOLEAN
AS $$
    SELECT
        CASE
            WHEN LENGTH($2) BETWEEN 3 AND 4 THEN
                /* 鋼索線 */
                (CAST($2 AS INTEGER) % 2 = 0) /* 物理的に上るものを上りとする */
            WHEN CAST(SUBSTR($2, 4, 2) AS INTEGER) % 2 = 0 THEN
                TRUE /* 偶数なら上り */
            ELSE
                FALSE /* 奇数なので下り */
        END
$$ LANGUAGE SQL IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION "is_kudari" ( INTEGER, TEXT ) RETURNS BOOLEAN
AS $$
    SELECT NOT(is_nobori($1, $2))
$$ LANGUAGE SQL IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION "time2datetime" ( TIME(0) ) RETURNS TIMESTAMP(0)
AS $$
    SELECT
        CASE
            /* 4 時までは前営業日 */
            WHEN $1 <  '04:00:00'::TIME(0) AND CURRENT_TIME <  '04:00:00'::TIME(0) THEN CURRENT_DATE + $1
            WHEN $1 <  '04:00:00'::TIME(0) AND CURRENT_TIME >= '04:00:00'::TIME(0) THEN CURRENT_DATE + $1 + '1 day'::INTERVAL
            WHEN $1 >= '04:00:00'::TIME(0) AND CURRENT_TIME <  '04:00:00'::TIME(0) THEN CURRENT_DATE + $1 - '1 day'::INTERVAL
            WHEN $1 >= '04:00:00'::TIME(0) AND CURRENT_TIME >= '04:00:00'::TIME(0) THEN CURRENT_DATE + $1
        END
$$ LANGUAGE SQL STABLE STRICT;

CREATE LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION distance(POINT, POINT) RETURNS NUMERIC
AS $$
    declare
        v_lat1 numeric := $1[0];
        v_lon1 numeric := $1[1];
        v_lat2 numeric := $2[0];
        v_lon2 numeric := $2[1];
        v_pi numeric := 3.1415926535897932384626433832795;
        v_rd numeric;
        v_dp numeric;
        v_dr numeric;
        v_p numeric;
        v_m numeric;
        v_n numeric;
    begin
        v_rd := v_pi / 180;
        v_lat1 := v_lat1 * v_rd;
        v_lon1 := v_lon1 * v_rd;
        v_lat2 := v_lat2 * v_rd;
        v_lon2 := v_lon2 * v_rd;
        v_dp = abs(v_lat1 - v_lat2);
        v_dr = abs(v_lon1 - v_lon2);
        v_p = v_lat1 + ((v_lat2 - v_lat1) / 2);
        v_m = 6335439 / sqrt(pow(1 - 0.006694 * pow(sin(v_p), 2), 3));
        v_n = 6378137 / sqrt(1 - 0.006694 * pow(sin(v_p), 2));
        return sqrt(pow(v_m * v_dp, 2) + pow(v_n * cos(v_p) * v_dr, 2));
    end
$$
LANGUAGE plpgsql;
