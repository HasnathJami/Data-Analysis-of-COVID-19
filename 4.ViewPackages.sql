
create or replace view CountryWise as
select * from Country 
join Cases on cnId=csId
join Tests on csId=testId
join Gender on csId=gnId
join Decision on csId=dnId
UNION
select * from Country@site1 
join Cases@site1 on cnId=csId
join Tests@site1 on csId=testId
join Gender@site1 on csId=gnId
join Decision@site1 on csId=dnId;



create or replace view ContinentWise as
select * from Country
join Cases on cnId=csId
UNION
select * from Country@site1
join Cases@site1 on cnId=csId;




create or replace view MaleFemaleWise as
select * from Gender
join Cases on gnId=csId
UNION
select * from Gender@site1
join Cases@site1 on gnId=csId;



create or replace view TransmissionWise as
select * from Decision
UNION
select * from Decision@site1;



create or replace view PopulationWise as
select * from Country join Tests on cnId=testId
UNION
select * from Country@site1 join Tests@site1 on cnId=testId;


create or replace view SingleCountryWise as
select * from Country 
join Cases on cnId=csId
join Tests on csId=testId
join Gender on csId=gnId
join Decision on csId=dnId
UNION
select * from Country@site1 
join Cases@site1 on cnId=csId
join Tests@site1 on csId=testId
join Gender@site1 on csId=gnId
join Decision@site1 on csId=dnId;


 create or replace view Predict as
 select transmissionRate,Temparature,Condition from Predict1
 join Predict2@site1
 on pd1Id=pd2Id;
 
 
 commit;