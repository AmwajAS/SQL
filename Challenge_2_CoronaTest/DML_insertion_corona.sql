
USE TestCorona


insert into City(cityNum, cityName) values(1,'Haifa');
insert into City(cityNum,cityName) values(2,'tel aviv');
insert into City(cityNum,cityName) values(3,'Jerusalem');
insert into City(cityNum,cityName) values(4,'Herzilya');
insert into City(cityNum,cityName) values(5,'Netanya');
insert into City(cityNum,cityName) values(6,'Nahariya');

------------------------------------------------------------------------------------------------


insert into Disease (diseaseName) values('Covid-19');
insert into Disease (diseaseName) values('Malaria');
insert into Disease (diseaseName) values('Influenza');
insert into Disease (diseaseName) values('HIV');
insert into Disease (diseaseName) values('Pneumonia');
insert into Disease (diseaseName) values('Diarrhea');
insert into Disease (diseaseName) values('Ebola');
insert into Disease (diseaseName) values('MERS');
insert into Disease (diseaseName) values('SARS');



insert into Hospital values ('Assuta Medical Center',2);
insert into Hospital values ('Ichilov Hospital',2);
insert into Hospital values ('Herzliya Medical Center',4);
insert into Hospital values ('Bnai Zion Medical Center',1);
insert into Hospital values ('Rambam Medical Center',1);
insert into Hospital values ('Carmel Hospital',1);
insert into Hospital values ('Hadassah Ein Kerem Hospital',3);
insert into Hospital values ('Galilee Medical Center',6);




insert into Resident values ('123456709', 'Eliran', 'Levi', '1993-01-12', '0523254122', '0522915362', 'eliran22', 1);
insert into Resident values ('023523586', 'Benjamin', 'Amir', '1996-02-01' , '0523022020', NULL, 'ben114', 2);
insert into Resident values ('111336780', 'Michael', 'Amar', '1990-03-12' , '0521101250', NULL, 'mmii2202', 3);
insert into Resident values ('052200329', 'Daniel', 'Baum', '1969-04-20' , '0521202202', '0552555225', 'ddd114', 4);
insert into Resident values ('522681101', 'Noah', 'Berger', '1996-06-26' , '0521102782', NULL, '15515d', 5);
insert into Resident values ('251524035', 'Matthew', 'Catz', '1997-04-27' , '0526339525', '0524427775', 'mattcat678', 6);
insert into Resident values ('325811020', 'Levi', 'Cohen', '1998-03-12' , '0526324147', NULL, 'llevv52', 1);
insert into Resident values ('404552336', 'David', 'Cohen', '1999-05-12' , '0524565463', '0542420427', 'dav43id', 1);
insert into Resident values ('502184882', 'John', 'Ben Haim', '1995-06-25' , '0526382441', '0524242277', 'john88374', 2);
insert into Resident values ('032265971', 'Gabriel', 'Bachar', '1992-01-02' , '0525255255', '0524242772', 'gddd222abr', 2);
insert into Resident values ('035565411', 'Isaac', 'Artom', '1986-07-31' , '0526352521', NULL, 'isoo125', 2);

insert into Resident(residentID,residentFirstName,residentSurName,residentBirthDate,contactPhone1,contactPhone2,password,citynum) values ('302264814', 'Bar', 'Levi', '1982-11-12' , '0528584871', NULL, 'barlev0012i', 1);
insert into Resident(residentID,residentFirstName,residentSurName,residentBirthDate,contactPhone1,contactPhone2,password,citynum) values ('200133552', 'Mor', 'Amir', '1978-10-26' , '0525251054', '0524415536', '123HH456', 1);
insert into Resident(residentID,residentFirstName,residentSurName,residentBirthDate,contactPhone1,contactPhone2,password,citynum) values ('410262205', 'Pnina', 'Amar', '1981-12-18' , '0525424225', NULL, '021ddd451', 2);
insert into Resident(residentID,residentFirstName,residentSurName,residentBirthDate,contactPhone1,contactPhone2,password,citynum) values ('201050523', 'Leora', 'Baum', '1980-12-03' , '0523545667', '0520526332', 'g22501', 1);
insert into Resident(residentID,residentFirstName,residentSurName,residentBirthDate,contactPhone1,contactPhone2,password,citynum) values ('145872201', 'Sivan', 'Berger', '1990-01-05' , '0525251281', NULL, 'moshe3664', 3);
insert into Resident(residentID,residentFirstName,residentSurName,residentBirthDate,contactPhone1,contactPhone2,password,citynum) values ('526328174', 'Avital', 'Catz', '1972-07-04' , '0526358898', '0529963257', 'av196ital', 4);
insert into Resident(residentID,residentFirstName,residentSurName,residentBirthDate,contactPhone1,contactPhone2,password,citynum) values ('410205505', 'Anet', 'Cohen', '1977-08-13' , '0521253364', NULL, 'aner1200215', 3);
insert into Resident(residentID,residentFirstName,residentSurName,residentBirthDate,contactPhone1,contactPhone2,password,citynum) values ('101020544', 'Stav', 'Ben Haim', '1982-05-12' , '0528596632', '052122256', 'stavben0627', 1);
insert into Resident(residentID,residentFirstName,residentSurName,residentBirthDate,contactPhone1,contactPhone2,password,citynum) values ('203555774', 'Merav', 'Cohen', '1983-03-30' , '0524478852', NULL, 'merav1330', 4);
insert into Resident(residentID,residentFirstName,residentSurName,residentBirthDate,contactPhone1,contactPhone2,password,citynum) values ('365884410', 'Dina', 'Bachar', '1995-01-25' , '0522235554', '0523368775', 'din2335', 1);
insert into Resident(residentID,residentFirstName,residentSurName,residentBirthDate,contactPhone1,contactPhone2,password,citynum) values ('225215444', 'Rachel', 'Artom', '1979-12-20' , '0521225335', '0521122254', 'grache125', 3);



