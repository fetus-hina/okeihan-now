CREATE TABLE "dias" (
    "id"            INTEGER NOT NULL PRIMARY KEY,
    "type_id"       INTEGER NOT NULL REFERENCES "types" ( "id" ),
    "weekday"       BOOLEAN NOT NULL,
    "holiday"       BOOLEAN NOT NULL,
    "number"        VARCHAR(6) NOT NULL, -- "A1200Z"
    "starting_station_id" INTEGER NOT NULL REFERENCES "stations" ( "id" ),
    "terminal_station_id" INTEGER NOT NULL REFERENCES "stations" ( "id" )
);
CREATE INDEX "dias_number" ON "dias" ( "number" );

CREATE TABLE "dias_line_groups" (
    "dia_id"        INTEGER NOT NULL REFERENCES "dias" ( "id" ),
    "group_id"      INTEGER NOT NULL REFERENCES "line_group" ( "id" ),
    PRIMARY KEY ( "dia_id", "group_id" )
);

CREATE TABLE "times" (
    "dia_id"        INTEGER NOT NULL REFERENCES "dias" ( "id" ),
    "station_id"    INTEGER NOT NULL REFERENCES "stations" ( "id" ),
    "arrive_at"     TIME(0) WITHOUT TIME ZONE NULL,
    "departure_at"  TIME(0) WITHOUT TIME ZONE NULL,
    "departure_line_id" INTEGER NULL REFERENCES "lines" ( "id" ),
    PRIMARY KEY ( "dia_id", "station_id" )
);
CREATE INDEX "times_station" ON "times" ( "station_id", "departure_line_id" );
