drop database if exists lab3;
create database if not exists lab3;
use lab3;

CREATE TABLE Zohiolch (
    ZohiolchCode VARCHAR(6) NOT NULL PRIMARY KEY,
    ZohiolchNer VARCHAR(45) NOT NULL
);
CREATE TABLE NomiinAngilal (
    NomAngilalCode VARCHAR(2) NOT NULL PRIMARY KEY,
    NomAngilalNer VARCHAR(45) not null
);
CREATE TABLE nasnii_angilal (
    Nasnii_angilalCode INT NOT NULL PRIMARY KEY,
    Nasnii_angilal_ner VARCHAR(20) not null
);
CREATE TABLE HevlelGazriinLavlah (
    HevlelGazarCode VARCHAR(4) NOT NULL PRIMARY KEY,
    HevlelGazarNer VARCHAR(45) not null,
    HevlelGazarHayg VARCHAR(45),
    HevlelGazarDugaar VARCHAR(8)
);
CREATE TABLE HavtasniiHelberLavlah (
    HavtasHelberCode VARCHAR(1) NOT NULL PRIMARY KEY,
    HavtasHelberNer VARCHAR(10) not null
);
CREATE TABLE HelniiLavlah (
    HelCode VARCHAR(3) NOT NULL PRIMARY KEY,
    HelNer VARCHAR(20) not null
);
CREATE TABLE AlbanTushaal (
    AlbanTushaalCode VARCHAR(2) NOT NULL PRIMARY KEY,
    AlbanTushaalNer VARCHAR(25)
);
CREATE TABLE AjiltanAngilal (
    AngilalCode INT NOT NULL PRIMARY KEY,
    AngilalNer VARCHAR(45)
);
CREATE TABLE HotAimgiinLavlah (
    HotAimgiinCode VARCHAR(2) NOT NULL PRIMARY KEY,
    HotAimgiinNer VARCHAR(45)
);
CREATE TABLE Zahialgiin_tuluv_lavlah (
    Zahialgiin_tuluv_lavlah_id INT NOT NULL auto_increment PRIMARY KEY,
    tuluv_lavlah VARCHAR(45)
);
CREATE TABLE IF NOT EXISTS TulburHelber (
    TulburHelber_id INT PRIMARY KEY,
    Helber VARCHAR(45)
);
CREATE TABLE DedAngilal (
    DedAngilalCode VARCHAR(2) NOT NULL PRIMARY KEY,
    DedAngilalNer INT,
    NomiinAngilal_NomAngilalCode VARCHAR(2),
    FOREIGN KEY (NomiinAngilal_NomAngilalCode)
        REFERENCES NomiinAngilal (NomAngilalCode)
);
CREATE TABLE Ajiltan (
    AjiltanCode VARCHAR(4) NOT NULL PRIMARY KEY,
    AjiltanOvogNer VARCHAR(45) not null,
    AjiltanHvis VARCHAR(2) not null,
    AjiltanUtas VARCHAR(25),
    AjiltanHayg VARCHAR(45),
    AjiltanRegNo VARCHAR(10) not null,
    Ajiltan_nevtreh_ner VARCHAR(30) not null,
    Ajiltan_nuuts_vg VARCHAR(65) not null,
    AlbanTushaal_AlbanTushaalCode VARCHAR(2) not null,
    Angilal_AngilalCode INT,
    FOREIGN KEY (AlbanTushaal_AlbanTushaalCode)
        REFERENCES AlbanTushaal (AlbanTushaalCode)
);

