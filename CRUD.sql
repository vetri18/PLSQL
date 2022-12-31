SELECT * FROM customertable

insert into customertable values('praveen','male','ap');

create or replace procedure x_customer(
p_name  in customertable.NAME%type,
p_gen  in customertable.GENDER%type,
p_address  in customertable.ADDRESS%type
)
is
begin
insert into customertable (NAME,GENDER,ADDRESS)values(p_name,p_gen,p_address);
commit;
end;

create or replace procedure x_Deletecust(
p_name  in customertable.NAME%type
)
is
begin
delete from  customertable where NAME=p_name;
commit;
end;

exec x_Deletecust('praveen')

select * from customertable
