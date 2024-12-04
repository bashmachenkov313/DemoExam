select *
from Request

select *
from Request
Where RequestStatusId = 3

select Request.RequestId, Equipment.EquipmentName, Request.RequestDate, Problem.ProblemName, [User].UserFullName as Client, Request.RequestDescription, Status.StatusName, Request.RequestTime, [User1].UserFullName as [Master], Priority.PriorityName, Stage.StageName, Request.RequestComment
From Equipment inner join
	Request on Equipment.EquipmentId = Request.RequestEquipmentId inner join
	Priority on Request.RequestPriorityId = Priority.PriorityId inner join
	Problem on Request.RequestProblemId = Problem.ProblemId inner join
	Stage on Request.RequestStageId = Stage.StageId inner join
	Status on Request.RequestStatusId = Status.StatusId inner join
	[User] on Request.RequestUserId = [User].UserId inner join
	[User] as User1 on Request.RequestMasterId = [User1].UserId

select AVG(RequestTime)/60.0 as TimeAVG
from Request
where RequestStageId = 3

create proc GetInfoRequestFromMaster
	@IdMaster int = 105 
as
begin
	select *
	from Request
	where RequestMasterId = @IdMaster and RequestStatusId = 3
end


exec GetInfoRequestFromMaster 105