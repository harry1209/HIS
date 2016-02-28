--添加Member信息时自动添加到Login_Information
create trigger insert_member_to_loginInfo
on Member_Information after insert 
as
begin
declare @id varchar(30), @dpt varchar(100)
select @id=MemberID, @dpt=MemberDepartment from inserted
insert into Login_Information values(@id,@id,@dpt)
end;

--删除Member信息时自动删除Login_Information中的
create trigger delete_member_from_login
on Member_Information after delete 
as
begin
declare @id varchar(30)
select @id=MemberID from deleted
delete  Login_Information where MemberID=@id
end;

--删除Member信息时自动删除Record_Information中的
create trigger delete_member_from_record
on Member_Information after delete 
as
begin
declare @id varchar(30)
select @id=MemberID from deleted
delete  Record_Information where PatientID=@id
end;

--删除Record信息时自动删除Bill_Information中的
create trigger delete_record_from_bill
on Record_Information after delete 
as
begin
declare @id varchar(30)
select @id=RecordID from deleted
delete Bill_Information where RecordID=@id
end;

--删除Bill信息时自动删除Billdetail_Information中的
create trigger delete_bill_from_billdetail
on Bill_Information after delete 
as
begin
declare @id varchar(30)
select @id=BillID from deleted
delete Billdetail_Information where BillID=@id
end;

--添加Record信息时自动添加到Authorization_Information
create trigger insert_record_to_authorization
on Record_Information after insert 
as
begin
declare @pid varchar(30), @rid varchar(30),@did varchar(30)
select @pid=PatientID, @rid=RecordID, @did=DoctorID from inserted
insert into Authorization_Information values(@did,@pid,@rid,@did)
end;

--删除Record信息时自动删除Authorization_Information中的
create trigger delete_record_from_authorization
on Record_Information after delete 
as
begin
declare @did varchar(30),@pid varchar(30),@rid varchar(30)
select @did=DoctorID, @pid=PatientID, @rid=RecordID from deleted
delete Authorization_Information where DoctorID=@did and RecordID=@rid and PatientID=@pid
end;