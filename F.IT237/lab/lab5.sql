DROP DATABASE IF EXISTS lab5;
CREATE DATABASE IF NOT EXISTS lab5;
USE lab5;

CREATE TABLE Tulburiin_helberiin_lavlah(
	Tulbur_helber_no varchar(3) primary key,
    Tulbur_helber_ner varchar(100)
);

INSERT INTO Tulburiin_helberiin_lavlah VALUES
    ( "TH1", "Бэлэн мөнгө"),
    ( "TH2", "Карт"),
    ( "TH3", "Данс"),
    ( "TH4", "Банк апп");

CREATE TABLE Teevriin_heregsliin_vildwerlegch(
	Vildwerlegch_no varchar(5) primary key,
    Vildwerlegch_ner varchar(100)
);

INSERT INTO Teevriin_heregsliin_vildwerlegch VALUES 
    ("TV001",'Volvo Buses'),
    ("TV002",'Daimler'),
    ("TV003",'Scania AB'),
    ("TV004",'MAN Truck & Bus'),
    ("TV005",'Marcopolo S.A.'),
    ("TV006",'Toyota'),
    ("TV007",'Nissan'),
    ("TV008",'Honda'),
    ("TV009",'Hyundai'),
    ("TV010",'Kia');

CREATE TABLE Teevriin_heregsliin_mark(
	Teevriin_heregsliin_mark_no varchar(5) primary key,
    Teevriin_heregsliin_mark_ner varchar(100)
);

INSERT INTO Teevriin_heregsliin_mark VALUES
	("TM001","Granbird"),
    ("TM002","Aero"),
    ("TM003","Universe-45"),
    ("TM004","Daewoo BH116"),
    ("TM005","Camry"),
    ("TM006","Prius 30"),
    ("TM007","Daewoo"),
    ("TM008","Sonata"),
    ("TM009","Prius 20");

CREATE TABLE Teevriin_heregsliin_turul(
	Teevriin_heregsliin_turul_no varchar(3) primary key,
    Teevriin_heregsliin_turul_ner varchar(100),
    Suudliin_too int
);

INSERT INTO Teevriin_heregsliin_turul VALUES
	("TT1", 'Суудлын', 4),
	("TT2", 'Бага оврын автобус', 25), 
	("TT3", 'Дунд оврын автобус', 35),
	("TT4", 'Том оврын автобус', 45); 

CREATE TABLE Teevriin_heregsel(
	Teevriin_heregsliin_no varchar(5) primary key,
    Teevriin_heregsliin_turul_no varchar(3),
    Ulsiin_dugaar varchar(10),
    Teevriin_heregsliin_mark_no varchar(5),
    Vildwerlegch_no varchar(5),
    FOREIGN KEY(Teevriin_heregsliin_turul_no) REFERENCES Teevriin_heregsliin_turul(Teevriin_heregsliin_turul_no),
    FOREIGN KEY(Teevriin_heregsliin_mark_no) REFERENCES Teevriin_heregsliin_mark(Teevriin_heregsliin_mark_no),
    FOREIGN KEY(Vildwerlegch_no) REFERENCES Teevriin_heregsliin_vildwerlegch(Vildwerlegch_no)
);

INSERT INTO Teevriin_heregsel VALUES
("TH001", "TT2", "41-72 УНЗ", "TM004", "TV004"),
("TH002", "TT3", "68-39 УЕА", "TM001", "TV001"),
("TH003", "TT4", "65-89 УЕЕ", "TM002", "TV004"),
("TH004", "TT4", "06-90 УНК", "TM003", "TV002"),
("TH005", "TT3", "68-39 УЕА", "TM004", "TV003"),
("TH006", "TT1", "36-39 УБД", "TM006", "TV006"),
("TH007", "TT4", "79-79 УАЕ", "TM001", "TV004"),
("TH008", "TT3", "06-06 УНЦ", "TM003", "TV005"),
("TH009", "TT1", "06-77 УНБ", "TM005", "TV006"),
("TH010", "TT2", "06-64 УНА", "TM007", "TV003");

CREATE TABLE Suudliin_turul_lavlah(
	Suudliin_turul_no varchar(3) primary key,
    Suudliin_turul_ner varchar(50)
);

INSERT INTO Suudliin_turul_lavlah VALUES
("ST1", "Энгийн"),
("ST2", "Хөгжлийн бэрхшээлтэй");

CREATE TABLE Suudal(
	Suudal_no varchar(7) primary key,
    Suudliin_turul_no varchar(3),
    Teevriin_heregsliin_no varchar(5),
    FOREIGN KEY(Suudliin_turul_no) REFERENCES Suudliin_turul_lavlah(Suudliin_turul_no),
    FOREIGN KEY(Teevriin_heregsliin_no) REFERENCES Teevriin_heregsel(Teevriin_heregsliin_no)
);

INSERT INTO Suudal VALUES
("TH00101", "ST2", "TH001"),
("TH00102", "ST2", "TH001"),
("TH00103", "ST1", "TH001"),
("TH00104", "ST1", "TH001"),
("TH00105", "ST1", "TH001"),
("TH00106", "ST1", "TH001"),
("TH00107", "ST1", "TH001"),
("TH00108", "ST1", "TH001"),
("TH00109", "ST1", "TH001"),
("TH00110", "ST1", "TH001"),
("TH00111", "ST1", "TH001"),
("TH00112", "ST1", "TH001"),
("TH00113", "ST1", "TH001"),
("TH00114", "ST1", "TH001"),
("TH00115", "ST1", "TH001"),
("TH00116", "ST1", "TH001"),
("TH00117", "ST1", "TH001"),
("TH00118", "ST1", "TH001"),
("TH00119", "ST1", "TH001"),
("TH00120", "ST1", "TH001"),
("TH00121", "ST1", "TH001"),
("TH00122", "ST1", "TH001"),
("TH00123", "ST1", "TH001"),
("TH00124", "ST1", "TH001"),
("TH00125", "ST1", "TH001"),
    ("TH00201", "ST2", "TH002"),
    ("TH00202", "ST2", "TH002"),
    ("TH00203", "ST1", "TH002"),
    ("TH00204", "ST1", "TH002"),
    ("TH00205", "ST1", "TH002"),
    ("TH00206", "ST1", "TH002"),
    ("TH00207", "ST1", "TH002"),
    ("TH00208", "ST1", "TH002"),
    ("TH00209", "ST1", "TH002"),
    ("TH00210", "ST1", "TH002"),
    ("TH00211", "ST1", "TH002"),
    ("TH00212", "ST1", "TH002"),
    ("TH00213", "ST1", "TH002"),
    ("TH00214", "ST1", "TH002"),
    ("TH00215", "ST1", "TH002"),
    ("TH00216", "ST1", "TH002"),
    ("TH00217", "ST1", "TH002"),
    ("TH00218", "ST1", "TH002"),
    ("TH00219", "ST1", "TH002"),
    ("TH00220", "ST1", "TH002"),
    ("TH00221", "ST1", "TH002"),
    ("TH00222", "ST1", "TH002"),
    ("TH00223", "ST1", "TH002"),
    ("TH00224", "ST1", "TH002"),
    ("TH00225", "ST1", "TH002"),
    ("TH00226", "ST1", "TH002"),
    ("TH00227", "ST1", "TH002"),
    ("TH00228", "ST1", "TH002"),
    ("TH00229", "ST1", "TH002"),
    ("TH00230", "ST1", "TH002"),
    ("TH00231", "ST1", "TH002"),
    ("TH00232", "ST1", "TH002"),
    ("TH00233", "ST1", "TH002"),
    ("TH00234", "ST1", "TH002"),
    ("TH00235", "ST1", "TH002"),