CREATE TABLE DuuregSumiinLavlah (
    DuuregSumiinCode VARCHAR(3) NOT NULL PRIMARY KEY,
    DuuregSumiinNer VARCHAR(45) not null,
    HotAimgiinLavlah_HotAimgiinCode VARCHAR(2),
    FOREIGN KEY (HotAimgiinLavlah_HotAimgiinCode)
        REFERENCES HotAimgiinLavlah (HotAimgiinCode)
);
CREATE TABLE HorooLavlah (
    HorooCode INT NOT NULL PRIMARY KEY,
    DuuregSumiinLavlah_DuuregSumiinCode VARCHAR(3),
    FOREIGN KEY (DuuregSumiinLavlah_DuuregSumiinCode)
        REFERENCES DuuregSumiinLavlah (DuuregSumiinCode)
);
CREATE TABLE Zahialagch (
    ZahialagchID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ZahialagchNer VARCHAR(45) not null,
    ZahialagchHvis TINYINT,
    ZahialagchRegister VARCHAR(10) not null,
    ZahialagchUtas VARCHAR(15),
    ZahialagchBairGudamjToot VARCHAR(45),
    ZahialagchNemeltMedeelel VARCHAR(45),
    HorooLavlah_HorooCode INT,
    FOREIGN KEY (HorooLavlah_HorooCode)
        REFERENCES HorooLavlah (HorooCode)
);
CREATE TABLE Zahialga (
    ZahialgaNo INT NOT NULL  auto_increment PRIMARY KEY,
    Zahialagch_ZahialagchID INT,
    Ajiltan_AjiltanCode VARCHAR(4),
    FOREIGN KEY (Zahialagch_ZahialagchID)
        REFERENCES Zahialagch (ZahialagchID),
    FOREIGN KEY (Ajiltan_AjiltanCode)
        REFERENCES Ajiltan (AjiltanCode)
);
CREATE TABLE Zahialga_tuluv (
    Zahialga_tuluv_id INT NOT NULL auto_increment PRIMARY KEY ,
    Ognoo DATETIME,
    tailbar VARCHAR(255),
    Zahialga_ZahialgaNo INT,
    Zahialgiin_tuluv_lavlah_Zahialgiin_tuluv_lavlah_id INT,
    Ajiltan_AjiltanCode VARCHAR(4),
    FOREIGN KEY (Zahialga_ZahialgaNo)
        REFERENCES Zahialga (ZahialgaNo),
    FOREIGN KEY (Zahialgiin_tuluv_lavlah_Zahialgiin_tuluv_lavlah_id)
        REFERENCES Zahialgiin_tuluv_lavlah (Zahialgiin_tuluv_lavlah_id),
    FOREIGN KEY (Ajiltan_AjiltanCode)
        REFERENCES Ajiltan (AjiltanCode)
);

CREATE TABLE Nom_lavlah (
    NomCode VARCHAR(20) NOT NULL PRIMARY KEY,
    NomNer VARCHAR(5) not null,
    HevlegsdsenOn DATE,
    HuudasToo INT,
    HevlelGazriinLavlah_HevlelGazarCode VARCHAR(4),
    HelniiLavlah_HelCode VARCHAR(3) not null,
    HavtasniiHelberLavlah_HavtasHelberCode VARCHAR(1),
    DedAngilal_DedAngilalCode VARCHAR(2),
    nasnii_angilal_Nasnii_angilalCode INT,
    FOREIGN KEY (HevlelGazriinLavlah_HevlelGazarCode)
        REFERENCES HevlelGazriinLavlah (HevlelGazarCode),
    FOREIGN KEY (HelniiLavlah_HelCode)
        REFERENCES HelniiLavlah (HelCode),
    FOREIGN KEY (HavtasniiHelberLavlah_HavtasHelberCode)
        REFERENCES HavtasniiHelberLavlah (HavtasHelberCode),
    FOREIGN KEY (DedAngilal_DedAngilalCode)
        REFERENCES DedAngilal (DedAngilalCode),
    FOREIGN KEY (nasnii_angilal_Nasnii_angilalCode)
        REFERENCES nasnii_angilal (Nasnii_angilalCode)
);

CREATE TABLE Nom (
    NomDansNo INT ,
    NomDans varchar(45),
    Name VARCHAR(50),
    Ognoo DATE,
    une DECIMAL(13 , 2),
    Nom_lavlah_NomCode VARCHAR(20),
    FOREIGN KEY (Nom_lavlah_NomCode)
        REFERENCES Nom_lavlah (NomCode)
);


CREATE TABLE ZahialgiinDelgerengvi (
    ZahialgiinDelgerenguiID INT not null,
    Zahialga_ZahialgaNo INT,
    Nom_NomDansNo varchar(45),
    Hugatsaa DATE,
    FOREIGN KEY (Zahialga_ZahialgaNo)
        REFERENCES Zahialga (ZahialgaNo)	
);


CREATE TABLE Zohiolchid (
    Zohiolchid INT NOT NULL PRIMARY KEY,
    Nom_lavlah_NomCode VARCHAR(20),
    Zohiolch_ZohiolchCode VARCHAR(6),
    FOREIGN KEY (Zohiolch_ZohiolchCode)
        REFERENCES Zohiolch (ZohiolchCode),
    FOREIGN KEY (Nom_lavlah_NomCode)
        REFERENCES Nom_lavlah (NomCode)
);
CREATE TABLE Tulbur (
    TulburHuudasNo INT NOT NULL PRIMARY KEY,
    TulburHemjee INT,
    TulburTulsunOgnoo DATE,
    Zahialga_ZahialgaNo INT,
    TulburHelber_TulburHelber_id INT,
    FOREIGN KEY (TulburHelber_TulburHelber_id)
        REFERENCES TulburHelber (TulburHelber_id)
);
-- ------------------------- ALTER ADD ----------------------------
		desc Nom_lavlah;
		-- NomLavlah -> ISBN varchar(20), //add
		alter table Nom_lavlah
		add ISBN varchar(20) null;

		desc HorooLavlah;
		-- HorooLavlah -> HorooNer varchar(45), //add
		alter table HorooLavlah
		add HorooNer varchar(45) not null;

		desc Zahialga;
		-- Zahialga -> ZahialgaOgnoo date, //add
		alter table Zahialga
		add column ZahialgaOgnoo timestamp default current_timestamp;

