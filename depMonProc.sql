create or replace procedure depMonProc(cid int,amt int)
as 

begin
update acc
set bal=bal+amt
where id=cid;
dbms_output.put_line('AMOUNT CREDITED');

end;
/