("TH00301", "ST2", "TH003"),
("TH00302", "ST2", "TH003"),
("TH00303", "ST1", "TH003"),
("TH00304", "ST1", "TH003"),
("TH00305", "ST1", "TH003"),
("TH00306", "ST1", "TH003"),
("TH00307", "ST1", "TH003"),
("TH00308", "ST1", "TH003"),
("TH00309", "ST1", "TH003"),
("TH00310", "ST1", "TH003"),
("TH00311", "ST1", "TH003"),
("TH00312", "ST1", "TH003"),
("TH00313", "ST1", "TH003"),
("TH00314", "ST1", "TH003"),
("TH00315", "ST1", "TH003"),
("TH00316", "ST1", "TH003"),
("TH00317", "ST1", "TH003"),
("TH00318", "ST1", "TH003"),
("TH00319", "ST1", "TH003"),
("TH00320", "ST1", "TH003"),
("TH00321", "ST1", "TH003"),
("TH00322", "ST1", "TH003"),
("TH00323", "ST1", "TH003"),
("TH00324", "ST1", "TH003"),
("TH00325", "ST1", "TH003"),
("TH00326", "ST1", "TH003"),
("TH00327", "ST1", "TH003"),
("TH00328", "ST1", "TH003"),
("TH00329", "ST1", "TH003"),
("TH00330", "ST1", "TH003"),
("TH00331", "ST1", "TH003"),
("TH00332", "ST1", "TH003"),
("TH00333", "ST1", "TH003"),
("TH00334", "ST1", "TH003"),
("TH00335", "ST1", "TH003"),
("TH00336", "ST1", "TH003"),
("TH00337", "ST1", "TH003"),
("TH00338", "ST1", "TH003"),
("TH00339", "ST1", "TH003"),
("TH00340", "ST1", "TH003"),
("TH00341", "ST1", "TH003"),
("TH00342", "ST1", "TH003"),
("TH00343", "ST1", "TH003"),
("TH00344", "ST1", "TH003"),
("TH00345", "ST1", "TH003"),
    ("TH00401", "ST2", "TH004"),
    ("TH00402", "ST2", "TH004"),
    ("TH00403", "ST1", "TH004"),
    ("TH00404", "ST1", "TH004"),
    ("TH00405", "ST1", "TH004"),
    ("TH00406", "ST1", "TH004"),
    ("TH00407", "ST1", "TH004"),
    ("TH00408", "ST1", "TH004"),
    ("TH00409", "ST1", "TH004"),
    ("TH00410", "ST1", "TH004"),
    ("TH00411", "ST1", "TH004"),
    ("TH00412", "ST1", "TH004"),
    ("TH00413", "ST1", "TH004"),
    ("TH00414", "ST1", "TH004"),
    ("TH00415", "ST1", "TH004"),
    ("TH00416", "ST1", "TH004"),
    ("TH00417", "ST1", "TH004"),
    ("TH00418", "ST1", "TH004"),
    ("TH00419", "ST1", "TH004"),
    ("TH00420", "ST1", "TH004"),
    ("TH00421", "ST1", "TH004"),
    ("TH00422", "ST1", "TH004"),
    ("TH00423", "ST1", "TH004"),
    ("TH00424", "ST1", "TH004"),
    ("TH00425", "ST1", "TH004"),
    ("TH00426", "ST1", "TH004"),
    ("TH00427", "ST1", "TH004"),
    ("TH00428", "ST1", "TH004"),
    ("TH00429", "ST1", "TH004"),
    ("TH00430", "ST1", "TH004"),
    ("TH00431", "ST1", "TH004"),
    ("TH00432", "ST1", "TH004"),
    ("TH00433", "ST1", "TH004"),
    ("TH00434", "ST1", "TH004"),
    ("TH00435", "ST1", "TH004"),
    ("TH00436", "ST1", "TH004"),
    ("TH00437", "ST1", "TH004"),
    ("TH00438", "ST1", "TH004"),
    ("TH00439", "ST1", "TH004"),
    ("TH00440", "ST1", "TH004"),
    ("TH00441", "ST1", "TH004"),
    ("TH00442", "ST1", "TH004"),
    ("TH00443", "ST1", "TH004"),
    ("TH00444", "ST1", "TH004"),
    ("TH00445", "ST1", "TH004"),
("TH00501", "ST2", "TH005"),
("TH00502", "ST2", "TH005"),
("TH00503", "ST1", "TH005"),
("TH00504", "ST1", "TH005"),
("TH00505", "ST1", "TH005"),
("TH00506", "ST1", "TH005"),
("TH00507", "ST1", "TH005"),
("TH00508", "ST1", "TH005"),
("TH00509", "ST1", "TH005"),
("TH00510", "ST1", "TH005"),
("TH00511", "ST1", "TH005"),
("TH00512", "ST1", "TH005"),
("TH00513", "ST1", "TH005"),
("TH00514", "ST1", "TH005"),
("TH00515", "ST1", "TH005"),
("TH00516", "ST1", "TH005"),
("TH00517", "ST1", "TH005"),
("TH00518", "ST1", "TH005"),
("TH00519", "ST1", "TH005"),
("TH00520", "ST1", "TH005"),
("TH00521", "ST1", "TH005"),
("TH00522", "ST1", "TH005"),
("TH00523", "ST1", "TH005"),
("TH00524", "ST1", "TH005"),
("TH00525", "ST1", "TH005"),
("TH00526", "ST1", "TH005"),
("TH00527", "ST1", "TH005"),
("TH00528", "ST1", "TH005"),
("TH00529", "ST1", "TH005"),
("TH00530", "ST1", "TH005"),
("TH00531", "ST1", "TH005"),
("TH00532", "ST1", "TH005"),
("TH00533", "ST1", "TH005"),
("TH00534", "ST1", "TH005"),
("TH00535", "ST1", "TH005"),
    ("TH00601", "ST1", "TH006"),
    ("TH00602", "ST1", "TH006"),
    ("TH00603", "ST1", "TH006"),
    ("TH00604", "ST1", "TH006"),