-- ------------------------- ALTER DROP ----------------------------

		desc Nom;
		-- Nom ->Name VARCHAR(50) //delete
		alter table Nom
		drop column Name;

		desc ZahialgiinDelgerengvi;
		-- ZahialgiinDelgerengvi -> Hugatsaa date,//delete
		alter table ZahialgiinDelgerengvi
		drop column Hugatsaa;

		desc HevlelGazriinLavlah;
		-- HevlelGazriinLavlah -> HevlelGazarDugaar varchar(8) //delete
		alter table HevlelGazriinLavlah
		drop column HevlelGazarDugaar;
        
-- ------------------------- MODIFY ----------------------------
		
	desc Nom_lavlah;
	-- Nom_lavlah -> NomNer varchar(45) 
	alter table Nom_lavlah
	modify NomNer varchar(45) not null;

	desc Tulbur;
	-- Tulbur -> int - decimal(13,2) 
	alter table Tulbur 
	modify TulburHemjee decimal(13,2) null;

	desc DedAngilal;
	-- dedangilal -> int - varchar 
	alter table DedAngilal
	modify DedAngilalNer varchar(25) not null;

	desc Zahialagch;
	-- ZahialagchHvis TINYINT -> varchar(2) 
	alter table Zahialagch
	modify ZahialagchHvis varchar(2) not null ;
    
    desc Nom;
	alter table Nom
	modify NomDansNo varchar(45) primary key;
		
	desc ZahialgiinDelgerengvi;
	alter table ZahialgiinDelgerengvi
	modify Nom_NomDansNo varchar(45) not null;
    
    desc Tulbur;
	alter table Tulbur
	modify TulburHuudasNo int not null auto_increment;

-- ------------------------- DEFAULT ----------------------------

	desc Tulbur;
	alter table Tulbur
	modify TulburTulsunOgnoo timestamp default current_timestamp;
    
    desc Zahialga_tuluv;
	alter table Zahialga_tuluv
	modify Ognoo datetime DEFAULT current_timestamp;
    
    desc Ajiltan;
    alter table Ajiltan
    modify AjiltanUtas varchar(8) DEFAULT "99999999";
    
-- ------------------------- CONSTRAINT ----------------------------

SELECT * FROM information_schema.table_constraints
	WHERE Table_name = 'Zahialagch' and table_schema = 'lab3';
    
ALTER TABLE Zahialagch
ADD CONSTRAINT z_reg_no
UNIQUE (ZahialagchRegister);

SELECT * FROM information_schema.table_constraints
	WHERE Table_name = 'Nom' and table_schema = 'lab3';

SELECT * FROM information_schema.table_constraints
	WHERE Table_name = 'ZahialgiinDelgerengvi' and table_schema = 'lab3';

-- ZahialgiinDelgerengvi -> foreign key(Nom_NomDansNo) references Nom(NomDansNo) 
alter table ZahialgiinDelgerengvi
add constraint PK_ZahialgiinDelgerenguiID
primary key(ZahialgiinDelgerenguiID),
add constraint fk_ZahialgiinDelgerengvi_Nom
foreign key(Nom_NomDansNo) references Nom(NomDansNo);


SELECT * FROM information_schema.table_constraints
WHERE Table_name = 'Tulbur' and table_schema = 'lab3';

-- Tulbur -> foreign key(Zahialga_ZahialgaNo) references Zahialga(ZahialgaNo)//holboos
alter table Tulbur
add constraint fk_Tulbur_Zahialga
foreign key(Zahialga_ZahialgaNo) references Zahialga(ZahialgaNo);

SELECT * FROM information_schema.table_constraints
WHERE Table_name = 'Ajiltan' and table_schema = 'lab3';

-- Ajiltan -> foreign key(Angilal_AngilalCode) references AjiltanAngilal(AngilalCode) 
alter table Ajiltan
add constraint fk_Ajiltan_AjiltanAngilal
foreign key(Angilal_AngilalCode) references AjiltanAngilal(AngilalCode);

