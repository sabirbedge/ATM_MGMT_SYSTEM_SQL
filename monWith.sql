declare
INSUFF_BAL exception;
pragma
 exception_init(INSUFF_BAL,-45);
account_number acc.accno%type;
cid acc.id%type;
balance acc.bal%type;
acc_type acc.acctype%type;
withdraw_amount int;
begin
account_number:=&account_number;
select id into cid from acc where accno=account_number;
select acctype into acc_type from acc where accno=account_number;
select bal into balance from acc where accno=account_number;
if cid>0 then
withdraw_amount:=&withdraw_amount ;
	if acc_type='current' then 
		if balance<withdraw_amount then
			raise INSUFF_BAL;
		else
			if withdraw_amount<='10000' then
				withMonProc(cid,withdraw_amount);
			else
				raise INSUFF_BAL;
			end if;
		end if;
	end if;
	
	if acc_type='saving' then
		if balance<withdraw_amount then
			raise INSUFF_BAL;
		else
			if withdraw_amount>='10000' and withdraw_amount<='40000' then
				withMonProc(cid,withdraw_amount);
			else
				raise INSUFF_BAL;
			end if;
		end if;
		
	end if;
commit;
end if;

exception
when INSUFF_BAL then
	dbms_output.put_line('INSUFFITIENT BALANCE');
when NO_DATA_FOUND then
	dbms_output.put_line('INVALID ACCOUNT NUMBER ');
end;
/