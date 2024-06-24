drop database if exists lab2;
create database lab2;
use lab2;
create table Zohiolch(
	ZohiolchCode varchar(6) not null primary key,
    ZohiolchNer varchar(45)
);

create table NomiinAngilal(
NomAngilalCode varchar(2) not null primary key,
NomAngilalNer varchar(45)
);

create table nasnii_angilal(
Nasnii_angilalCode int not null primary key,
Nasnii_angilal_ner varchar(20)
);

create table HevlelGazriinLavlah(
HevlelGazarCode varchar(4) not null primary key,
HevlelGazarNer varchar(45),
HevlelGazarHayg varchar(45)
);

create table HavtasniiHelberLavlah(
HavtasHelberCode varchar(1) not null primary key,
HavtasHelberNer varchar(10)
);

create table HelniiLavlah(
HelCode varchar(3) not null primary key,
HelNer varchar(20) 
);

create table AlbanTushaal(
AlbanTushaalCode varchar(2) not null primary key,
AlbanTushaalNer varchar(25)
);

create table AjiltanAngilal(
AngilalCode int not null primary key,
AngilalNer varchar(45)
);

create table HotAimgiinLavlah(
HotAimgiinCode varchar(2) not null primary key,
HotAimgiinNer varchar(45)
);

create table Zahialgiin_tuluv_lavlah(
Zahialgiin_tuluv_lavlah_id int not null primary key,
tuluv_lavlah varchar(45)
);

create table if not exists TulburHelber(
TulburHelber_id int not null primary key,
Helber varchar(45)
);

create table DedAngilal(
DedAngilalCode varchar(2) not null primary key,
DedAngilalNer varchar(45),
NomiinAngilal_NomAngilalCode varchar(2),
foreign key(NomiinAngilal_NomAngilalCode) references NomiinAngilal(NomAngilalCode)
);

create table Ajiltan(
AjiltanCode varchar(4) not null primary key, 
AjiltanOvogNer varchar(45),
AjiltanHvis varchar(2),
AjiltanUtas varchar(25),
AjiltanHayg varchar(45),
AjiltanRegNo varchar(10),
Ajiltan_nevtreh_ner varchar(30),
Ajiltan_nuuts_vg varchar(65),
AlbanTushaal_AlbanTushaalCode varchar(2),
Angilal_AngilalCode int,
foreign key(AlbanTushaal_AlbanTushaalCode) references AlbanTushaal(AlbanTushaalCode),
foreign key(Angilal_AngilalCode) references AjiltanAngilal(AngilalCode)
);

create table DuuregSumiinLavlah(
DuuregSumiinCode varchar(3) not null primary key,
DuuregSumiinNer varchar(45),
HotAimgiinLavlah_HotAimgiinCode varchar(2),
foreign key(HotAimgiinLavlah_HotAimgiinCode) references HotAimgiinLavlah(HotAimgiinCode)
);

create table HorooLavlah(
HorooCode int not null primary key, 
HorooNer varchar(45),
DuuregSumiinLavlah_DuuregSumiinCode varchar(3),
foreign key (DuuregSumiinLavlah_DuuregSumiinCode) references DuuregSumiinLavlah(DuuregSumiinCode) 
);

create table Zahialagch(
ZahialagchID int not null primary key,
ZahialagchNer varchar(45),
ZahialagchHvis tinyint,
ZahialagchRegister varchar(10),
ZahialagchUtas varchar(15),
ZahialagchBairGudamjToot varchar(45),
ZahialagchNemeltMedeelel varchar(45),
HorooLavlah_HorooCode int,
foreign key (HorooLavlah_HorooCode) references HorooLavlah(HorooCode)
);

create table Zahialga(
ZahialgaNo int not null primary key,
ZahialgaOgnoo date,
Zahialagch_ZahialagchID int,
Ajiltan_AjiltanCode varchar(4),
foreign key (Zahialagch_ZahialagchID) references Zahialagch(ZahialagchID),
foreign key (Ajiltan_AjiltanCode) references Ajiltan(AjiltanCode)
);

create table Zahialga_tuluv(
Zahialga_tuluv_id int not null primary key,
Ognoo datetime,
tailbar varchar(255),
Zahialga_ZahialgaNo int,
Zahialgiin_tuluv_lavlah_Zahialgiin_tuluv_lavlah_id int,
Ajiltan_AjiltanCode varchar(4),
foreign key (Zahialga_ZahialgaNo) references Zahialga(ZahialgaNo),
foreign key(Zahialgiin_tuluv_lavlah_Zahialgiin_tuluv_lavlah_id) references Zahialgiin_tuluv_lavlah(Zahialgiin_tuluv_lavlah_id),
foreign key (Ajiltan_AjiltanCode) references Ajiltan(AjiltanCode)
);

create table Nom_lavlah(
NomCode varchar(20) not null primary key,
NomNer varchar(45),
HevlegsdsenOn date,
HuudasToo int,
ISBN varchar(20),
HevlelGazriinLavlah_HevlelGazarCode varchar(4),
HelniiLavlah_HelCode varchar(3),
HavtasniiHelberLavlah_HavtasHelberCode varchar(1),
DedAngilal_DedAngilalCode varchar(2),
nasnii_angilal_Nasnii_angilalCode int,
foreign key(HevlelGazriinLavlah_HevlelGazarCode) references HevlelGazriinLavlah(HevlelGazarCode),
foreign key(HelniiLavlah_HelCode) references HelniiLavlah(HelCode),
foreign key (HavtasniiHelberLavlah_HavtasHelberCode) references HavtasniiHelberLavlah(HavtasHelberCode),
foreign key(DedAngilal_DedAngilalCode) references DedAngilal(DedAngilalCode),
foreign key(nasnii_angilal_Nasnii_angilalCode) references nasnii_angilal(Nasnii_angilalCode)
);

create table Nom(
NomDansNo int not null primary key,
NomDans varchar(45),
Ognoo date,
une decimal(13,2),
Nom_lavlah_NomCode varchar(20),
foreign key (Nom_lavlah_NomCode) references Nom_lavlah(NomCode)
);

create table ZahialgiinDelgerengvi(
ZahialgiinDelgerenguiID int not null primary key,
Zahialga_ZahialgaNo int,
Nom_NomDansNo int,
foreign key(Zahialga_ZahialgaNo) references Zahialga(ZahialgaNo),
foreign key(Nom_NomDansNo) references Nom(NomDansNo)
);

create table Zohiolchid(
Zohiolchid int not null primary key,
Nom_lavlah_NomCode varchar(20),
Zohiolch_ZohiolchCode varchar(6),
foreign key (Zohiolch_ZohiolchCode) references Zohiolch(ZohiolchCode),
foreign key(Nom_lavlah_NomCode) references Nom_lavlah(NomCode)
);

create table Tulbur(
TulburHuudasNo int not null primary key,
TulburHemjee decimal(13,2),
TulburTulsunOgnoo date,
Zahialga_ZahialgaNo int ,
TulburHelber_TulburHelber_id int,
foreign key(Zahialga_ZahialgaNo) references Zahialga(ZahialgaNo),
foreign key(TulburHelber_TulburHelber_id) references TulburHelber(TulburHelber_id)
);

