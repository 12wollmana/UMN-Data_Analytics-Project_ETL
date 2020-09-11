-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/QU9F4l
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "Players" (
    "player_id" INT   NOT NULL,
    "full_name" VARCHAR(50)   NOT NULL,
    "birthday" VARCHAR(10)   NOT NULL,
    "height_ft" FLOAT   NOT NULL,
    "weight_lbs" FLOAT   NOT NULL,
    "salary" FLOAT   NOT NULL,
    "college" VARCHAR(50)   NOT NULL,
    "high_school" VARCHAR(50)   NOT NULL,
    "rating_2K20" INT   NOT NULL,
    "nationality" VARCHAR(50)   NOT NULL,
    "draft_year" INT   NOT NULL,
    "draft_peak" INT   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "Statistics" (
    "player_id" INT   NOT NULL,
    "games_played" INT   NOT NULL,
    "minutes_played" FLOAT   NOT NULL,
    "field_goals_made" INT   NOT NULL,
    "field_goals_attempts" INT   NOT NULL,
    "three_points_made" INT   NOT NULL,
    "three_points_attempts" INT   NOT NULL,
    "free_throws_made" INT   NOT NULL,
    "free_throws_attempted" INT   NOT NULL,
    "turnovers" INT   NOT NULL,
    "personal_fouls" INT   NOT NULL,
    "offensive_rebounds" INT   NOT NULL,
    "defensive_rebounds" INT   NOT NULL,
    "total_rebounds" INT   NOT NULL,
    "assists" INT   NOT NULL,
    "steals" INT   NOT NULL,
    "blocks" INT   NOT NULL,
    "points" INT   NOT NULL,
    CONSTRAINT "pk_Statistics" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "Team_Players" (
    "team_id" INT   NOT NULL,
    "player_id" INT   NOT NULL,
    "position" VARCHAR(50)   NOT NULL,
    "jersey" VARCHAR(2)   NOT NULL,
    CONSTRAINT "pk_Team_Players" PRIMARY KEY (
        "team_id","player_id"
     )
);

CREATE TABLE "Teams" (
    "team_id" INT   NOT NULL,
    "team_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "team_id"
     )
);

ALTER TABLE "Statistics" ADD CONSTRAINT "fk_Statistics_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("player_id");

ALTER TABLE "Team_Players" ADD CONSTRAINT "fk_Team_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Team_Players" ADD CONSTRAINT "fk_Team_Players_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("player_id");
