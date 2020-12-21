create table  majorward
(
Major varchar2(20) not null,
Wardcode varchar2(15),
constraint pk_majorward primary key (Major)
)
;

create table doctor
(
Medical_number varchar2(10) not null, 
doctor_name varchar2(10),
doctor_date date,
Gender varchar2(7),
age varchar2(4),
Major varchar2(20),
salary int,
constraint pk_doctor primary key (Medical_number),
constraint fk1_doctor foreign key(Major) references majorward(Major)
)
;

create table Patient
(
registration_number varchar2(15) not null,
Patient_name varchar2(10),
Gender varchar2(7),
age varchar2(4),
Address varchar2(30),
HP varchar2(15),
constraint pk_Patient primary key (registration_number)
)
;

create table Area_in_charge
(
Inspection_equipment varchar2(15) not null,
Inspection_part varchar2(15),
constraint pk_Area_in_charge primary key(Inspection_equipment)
)
;


create table ward
(
wardcode varchar2(10) not null,
wardname varchar2(15),
doctor_responsibility varchar2(10),
constraint pk_ward primary key (wardcode),
constraint fk1_ward foreign key(doctor_responsibility) references doctor(Medical_number)
)
;


create table patient_doctor
(
patient_number varchar2(15) not null, 
Medical_number varchar2(10),
constraint pk_patient_doctor primary key (patient_number),
constraint fk1_patient_doctor foreign key(patient_number) references Patient(registration_number),
constraint fk2_patient_doctor foreign key(Medical_number) references doctor(Medical_number)
)
;



create table Hospitalization
(
patient_number varchar2(15) not null,
wardcode varchar2(5) not null,
Hospitalization_date date not null,
constraint pk_Hospitalization primary key(patient_number, wardcode, Hospitalization_date),
constraint fk1_Hospitalization foreign key(patient_number) references Patient(registration_number),
constraint fk2_Hospitalization foreign key(wardcode) references ward(wardcode)
)
;

create table Interview
(
patient_number varchar2(15) not null,
Interview_date date,
constraint pk_Interview primary key(patient_number,Interview_date),
constraint fk1_Interview foreign key(patient_number) references Patient(registration_number)
)
;

create table operation
(
patient_number varchar2(15) not null,
Medical_number varchar2(10),
operation_date date,
operation_Area varchar2(20),
constraint pk_operation primary key(patient_number),
constraint fk1_operation foreign key(Medical_number) references doctor(Medical_number)
)
;

create table Interview_Reservation
(
Reservation_number varchar2(10) not null, 
Reservation_one_date date,
Reservation_date date,
patient_number varchar2(15),
Medical_number varchar2(10),
constraint pk_Interview_Reservation primary key(Reservation_number),
constraint fk1_Interview_Reservation foreign key(patient_number) references Patient(registration_number),
constraint fk2_Interview_Reservation foreign key(Medical_number) references doctor(Medical_number)
)
;

create table Inspection_Schedule
(
Schedule_number varchar2(10) not null,
Inspection_equipment varchar2(15),
Inspection_date date,
Inspection_time varchar2(10),
constraint pk_Inspection_Schedule primary key(Schedule_number),
constraint fk1_Inspection_Schedule foreign key(Inspection_equipment) references Area_in_charge(Inspection_equipment)
)
;

create table Inspection_Reservation
(
Inspection_number_Re varchar2(15) not null,
registration_number varchar2(15),
Schedule_number varchar2(10),
constraint pk_Inspection_Reservation primary key(Inspection_number_Re),
constraint fk1_Inspection_Reservation foreign key(registration_number) references Patient(registration_number),
constraint fk2_Inspection_Reservation foreign key(Schedule_number) references Inspection_Schedule(Schedule_number)
)
;


create table Diagnostic_prescription
(
prescription_number varchar2(10) not null,
Diagnostic_date date,
Diagnostic_content varchar2(20),
Inspection_number_Re varchar2(10),
constraint pk_Diagnostic_prescription primary key(prescription_number),
constraint fk1_Diagnostic_prescription foreign key(Inspection_number_Re) references Inspection_Reservation(Inspection_number_Re)
)
;


create table Nurse
(
Nurse_number varchar2(10) not null,
Nurse_name varchar2(10),
age varchar2(4),
salary int,
Medical_number varchar2(15),
constraint pk_Nurse primary key(Nurse_number),
constraint fk1_Nurse foreign key(Medical_number) references doctor(Medical_number)
)
;

create table Inspection_schedule_ticket
(
Schedule_number varchar2(10) not null,
Inspection_number_Re varchar2(10) not null,
Issuer_name varchar2(10),
Issuer_date date,
constraint pk_Inspection_schedule_ticket primary key(Schedule_number, Inspection_number_Re),
constraint fk1_Inspection_schedule_ticket foreign key(Schedule_number) references Inspection_Schedule(Schedule_number)
)
;


