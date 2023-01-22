
--display a patients name and thiere Doctors with cancer disease using CTE.  
with cte 
as
(
select p.patient_name , d.name  from Patient p
join Doctor d on p.doctor_id = d.doctor_id 
where p.disease = 'Cancer'

)

select * from cte



-- display top seconed salary of the Doctors using CTE with Dens Rank

with cte2
as
(
 select d.name as [Doctor Name] , d.salary  , DENSE_RANK() over (ORDER BY salary desc) as [Rank_salary] 
 from Doctor d 
 
 )

 select * from cte2
 where Rank_salary =2



--Displaying A report with patient Checked in 

create procedure daily_rebort
as
select count(p.patient_id) AS [Number of Patint],GETDATE() as [Date of Rebort] 
from Patient p join Check_in_Patient ch on p.patient_id = ch.p_id

exec daily_rebort


GO



--Calculating total Charge Bill of a specific Patient using Stored Procedure.

alter proc Calc_TotalCharge @pid int 
as  

select b.Bill_no, (b.no_days *b.room_charge)+b.doctor_charge + b.lab_charge as [Total Charge] from Bill b
join Patient p on p.patient_id = b.p_id
where p.patient_id = @pid

 EXEC Calc_TotalCharge 8



go



--Trigger to prevent a delete in Bill Table.

create trigger tr_Bill on Bill instead of delete
as
select ' You cannot delete from Bill table'

--DELETE FROM Bill WHERE no_days = 6
 


 -- Report About diabets Patient using view

go

alter view V_Diabets
as
select p.patient_name , d.name as [Consulting doctor]  from Patient p
join Doctor d on p.doctor_id = d.doctor_id 
where p.disease = 'Diabets'



select * from V_Diabets



 -- Report About Hypertension Patient using view

go
create  view V_Hypertension
as
select p.patient_name , d.name as [Consulting doctor]  from Patient p
join Doctor d on p.doctor_id = d.doctor_id 
where p.disease = 'Hypertension'


select * from V_Hypertension


-- Report About Cervical cancer Patient using view

 
 go
 create  view V_Cervicalcancer
as
select p.patient_name , d.name as [Consulting doctor]  from Patient p
join Doctor d on p.doctor_id = d.doctor_id 
where p.disease = 'Cervical cancer' and p.age <50

select * from V_Hypertension