-- ------------------------- CHECK ----------------------------

select * from information_schema.table_constraints
where table_name = 'Tulbur' and table_schema = 'lab3';

ALTER TABLE Tulbur
ADD CONSTRAINT T_hemjee CHECK (TulburHemjee >= 0 );

-- insert into Tulbur values
-- (null, 35600.00, "2023-04-25 17:31:00", 1, 1);

-- select * from Tulbur;

select * from information_schema.table_constraints
where table_name = 'Ajiltan' and table_schema = 'lab3';

alter table Ajiltan
add constraint pass check(Length(Ajiltan_nuuts_vg)>=6);

-- insert into Ajiltan values
-- ("A011", "Очир Цолмон", "эр", "90891234", "БЗД 3хороо","ЗЦ88120857", "nomin1234", "nn19", "CA" ,2);

-- insert into Ajiltan values
-- ("A011", "Очир Цолмон", "эр", "90891234", "БЗД 3хороо","ЗЦ88120857", "nomin1234", "nn7819", "CA" ,2);

-- select * from Ajiltan;

select * from information_schema.table_constraints
where table_name = 'Zahialagch' and table_schema = 'lab3';

ALTER TABLE Zahialagch
ADD CONSTRAINT check_reg_no 
CHECK (ZahialagchRegister REGEXP '^[А-Я]{2}[0-9]{2}[0-3][0-9][0-3][0-9]{3}$');

-- insert into Zahialagch values
-- (null, "Очир", "эр", "ЗГh04310607", "88321467", "skytown 89-р байр 132 тоот", "7давхар", 2253);

-- insert into Zahialagch values
-- (null, "Балдан", "эр", "УА90112309", "80321467", "skytown 89-р байр 132 тоот", "7давхар", 2253);

-- select * from Zahialagch;

select * from information_schema.table_constraints
where table_name = 'Ajiltan' and table_schema = 'lab3';

ALTER TABLE Ajiltan
ADD CONSTRAINT check_A_reg_no 
CHECK (AjiltanRegNo REGEXP '^[А-Я]{2}[0-9]{2}[0-3][0-2][0-3][0-9]{3}$');

-- insert into Ajiltan values
-- ("A012", "Мөнх Эрдэнэ", "эр", "89891234", "БЗД 3хороо","ЗRR8120877", "nomin1234", "nn1989", "CA" ,2);

-- insert into Ajiltan values
-- ("A012", "Эрдэнэ", "эр", "88891234", "БЗД 3хороо","ЗО88120877", "nomin1234", "nn1989", "CA" ,2);

-- select * from Ajiltan;

ALTER TABLE Ajiltan
ADD CONSTRAINT check_phone_num 
CHECK (AjiltanUtas REGEXP '^[0-9]{8}$');

-- insert into Ajiltan values
-- ("A013", "Мөнх Эрдэнэ", "эр", "8989123?4", "БЗД 3хороо","ЗО98120877", "nomin1234", "nn1989", "CA" ,2);

-- insert into Ajiltan values
-- ("A013", "Мөнх Эрдэнэ", "эр", "89891234", "БЗД 3хороо","ЗО98120877", "nomin1234", "nn1989", "CA" ,2);

-- select * from Ajiltan; 

-- ------------------------------  Bichleg oruulah  -----------------------------
insert into Zohiolch Values
("ZF0001", "Элена Ферранте"),
("ZF0002", "Кавагүчи Тошиказу"),
("ZF0003", "Мишель Обама"),
("ZF0004", "Кийосаки Роберт"),
("ZF0005", "Ольга Токарчук"),
("ZF0006", "Пауло Коэльо"),
("ZF0007", "Isabel Allende"),
("ZF0008", "Jeff Kinney"),
("ZF0009", "Чопра Дийпак"),
("ZF0010", " А.Н.Смоляков"),
("ZM0001", "В.Баярсайхан"),
("ZM0002", "Н.Даваадаш"),
("ZM0003", "Н.Төмөрбаатар"),
("ZM0004", "Х.Болор-Эрдэнэ"),
("ZM0005", "Б.Батсуурь"),
("ZM0006", "Хулан Мяасүрэн");

insert into NomiinAngilal Values
("K", "Хүүхдийн ном"),
("C","Нийтийн ном");

insert into nasnii_angilal Values
(1, "0+ нас"),
(2, "6+ нас"),
(3, "10+ нас"),
(4, "16+ нас");

