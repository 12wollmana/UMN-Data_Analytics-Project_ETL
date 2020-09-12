-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/QU9F4l
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "players" (
    "player_id" INT   NOT NULL,
    "full_name" VARCHAR(50)   NOT NULL,
    "birthday" VARCHAR(10)   NOT NULL,
    "height_ft" FLOAT   NOT NULL,
    "weight_lbs" FLOAT   NOT NULL,
    "salary" FLOAT   NOT NULL,
    "college" VARCHAR(50),
    "high_school" VARCHAR(50),
    "videogame_rating" INT   NOT NULL,
    "nationality" VARCHAR(50)   NOT NULL,
    "draft_year" INT,
    "draft_peak" INT,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "player_statistics" (
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
    CONSTRAINT "pk_player_statistics" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "team_players" (
    "team_id" INT   NOT NULL,
    "player_id" INT   NOT NULL,
    "position" VARCHAR(50)   NOT NULL,
    "jersey" VARCHAR(2)   NOT NULL,
    CONSTRAINT "pk_team_players" PRIMARY KEY (
        "team_id","player_id"
     )
);

CREATE TABLE "teams" (
    "team_id" INT   NOT NULL,
    "team_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "team_id"
     )
);

ALTER TABLE "player_statistics" ADD CONSTRAINT "fk_player_statistics_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("player_id");

ALTER TABLE "team_players" ADD CONSTRAINT "fk_team_players_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("team_id");

ALTER TABLE "team_players" ADD CONSTRAINT "fk_team_players_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("player_id");
