/*
2. 	Build a multiplayer quiz system:
			Two players join a session and answer the same questions.
			Tracks time taken + correctness.
			API decides the winner and stores the score.
			perform this on database
*/

create schema Session; 

create table Session.Users
(
	UserId int primary key identity(1,1) ,
    UserName varchar(50)
);

insert into Session.Users values ('Disha');
insert into Session.Users values ('Riya');

select * from Session.Users;

create table Session.QuizSessions 
(
    SessionId int primary key identity(1,1) ,
    CreatedAt datetime default GETDATE()
);

insert into Session.QuizSessions  values ('2025-04-10');

select * from Session.QuizSessions;

create table Session.QuizPlayers 
(
    QuizPlayerId int primary key identity(1,1) ,
    SessionId int,
    UserId int,
    foreign key (SessionId)references Session.QuizSessions(SessionId)
	on delete cascade
	on update cascade,
    foreign key (UserId) references Session.Users(UserId)
	on delete cascade
	on update cascade
);

insert into Session.QuizPlayers values (1,1);
insert into Session.QuizPlayers values (1,2);

select * from Session.QuizPlayers;

create table Session.Questions 
(
    QuestionId int primary key identity(1,1) ,
    Question varchar(200),
    OptionA varchar(100),
    OptionB varchar(100),
    OptionC varchar(100),
    OptionD varchar(100),
    CorrectAnswer varchar(10)
);

--drop table Session.Questions ;
insert into Session.Questions values ('Solve 2*2 = ?','4', '0', '1', '6', 'A');
insert into Session.Questions values ('10 /5  = ?','5', '0', '1', '2', 'D');

--delete from Session.Questions
--where QuestionId=2;

select * from Session.Questions;


create table Session.Answers 
(
    AnswerId int primary key identity(1,1) ,
    QuizPlayerId int,
    QuestionId int,
    SelectedAnswer varchar(10),
    TimeTaken int,
    IsCorrect bit,
    foreign key (QuizPlayerId) references Session.QuizPlayers(QuizPlayerId)
	on delete cascade
	on update cascade,
    foreign key (QuestionId)  references Session.Questions(QuestionId)
	on delete cascade
	on update cascade
);

--drop table Session.Answers;
--insert into Session.Answers values (1, 1,'A',1,1);
--insert into Session.Answers values (2, 1,'B',2,0);

select * from Session.Answers;

create table Session.Results 
(
    ResultId int primary key identity(1,1) ,
    SessionId int,
    WinnerId int,
    ScorePlayer1 int,
    ScorePlayer2 int,
    foreign key  (SessionId) references Session.QuizSessions(SessionId)
	on delete cascade
	on update cascade,
    foreign key (WinnerId) references Session.Users(UserId)
	on delete cascade
	on update cascade
);

-- Sp for Quiz
create or alter procedure SP_MultiplayerQuiz
@sessionId int,
@userId int,
@questionId int,
@selectedAnswer varchar(20),
@Time int
as
begin
	declare @quizPlayerId int;
	declare @correctAnswer varchar(20);
	declare @isCorrect bit;

	--user quiz player id 
	select @quizPlayerId = QuizPlayerId from Session.QuizPlayers
	where SessionId = @sessionId and UserId = @userId;

	--correct ans
	select @correctAnswer = CorrectAnswer from Session.Questions 
	where QuestionId = @questionId;

	--compare selected answer
	if (@selectedAnswer = @correctAnswer)
	begin
		set @isCorrect = 1;
	end
	else
	begin
		set @isCorrect = 0;
	end

	--inserting in answers table(Players answer)
	insert into Session.Answers
	(QuizPlayerId,QuestionId,SelectedAnswer,TimeTaken, IsCorrect)
	values 
	(@quizPlayerId, @questionId, @selectedAnswer, @Time, @isCorrect);

	--both players answer cheking 
	declare @totalquestions int;
	declare @answer1 int, @answer2 int;
	declare @player1 int, @player2 int;
	declare @user1 int, @user2 int;

	--select total Qs
	select @totalquestions = count(*) from Session.Questions;

	--find both players 
	select @player1 = min(QuizPlayerId), @player2 = max(QuizPlayerId)
	from Session.QuizPlayers
	where SessionId = @sessionId;

	--count their answers
	select @answer1 = COUNT(*) from Session.Answers
	where QuizPlayerId = @player1;

	select @answer2 = COUNT(*) from Session.Answers
	where QuizPlayerId = @player2;

	--if (@answer1 = @totalquestions and @answer2 = @totalquestions)
	--both answered at least one question 
	if (@answer1 >= 1 AND @answer2 >= 1)
	begin
		declare @score1 int, @score2 int;
		declare @time1 int, @time2 int;
		declare @winnerId int;

		--select userd id 
		select @user1 = UserId from Session.QuizPlayers
		where QuizPlayerId = @player1;

		select @user2 = UserId from Session.QuizPlayers
		where QuizPlayerId = @player2;

		--score calculate
		select @score1 = COUNT(*), @time1 = sum(TimeTaken)
		from Session.Answers
		where QuizPlayerId = @player1 and IsCorrect =1;

		select @score2 = COUNT(*), @time2 = sum(TimeTaken)
		from Session.Answers
		where QuizPlayerId = @player2 and IsCorrect =1;

		--for winner
		if (@score1 > @score2)
		begin
			set @winnerId = @user1;
		end
		--else if
		else if (@score2 > @score1)
		begin
			set @winnerId = @user2;
		end
		--else
		else
		begin
			if(@time1 > @time2)
			begin
				set @winnerId = @user2;
			end
			else
			begin
				set @winnerId = @user1;
			end

		end

		--insert in result table
		insert into Session.Results(SessionId,WinnerId,ScorePlayer1,ScorePlayer2)
		values (@sessionId, @winnerId, @score1, @score2);
	end

end


--Execute 
exec SP_MultiplayerQuiz 
    @SessionId = 1,
    @UserId = 1,
    @QuestionId = 1,
    @SelectedAnswer = 'A',
    @Time = 5;

exec SP_MultiplayerQuiz 
    @SessionId = 1,
    @UserId = 2,
    @QuestionId = 1,
    @SelectedAnswer = 'D',
    @Time = 4;

	select * from  Session.Results;
	select * from Session.Answers;

	--drop table Session.Answers;