insert into ResidentDiseases values (4,'123456709', 2010, 4);
insert into ResidentDiseases values (5,'522681101', 2000, 3);
insert into ResidentDiseases values (6,'302264814', 2020, 2);
insert into ResidentDiseases values (2,'123456709', 2001, 5);
insert into ResidentDiseases values (3,'123456709', 2003, 2);
insert into ResidentDiseases values (2,'365884410', 2016, 5);
insert into ResidentDiseases values (9,'365884410', 2013, 2);
insert into ResidentDiseases values (1,'365884410', 2015, 1);
insert into ResidentDiseases values (3,'365884410', 2000, 2);
insert into ResidentDiseases values (1,'225215444', 2001, 1);
insert into ResidentDiseases values (6,'225215444', 2001, 1);



insert into SickResident values ('145872201','R','Rambam Medical Center');
insert into SickResident values ('035565411','S','Assuta Medical Center');
insert into SickResident values ('225215444','D','Assuta Medical Center');
insert into SickResident values ('032265971','R','Carmel Hospital');
insert into SickResident values ('325811020','R','Carmel Hospital');
insert into SickResident values ('302264814','S','Carmel Hospital');
insert into SickResident values ('365884410','S','Ichilov Hospital');



insert into SickResidentTracking values ('145872201', '2020-05-03 03:00:00', 50);
insert into SickResidentTracking values ('035565411', '2020-12-03 03:00:00', 60);
insert into SickResidentTracking values ('302264814', '2020-05-12 05:00:00', 70);
insert into SickResidentTracking values ('225215444', '2020-02-12 06:00:00', 30);
insert into SickResidentTracking values ('325811020', '2020-12-12 05:00:00', 20);
insert into SickResidentTracking values ('325811020', '2020-12-12 02:00:00', 22);
insert into SickResidentTracking values ('325811020', '2020-12-12 03:00:00', 60);
insert into SickResidentTracking values ('365884410', '2020-12-07 08:00:00', 30);
insert into SickResidentTracking values ('365884410', '2020-12-07 07:00:00', 50);


insert into SickResidentVisits values ('365884410', '2020-12-05 07:00:00', '2020-12-05 08:00:00');
insert into SickResidentVisits values ('365884410', '2020-12-04 08:00:00', '2020-12-04 08:40:00');
insert into SickResidentVisits values ('325811020', '2020-12-10 10:00:00', '2020-12-10 10:46:00');
insert into SickResidentVisits values ('145872201', '2020-05-01 12:00:00', '2020-05-01 12:40:00');
insert into SickResidentVisits values ('035565411', '2020-11-29 09:00:00', '2020-11-29 09:30:00');
insert into SickResidentVisits values ('302264814', '2020-05-11 20:00:00', '2020-05-11 22:00:00');
insert into SickResidentVisits values ('325811020', '2020-12-10 13:00:00', '2020-12-10 13:20:00');
insert into SickResidentVisits values ('225215444', '2020-02-09 06:00:00', '2020-02-09 07:00:00');
insert into SickResidentVisits values ('325811020', '2020-12-10 17:00:00', '2020-12-10 18:10:00');
insert into SickResidentVisits values ('325811020', '2020-12-11 11:50:00', '2020-12-11 13:00:00');


insert into Business values ('51520', 'Prosecutors office', 'G', 1, 'Shomron', '5');
insert into Business values ('51102', 'Sonol', 'P', 1, 'Hamelakha', '7');
insert into Business values ('51514', 'Zara', 'P', 2, 'lolav', '5');
insert into Business values ('51251', 'Clalit', 'P', 1, 'zafen', '10');
insert into Business values ('51014', 'KSP', 'P', 2, 'Shomron', '2');


