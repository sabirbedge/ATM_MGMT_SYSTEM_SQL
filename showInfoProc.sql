create or replace procedure showInfoProc(cid int)
as 
row acc%rowtype;
begin
select * into row from acc where id=cid;
dbms_output.put_line('ID-'||row.id);
dbms_output.put_line('Name-'||row.nm);
dbms_output.put_line('Mobile-'||row.mob);
dbms_output.put_line('ACC_NO-'||row.accno);
dbms_output.put_line('ACC_TYPE-'||row.acctype);
dbms_output.put_line('BALANCE-'||row.bal);
end;
/
