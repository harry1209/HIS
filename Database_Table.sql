create database db_hospital COLLATE  Chinese_PRC_CS_AS

create table Login_Information
(
	MemberID varchar(50) primary key,
	MemberPassword varchar(50),
	IdentityInfo varchar(50),
)

create table Member_Information
(
	MemberID varchar(50) primary key,
	MemberName varchar(50),
	MemberGender varchar(50),
	MemberAge int,
	MemberDepartment varchar(100),
	MemberEmail varchar(100),
	MemberTel varchar(50),
	MemberAddress varchar(200),
	MemberComment varchar(100),
	MemberInfo varchar(100),
)

create table Department_Information
(
	DepartmentName varchar(100) primary key,
)


create table Record_Information
(
	DoctorID varchar(100),
	PatientID varchar(100),
	RecordID varchar(100),
	RecordContent varchar(8000),
	primary key(DoctorID,RecordID,PatientID),
)

create table Bill_Information
(
	DoctorID varchar(100),
	PatientID varchar(100),
	RecordID varchar(100),
	BillID varchar(100),
	BillPrice int,
	primary key(DoctorID,PatientID,RecordID,BillID),
)

create table Billdetail_Information
(
	RecordID varchar(100),
	BillID varchar(100),
	BillItemID varchar(100),
	BillItemName varchar(100),
	BillItemType varchar(100),
	BillItemPrice int,
	BillItemQuantity int,
	primary key(BillID,BillItemID),
)

create table Visitation_Information
(
	RecordID varchar(100),
	BillID varchar(100),
	MemberID varchar(100),
	Working varchar(100),
	Location varchar(100),
	Visitation varchar(500),
)

create table Medicine_Information
(
	MedicineID varchar(100),
	MedicineName varchar(100),
	MedicineType varchar(100),
	MedicinePrice int,
	MedicineInfo varchar(8000),
	primary key(MedicineID,MedicineName),
)

create table Medicinetype_Information
(
	MedicinetypeName varchar(100),
)

create table Authorization_Information
(
	DoctorID varchar(100),
	PatientID varchar(100),
	RecordID varchar(100),
	AuthorizationID varchar(100),
	primary key(DoctorID,PatientID,RecordID,AuthorizationID),
)

create table Appointment_Information
(
	DoctorID varchar(100),
	PatientID varchar(100),
	SubmitTime varchar(100),
	AppointmentInfo varchar(8000),
	Info int,
	primary key(DoctorID,PatientID,SubmitTime),
)