insert into SickResidentVisitsInBusiness values ('365884410', '2020-12-05 07:00:00', '51520');
insert into SickResidentVisitsInBusiness values ('365884410', '2020-12-04 08:00:00', '51102');
insert into SickResidentVisitsInBusiness values ('325811020', '2020-12-10 10:00:00', '51102');
insert into SickResidentVisitsInBusiness values ('145872201', '2020-05-01 12:00:00', '51514');
insert into SickResidentVisitsInBusiness values ('035565411', '2020-11-29 09:00:00', '51520');
insert into SickResidentVisitsInBusiness values ('302264814', '2020-05-11 20:00:00', '51014');
insert into SickResidentVisitsInBusiness values ('325811020', '2020-12-10 13:00:00', '51514');
insert into SickResidentVisitsInBusiness values ('225215444', '2020-02-09 06:00:00', '51251');
insert into SickResidentVisitsInBusiness values ('325811020', '2020-12-10 17:00:00', '51251');
insert into SickResidentVisitsInBusiness values ('325811020', '2020-12-11 11:50:00', '51014');



insert into ResidentInInsulation values ('123456709');
insert into ResidentInInsulation values ('023523586');
insert into ResidentInInsulation values ('111336780');
insert into ResidentInInsulation values ('522681101');
insert into ResidentInInsulation values ('052200329');
insert into ResidentInInsulation values ('251524035');
insert into ResidentInInsulation values ('404552336');
insert into ResidentInInsulation values ('502184882');
insert into ResidentInInsulation values ('200133552');
insert into ResidentInInsulation values ('410262205');
insert into ResidentInInsulation values ('035565411');


insert into InsulationOfAResident values ('123456709', '2020-05-12', '2020-05-28', 10);
insert into InsulationOfAResident values ('123456709', '2021-04-12', NULL, 40);
insert into InsulationOfAResident values ('023523586', '2021-04-07', NULL, 60);
insert into InsulationOfAResident values ('123456709', '2021-04-09', NULL, 50);
insert into InsulationOfAResident values ('035565411', '2021-04-01', NULL, 10);
insert into InsulationOfAResident values ('410262205', '2020-05-05', '2020-05-20', 20);
insert into InsulationOfAResident values ('200133552', '2020-04-07', '2020-04-21', 40);
insert into InsulationOfAResident values ('502184882', '2020-04-03', '2020-04-19', 80);
insert into InsulationOfAResident values ('404552336', '2020-05-25', '2020-06-20', 50);
insert into InsulationOfAResident values ('404552336', '2020-07-16', '2020-08-01', 30);
insert into InsulationOfAResident values ('404552336', '2020-05-29', '2020-06-13', 60);
insert into InsulationOfAResident values ('251524035', '2020-05-17', '2020-05-31', 70);
insert into InsulationOfAResident values ('522681101', '2020-01-22', '2020-02-15', 20);
insert into InsulationOfAResident values ('052200329', '2021-03-30', NULL, 50);
insert into InsulationOfAResident values ('111336780', '2021-04-07', NULL, 30);
insert into InsulationOfAResident values ('023523586', '2021-04-10', NULL, 20);


insert into Meet values ('365884410', '2020-12-05 07:00:00', '51520', '123456709');
insert into Meet values ('365884410', '2020-12-04 08:00:00', '51102', '023523586');
insert into Meet values ('325811020', '2020-12-10 10:00:00', '51102', '035565411');
insert into Meet values ('145872201', '2020-05-01 12:00:00', '51514', '035565411');
insert into Meet values ('035565411', '2020-11-29 09:00:00', '51520', '200133552');
insert into Meet values ('302264814', '2020-05-11 20:00:00', '51014', '410262205');
insert into Meet values ('325811020', '2020-12-10 13:00:00', '51514', '404552336');
insert into Meet values ('225215444', '2020-02-09 06:00:00', '51251', '404552336');
insert into Meet values ('225215444', '2020-02-09 06:00:00', '51251', '251524035');
insert into Meet values ('325811020', '2020-12-10 17:00:00', '51251', '023523586');
insert into Meet values ('325811020', '2020-12-10 17:00:00', '51251', '404552336');
insert into Meet values ('325811020', '2020-12-11 11:50:00', '51014', '111336780');
insert into Meet values ('325811020', '2020-12-11 11:50:00', '51014', '052200329');
insert into Meet values ('325811020', '2020-12-11 11:50:00', '51014', '522681101');


insert into Near values ('51520','51102',100);
insert into Near values ('51520','51251',20);
insert into Near values ('51102','51251',90);
insert into Near values ('51014','51514',15);

----------------------------------------------------------------------------------------------------------------------------