("TH00701", "ST2", "TH007"),
("TH00702", "ST2", "TH007"),
("TH00703", "ST1", "TH007"),
("TH00704", "ST1", "TH007"),
("TH00705", "ST1", "TH007"),
("TH00706", "ST1", "TH007"),
("TH00707", "ST1", "TH007"),
("TH00708", "ST1", "TH007"),
("TH00709", "ST1", "TH007"),
("TH00710", "ST1", "TH007"),
("TH00711", "ST1", "TH007"),
("TH00712", "ST1", "TH007"),
("TH00713", "ST1", "TH007"),
("TH00714", "ST1", "TH007"),
("TH00715", "ST1", "TH007"),
("TH00716", "ST1", "TH007"),
("TH00717", "ST1", "TH007"),
("TH00718", "ST1", "TH007"),
("TH00719", "ST1", "TH007"),
("TH00720", "ST1", "TH007"),
("TH00721", "ST1", "TH007"),
("TH00722", "ST1", "TH007"),
("TH00723", "ST1", "TH007"),
("TH00724", "ST1", "TH007"),
("TH00725", "ST1", "TH007"),
("TH00726", "ST1", "TH007"),
("TH00727", "ST1", "TH007"),
("TH00728", "ST1", "TH007"),
("TH00729", "ST1", "TH007"),
("TH00730", "ST1", "TH007"),
("TH00731", "ST1", "TH007"),
("TH00732", "ST1", "TH007"),
("TH00733", "ST1", "TH007"),
("TH00734", "ST1", "TH007"),
("TH00735", "ST1", "TH007"),
("TH00736", "ST1", "TH007"),
("TH00737", "ST1", "TH007"),
("TH00738", "ST1", "TH007"),
("TH00739", "ST1", "TH007"),
("TH00740", "ST1", "TH007"),
("TH00741", "ST1", "TH007"),
("TH00742", "ST1", "TH007"),
("TH00743", "ST1", "TH007"),
("TH00744", "ST1", "TH007"),
("TH00745", "ST1", "TH007"),
    ("TH00801", "ST2", "TH008"),
    ("TH00802", "ST2", "TH008"),
    ("TH00803", "ST1", "TH008"),
    ("TH00804", "ST1", "TH008"),
    ("TH00805", "ST1", "TH008"),
    ("TH00806", "ST1", "TH008"),
    ("TH00807", "ST1", "TH008"),
    ("TH00808", "ST1", "TH008"),
    ("TH00809", "ST1", "TH008"),
    ("TH00810", "ST1", "TH008"),
    ("TH00811", "ST1", "TH008"),
    ("TH00812", "ST1", "TH008"),
    ("TH00813", "ST1", "TH008"),
    ("TH00814", "ST1", "TH008"),
    ("TH00815", "ST1", "TH008"),
    ("TH00816", "ST1", "TH008"),
    ("TH00817", "ST1", "TH008"),
    ("TH00818", "ST1", "TH008"),
    ("TH00819", "ST1", "TH008"),
    ("TH00820", "ST1", "TH008"),
    ("TH00821", "ST1", "TH008"),
    ("TH00822", "ST1", "TH008"),
    ("TH00823", "ST1", "TH008"),
    ("TH00824", "ST1", "TH008"),
    ("TH00825", "ST1", "TH008"),
    ("TH00826", "ST1", "TH008"),
    ("TH00827", "ST1", "TH008"),
    ("TH00828", "ST1", "TH008"),
    ("TH00829", "ST1", "TH008"),
    ("TH00830", "ST1", "TH008"),
    ("TH00831", "ST1", "TH008"),
    ("TH00832", "ST1", "TH008"),
    ("TH00833", "ST1", "TH008"),
    ("TH00834", "ST1", "TH008"),
    ("TH00835", "ST1", "TH008"),
("TH00901", "ST1", "TH009"),
("TH00902", "ST1", "TH009"),
("TH00903", "ST1", "TH009"),
("TH00904", "ST1", "TH009"),
    ("TH01001", "ST2", "TH010"),
    ("TH01002", "ST2", "TH010"),
    ("TH01003", "ST1", "TH010"),
    ("TH01004", "ST1", "TH010"),
    ("TH01005", "ST1", "TH010"),
    ("TH01006", "ST1", "TH010"),
    ("TH01007", "ST1", "TH010"),
    ("TH01008", "ST1", "TH010"),
    ("TH01009", "ST1", "TH010"),
    ("TH01010", "ST1", "TH010"),
    ("TH01011", "ST1", "TH010"),
    ("TH01012", "ST1", "TH010"),
    ("TH01013", "ST1", "TH010"),
    ("TH01014", "ST1", "TH010"),
    ("TH01015", "ST1", "TH010"),
    ("TH01016", "ST1", "TH010"),
    ("TH01017", "ST1", "TH010"),
    ("TH01018", "ST1", "TH010"),
    ("TH01019", "ST1", "TH010"),
    ("TH01020", "ST1", "TH010"),
    ("TH01021", "ST1", "TH010"),
    ("TH01022", "ST1", "TH010"),
    ("TH01023", "ST1", "TH010"),
    ("TH01024", "ST1", "TH010"),
    ("TH01025", "ST1", "TH010");
CREATE TABLE Zorchigch(
	Zorchigchiin_code varchar(10) primary key,
    Ovog varchar(50),
    Ner varchar(50),
    RD varchar(10),
    Utasnii_dugaar varchar(8)
);

INSERT INTO Zorchigch VALUES
("ZO00000001", "Төгөлдөр", "Сүхбат", "УА80112309", "88321467"),
("ZO00000002", "Балдан", "Эгшиглэн", "УВ90101313", "99862364"),
("ZO00000003", "Эрдэнэ", "Эрдэнэбилгүүн", "УЖ10102304", "89763872"),
("ZO00000004", "Галбадрах", "Ирээдүй", "ЛЛ98050323", "80873269"),
("ZO00000005", "Сүх", "Отгонтуяа", "ТА19112059", "91273643"),
("ZO00000006", "Ганхуяг", "Батцэрэн", "ЗГ03310606", "90641222"),
("ZO00000007", "Одбаяр", "Номин", "ЗА89082367", "91631222"),
("ZO00000008", "Нарансүх", "Хулан", "ЙА97021189", "90635422"),
("ZO00000009", "Очир", "Чанарав", "УД01212873", "96413322"),
("ZO00000010", "Цэрэн", "Пүрэв", "ЗГ03250706", "89123456"),
("ZO00000011", "Болд-Эрдэнэ", "Ариунаа", "ЗД89120626", "89896213"),
("ZO00000012", "Бат", "Батбаатар", "ЗА89072367", "91631226"),
("ZO00000013", "Наран", "Саран", "ЙА97021089", "90635423"),
("ZO00000014", "Алтантулга", "Буянхишиг", "ТА90112314", "89090965"),
("ZO00000015", "Баяр", "Эрдэнэбат", "ЗГ03250706", "99113355");

CREATE TABLE Suudliin_tuluv_lavlah(
	Suudliin_tuluv_no varchar(4) primary key,
    Suudliin_tuluv_ner varchar(50)
);

INSERT INTO Suudliin_tuluv_lavlah VALUES
("STL1", "Сул суудал"),
("STL2", "Захиалсан"),
("STL3", "Суусан"),
("STL4", "Суугаагүй");

CREATE TABLE Ajiltan_turul(
	Ajiltan_turul_no varchar(3) primary key,
    Ajiltan_turul_ner varchar(50)
);

INSERT INTO Ajiltan_turul VALUES
("AT1","Захирал"),
("AT2","Менежер"),
("AT3","Жолооч"),
("AT4","Оператор");

CREATE TABLE Urtuu(
	Urtuu_no int primary key,
    Urtuu_ner varchar(100)
);

