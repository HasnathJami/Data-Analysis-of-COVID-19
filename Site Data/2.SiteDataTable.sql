clear screen;

drop table Country cascade constraints;
drop table Cases cascade constraints;
drop table Tests cascade constraint;
drop table Gender cascade constraints;
drop table Decision cascade constraint;
drop table Predict2 cascade constraint;

create table Country(
cnId integer,
cnName varchar(20),
population number,
continent varchar(20),
PRIMARY KEY(cnId)
);

create table Cases(
csId integer,
totalCases number,
activeCases number,
death number,
recovered number,
FOREIGN KEY(csId) REFERENCES Country(cnId)
);

create table Tests(
testId integer,
totalTests integer,
testPerCase integer,
testPerPopulation integer,
covidPositivePer integer,
covidNegativePer integer,
FOREIGN KEY(testId) REFERENCES Country(cnId)
);



create table Gender(
gnId integer,
totalCaseMale integer,
totalCaseFemale integer,
totalDeathsMale integer,
totalDeathsFemale integer,
FOREIGN KEY(gnId) REFERENCES Country(cnId)
);


create table Decision(
dnId integer,
caseFatalityRate float,
infectionFatalityRate float,
transmission varchar(50),
FOREIGN KEY(dnId) REFERENCES Country(cnId)
);

create table Predict2(
pd2id integer,
transmissionRate varchar(30),
Temparature varchar(30)
);

commit;