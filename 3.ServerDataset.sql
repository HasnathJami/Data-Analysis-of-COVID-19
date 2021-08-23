create or replace trigger trigforinsert1
after insert 
on Country
for each row
declare
begin
    
	dbms_output.put_line('Row Inserted on Country Table Sucessfully');
end;
/

create or replace trigger trigforinsert2
after insert 
on Cases
for each row
declare
begin
    
	dbms_output.put_line('Row Inserted on Cases Table Sucessfully');
end;
/

create or replace trigger trigforinsert3
after insert 
on Tests
for each row
declare
begin
    
	dbms_output.put_line('Row Inserted on Tests Table Sucessfully');
end;
/

create or replace trigger trigforinsert4
after insert 
on Gender
for each row
declare
begin
    
	dbms_output.put_line('Row Inserted on Gender Table Sucessfully');
end;
/

create or replace trigger trigforinsert5
after insert 
on Decision
for each row
declare
begin
    
	dbms_output.put_line('Row Inserted on Decision Table Sucessfully');
end;
/


create or replace trigger trigforinsert6
after insert 
on Predict1
for each row
declare
begin
    
	dbms_output.put_line('Row Inserted on Predict1 Table Sucessfully');
end;
/




insert into Country values(1,'Bangladesh',165859290,'Asia');
insert into Country values(2,'USA',332389130,'America');
insert into Country values(3,'India',1389679065,'Asia');
insert into Country values(7,'Saudi Arabia',13896,'Asia');



insert into Cases values(1,566838,39355,8642,518841);
insert into Cases values(2,30425787,7261358,554104,22610325);
insert into Cases values(3,11554895,290152,159594,11105149);
insert into Cases values(7,115548,2901,159,11100);




insert into Tests values(1,4349615,8,38,13,87);
insert into Tests values(2,25001235,12,33,31,69);
insert into Tests values(3,26547865,16,42,38,62);
insert into Tests values(7,115508,12,15,31,58);




insert into Gender values(1,312120,212325,5641,3112);
insert into Gender values(2,21232547,12355458,321456,213214);
insert into Gender values(3,6231456,4932149,89632,60123);
insert into Gender values(7,62314,493214,8963,6012);





insert into Decision values(1,1.53,1.48,'Community Transmission');
insert into Decision values(2,1.82,1.80,'Community Transmission');
insert into Decision values(3,1.38,1.35,'Clusters of Cases');
insert into Decision values(7,1.02,1.13,'Sporadic Cases');


insert into Predict1 values(1,'GOOD');
insert into Predict1 values(2,'BAD');
insert into Predict1 values(3,'BAD');
insert into Predict1 values(4,'GOOD');
insert into Predict1 values(5,'BAD');
insert into Predict1 values(6,'BAD');
insert into Predict1 values(7,'GOOD');

commit;