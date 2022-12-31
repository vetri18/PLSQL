create table MyBankTable ( Name varchar(25) , AccNo varchar (30),Address varchar(30) , PinCode varchar(20) ,Branch varchar(20) ,ifsccode varchar(20) )

---------------------
select * from mybanktable
-----------------
insert into MyBankTable values ('vetrivelan','123456','anbunagar','635109','hosur','654321');
insert into MyBankTable values ('praveen','123456','anbunagar','635109','andra','654321');
insert into MyBankTable values ('navya','123456','anbunagar','635109','hosur','654321');
insert into MyBankTable values ('rithunsakthi','123456','anbunagar','635109','hosur','654321');
insert into MyBankTable values ('karthikeyan','123456','anbunagar','635109','hosur','654321');
insert into MyBankTable values ('lavanya','123456','anbunagar','635109','hosur','654321');
insert into MyBankTable values ('palanivelu','123456','anbunagar','635109','hosur','654321');
insert into MyBankTable values ('gomathi','123456','anbunagar','635109','hosur','654321');
insert into MyBankTable values ('pradeep','123456','anbunagar','635109','hosur','654321');
insert into MyBankTable values ('madhuri','123456','anbunagar','635109','hosur','654321');
insert into MyBankTable values ('kala','123456','anbunagar','635109','hosur','654321');

-----------------------------
create or replace procedure InsertBanker(
P_Name in MyBankTable.NAME%type,
P_AccNo in MyBankTable.ACCNO%type,
P_Address in MyBankTable.ADDRESS%type,
P_PinCode in MyBankTable.PINCODE%type,
P_Branch in MyBankTable.BRANCH%type,
P_ifsccode in MyBankTable.IFSCCODE%type,
)
is
begin
insert into MyBankTable(NAME ,ACCNO ,ADDRESS ,PINCODE ,BRANCH ,IFSCCODE) values (P_Name,P_AccNo, P_Address , P_PinCode, P_Branch , P_ifsccode);
commit;
end;
/
-------------------------

set serveroutput on;
declare
P_Name MyBankTable.Name%type;
cursor c_list is
select Name from MyBankTable;
begin 
open c_list;

fetch c_list into P_Name;
dbms_output.put_line(c_list%ROWCOUNT||'-'||P_Name);
fetch c_list into P_Name;
dbms_output.put_line(c_list%ROWCOUNT||'-'||P_Name);
fetch c_list into P_Name;
dbms_output.put_line(c_list%ROWCOUNT||'-'||P_Name);
fetch c_list into P_Name;
dbms_output.put_line(c_list%ROWCOUNT||'-'||P_Name);
fetch c_list into P_Name;
dbms_output.put_line(c_list%ROWCOUNT||'-'||P_Name);
fetch c_list into P_Name;
dbms_output.put_line(c_list%ROWCOUNT||'-'||P_Name);

close c_list;
end;
/

------------------
cursor with loop

set serveroutput on;
declare
P_Name MyBankTable.Name%type;

cursor c_list is 
select Name from MyBankTable;
begin
open d_list;
loop
fetch c_list into P_Name;
dbms_output.put_line(c_list%ROWCOUNT||'-'||P_Name);

exit when c_list%NOTFOUND;
end loop;
close c_list;
end;
/
-----------------
roll back with save point 
invepoint sav1;
update MyBankTable set Branch=Branch+HSR;
rollback to sav1;
update MyBankTable set Branch=Branch+krishnagiri where Name=palanivelu;
commit;
-----------------
loop


set serveroutput on;
declare
x number:=0;
begin
loop
dbms_output.put_line('inside loop: x'|| to_char(x));
x:=x+1;
if x>3 then
exit;
end if;
end loop;
dbms_output.put_line('outside loop:x'||to_char(x));
end;
/

---------------
2)loop with exit when :


set serveroutput on;
declare
x number:=0;
begin
loop
dbms_output.put_line('inside loop:x'||to_char(x));
x:= x+1;
exit when x>3;
end loop;
dbms_output.put_line('outside loop:x'||to_char(x));
end;
/
---------------
3)for loop:

set serveroutput on;
begin
for i in 1..5 loop
dbms_output.put_line('inside loop:i'||to_char(i));
end loop;
end;
/
--------------
for loop with stepclause :

set serveroutput on;
declare
i number :=10;
begin
for i in 1..6 loop
dbms_output_put_line('local: '||to_char(i) ||','global:' ||to_char(main.i));
end loop;
end;
/
----------------
set serveroutput on;

declare
a number:=10;
begin
while a<20 loop
dbms_output.put_line('value of a: '|| a);

a:a+1;
end loop;
end;
/

---------------------------------------------------------------------
create or replace function TotalCount
return number is
total number:=0;
beign
select count(*) into total from customers;
return total;
end;
/

declare
c number;
begin
c:=TotalCount();
dbms_output.put_line ('total number of customers is '|| c);
end;
/
-----------------------------------------------------------------------------
declare
begin
insert into MyBankTable(Name ,AccNo ,Address ,PinCode ,Branch ,ifsccode) values (priyanshu,987654321, hosur , 635109, avalapalli , 123456);
if(SQL%Found) then
dbms_output.put_line('True');
else
dbms_output.put_line('False');
end if;
end;
/
select * from MyBankTable