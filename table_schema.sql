drop table MVP_data cascade
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
	PLUS_MINUS varchar,
	SEASON varchar
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

select * from contracts_clean

--joined table
create view mvp_merge as
select m.PLAYER_NAME,
	m.GAME_NUMBER,
	m.GAME_PLAYED,
	m.DATE,
	m.AGE,
	m.TEAM,
	m.HOME_AWAY,
	m.OPP,
	m.RESULT,
	m.GS,
	m.MP,
	m.MIN,
	m.SEC,
	m.SECONDS_PLAYED,
	m.FG,
	m.FGA,
	m.FG_PERCENT,
	m.THREEP,
	m.THREEPA,
	m.THREEP_PERCENT,
	m.FT,
	m.FTA,
	m.FT_PERCENT,
	m.ORB,
	m.DRB,
	m.TRB,
	m.AST,
	m.STL,
	m.BLK,
	m.TOV,
	m.PF,
	m.PTS,
	m.GMSC,
	m.PLUS_MINUS,
	m.SEASON,
	c.SALARY
from MVP_data as m
join contracts_clean as c
	on m.PLAYER_NAME = c.PLAYER
	and m.SEASON = c.SEASON
limit 5

select * from mvp_merge
limit 5

--drop table rookie_data
create table rookie_data(
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

select * from rookie_data
limit 5

--joined table
create view rookie_merge as
select r.PLAYER_NAME,
	r.GAME_NUMBER,
	r.GAME_PLAYED,
	r.DATE,
	r.AGE,
	r.TEAM,
	r.HOME_AWAY,
	r.OPP,
	r.RESULT,
	r.GS,
	r.MP,
	r.MIN,
	r.SEC,
	r.SECONDS_PLAYED,
	r.FG,
	r.FGA,
	r.FG_PERCENT,
	r.THREEP,
	r.THREEPA,
	r.THREEP_PERCENT,
	r.FT,
	r.FTA,
	r.FT_PERCENT,
	r.ORB,
	r.DRB,
	r.TRB,
	r.AST,
	r.STL,
	r.BLK,
	r.TOV,
	r.PF,
	r.PTS,
	r.GMSC,
	r.PLUS_MINUS,
	c.SALARY
from rookie_data as r
join contracts_clean as c
	on r.PLAYER_NAME = c.PLAYER
limit 5

select * from rookie_merge
limit 5