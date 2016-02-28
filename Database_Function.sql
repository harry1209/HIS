--���Member��Ϣʱ�Զ���ӵ�Login_Information
create trigger insert_member_to_loginInfo
on Member_Information after insert 
as
begin
declare @id varchar(30), @dpt varchar(100)
select @id=MemberID, @dpt=MemberDepartment from inserted
insert into Login_Information values(@id,@id,@dpt)
end;

--ɾ��Member��Ϣʱ�Զ�ɾ��Login_Information�е�
create trigger delete_member_from_login
on Member_Information after delete 
as
begin
declare @id varchar(30)
select @id=MemberID from deleted
delete  Login_Information where MemberID=@id
end;

--ɾ��Member��Ϣʱ�Զ�ɾ��Record_Information�е�
create trigger delete_member_from_record
on Member_Information after delete 
as
begin
declare @id varchar(30)
select @id=MemberID from deleted
delete  Record_Information where PatientID=@id
end;

--ɾ��Record��Ϣʱ�Զ�ɾ��Bill_Information�е�
create trigger delete_record_from_bill
on Record_Information after delete 
as
begin
declare @id varchar(30)
select @id=RecordID from deleted
delete Bill_Information where RecordID=@id
end;

--ɾ��Bill��Ϣʱ�Զ�ɾ��Billdetail_Information�е�
create trigger delete_bill_from_billdetail
on Bill_Information after delete 
as
begin
declare @id varchar(30)
select @id=BillID from deleted
delete Billdetail_Information where BillID=@id
end;

--���Record��Ϣʱ�Զ���ӵ�Authorization_Information
create trigger insert_record_to_authorization
on Record_Information after insert 
as
begin
declare @pid varchar(30), @rid varchar(30),@did varchar(30)
select @pid=PatientID, @rid=RecordID, @did=DoctorID from inserted
insert into Authorization_Information values(@did,@pid,@rid,@did)
end;

--ɾ��Record��Ϣʱ�Զ�ɾ��Authorization_Information�е�
create trigger delete_record_from_authorization
on Record_Information after delete 
as
begin
declare @did varchar(30),@pid varchar(30),@rid varchar(30)
select @did=DoctorID, @pid=PatientID, @rid=RecordID from deleted
delete Authorization_Information where DoctorID=@did and RecordID=@rid and PatientID=@pid
end;