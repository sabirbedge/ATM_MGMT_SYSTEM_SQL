declare
account_number acc.accno%type;
cid acc.id%type;
balance acc.bal%type;
begin
account_number:=&account_number;
select id into cid from acc where accno=account_number;
if cid>0 then
select bal into balance from acc where accno=account_number;
dbms_output.put_line('AVAILABLE BALANCE-'||balance);
end if;

exception
when NO_DATA_FOUND then
dbms_output.put_line('INVALID ACCOUNT NUMBER ');
end;
/