insert into HevlelGazriinLavlah values
("HG01","Magic color print","Монгол 3-ын автобусны буудал"),
("HG02","Улаанбаатар принт","Таван Богд Группын төв байр"),
("HG03","Монсудар ХХК","Адмон компаны байр"),
("HG04","Мөнхийн үсэг ХХК","Ажилчны гудамж -135"),
("HG05","Дусал принтинг ХХК","Галакси тауэр, 5007 тоот"),
("HG06","Принтхаус ХХК","Баруун 4-н зам, РЕНТАЛОН Байр 119 тоот"),
("HG07","Интерпресс ХХК","Жамъян Гүний гудамж-5 СиТиПи"),
("HG08","Титэм Дизайн ХХК","Чингэлтэй дүүрэг 4-р хороо Бага тойруу"),
("HG09","ТООНОТ ПРИНТ ХХК","БГД, 6хороо, 10хороолол Марк Товчоо8"),
("HG10","Хөх Монгол Принтинг","БГД, Замчны гудамж-39, Газар бизнес төв");

insert into HavtasniiHelberLavlah Values
("Z", "Зөөлөн"),
("H", "Хатуу"),
("M", "Модон"),
("A", "Арьсан");
insert into HelniiLavlah Values
("MGL", "Монгол"),
("ENG", "Англи"),
("RUS", "Орос"),
("DEU", "Герман"),
("KOR", "Солонгос"),
("FRA", "Франц"),
("CHN", "Хятад"),
("JPN", "Япон");

insert into AlbanTushaal Values
("ZA", "Захирал"),
("ME", "Менежер"),
("CA", "Кассын ажилтан"),
("HV", "Хүргэлтийн ажилтан"),
("BO", "Борлуулалтын ажилтан");

insert into HotAimgiinLavlah Values
("11", "Улаанбаатар"),
("83", "Баян-Өлгий"),
("64", "Баянхонгор"),
("82", "Говь-Алтай"),
("81", "Завхан"),
("46", "Өмнөговь");

insert into Zahialgiin_tuluv_lavlah Values
(null, "Урьдчилан захиалсан"),
(null, "Баталгаажаагүй"),
(null, "Баталгаажсан"),
(null, "Буцаасан"),
(null, "Цуцлагдсан");

insert into TulburHelber Values
(1, "Карт"),
(2, "QPay"),
(3, "SocialPay"),
(4, "Данс"),
(5, "Бэлэн мөнгө");

insert into DedAngilal values
("B1", "Үлгэр", "K"),
("B2", "Танин мэдэхүй", "K"),
("B3", "Хүүхдийн уран зохиол", "K"),
("A1", "Гүн ухаан, философи", "C"),
("A2", "Уран зохиолын ном","C"),
("A3", "Шинжлэх ухаан", "C"),
("A4", "Бизнес, маркетинг", "C"),
("A5", "Эрүүл мэнд", "C"),
("A6", "Хэл шинжлэл", "C"),
("A7", "Яруу найраг, соёл урлаг", "C"),
("A8", "Түүх, ёс заншил", "C"),
("A9", "Нийгэм, улс төр, хууль", "C");

insert into AjiltanAngilal values
(1, 'Admin'),
(2, 'Manager'),
(3, 'Operator');

insert into Ajiltan values
("A001", "Галбадрах Номин", "эм", "99892988", "БЗД 3хороо","ЗХ99120834", "nomin1234", "nn9819", "CA",2),
("A002", "Содном Одгэрэл" , "эм", "89983421", "БГД 2хороо","ЗХ97121824", "odgerel", "gerlee21", "CA", 2),
("A003", "Амартүвшин Эгшиглэн", "эм", "91283742", "БГД 5-р хороо","НГ09310554", "egshiglen", "egshig42","ZA", 2),
("A004", "Гаадан Билгүүн", "эр", "91129876", "ЧД 1-р хорооо","ЭГ02221495", "bilgvvn", "bilgvvn76","ME", 2),
("A005", "Очир Мягмар", "эр", "95127281", "СБД 3р хороо", "ЗГ03310607", "myagmar", "myagmar81", "HV", 2),
("A006", "Өлзийсайхан Ариунтуяа", "эм", "88774334","СБД 6-р хороо", "МГ89122738", "ariunaa", "ariuk34","HV", 2),
("A007", "Энхбаяр Болор", "эм", "90099880", "СХД 1р хороо", "ЛД88121378", "bolor", "bolor80", "HV", 2),
("A008", "Гочоо Болд", "эр", "99771274", "СХД 6-р хороо","ЗХ99220833", "bold", "bold74", "CA", 2),
("A009", "Даш Дорж", "эр", "96208754", "БГД 2р хороо","ЛД88121379", "dorj", "dorj54", "CA", 2),
("A010", "Батбаяр Саруул", "эр", "80982342", "БЗД 12р хороо","ХГ91123037", "saruul", "saruul42","BO", 1 );