INSERT INTO Urtuu VALUES
(1, "Ар.Өлзийт"),
(2, "Ар.Хайрхан"),
(3, "Ар.Эрдэнэмандал "),
(4, "Ар.Жаргалант"), 
(5, "Ар.Ихтамир "),
(6, "Ар.Өндөр-Улаан"),
(7, "Ар.Чулуутын гүүр"),
(8, "Ар.Тариат"),
(9, "Ар.Цэцэрлэг"),
(10, "Ар.Хотонт"),
(11, "Ар.Цэнхэр"),
(12, "Ар.Эрдэнэбулган"),
(13, "Өв.Нарийнтээл "),
(14, "Бн.Өлзийт"),
(15, "Бн.Баянхонгор"),
(16, "Бө.Өлгий"),
(17, "Бу.Булган"),
(18, "Бн.Бөмбөгөр"),
(19, "Бн.Бууцагаан"),
(20, "Го.Дэлгэр"),
(21, "Го.Есөнбулаг"),
(22, "Тө.Баянчандмань"),
(23, "Сэ.Баянгол"),
(24, "Да.Дархан"),
(25, "Да.Шарын гол"),
(26, "Гс.Чойр"),
(27, "Дг.Даланжаргалан"),
(28, "Дг.Айраг"),
(29, "Дг.Сайншанд"),
(30, "Хэ.Норовлин"),
(31, "До.Баян-Уул" ),
(32, "До.Баяндун"),
(33, "До.Дашбалбар"),
(34, "Хэ.Бэрх"),
(35, "Хэ.Норовлин"),
(36, "До.Баян-Уул"),
(37, "Сү.Түмэнцогт"),
(38, "До.Хөлөнбуйр"),
(39, "До.Хэрлэн"),
(40, "Ду.Дэлгэрцогт"),
(41, "Ду.Сайнцагаан"),
(42, "Ду.Луус"),
(43, "Ду.Хулт"),
(44, "Ду.Сайхан-Овоо"),
(45, "Сонгиохайрхан ЗТТөв"),
(46, "Баянзүрх ЗТТөв");


CREATE TABLE Nasnii_angilal(
	Nasnii_angilal_no varchar(2) primary key,
    Nasnii_angilal_ner varchar(50)
);

INSERT INTO Nasnii_angilal VALUES
("HV", "Хүүхэд"),
("TO", "Том хүн");

CREATE TABLE Chiglel(
	Chiglel_ID varchar(5) primary key,
    Chiglel_ner varchar(100),
    Chiglel_vne decimal(10,2)
);

INSERT INTO Chiglel VALUES
("CH001", "Сонгиохайрхан ЗТТөв - Ар. Жаргалант", 42800.00),
("CH002", "Сонгиохайрхан ЗТТөв - Ар.Тариат", 55000.00),
("CH003", "Сонгиохайрхан ЗТТөв - Ар.Цэцэрлэг", 42000.00),
("CH004", "Сонгиохайрхан ЗТТөв - Ар.Эрдэнэбулган", 45000.00),
("CH005", "Сонгиохайрхан ЗТТөв - Бн.Баянхонгор", 48000.00),
("CH006", "Сонгиохайрхан ЗТТөв - Бө.Баян-Өлгий", 128000.00),
("CH007", "Сонгиохайрхан ЗТТөв - Бу.Булган", 32800.00),
("CH008", "Сонгиохайрхан ЗТТөв - Го.Есөнбулаг" , 76000.00),
("CH009", "Сонгиохайрхан ЗТТөв - Дархан-Уул", 20000.00),
("CH010", "Сонгиохайрхан ЗТТөв - Да.Шарын гол", 20000.00),
("CH011", "Баянзүрх ЗТТөв - Дг.Сайншанд", 33600.00),
("CH012", "Баянзүрх ЗТТөв - До.Дашбалбар", 56700.00),
("CH013", "Баянзүрх ЗТТөв - До.Баян-Уул", 60000.00),
("CH014", "Баянзүрх ЗТТөв - До.Хэрлэн", 60000.00),
("CH015", "Баянзүрх ЗТТөв - Ду.Сайхан-Овоо", 37800.00);

CREATE TABLE Marshrut(
	Marshrut_no varchar(5) primary key,
    Chiglel_ID varchar(5),
    Urtuu_no1 int,
    Urtuu_no2 int,
    Daraalliin_dugaar int,
    FOREIGN KEY(Chiglel_ID) REFERENCES Chiglel(Chiglel_ID),
    FOREIGN KEY(Urtuu_no1) REFERENCES Urtuu(Urtuu_no),
    FOREIGN KEY(Urtuu_no2) REFERENCES Urtuu(Urtuu_no)
);

INSERT INTO Marshrut VALUES
("M0001", "CH001", 45, 1, 1),
("M0002", "CH001", 1, 2, 2),
("M0003", "CH001", 2, 3, 3),
("M0004", "CH001", 3, 4, 4),
	("M0005", "CH002", 45, 5, 1),
	("M0006", "CH002", 5, 6, 2),
	("M0007", "CH002", 6, 7, 3),
	("M0008", "CH002", 7, 8, 4),
("M0009", "CH003", 45, 1, 1),
("M0010", "CH003", 1, 2, 2),
("M0011", "CH003", 2, 3, 3),
("M0012", "CH003", 3, 9, 4),
	("M0013", "CH004", 45, 10, 1),
	("M0014", "CH004", 10, 11, 2),
	("M0015", "CH004", 11, 12, 3),
("M0016", "CH005", 45, 13, 1),
("M0017", "CH005", 13, 14, 2),
("M0018", "CH005", 14, 15, 3),
	("M0019", "CH006", 45, 16, 1),
("M0020", "CH007", 45, 17, 1),
	("M0021", "CH008", 45, 18, 1),
	("M0022", "CH008", 18, 19, 2),
	("M0023", "CH008", 19, 20, 3),
	("M0024", "CH008", 20, 21, 4),
("M0025", "CH009", 45, 22, 1),
("M0026", "CH009", 22, 23, 2),
("M0027", "CH009", 23, 24, 3),
	("M0028", "CH010", 45, 25, 1),
("M0029", "CH011", 46, 26, 1),
("M0030", "CH011", 26, 27, 2),
("M0031", "CH011", 27, 28, 3),
("M0032", "CH011", 28, 29, 4),
	("M0033", "CH012", 46, 30, 1),
	("M0034", "CH012", 30, 31, 2),
	("M0035", "CH012", 31, 32, 3),
	("M0036", "CH012", 32, 33, 4),
("M0037", "CH013", 46, 33, 1),
("M0038", "CH013", 34, 35, 2),
("M0039", "CH013", 35, 36, 3),
	("M0040", "CH014", 46, 37, 1),
	("M0041", "CH014", 37, 38, 2),
	("M0042", "CH014", 38, 39, 3),
("M0043", "CH015", 46, 40, 1),
("M0044", "CH015", 40, 41, 2),
("M0045", "CH015", 41, 42, 3),
("M0046", "CH015", 42, 43, 4),
("M0047", "CH015", 43, 44, 5);

CREATE TABLE Tarif(
	Tarif_no int primary key,
    Marshrut_no varchar(5),
    Nasnii_angilal_no varchar(2),
    Vne decimal(10,2),
    FOREIGN KEY(Marshrut_no) REFERENCES Marshrut(Marshrut_no)
);

