--drop table MVP_data
create table MVP_data(
	PLAYER_NAME varchar,
	GAME_NUMBER int,
	GAME_PLAYED int,
	DATE varchar,
	AGE int,
	TEAM varchar,
	HOME_AWAY varchar,
	OPP varchar,
	RESULT varchar,
	GS int,
	MP varchar,
	MIN int,
	SEC int,
	SECONDS_PLAYED int,
	FG int,
	FGA int,
	FG_PERCENT decimal,
	THREEP int,
	THREEPA int,
	THREEP_PERCENT decimal,
	FT int,
	FTA int,
	FT_PERCENT decimal,
	ORB int,
	DRB int,
	TRB int,
	AST int,
	STL int,
	BLK int,
	TOV int,
	PF int,
	PTS int,
	GMSC decimal,
	PLUS_MINUS varchar
);

select * from MVP_data
limit 5

--drop table contracts
create table contracts(
	PLAYER varchar,
	SEASON varchar,
	TEAM varchar,
	LEAGUE varchar,
	SALARY money
);

select * from contracts
limit 5

create view contracts_clean as
  select PLAYER, SEASON, SALARY from contracts;

--joined table
select *
from MVP_data as m
join contracts_clean as c
on PLAYER_NAME = PLAYER
limit 10