insert into DuuregSumiinLavlah values
("U01", "Багануур", "11"),
("U04", "Багахангай", "11"),
("U07", "Баянгол", "11"),
("U10", "Баянзүрх", "11"),
("U13", "Найлайх", "11"),
("U16", "Сонгинохайрхан", "11"),
("U19", "Сүхбаатар", "11"),
("U22", "Хан-УУл", "11"),
("U25", "Чингэлтэй ", "11"),
("B01", "Өлгий сум", "83"),
("B04", "Алтай сум", "83"),
("B07", "Алтанцөгц сум", "83"),
("B10", "Баяннуур сум", "83"),
("B13", "Бугат сум", "83"),
("B16", "Булган сум", "83"),
("B19", "Буянт сум", "83"),
("B22", "Дэлүүн сум", "83"),
("B25", "Ногооннуур сум", "83"),
("X01", "Баянхонгор сум", "64"),
("X04", "Баацагаан сум", "64"),
("X07", "Баянбулаг сум", "64"),
("X10", "Баянговь сум", "64"),
("X13", "Баянлиг сум", "64"),
("X16", "Баян-Овоо сум", "64"),
("X19", "Баян-Өндөр сум", "64"),
("X22", "Баянцагаан сум", "64"),
("X25", "Богд сум", "64"),
("A01", "Есөнбулаг сум", "82"),
("A04", "Алтай сум", "82"),
("A07", "Баян-уул сум", "82"),
("A10", "Бигэр сум", "82"),
("A13", "Бугат сум", "82"),
("A16", "Дарив сум", "82"),
("A19", "Дэлгэр сум", "82"),
("A22", "Жаргалан сум", "82"),
("A25", "Тайшир сум", "82"),
("Z01", "Улиастай сум", "81"),
("Z04", "Алдархаан сум", "81"),
("Z07", "Асгат сум", "81"),
("Z10", "Баянтэс сум", "81"),
("Z13", "Баянхайрхан сум", "81"),
("Z16", "Дөрвөлжин сум", "81"),
("Z19", "Завханмандал сум", "81"),
("Z22", "Идэр сум", "81"),
("Z25", "Их-Уул сум", "81"),
("G01", "Даланзадгад сум", "46"),
("G04", "Баяндалай сум", "46"),
("G07", "Баян-Овоо сум", "46"),
("G10", "Булган сум", "46"),
("G13", "Гурвантэс сум", "46"),
("G16", "Мандал-Овоо сум", "46"),
("G19", "Манлай сум", "46"),
("G22", "Ноён сум", "46"),
("G25", "Номгон сум", "46");
insert into HorooLavlah(HorooCode,HorooNer, DuuregSumiinLavlah_DuuregSumiinCode) values
(151, "1-р хороо", "U01"),
(153, "2-р хороо", "U01"),
(155, "3-р хороо", "U01"),
(157, "4-р хороо", "U01"),
(159, "5-р хороо", "U01"),
	(451, "1-р хороо", "U04"),
	(453, "2-р хороо", "U04"),
(1351,"1-р хороо", "U13"),
(1353,"2-р хороо", "U13"),
(1355,"3-р хороо", "U13"),
(1357,"4-р хороо", "U13"),
(1359,"5-р хороо", "U13"),
(1361,"6-р хороо", "U13"),
(1363,"7-р хороо", "U13"),
(1365,"8-р хороо", "U13"),
	(751,"1-р хороо", "U07"),
	(753,"2-р хороо", "U07"),
	(755,"3-р хороо", "U07"),
	(757,"4-р хороо", "U07"),
	(759,"5-р хороо", "U07"),
	(761,"6-р хороо", "U07"),
	(763,"7-р хороо", "U07"),
	(765,"8-р хороо", "U07"),
(1051,"1-р хороо", "U10"),
(1053,"2-р хороо", "U10"),
(1055,"3-р хороо", "U10"),
(1057,"4-р хороо", "U10"),
(1059,"5-р хороо", "U10"),
(1061,"6-р хороо", "U10"),
(1063,"7-р хороо", "U10"),
(1065,"8-р хороо", "U10"),
	(1651,"1-р хороо", "U16"),
	(1653,"2-р хороо", "U16"),
	(1655,"3-р хороо", "U16"),
	(1657,"4-р хороо", "U16"),
	(1659,"5-р хороо", "U16"),
	(1661,"6-р хороо", "U16"),
	(1663,"7-р хороо", "U16"),
	(1665,"8-р хороо", "U16"),
