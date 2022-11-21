declare
account_number varchar(15);
cid int;
begin
account_number:=&account_number;
select id into cid from acc where accno=account_number;
showInfoProc(cid);

exception 
when NO_DATA_FOUND then
dbms_output.put_line('INVALID ACCOUNT NUMBER');
end;
/
