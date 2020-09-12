-- List the following details of each player: player_id, full_name, team_name, salary, position, jersey

select Players.player_id,
		Players.full_name,
		Teams.team_name,
		Players.salary,
		Team_Players.position,
		Team_Players.jersey
from Players
	join Teams
		on (Players.player_id = Team_Players.player_id)
	join Team_Players
		on (Team_Players.team_id = Teams.team_id)


-- List the following details of each player with a NBA 2K20 rating <= 10: player_id, full_name, 
-- position, rating_2K20, games_played, points
select Players.player_id,
		Players.full_name,
		Teams_Players.position,
		Players.rating_2K20,
		Statistics.games_played
		Statistics.points
from Players
	join Statistics
		on (Players.player_id = Statistics.player_id)
	join Team_Players
		on (Team_Players.player_id = Players.player_id)
where rating_2K20 <= 10
order by rating_2K20;


-- List full_name, salary, draft_year, draft_peak for players making between 4 million and 10 million
select full_name, salary, draft_year, draft_peak
from Players
where salary between 4000000 and 10000000;