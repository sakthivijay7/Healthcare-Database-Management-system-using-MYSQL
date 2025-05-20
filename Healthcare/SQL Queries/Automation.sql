-- 1.Patients details retrieve
delimiter //
create procedure  patientsdetails(in p varchar(50) )
begin 
select * from patients
where name=p;
end  //
delimiter ;

-- Enter name
call patientsdetails("MaRk foRD");

-- 2.Total billing Amount 

delimiter //
create procedure Billing_Amount_check(in input varchar(30))
begin 
select Name,Hospital,Doctor,DateofAdmission,Discharge_Date,TestResults,BillingAmount from Patients as p
left join admissions a on a.Patient_Id=p.Patient_Id
left join billing b on b.Patient_Id=p.Patient_Id
left join medicalrecords m on m.Patient_Id=p.Patient_Id
where Name=input;
end //
delimiter ;

-- Enter name
call  Billing_Amount_check("MaRk foRD");












