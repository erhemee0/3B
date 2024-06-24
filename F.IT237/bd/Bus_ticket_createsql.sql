DROP DATABASE Bus_ticket;
CREATE DATABASE IF NOT EXISTS Bus_ticket;
USE Bus_ticket;

CREATE TABLE Tulburiin_helberiin_lavlah(
	Tulbur_helber_no varchar(3) primary key,
    Tulbur_helber_ner varchar(100)
);
CREATE TABLE Teevriin_heregsliin_vildwerlegch(
	Vildwerlegch_no varchar(5) primary key,
    Vildwerlegch_ner varchar(100)
);
CREATE TABLE Teevriin_heregsliin_mark(
	Teevriin_heregsliin_mark_no varchar(5) primary key,
    Teevriin_heregsliin_mark_ner varchar(100)
);
CREATE TABLE Teevriin_heregsliin_turul(
	Teevriin_heregsliin_turul_no varchar(3) primary key,
    Teevriin_heregsliin_turul_ner varchar(100),
    Suudliin_too int
);
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
CREATE TABLE Suudliin_turul_lavlah(
	Suudliin_turul_no varchar(3) primary key,
    Suudliin_turul_ner varchar(50)
);
CREATE TABLE Suudal(
	Suudal_no varchar(7) primary key,
    Suudliin_turul_no varchar(3),
    Teevriin_heregsliin_no varchar(5),
    FOREIGN KEY(Suudliin_turul_no) REFERENCES Suudliin_turul_lavlah(Suudliin_turul_no),
    FOREIGN KEY(Teevriin_heregsliin_no) REFERENCES Teevriin_heregsel(Teevriin_heregsliin_no)
);
CREATE TABLE Zorchigch(
	Zorchigchiin_code varchar(10) primary key,
    Ovog varchar(50),
    Ner varchar(50),
    RD varchar(10),
    Utasnii_dugaar varchar(8)
);
CREATE TABLE Suudliin_tuluv_lavlah(
	Suudliin_tuluv_no varchar(4) primary key,
    Suudliin_tuluv_ner varchar(50)
);
CREATE TABLE Ajiltan_turul(
	Ajiltan_turul_no varchar(3) primary key,
    Ajiltan_turul_ner varchar(50)
);
CREATE TABLE Urtuu(
	Urtuu_no int primary key,
    Urtuu_ner varchar(100)
);
CREATE TABLE Nasnii_angilal(
	Nasnii_angilal_no varchar(2) primary key,
    Nasnii_angilal_ner varchar(50)
);
CREATE TABLE Chiglel(
	Chiglel_ID varchar(5) primary key,
    Chiglel_ner varchar(100),
    Chiglel_vne decimal(10,2)
);
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
CREATE TABLE Tarif(
	Tarif_no int primary key,
    Marshrut_no varchar(5),
    Nasnii_angilal_no varchar(2),
    Vne decimal(10,2),
    FOREIGN KEY(Marshrut_no) REFERENCES Marshrut(Marshrut_no)
);
CREATE TABLE Hungulultiin_turul_lavlah(
	Hungulultiin_turul_no varchar(3) primary key,
    Hungulultiin_turul_ner varchar(50), 
    Vniin_cof double
);
CREATE TABLE Aylal(
	Aylal_no varchar(8) primary key,
    Chiglel_ID varchar(5),
    Hudluh_ognoo timestamp,
    Teevriin_heregsliin_no varchar(5),
    FOREIGN KEY(Chiglel_ID) REFERENCES Chiglel(Chiglel_ID),
    FOREIGN KEY(Teevriin_heregsliin_no) REFERENCES Teevriin_heregsel(Teevriin_heregsliin_no)    
);
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
CREATE TABLE AylalBaJolooch(
	AylalBaJolooch int primary key,
    Aylal_no varchar(8),
    Ajiltnii_code varchar(10),
    FOREIGN KEY(Aylal_no) REFERENCES Aylal(Aylal_no),
    FOREIGN KEY(Ajiltnii_code) REFERENCES Ajiltan(Ajiltnii_code)
);
CREATE TABLE Zahialgiin_tuluv_lavlah(
	Zahialgiin_tuluv_lavlah_no varchar(5) primary key,
    Zahialgiin_tuluv_lavlah_ner varchar(50)
);
CREATE TABLE Zahialagch(
	Zahialagchiin_code varchar(10) primary key,
    Ovog varchar(10),
    Ner varchar(10),
    Email varchar(100),
    Nevtreh_ner varchar(50),
    Nuuts_vg varchar(50)
);
CREATE TABLE Zahialga(
	Zahialgiin_code int primary key auto_increment,
    Zahialgiin_ognoo datetime,
    Ajiltnii_code varchar(10),
    Zahialagchiin_code varchar(10),
    Hungulultiin_turul_no varchar(3),
    FOREIGN KEY(Ajiltnii_code) REFERENCES Ajiltan(Ajiltnii_code),
    FOREIGN KEY(Zahialagchiin_code) REFERENCES Zahialagch(Zahialagchiin_code),
    FOREIGN KEY(Hungulultiin_turul_no) REFERENCES Hungulultiin_turul_lavlah(Hungulultiin_turul_no) 
);
CREATE TABLE Zahialgiin_tuluv(
	Zahialgiin_tuluv_no int primary key auto_increment,
    Tailbar varchar(255),
    Ognoo datetime DEFAULT current_timestamp,
    Zahialgiin_tuluv_lavlah_no varchar(5),
    Zahialgiin_code int,
    FOREIGN KEY(Zahialgiin_tuluv_lavlah_no) REFERENCES Zahialgiin_tuluv_lavlah(Zahialgiin_tuluv_lavlah_no),
    FOREIGN KEY(Zahialgiin_code) REFERENCES Zahialga(Zahialgiin_code)
);
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
CREATE TABLE Tulbur(
	Tulburiin_code varchar(10) primary key,
    Zahialgiin_code int ,
    Tulbur_tulsun_ognoo datetime,
    Tulbur_helber_no varchar(3),
    Tuluh_dvn decimal(10,2),
    FOREIGN KEY(Zahialgiin_code) REFERENCES Zahialga(Zahialgiin_code),
    FOREIGN KEY(Tulbur_helber_no)REFERENCES Tulburiin_helberiin_lavlah(Tulbur_helber_no)
);

alter table Zahialgiin_tuluv
modify Zahialgiin_tuluv_lavlah_no varchar(5) DEFAULT "ZTL01";

alter table Zahialga
modify Zahialgiin_ognoo datetime DEFAULT current_timestamp;