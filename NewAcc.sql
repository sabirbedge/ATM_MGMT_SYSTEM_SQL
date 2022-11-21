declare
customer_name varchar(10);
contact_number varchar(10);
account_number varchar(15);
account_type varchar(10);
balance number;
cid int;
begin
customer_name:=&customer_name ;
contact_number:=&contact_number;
account_number:=&account_number;
account_type:=&account_type;
balance:=&balance;
insert into acc values(idseq.nextval,customer_name,contact_number,account_number,account_type,balance);
select max(id) into cid from acc;
showInfoProc(cid);
end;
/