INSERT INTO Tarif VALUES
(1,"M0001","HV", 28000.00),
(2,"M0001","TO", 14000.00),
(3,"M0002","HV", 6500.00),
(4,"M0002","TO", 3250.00),
(5,"M0003","HV", 3800.00),
(6,"M0003","TO", 1900.00),
(7,"M0004","HV", 4500.00),
(8,"M0004","TO", 2250.00),
(9,"M0005","HV", 33000.00),
(10,"M0005","TO", 16500.00),
(11,"M0006","HV", 15000.00),
(12,"M0006","TO", 7500.00),
(13,"M0007","HV", 2000.00),
(14,"M0007","TO", 1000.00),
(15,"M0008","HV", 2000.00),
(16,"M0008","TO", 1000.00),
(17,"M0009","HV", 5000.00),
(18,"M0009","TO", 2500.00),
(19,"M0010","HV", 28000.00),
(20,"M0010","TO", 14000.00),
(21,"M0011","HV", 6500.00),
(22,"M0011","TO", 3250.00),
(23,"M0012","HV", 3800.00),
(24,"M0012","TO", 1900.00),
(25,"M0013","HV", 3700.00),
(26,"M0013","TO", 1850.00),
(27,"M0014","HV", 37000.00),
(28,"M0014","TO", 18500.00),
(29,"M0015","HV", 6000.00),
(30,"M0015","TO", 3000.00),
(31,"M0016","HV", 2000.00),
(32,"M0016","TO", 1000.00),
(33,"M0017","HV", 42000.00),
(34,"M0017","TO", 21000.00),
(35,"M0018","HV", 4600.00),
(36,"M0018","TO", 2300.00),
(37,"M0019","HV", 1400.00),
(38,"M0019","TO", 700.00),
(39,"M0020","HV", 128000.00),
(40,"M0020","TO", 64000.00),
(41,"M0021","HV", 32800.00),
(42,"M0021","TO", 16400.00),
(43,"M0022","HV", 55000.00),
(44,"M0022","TO", 27500.00),
(45,"M0023","HV", 6000.00),
(46,"M0023","TO", 3000.00),
(47,"M0024","HV", 9000.00),
(48,"M0024","TO", 4500.00),
(49,"M0025","HV", 6000.00),
(50,"M0025","TO", 3000.00),
(51,"M0026","HV", 10000.00),
(52,"M0026","TO", 5000.00),
(53,"M0027","HV", 5000.00),
(54,"M0027","TO", 2500.00),
(55,"M0028","HV", 5000.00),
(56,"M0028","TO", 2500.00),
(57,"M0029","HV", 20000.00),
(58,"M0029","TO", 10000.00),
(59,"M0030","HV", 16600.00),
(60,"M0030","TO", 8300.00),
(61,"M0031","HV", 5800.00),
(62,"M0031","TO", 2900.00),
(63,"M0032","HV", 1900.00),
(64,"M0032","TO", 950.00),
(65,"M0033","HV", 9300.00),
(66,"M0033","TO", 4650.00),
(67,"M0034","HV", 40400.00),
(68,"M0034","TO", 20200.00),
(69,"M0035","HV", 5200.00),
(70,"M0035","TO", 2600.00),
(71,"M0036","HV", 4800.00),
(72,"M0036","TO", 2400.00),
(73,"M0037","HV", 7200.00),
(74,"M0037","TO", 3600.00),
(75,"M0038","HV", 30000.00),
(76,"M0038","TO", 15000),
(77,"M0039","HV", 22000.00),
(78,"M0039","TO", 11000.00),
(79,"M0040","HV", 8000.00),
(80,"M0040","TO", 4000.00),
(81,"M0041","HV", 42000.00),
(82,"M0041","TO", 21000.00),
(83,"M0042","HV", 6000.00),
(84,"M0042","TO", 3000.00),
(85,"M0043","HV", 12000.00),
(86,"M0043","TO", 6000.00),
(87,"M0044","HV", 17400.00),
(88,"M0044","TO", 8700.00),
(89,"M0045","HV", 3200.00),
(90,"M0045","TO", 1600.00),
(91,"M0046","HV", 3700.00),
(92,"M0046","TO", 1850.00),
(93,"M0047","HV", 2700.00),
(94,"M0047","TO", 1350.00);


CREATE TABLE Hungulultiin_turul_lavlah(
	Hungulultiin_turul_no varchar(3) primary key,
    Hungulultiin_turul_ner varchar(50), 
    Vniin_cof double
);

INSERT INTO Hungulultiin_turul_lavlah VALUES
("H01", "+5 суудал захиалсан", 0.97),
("H02", "+10 суудал захиалсан", 0.9);

CREATE TABLE Aylal(
	Aylal_no varchar(8) primary key,
    Chiglel_ID varchar(5),
    Hudluh_ognoo timestamp,
    Teevriin_heregsliin_no varchar(5),
    FOREIGN KEY(Chiglel_ID) REFERENCES Chiglel(Chiglel_ID),
    FOREIGN KEY(Teevriin_heregsliin_no) REFERENCES Teevriin_heregsel(Teevriin_heregsliin_no)    
);

INSERT INTO Aylal VALUES
("A0000001", "CH001", "2023-11-20 08:00:00", "TH001"),
("A0000002", "CH001", "2023-11-20 13:30:00", "TH002"),
("A0000003", "CH002", "2023-11-20 09:00:00", "TH003"),
("A0000004", "CH002", "2023-11-21 10:00:00", "TH004"),
("A0000005", "CH005", "2023-11-21 18:00:00", "TH005"),
("A0000006", "CH006", "2023-11-22 08:00:00", "TH001"),
("A0000007", "CH007", "2023-11-22 14:00:00", "TH006"),
("A0000008", "CH008", "2023-11-22 10:30:00", "TH007"),
("A0000009", "CH009", "2023-11-23 15:45:00", "TH009"),
("A0000010", "CH010", "2023-11-24 12:20:00", "TH008"),
("A0000011", "CH011", "2023-11-24 17:00:00", "TH010"),
("A0000012", "CH012", "2023-11-24 08:00:00", "TH006"),
("A0000013", "CH013", "2023-11-25 15:00:00", "TH008"),
("A0000014", "CH014", "2023-11-26 12:00:00", "TH002"),
("A0000015", "CH015", "2023-11-27 13:00:00", "TH003");

CREATE TABLE Ajiltan(
	Ajiltnii_code varchar(10) primary key,
    Ovog varchar(50),
    Ner varchar(50),
    RD varchar(10),
    Hvis varchar(2),
    Utasnii_dugaar varchar(8),
    Email varchar(100),
    Ajiltan_turul_no varchar(3),
    Nevtreh_ner varchar(50),
    Nuuts_vg varchar(50),
    Ajillaj_ehelsen_ognoo date,
    foreign key(Ajiltan_turul_no) references Ajiltan_turul(Ajiltan_turul_no)
);

