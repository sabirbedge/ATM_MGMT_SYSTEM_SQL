declare
account_number acc.accno%type;
cid acc.id%type;
balance acc.bal%type;
deposited_amount int;
begin
account_number:=&account_number;
select id into cid from acc where accno=account_number;
if cid>0 then
deposited_amount:=&deposited_amount ;
depMonProc(cid,deposited_amount);
end if;

exception
when NO_DATA_FOUND then
dbms_output.put_line('INVALID ACCOUNT NUMBER ');
end;
/