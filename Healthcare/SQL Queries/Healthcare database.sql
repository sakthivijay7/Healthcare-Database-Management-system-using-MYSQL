-- create database Healthcare;
 -- Table creation Patients:
use Healthcare;
create table Patients(
 Patient_Id int auto_increment primary key,
 Name varchar(20),
 Age int,
 Gender varchar(6),
 BloodType varchar(3),
 MedicalCondition varchar(15));
 select * from healthcare.Patients;
 
  -- Table creation Admissions:
use Healthcare;
create table Admissions(
 Patient_Id int auto_increment primary key not null,
 DateofAdmission varchar(10) ,
 Doctor varchar(20) ,
 Hospital varchar(30),
 RoomNumber int,
 AdmissionType varchar(10),
 Discharge_Date varchar(10),
 foreign key(Patient_Id) references Patients (Patient_Id));
 alter table Admissions modify column DateofAdmission date;
 select * from healthcare.admissions;
 
   -- Table creation Billing:
 use Healthcare;
 create table Billing(
  Patient_Id int auto_increment primary key,
  InsuranceProvider varchar(20),
  BillingAmount decimal(10,2),
  foreign key (Patient_Id) references Patients (Patient_Id));
select * from Billing; 

 -- Table creation MedicalRecords:
use Healthcare;
create table MedicalRecords(
Patient_Id int auto_increment primary key not null,
Medication varchar(15),
TestResults varchar(15),
foreign key (Patient_Id) references Patients (Patient_Id));
   

  
  