INSERT INTO Ajiltan VALUES
("A001", "Галбадрах","Номин","ЗХ90120834", "эм", "99892988", "nomin@gmail.com", "AT1", "nomio", "nomi2988", "2021-11-01"),
("A002", "Содном","Одгэрэл" ,"ЗХ97121824", "эм", "89983421", "odgerel@gmail.com" , "AT2", "odgerel", "odG1824", "2020-10-21"),
("A003", "Амартүвшин","Эгшиглэн","НГ89310554", "эм", "91283742", "egshiglen@gmail.com", "AT3", "egshig","0909", "2020-12-01"),
("A004", "Гаадан","Билгүүн","ЭГ72221495", "эр", "91129876", "bilgvvn@gmail.com", "AT3", "bilgvvn", "bek897", "2020-08-23"),
("A005", "Очир","Мягмар", "ЗГ77310607","эр" ,"95127281", "myagmar@gmail.com","AT3", "myagmar", "myagmar56", "2021-01-01"),
("A006", "Өлзийсайхан","Ариунтуяа","МГ89122738", "эм", "88774334", "ariuna@gmail.com","AT3", "ariuk", "ari987", "2019-01-01"),
("A007", "Энхбаяр","Болор", "ЛД88121378", "эм", "90099880", "bolor@gmail.com","AT3", "bolor", "blr235", "2019-01-01"),
("A008", "Гочоо","Болд","ЗХ84220833",  "эр", "99771274", "bold@gmail.com","AT4", "bold", "bld421", "2019-01-01"),
("A009", "Даш","Дорж","ЛД88121379", "эр", "96208754", "dorj@gmail.com","AT4", "dorj", "sdfg32", "2019-01-01"),
("A010", "Батбаяр","Саруул","ХГ91123037",  "эр", "80982342", "saruul@gmail.com","AT4", "saruul", "sar45","2019-01-01");
CREATE TABLE AylalBaJolooch(
	AylalBaJolooch int primary key,
    Aylal_no varchar(8),
    Ajiltnii_code varchar(10),
    FOREIGN KEY(Aylal_no) REFERENCES Aylal(Aylal_no),
    FOREIGN KEY(Ajiltnii_code) REFERENCES Ajiltan(Ajiltnii_code)
);

INSERT INTO AylalBaJolooch VALUES
(1, "A0000001", "A001"),
(2, "A0000002", "A002"),
(3, "A0000003", "A003"),
(4, "A0000004", "A004"),
(5, "A0000005", "A005"),
(6, "A0000006", "A006"),
(7, "A0000007", "A007"),
(8, "A0000008", "A008"),
(9, "A0000009", "A009"),
(10, "A0000010", "A010"),
(11, "A0000011", "A001"),
(12, "A0000012", "A003"),
(13, "A0000013", "A004"),
(14, "A0000014", "A007"),
(15, "A0000015", "A002"),
(16, "A0000001", "A006"),
(17, "A0000002", "A007"),
(18, "A0000004", "A003"),
(19, "A0000005", "A004"),
(20, "A0000006", "A005");

CREATE TABLE Zahialgiin_tuluv_lavlah(
	Zahialgiin_tuluv_lavlah_no varchar(5) primary key,
    Zahialgiin_tuluv_lavlah_ner varchar(50)
);

INSERT INTO Zahialgiin_tuluv_lavlah VALUES
    ("ZTL01", "Баталгаажаагүй"),
    ("ZTL02", "Баталгаажсан"),
    ("ZTL03", "Буцаасан"),
    ("ZTL04", "Цуцлагдсан");

CREATE TABLE Zahialagch(
	Zahialagchiin_code varchar(10) primary key,
    Ovog varchar(10),
    Ner varchar(10),
    Email varchar(100),
    Nevtreh_ner varchar(50),
    Nuuts_vg varchar(50)
);

INSERT INTO Zahialagch VALUES
	("ZA00000001", "Очир", "Батбаяр", "batbayr@gmail.com", "batbayr", "batbayr"),
    ("ZA00000002", "Гомбо","Оюунбилэг", "oyunbileg@gmail.com", "oyunbileg", "oyunbileg"),
    ("ZA00000003", "Сүрэн","Ану", "anu@gmail.com", "anu", "anu"),
    ("ZA00000004", "Гаадан","Хишигбат","hishigbat@gmail.com", "hishigbat", "hishigbat"),
    ("ZA00000005", "Билгүүн59","Тэнгэр", "tenger@gmail.com", "tenger", "tenger"),
    ("ZA00000006", "Туяа" ,"Мөнхцэцэг", "munhtsetseg@gmail.com", "munhtsetseg", "munhtsetseg"),
    ("ZA00000007", "Мөнх", "Энхжаргал", "enhjargal@gmail.com", "enhjargal", "enhjargal"),
    ("ZA00000008", "Эрдэнэ","Амарсайхан", "amarsaihan@gmail.com", "amarsaihan", "amarsaihan"),
    ("ZA00000009", "Баяр" ,"Саран", "saran@gmail.com", "saran", "saran"),
    ("ZA00000010", "Долгор","Ганболд", "ganbold@gmail.com", "ganbold", "ganbold");

CREATE TABLE Zahialga(
	Zahialgiin_code int primary key,
    Zahialgiin_ognoo datetime,
    Ajiltnii_code varchar(10),
    Zahialagchiin_code varchar(10),
    Hungulultiin_turul_no varchar(3),
    FOREIGN KEY(Ajiltnii_code) REFERENCES Ajiltan(Ajiltnii_code),
    FOREIGN KEY(Zahialagchiin_code) REFERENCES Zahialagch(Zahialagchiin_code),
    FOREIGN KEY(Hungulultiin_turul_no) REFERENCES Hungulultiin_turul_lavlah(Hungulultiin_turul_no) 
);

INSERT INTO Zahialga VALUES
(1, "2023-11-11 10:10:00", "A004", "ZA00000001", null),
(2, "2023-11-12 14:25:01", "A003", "ZA00000002", null),
(3, "2023-11-13 18:23:23", "A005", "ZA00000003", null),
(4, "2023-11-14 15:12:06", "A006", "ZA00000004", null),
(5, "2023-11-15 14:50:02", "A007", "ZA00000005", null),
(6, "2023-11-16 20:00:50", "A003", "ZA00000006", null),
(7, "2023-11-17 21:06:10", "A004", "ZA00000007", null),
(8, "2023-11-18 22:30:16", "A005", "ZA00000008", null),
(9, "2023-11-19 09:34:38", "A006", "ZA00000009", null),
(10, "2023-11-20 19:40:15", "A007", "ZA00000010", null);

CREATE TABLE Zahialgiin_tuluv(
	Zahialgiin_tuluv_no int primary key,
    Tailbar varchar(255),
    Ognoo datetime,
    Zahialgiin_tuluv_lavlah_no varchar(5),
    Zahialgiin_code int,
    FOREIGN KEY(Zahialgiin_tuluv_lavlah_no) REFERENCES Zahialgiin_tuluv_lavlah(Zahialgiin_tuluv_lavlah_no),
    FOREIGN KEY(Zahialgiin_code) REFERENCES Zahialga(Zahialgiin_code)
);

