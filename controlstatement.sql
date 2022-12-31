set serveroutput on;

declare
num1 number:= 10;
num2 number:=5;
begin 
if num1> num2 then
dbms_output.put_line('i am if block');
end if;
dbms_output.put_line('i am outside if block');
end;
/

declare
num1 number:= 10;
num2 number:=5;
begin 
if num1< num2 then
dbms_output.put_line('i am if block');
else
dbms_output.put_line('i am outside if block');
end if;
end;
/