(1951,"1-р хороо", "U19"),
(1953,"2-р хороо", "U19"),
(1955,"3-р хороо", "U19"),
(1957,"4-р хороо", "U19"),
(1959,"5-р хороо", "U19"),
(1961,"6-р хороо", "U19"),
(1963,"7-р хороо", "U19"),
(1965,"8-р хороо", "U19"),
	(2251,"1-р хороо", "U22"),
	(2253,"2-р хороо", "U22"),
	(2255,"3-р хороо", "U22"),
	(2257,"4-р хороо", "U22"),
	(2259,"5-р хороо", "U22"),
	(2261,"6-р хороо", "U22"),
	(2263,"7-р хороо", "U22"),
	(2265,"8-р хороо", "U22"),
(2551,"1-р хороо", "U25"),
(2553,"2-р хороо", "U25"),
(2555,"3-р хороо", "U25"),
(2557,"4-р хороо", "U25"),
(2559,"5-р хороо", "U25"),
(2561,"6-р хороо", "U25"),
(2563,"7-р хороо", "U25"),
(2565,"8-р хороо", "U25");

insert into Zahialagch values
(null, "Очир", "эр", "УА80112309", "88321467", "skytown 89-р байр 132 тоот", "7давхар", 2253),
(null, "Гомбо", "эр", "УВ90101313", "99862364", "Viva 2-р байр 20 тоот", null, 2251),
(null, "Сүрэн", "эм", "УЖ97102304", "89763872", "Startown 1р байр 5тоот", null, 2253),
(null, "Гаадан", "эр", "ЛЛ98050323", "80873269", "Tara 7-р байр 65 тоот", "Заавал залгаж ирэх", 2557),
(null, "Билгүүн", "эр", "ТА97112059", "91273643", "Apartment-1 33 тоот", null, 151),
(null, "Туяа", "эм", "ЗГ03310606", "90641222", "ICN-1 11 тоот", null, 153),
(null, "Мөнх", "эр", "ЗА89082367", "91631222", "Цагдаагийн гудамж 44/5-р байр 39 тоот", null, 1657),
(null, "Эрдэнэ", "эр", "ЙА97021189", "90635422", "Залуучуудын гудамж 17/2-р байр", null, 1659),
(null, "Баяр", "эр", "УД01212873", "96413322", "Автоплаза-2 төв, 3 давхарт 3 тоот", "Яаралтай захиалга", 1957),
(null, "Долгор", "эм", "ЗГ03250706", "89123456", "49/1-р байр 1 давхарт 101 тоот", null, 1951);

insert into Zahialga values
(null, 1, "A001", "2023-01-12 12:00:00"),
(null, 2, "A001", "2023-01-12 12:59:00"),
(null, 3, "A001", "2023-01-15 14:00:00"),
(null, 4, "A002", "2023-02-19 15:30:00"),
(null, 5, "A002", "2023-03-11 16:35:00"),
(null, 6, "A005", "2023-04-25 17:31:00"),
(null, 7, "A001", "2023-07-17 18:12:00"),
(null, 8, "A007", "2023-07-21 19:28:00"),
(null, 9, "A009", "2023-08-12 14:51:00"),
(null, 10, "A007", "2023-08-19 15:20:00");

insert into Nom_lavlah values
("Nom0001", "Кофе хөрөхөөс өмнө", "2022-06-20", 232, "HG03", "MGL", "Z", "A2", 2, "9789919517816"), 
("Nom0002", "Ганцаардлын өдрүүд", "2023-02-14", 336, "HG03", "MGL", "Z", "A2", 3, "9789919518936"),
("Nom0003", "Хэсүүлчид", "2022-04-22", 578, "HG03", "MGL", "H", "A2", 2, "9789919517397"),
("Nom0004", "Алхимич", "2017-01-01", 183, "HG05", "MGL", "Z", "A2", 3, "9789997850546"),
("Nom0005", "Violeta", "2023-02-16", 336, "HG04", "ENG", "Z", "A2", 4, "9781526648365"),
("Nom0006", "Diary of a Wimpy Kid:The Deep End", "2022-01-20", 240, "HG09", "ENG", "Z", "B3", 1, "9780241396957"),
("Nom0007", "Өдөр тутамд хэрэглэгдэх Солонгос хэл", "2023-09-18", 270, "HG07", "KOR", "Z", "A6", 3, "9789919017033"),
("Nom0008", "Будда гэгээрлийн түүх", "2023-09-14", 340, "HG06", "MGL", "Z", "A1", 4, "9789997859457"),
("Nom0009", "Модультай тэгшитгэл, тэнцэтгэл биш бодох арга", "2023-08-14", 111, "HG05", "MGL", "Z", "A3", 3, "9785930783254"),
("Nom0010", "Монголын нууц товчоо", "2013-01-01", 278, "HG04", "MGL", "Z", "A8", 3, "9789996223846");