INSERT INTO Zahialgiin_tuluv VALUES
(1,null, "2023-11-11 10:11:00", "ZTL01", 1),
(2,null, "2023-11-12 14:26:23", "ZTL02", 2),
(3,null, "2023-11-13 18:24:05", "ZTL03", 3),
(4,null, "2023-11-14 15:15:46", "ZTL02", 4),
(5,null, "2023-11-15 14:52:12", "ZTL02", 5),
(6,null, "2023-11-16 20:01:30", "ZTL02", 6),
(7,null, "2023-11-17 21:07:20", "ZTL02", 7),
(8,null, "2023-11-17 21:07:20", "ZTL02", 8),
(9,null, "2023-11-18 22:33:46", "ZTL03", 9),
(10,null, "2023-11-19 09:38:18", "ZTL01", 10);

CREATE TABLE Zahialgiin_detail(
	Zahialgiin_detail_no int primary key,
    Zahialgiin_code int,
    Zorchigchiin_code varchar(10),
    Suudal_no varchar(7),
    Suudliin_tuluv_no varchar(4),
    Aylal_no varchar(8),
    FOREIGN KEY(Zahialgiin_code) REFERENCES Zahialga(Zahialgiin_code),
    FOREIGN KEY(Zorchigchiin_code) REFERENCES Zorchigch(Zorchigchiin_code),
    FOREIGN KEY(Suudal_no) REFERENCES Suudal(Suudal_no),
    FOREIGN KEY(Suudliin_tuluv_no) REFERENCES Suudliin_tuluv_lavlah(Suudliin_tuluv_no),
    FOREIGN KEY(Aylal_no) REFERENCES Aylal(Aylal_no)
);
INSERT INTO Zahialgiin_detail VALUES
(1, 1, "ZO00000001","TH00101", "STL1", "A0000001"),
(2, 2, "ZO00000001","TH00201", "STL1", "A0000002"),
(3, 2, "ZO00000002","TH00202", "STL1", "A0000002"),
(4, 2, "ZO00000003","TH00203", "STL1", "A0000002"),
(5, 2, "ZO00000004","TH00204", "STL1", "A0000002"),
(6, 2, "ZO00000005","TH00205", "STL1", "A0000002"),
(7, 2, "ZO00000006","TH00206", "STL1", "A0000002"),
(8, 3, "ZO00000001","TH00301", "STL1", "A0000003"),
(9, 3, "ZO00000002","TH00302", "STL1", "A0000003"),
(10, 3, "ZO00000003","TH00305", "STL1", "A0000003"),
(11, 3, "ZO00000004","TH00306", "STL1", "A0000003"),
(12, 3, "ZO00000005","TH00310", "STL1", "A0000003"),
(13, 3, "ZO00000006","TH00311", "STL1", "A0000003"),
(14, 3, "ZO00000007","TH00315", "STL1", "A0000003"),
(15, 3, "ZO00000008","TH00317", "STL1", "A0000003"),
(16, 3, "ZO00000009","TH00313", "STL1", "A0000003"),
(17, 3, "ZO00000010","TH00327", "STL1", "A0000003"),
(18, 4, "ZO00000011","TH00428", "STL1", "A0000004"),
(19, 5, "ZO00000012","TH00501", "STL1", "A0000005"),
(20, 6, "ZO00000013","TH00101", "STL1", "A0000006"),
(21, 7, "ZO00000014","TH00601", "STL1", "A0000007"),
(22, 7, "ZO00000015","TH00604", "STL1", "A0000007"),
(23, 8, "ZO00000001","TH00706", "STL1", "A0000008"),
(24, 8, "ZO00000002","TH00708", "STL1", "A0000008"),
(25, 9, "ZO00000005","TH00902", "STL1", "A0000009"),
(26, 9, "ZO00000004","TH00904", "STL1", "A0000009"),
(27, 10, "ZO00000007","TH00808", "STL1", "A0000010"),
(28, 10, "ZO00000009","TH00810", "STL1", "A0000010"),
(29, 10, "ZO00000011","TH00813", "STL1", "A0000010"),
(30, 10, "ZO00000015","TH00814", "STL1", "A0000010");

CREATE TABLE Tulbur(
	Tulburiin_code varchar(10) primary key,
    Zahialgiin_code int ,
    Tulbur_tulsun_ognoo datetime,
    Tulbur_helber_no varchar(3),
    Tuluh_dvn decimal(10,2),
    FOREIGN KEY(Zahialgiin_code) REFERENCES Zahialga(Zahialgiin_code),
    FOREIGN KEY(Tulbur_helber_no)REFERENCES Tulburiin_helberiin_lavlah(Tulbur_helber_no)
);
INSERT INTO Tulbur VALUES
("TU00000001", 1, "2023-11-11 10:11:00", "TH1", null),
("TU00000002", 2, "2023-11-12 14:26:23", "TH1", null),
("TU00000003", 3, "2023-11-13 18:24:05", "TH2", null),
("TU00000004", 4, "2023-11-14 15:15:46", "TH4", null),
("TU00000005", 5, "2023-11-15 14:52:12", "TH3", null),
("TU00000006", 6, "2023-11-16 20:01:30", "TH2", null),
("TU00000007", 7, "2023-11-17 21:07:20", "TH2", null),
("TU00000008", 8, "2023-11-18 22:33:46", "TH4", null),
("TU00000009", 9, "2023-11-19 09:38:18", "TH3", null);


-- ------------------------ INNER JOIN --------------------- Тээврийн хэрэгслийн жагсаалт харах
select * from Teevriin_heregsel;
select * from Teevriin_heregsliin_turul;

SELECT ts.Ulsiin_dugaar AS Улсын_дугаар,
	tht.Teevriin_heregsliin_turul_ner AS Төрөл
FROM Teevriin_heregsel AS ts
	left JOIN Teevriin_heregsliin_turul AS tht 
    ON ts.Teevriin_heregsliin_turul_no = tht.Teevriin_heregsliin_turul_no;
    
-- ------------------------ INNER JOIN --------------------- Жолоочийн жагсаалт харах
select * from Ajiltan;
select * from Ajiltan_turul;
SELECT Ajiltnii_code as Ажилтны_код,
	Ajiltan.Ner as Нэр, 
	Ajiltan.RD as Регистрийн_дугаар, 
    Ajiltan.Hvis as Хүйс,
	Ajiltan.Utasnii_dugaar as Утасны_дугаар, 	
	Ajiltan_turul.ajiltan_turul_ner as Ажилтны_төрөл
FROM Ajiltan 
	RIGHT JOIN Ajiltan_turul ON Ajiltan.Ajiltan_turul_no = Ajiltan_turul.Ajiltan_turul_no 
	WHERE Ajiltan_turul_ner = 'Жолооч';
    
-- ------------------------ INNER JOIN --------------------- Маршрутын жагсаалт харах 
SELECT Marshrut.Marshrut_no as Маршрутын_дугаар,
	Chiglel.Chiglel_ner as Чиглэлийн_нэр, 
	urtuu1.Urtuu_ner as Өртөө1, 
	urtuu2.Urtuu_ner as Өртөө2,
	Marshrut.Daraalliin_dugaar as Дарааллын_дугаар
