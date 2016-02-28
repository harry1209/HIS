insert into Member_Information(MemberID,MemberName)
values('1001','make')

select * from Record_Information join Member_Information on Record_Information.MemberID=Member_Information.MemberID and Member_Information.MemberID='1002'

select distinct * from Bill_Information join Member_Information on Bill_Information.MemberID=Member_Information.MemberID

select RecordID from Record_Information where MemberID='1001'


select * from Department_Information where DepartmentName='it'
 

insert into Billdetail_Information(BillID,BillItemID,BillItemName,BillItemType,BillItemPrice,BillItemQuantity) 

select * from Visitation_Information where Visitation='2014/11/24 20:20:06'

values('300111','M1001','MM1','Medicine','10','2')

update Medicine_Information set MedicineID='M1002',MedicineName='MM2',MedicinePrice='11',MedicineType='Medicine',MedicineInfo='goodgood' 
where MedicineID='M1002' and MedicineName='MM2'

select * from Visitation_Information join Member_Information on Visitation_Information.MemberID=Member_Information.MemberID 
where RecordID='30011'

select * from Member_Information where MemberDepartment='NULL'

 select * from Record_Information join Member_Information on Record_Information.DoctorID=Member_Information.MemberID where Member_Information.MemberDepartment='Patient'



select * from Record_Information join Member_Information on Record_Information.PatientID=Member_Information.MemberID join Authorization_Information on 
where Record_Information.DoctorID='D1002' and Member_Information.MemberDepartment='Patient'

select * from  Record_Information

select * from Authorization_Information where AuthorizationID='D1003'

select * from Bill_Information

select * from Record_Information

select * from Authorization_Information join Record_Information on Record_Information.DoctorID=Authorization_Information.DoctorID  
where Authorization_Information.AuthorizationID='D1003' and Authorization_Information.PatientID='P1001'


update Authorization_Information set AuthorizationID='D1003' where RecordID='987' and PatientID='P1001' and DoctorID='D1001' and AuthorizationID='D1002'

select * from Authorization_Information where DoctorID='D1001' and DoctorID!=AuthorizationID


delete Record_Information where RecordID='798' and DoctorID='D1001' and PatientID='P1003'



select * from Record_Information join Authorization_Information on Record_Information.RecordID=Authorization_Information.RecordID and Record_Information.PatientID=Authorization_Information.PatientID join Member_Information on Record_Information.DoctorID=Member_Information.MemberID 
where Authorization_Information.AuthorizationID='D1002'

select distinct(PatientID) from Record_Information join Member_Information on Record_Information.PatientID=Member_Information.MemberID 
where Record_Information.DoctorID='D1002' and Member_Information.MemberDepartment='Patient'


