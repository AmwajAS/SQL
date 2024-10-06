drop database if exists TestCorona;
create database TestCorona;
use TestCorona;

create table city
(
cityNum smallint primary key, check(cityNum > 0),
cityName varchar (20) not null unique  
);


create table Disease
(
diseaseNum int identity(1,1) primary key,
diseaseName nvarchar(20) not null unique
)

create table Resident
(
residentID char(9) check(residentID like replicate('[0-9]',9)) primary key,
residentFirstName nvarchar(20) check(len(residentFirstName) >= 2) not null,
residentSurName nvarchar(20) check(len(residentSurName) >= 2) not null,
residentBirthDate date check(residentBirthDate <= getdate()) not null,
contactPhone1 char(10) check(contactPhone1 like '05'+replicate('[0-9]',8)) not null,
contactPhone2 char(10) check(contactPhone2 like '0'+replicate('[0-9]',8)
or contactPhone2 like '05'+replicate('[0-9]',8)),

check(contactPhone1 <> contactPhone2),
password nvarchar(20) check((password like '%[0-9]%[A-Za-z]%' or password like '%[A-Za-z]%[0-9]%') and

len(password)>=6) not null,
citynum smallint references City(cityNum) not null
)

create table Hospital
(
HospitalName nvarchar(40) primary key,
cityNum smallint references City(cityNum)
)

create table ResidentDiseases
(
diseaseNum int references Disease(diseaseNum),
residentID char(9) references Resident(residentID),
discoverYear smallint check(discoverYear between year(getdate()) - 120 and year(getdate())) not null,
severityLevel tinyint check(severityLevel between 1 and 5) not null,
primary key(diseaseNum,residentID)
)

create table SickResident
(
residentID char(9) references Resident(residentID) primary key,
status char(1) check(status in('R','S','D')) not null,
hospitalizedIn nvarchar(40) references Hospital(HospitalName) on update cascade
)


create table SickResidentTracking
(
residentID char(9) references SickResident(residentID) on delete cascade,
trackDateTime datetime check(trackDateTime <= getdate()),
result tinyint check(result <= 100) not null,
primary key(residentID,trackDateTime)
)

create table SickResidentVisits
(
residentID char(9) references SickResident(residentID) on delete cascade,

visitStartDateTime datetime check(visitStartDateTime >= '2019/12/31'),
visitEndDateTime datetime check(visitEndDateTime <= getdate()) not null,
primary key(residentID,visitStartDateTime),
check(visitStartDateTime <= visitEndDateTime)
)

create table Business
(
businessNum char(5) check(businessNum like '51'+replicate('[0-9]',3)) primary key,
businessName nvarchar(40) not null,
businessType char(1) check(businessType in ('G','P')) not null,
cityNum smallint references City(cityNum),
street nvarchar(20) not null,
houseNum nvarchar(5) not null
)
create table SickResidentVisitsInBusiness
(
residentID char(9),
visitStartDateTime datetime,
businessNum char(5) references Business(businessNum),
foreign key(residentID,visitStartDateTime) references SickResidentVisits(residentID,visitStartDateTime),
primary key(residentID,visitStartDateTime,businessNum)
)
create table ResidentInInsulation
(
residentID char(9) references Resident(residentID) primary key
)
create table InsulationOfAResident
(
residentID char(9) references ResidentInInsulation(residentID) on delete cascade,
StartDateTime datetime check(StartDateTime >= '2019/12/31'),
EndDateTime datetime,
result tinyint check(result <= 100),
check(datediff(day,StartDateTime,EndDateTime) >= 14),
primary key(residentID,StartDateTime)
)
create table Meet
(
sickResidentID char(9),
visitStartDateTime datetime,
businessNum char(5),
residentID char(9) references Resident(residentID),
foreign key(sickResidentID,visitStartDateTime,businessNum) references SickResidentVisitsInBusiness
(residentID,visitStartDateTime,businessNum),
primary key(sickResidentID,visitStartDateTime,businessNum,residentID)
)
create table Near
(
businessNum1 char(5) references Business(businessNum),
businessNum2 char(5) references Business(businessNum),
distance float check(distance > 0) not null,
primary key(businessNum1,businessNum2),
check(businessNum1<>businessNum2)
)


alter table Resident
add gender char(1) check(gender in('M','F','O'));

update Resident
set gender = 'F'
where residentID = '522681101';

update Resident
set gender = 'F'
where residentID = '526328174';


SELECT *
FROM Resident