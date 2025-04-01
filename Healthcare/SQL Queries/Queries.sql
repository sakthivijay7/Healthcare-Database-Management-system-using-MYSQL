
-- 1.Retrieve the Names,Ages, and Medicalconditions of all patients.
select Name,Age,MedicalCondition  from patients;

-- 2.List the admission details(Doctor,Hospital,Room number) of a specific patient by Name.
select p.Name,a.Doctor,a.Hospital,a.RoomNumber from admissions  a
join patients p on a.Patient_Id=p.Patient_Id
 where  p.Name="Bobby JacksOn";

-- 3.Find the Insurance provider and Billing amount for all patients admitted to a specific hospital. 
select p.Name,a.Hospital, b.InsuranceProvider,b.BillingAmount  from billing  b
 join admissions a on b.Patient_Id = a.Patient_Id
 join patients p on b.Patient_Id=p.Patient_Id
 where  a.Hospital="Sons and Miller";
 
-- 4.Calculate the Total billing amount for a specific patient using their Name.
select p.Name, SUM(b.BillingAmount) as Total_bill from billing  b
  join patients p on b.Patient_Id=p.Patient_Id
  where p.Name="Bobby JacksOn";
  
-- 5.Find the details of patients with cancer,aged 30-50 along with their doctor and billing information.
select p.Name,p.Gender,p.Age,a.Doctor,p.MedicalCondition,b.InsuranceProvider,b.BillingAmount from  patients p
 join admissions a on p.Patient_Id=a.Patient_Id
 join billing b on p.Patient_Id=b.Patient_Id
  where p.MedicalCondition="Cancer"  and p.age>30 and p.age<50;
  

-- 6.Retrieve the latest 5 admissons with their patient details. 
select p.Patient_Id,p.Name,a.Hospital,a.DateofAdmission from admissions a
join patients p on a.Patient_Id=p.Patient_Id
order by str_to_date(a.DateofAdmission,"%d-%m-%y" )desc limit 5;

-- 7.Find all patients whose billing amount exceeds 50,000
select p.Name,b.BillingAmount from billing b
join patients p on b.Patient_Id=p.Patient_Id
where b.BillingAmount>50000;
  
-- 8.Get a list of all hospitals with the number of admissions.  
select a.Hospital,count(*) as COUNT from admissions a
group by a.Hospital;

-- 9.Display all doctor who have treated more then 1 patients.
select  a.Doctor ,count(distinct a.Patient_Id) as patients from  admissions a
group by a.Doctor
having count(distinct a.Patient_Id)>1;

 -- 10.Identify the patients who stayed for more than 10 days in the hospitals.
 select p.Name,a.DateofAdmission,a.Discharge_Date ,datediff (str_to_date(a.Discharge_Date,"%d-%m-%y"),str_to_date(a.DateofAdmission,"%d-%m-%y")) Daystayed from admissions a
 join patients p on a.Patient_Id=p.Patient_Id
 where datediff (str_to_date(a.Discharge_Date,"%d-%m-%y"),str_to_date(a.DateofAdmission,"%d-%m-%y"))>10;
 
 -- 11.Find the average billing amount for each hospitals.
select a.Hospital,avg(b.BillingAmount)as Avg_Billamount from billing b
join admissions a on b.Patient_Id=a.Patient_Id
group by a.Hospital;

-- 12.List patients who were age above 20 and less then 50 and medicalcondition "Diabetes"
select Name,Age,Gender,MedicalCondition from patients 
where Age>20 and Age<50
and MedicalCondition="Diabetes";


-- 13.Find all patients admitted under the "Emergency" type.
select p.Name,a.Hospital,a.DateofAdmission from admissions a
join patients p on a.Patient_Id=p.Patient_Id
where a.AdmissionType ="Emergency";


-- 14.Retrieve patient details whose test results are marked as inconclusive.
select p.Name,p.Age,p.Gender,p.MedicalCondition,m.TestResults from medicalrecords m
join patients p on m.Patient_Id=p.Patient_Id
where m.TestResults="Inconclusive";

-- 15.Show the total number of patients by blood type.
select BloodType,count(Patient_Id)as total  from patients 
group by BloodType;



0	80	14:20:35	select BloodType,count(Patient_Id)as total ,p.Gender from patients p
 group by BloodType
 LIMIT 0, 50000	Error Code: 1055. Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'healthcare.p.Gender' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.016 sec

 
 


   