insert into Zohiolchid values
(1, "Nom0001", "ZF0002"),
(2, "Nom0002", "ZF0001"),
(3, "Nom0003", "ZF0005"),
(4, "Nom0004", "ZF0006"),
(5, "Nom0005", "ZF0007"),
(6, "Nom0006", "ZF0008"),
(7, "Nom0007", "ZM0006"),
(8, "Nom0008", "ZF0009"),
(9, "Nom0009", "ZF0010"),
(10, "Nom0010", null);

insert into Nom values
("D1", "9789919517816001", "2019-01-01", 16900, "Nom0001"),
("D2", "9789919518936002", "2019-01-01", 18900, "Nom0002"),
("D3", "9789919517397003", "2019-01-01", 29900, "Nom0003"),
("D4", "9789997850546004", "2020-01-01", 25000, "Nom0004"),
("D5", "9781526648365005", "2020-01-01", 30000, "Nom0005"),
("D6", "9780241396957006", "2021-01-01", 30000, "Nom0006"),
("D7", "9789919017033007", "2021-01-01", 20000, "Nom0007"),
("D8", "9789997859457008", "2022-01-01", 10000, "Nom0008"),
("D9", "9785930783254009", "2022-01-01", 20000, "Nom0009"),
("D10", "9789996223846010", "2023-01-01", 10000, "Nom0010");
insert into Tulbur values
(null, 30000, "2023-01-12 12:20:00", 1, 1),
(null, 20000, "2023-01-12 13:10:00", 2, 4),
(null, 10000, "2023-01-15 14:20:00", 3, 4),
(null, 16900, "2023-02-19 15:34:00", 4, 2),
(null, 20000, "2023-03-11 16:37:00", 5, 2),
(null, 30000, "2023-04-25 17:34:00", 6, 3),
(null, 20000, "2023-07-17 18:13:00", 7, 3),
(null, 18900, "2023-07-21 19:30:00", 8, 2),
(null, 18900, "2023-08-12 14:54:00", 9, 2),
(null, 30000, "2023-08-19 15:23:00", 10, 4);

insert into Zahialga_tuluv values
(null, "2023-01-12 12:19:00", null, 1, 2, "A001"),
(null, "2023-01-12 12:19:00", null, 1, 3, "A001"),
(null, "2023-01-15 13:19:00", null, 2, 2, "A001"),
(null, "2023-01-15 13:19:00", null, 2, 3, "A001"),
(null, "2023-01-20 14:30:00", null, 3, 2, "A002"),
(null, "2023-01-20 14:30:00", null, 3, 1, "A002"),
(null, "2023-01-20 14:30:00", null, 3, 3, "A002"),
(null, "2023-02-15 15:30:00", null, 4, 2, "A002"),
(null, "2023-02-15 15:30:00", null, 4, 4, "A002"),
(null, "2023-03-12 16:45:00", null, 5, 1, "A003"),
(null, "2023-03-12 16:45:00", null, 5, 5, "A003"),
(null, "2023-04-02 17:50:00", null, 6, 2, "A004"),
(null, "2023-04-02 17:50:00", null, 6, 3, "A004"),
(null, "2023-07-18 18:10:00", null, 7, 2, "A001"),
(null, "2023-07-18 18:10:00", null, 7, 3, "A001"),
(null, "2023-07-12 19:50:00", null, 8, 2, "A008"),
(null, "2023-07-12 19:50:00", null, 8, 3, "A008"),
(null, "2023-08-11 14:59:00", null, 9, 2, "A009"),
(null, "2023-08-11 14:59:00", null, 9, 3, "A009"),
(null, "2023-08-12 15:43:00", null, 10,2, "A008"),
(null, "2023-08-12 15:43:00", null, 10,3, "A008");


insert into ZahialgiinDelgerengvi values
(1, 1, "D1"),
(2, 2, "D2"),
(3, 3, "D3"),
(4, 4, "D4"),
(5, 5, "D5"),
(6, 6, "D6"),
(7, 7, "D7"),
(8, 8, "D8"), 
(9, 9, "D9"),
(10, 10, "D10");

select * from ZahialgiinDelgerengvi;