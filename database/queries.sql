-- List the following details of each player: player_id, full_name, team_name, salary, position, jersey.
select  players.player_id,
		players.full_name,
		teams.team_name,
		players.salary,
		team_players.position,
		team_players.jersey
from team_players
	join players
		on (players.player_id = team_players.player_id)
	join teams
		on (team_players.team_id = teams.team_id);


-- List the following details of each player with a NBA 2K20 rating <= 70: player_id, full_name, 
-- position, videogame_rating, games_played, points.
select players.player_id,
		players.full_name,
		team_players.position,
		players.videogame_rating,
		player_statistics.games_played,
		player_statistics.points
from player_statistics
	join players
		on (players.player_id = player_statistics.player_id)
	join team_players
		on (team_players.player_id = players.player_id)
where videogame_rating <= 70
order by videogame_rating;


-- List full_name, salary, draft_year, draft_peak for players making between 4 million and 10 million.
select full_name, salary, draft_year, draft_peak
from players
where salary between 4000000 and 10000000;


-- Find players that don't have a team.
-- 30 is the team_id for "On Market", which
-- means no team.
select  players.player_id,
		players.full_name,
		teams.team_name,
		players.salary,
		team_players.position,
		teams.team_name
from team_players
	join players
		on (players.player_id = team_players.player_id)
	join teams
		on (team_players.team_id = teams.team_id)
where teams.team_id = 30;