FROM Marshrut
	INNER JOIN Chiglel ON Chiglel.Chiglel_ID = Marshrut.Chiglel_ID
	INNER JOIN Urtuu as urtuu1 ON urtuu1.Urtuu_no = Marshrut.Urtuu_no1 
	INNER JOIN Urtuu as urtuu2 on urtuu2.Urtuu_no = Marshrut.Urtuu_no2;

-- -------------------- "A0000003" аяллын сул суудлын жагсаалт ----------------
SELECT Suudal.Suudal_no AS Сул_суудал 
FROM Suudal
INNER JOIN Teevriin_heregsel AS th ON th.Teevriin_heregsliin_no = Suudal.Teevriin_heregsliin_no
INNER JOIN Aylal ON Aylal.Teevriin_heregsliin_no = th.Teevriin_heregsliin_no
INNER JOIN Chiglel ON Chiglel.Chiglel_ID = Aylal.Chiglel_ID
WHERE Suudal.Suudal_no NOT IN
		(SELECT Zahialgiin_detail.Suudal_no
			FROM Zahialgiin_detail
			WHERE Aylal_no = "A0000003")
			AND Aylal.Aylal_no = "A0000003"; 
        
-- ----------------------------  Ажилтны дэлгэрэнгүй харах (A002)---------------------------------------------- 

SELECT Ovog AS Овог, 
	Ner AS Нэр, 
	RD AS Регистрийн_дугаар, 
	Hvis AS Хүйс, 
	Utasnii_dugaar AS Утасны_дугаар,
	Email AS И_мэйл, 
	Ajiltan_turul.Ajiltan_turul_ner AS Ажилтан_төрөл, 
	AJillaj_ehelsen_ognoo AS Ажиллаж_эхэлсэн_огноо
FROM Ajiltan
INNER JOIN Ajiltan_turul ON Ajiltan.Ajiltan_turul_no = Ajiltan_turul.Ajiltan_turul_no
WHERE Ajiltan.Ajiltnii_code = "A002";

-- ----------------------- Aylalin delgerengui harah --------------------------

SELECT Aylal.Aylal_no AS Аялалын_дугаар, 
	Chiglel_ner AS Чиглэлийн_нэр, 
	Ulsiin_dugaar AS Улсын_дугаар ,
	Hudluh_ognoo AS Хөдлөх_огноо, 
	GROUP_CONCAT(Utasnii_dugaar) AS Жолоочдын_дугаар
FROM Aylal
INNER JOIN AylalBaJolooch ON Aylal.Aylal_no = AylalBaJolooch.Aylal_no
INNER JOIN Ajiltan ON Ajiltan.Ajiltnii_code = AylalBaJolooch.Ajiltnii_code
LEFT JOIN Chiglel ON Aylal.Chiglel_ID = Chiglel.Chiglel_ID
LEFT JOIN Teevriin_heregsel ON Aylal.Teevriin_heregsliin_no = Teevriin_heregsel.Teevriin_heregsliin_no
WHERE Aylal.Aylal_no = "A0000001" ;

-- ------------ Zahialgiin_code = 2 Захиалгын дэлгэрэнгүй харах ----------------------
SELECT 
    Z.Zahialgiin_code AS Захиалгын_код, 
    Zahialgiin_ognoo AS Огноо, 
    GROUP_CONCAT(Zo.Ner) AS Зорчигчдын_нэрс,  
    GROUP_CONCAT(ZD.Suudal_no) AS Захиалсан_суудлууд,
    A_Chiglel_ner AS Чиглэлийн_нэр , 
    A_Ulsiin_dugaar AS Улсын_дугаар,
    A_Hudluh_ognoo AS Хөдлөх_огноо, 
    A_Utasnii_dugaar AS Жолоочийн_дугаар
FROM Zahialgiin_detail AS ZD
LEFT JOIN Zahialga AS Z ON ZD.Zahialgiin_code = Z.Zahialgiin_code
INNER JOIN Zorchigch as Zo ON ZD.Zorchigchiin_code = Zo.Zorchigchiin_code
INNER JOIN Suudal as S ON ZD.Suudal_no = S.Suudal_no
JOIN ( SELECT 
        Aylal.Aylal_no AS A_Aylal_no, 
        Chiglel_ner AS A_Chiglel_ner, 
        Ulsiin_dugaar AS A_Ulsiin_dugaar,
        Hudluh_ognoo AS A_Hudluh_ognoo, 
        GROUP_CONCAT(Utasnii_dugaar) AS A_Utasnii_dugaar, 
        Chiglel_ner AS A_Subquery_Chiglel_ner
    FROM Aylal
    INNER JOIN AylalBaJolooch ON Aylal.Aylal_no = AylalBaJolooch.Aylal_no
    INNER JOIN Ajiltan ON Ajiltan.Ajiltnii_code = AylalBaJolooch.Ajiltnii_code
    LEFT JOIN Chiglel ON Aylal.Chiglel_ID = Chiglel.Chiglel_ID
    LEFT JOIN Teevriin_heregsel ON Aylal.Teevriin_heregsliin_no = Teevriin_heregsel.Teevriin_heregsliin_no
    WHERE Aylal.Aylal_no = (
            SELECT Aylal_no
            FROM Zahialgiin_detail
            WHERE Zahialgiin_code = 2
            ORDER BY Aylal_no
            LIMIT 1
        )
    GROUP BY Aylal.Aylal_no, Ulsiin_dugaar, Hudluh_ognoo
    ) AS Aylal_delgerengvi ON Aylal_delgerengvi.A_Aylal_no = ZD.Aylal_no
WHERE ZD.Zahialgiin_code = 2
GROUP BY Z.Zahialgiin_code, Zahialgiin_ognoo, A_Aylal_no, A_Chiglel_ner, A_Ulsiin_dugaar, A_Hudluh_ognoo, A_Utasnii_dugaar, A_Subquery_Chiglel_ner;

set session sql_mode="STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION";
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- --------------- Тээврийн хэрэгслийн дэлгэрэнгүй харах --------------
SELECT ts.Ulsiin_dugaar AS Улсын_дугаар,
	tht.Teevriin_heregsliin_turul_ner AS Төрөл,
	tsm.Teevriin_heregsliin_mark_ner AS Марк, 
	v.Vildwerlegch_ner AS Үйлдвэрлэгч
FROM Teevriin_heregsel AS ts
	INNER JOIN Teevriin_heregsliin_turul AS tht ON ts.Teevriin_heregsliin_turul_no = tht.Teevriin_heregsliin_turul_no
	INNER JOIN Teevriin_heregsliin_mark AS tsm ON ts.Teevriin_heregsliin_mark_no = tsm.Teevriin_heregsliin_mark_no
	INNER JOIN Teevriin_heregsliin_vildwerlegch AS v ON ts.Vildwerlegch_no = v.Vildwerlegch_no
    where ts.Teevriin_heregsliin_no = "TH001";

-- --------------- A0000002 аялалаар зорчиж буй зорчигчийн жагсаалт харах ---------------------
SELECT Ner AS Зорчигчийн_нэр, 
	RD AS Регистрийн_дугаар, 
    Utasnii_dugaar AS Утасны_дугаар
FROM Zorchigch
	WHERE Zorchigchiin_code IN
		(SELECT Zorchigchiin_code
		FROM Zahialgiin_detail
		WHERE Aylal_no = "A0000002");
 
