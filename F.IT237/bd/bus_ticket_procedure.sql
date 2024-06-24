 USE Bus_ticket;
 set global log_bin_trust_function_creators = 1;
 -- --------------------------------------PROCEDURE-----------------------------------
 -- --------------------Tulburiin_helberiin_lavlah INSERT --------------------
DROP PROCEDURE IF EXISTS Insert_into_Tulburiin_helberiin_lavlah;
DELIMITER // 
CREATE PROCEDURE Insert_into_Tulburiin_helberiin_lavlah(Tulbur_helber_no varchar(3), Tulbur_helber_ner varchar(100))
BEGIN
   insert into Tulburiin_helberiin_lavlah values
		(Tulbur_helber_no, Tulbur_helber_ner);
END //
DELIMITER ;
Call Insert_into_Tulburiin_helberiin_lavlah("TH1", "Бэлэн мөнгө");
Call Insert_into_Tulburiin_helberiin_lavlah("TH2", "Карт");
Call Insert_into_Tulburiin_helberiin_lavlah("TH3", "Данс");
Call Insert_into_Tulburiin_helberiin_lavlah("TH4", "Банк апп");
 -- --------------------Tulburiin_helberiin_lavlah DELETE --------------------

DELIMITER // 
CREATE PROCEDURE Delete_Tulburiin_helberiin_lavlah(id varchar(3))
BEGIN
   delete from Tulburiin_helberiin_lavlah 
   where Tulbur_helber_no = id;
END //
DELIMITER ;
Call Delete_Tulburiin_helberiin_lavlah("TH1");

Call Insert_into_Tulburiin_helberiin_lavlah("TH1", "Бэлэн мөнгө");
 -- --------------------Tulburiin_helberiin_lavlah UPDATE --------------------

DELIMITER // 
CREATE PROCEDURE Update_Tulburiin_helberiin_lavlah(id varchar(3), update_value varchar(100))
BEGIN
   update Tulburiin_helberiin_lavlah
   set Tulbur_helber_ner = update_value
   where Tulbur_helber_no = id;
END //
DELIMITER ;

Call Update_Tulburiin_helberiin_lavlah("TH4", "QPay");

 -- -------------------- Teevriin_heregsliin_vildwerlegch INSERT --------------------
 
DROP PROCEDURE IF EXISTS Insert_into_Teevriin_heregsliin_vildwerlegch;

DELIMITER //
CREATE PROCEDURE Insert_into_Teevriin_heregsliin_vildwerlegch(IN vildwerlegch_no VARCHAR(5), IN vildwerlegch_ner VARCHAR(100))
BEGIN
    INSERT INTO Teevriin_heregsliin_vildwerlegch VALUES (vildwerlegch_no, vildwerlegch_ner);
END//
DELIMITER ;

CALL Insert_into_Teevriin_heregsliin_vildwerlegch("TV001",'Volvo Buses');
CALL Insert_into_Teevriin_heregsliin_vildwerlegch("TV002",'Daimler');
CALL Insert_into_Teevriin_heregsliin_vildwerlegch("TV003",'Scania AB');
CALL Insert_into_Teevriin_heregsliin_vildwerlegch("TV004",'MAN Truck & Bus');
CALL Insert_into_Teevriin_heregsliin_vildwerlegch("TV005",'Marcopolo S.A.');
CALL Insert_into_Teevriin_heregsliin_vildwerlegch("TV006",'Toyota');
CALL Insert_into_Teevriin_heregsliin_vildwerlegch("TV007",'Nissan');
CALL Insert_into_Teevriin_heregsliin_vildwerlegch("TV008",'Honda');
CALL Insert_into_Teevriin_heregsliin_vildwerlegch("TV009",'Hyundai');
CALL Insert_into_Teevriin_heregsliin_vildwerlegch("TV010",'Kia');

CALL Insert_into_Teevriin_heregsliin_vildwerlegch("TV011",'Changan');

-- SELECT  from Teevriin_heregsliin_vildwerlegch;

 -- -------------------- Teevriin_heregsliin_vildwerlegch DELETE --------------------

DROP PROCEDURE IF EXISTS Delete_from_Teevriin_heregsliin_vildwerlegch;
DELIMITER //
CREATE PROCEDURE Delete_from_Teevriin_heregsliin_vildwerlegch(IN id VARCHAR(5))
BEGIN
    DELETE FROM Teevriin_heregsliin_vildwerlegch WHERE Vildwerlegch_no = id;
END //
DELIMITER ;

CALL Delete_from_Teevriin_heregsliin_vildwerlegch('TV011');

 -- -------------------- Teevriin_heregsliin_vildwerlegch UPDATE --------------------

DROP PROCEDURE IF EXISTS Update_Teevriin_heregsliin_vildwerlegch;
DELIMITER //
CREATE PROCEDURE Update_Teevriin_heregsliin_vildwerlegch(IN id VARCHAR(5), IN update_value VARCHAR(100))
BEGIN
    UPDATE Teevriin_heregsliin_vildwerlegch SET Vildwerlegch_ner = update_value WHERE Vildwerlegch_no = id;
END//
DELIMITER ;

CALL Update_Teevriin_heregsliin_vildwerlegch('TV002', 'Mercedes-Benz');


-- ---------------------Teevriin_heregsliin_mark INSERT--------------------

DROP PROCEDURE IF EXISTS Insert_into_Teevriin_heregsliin_mark;
DELIMITER //
CREATE PROCEDURE Insert_into_Teevriin_heregsliin_mark(IN mark_no VARCHAR(5), IN mark_ner VARCHAR(100))
BEGIN
    INSERT INTO Teevriin_heregsliin_mark VALUES (mark_no, mark_ner);
END//
DELIMITER ;

CALL Insert_into_Teevriin_heregsliin_mark("TM001","Granbird");
CALL Insert_into_Teevriin_heregsliin_mark("TM002","Aero");
CALL Insert_into_Teevriin_heregsliin_mark("TM003","Universe-45");
CALL Insert_into_Teevriin_heregsliin_mark("TM004","Daewoo BH116");
CALL Insert_into_Teevriin_heregsliin_mark("TM005","Camry");
CALL Insert_into_Teevriin_heregsliin_mark("TM006","Prius 30");
CALL Insert_into_Teevriin_heregsliin_mark("TM007","Daewoo");
CALL Insert_into_Teevriin_heregsliin_mark("TM008","Sonata");
CALL Insert_into_Teevriin_heregsliin_mark("TM009","Prius 20");

CALL Insert_into_Teevriin_heregsliin_mark('TM010', 'Audi Q7');

-- ---------------------Teevriin_heregsliin_mark DELETE--------------------

DROP PROCEDURE IF EXISTS Delete_from_Teevriin_heregsliin_mark;
DELIMITER //
CREATE PROCEDURE Delete_from_Teevriin_heregsliin_mark(IN id VARCHAR(5))
BEGIN
    DELETE FROM Teevriin_heregsliin_mark WHERE Teevriin_heregsliin_mark_no = id;
END//
DELIMITER ;

CALL Delete_from_Teevriin_heregsliin_mark('TM010');

-- ---------------------Teevriin_heregsliin_mark UPDATE--------------------

DROP PROCEDURE IF EXISTS Update_Teevriin_heregsliin_mark;
DELIMITER //
CREATE PROCEDURE Update_Teevriin_heregsliin_mark(IN id VARCHAR(5), IN update_value VARCHAR(100))
BEGIN
    UPDATE Teevriin_heregsliin_mark SET Teevriin_heregsliin_mark_ner = update_value WHERE Teevriin_heregsliin_mark_no = id;
END//
DELIMITER ;

CALL Update_Teevriin_heregsliin_mark('TM005', 'Crown');

-- SELECT  from Teevriin_heregsliin_mark;

-- ---------------------- Teevriin_heregsliin_turul INSERT ------------------------

DROP PROCEDURE IF EXISTS Insert_into_Teevriin_heregsliin_turul;
DELIMITER //
CREATE PROCEDURE Insert_into_Teevriin_heregsliin_turul(IN turul_no VARCHAR(3), IN turul_ner VARCHAR(100), IN suudliin_too INT)
BEGIN
    INSERT INTO Teevriin_heregsliin_turul VALUES (turul_no, turul_ner, suudliin_too);
END//
DELIMITER ;

CALL Insert_into_Teevriin_heregsliin_turul("TT1", 'Суудлын', 4);
CALL Insert_into_Teevriin_heregsliin_turul("TT2", 'Бага оврын автобус', 25);
CALL Insert_into_Teevriin_heregsliin_turul("TT3", 'Дунд оврын автобус', 35);
CALL Insert_into_Teevriin_heregsliin_turul("TT4", 'Том оврын автобус', 45);

CALL Insert_into_Teevriin_heregsliin_turul('TT5', 'Жуулчдын автобус', 50);

-- ---------------------- Teevriin_heregsliin_turul DELETE ------------------------

DROP PROCEDURE IF EXISTS Delete_from_Teevriin_heregsliin_turul;
DELIMITER //
CREATE PROCEDURE Delete_from_Teevriin_heregsliin_turul(IN id VARCHAR(3))
BEGIN
    DELETE FROM Teevriin_heregsliin_turul WHERE Teevriin_heregsliin_turul_no = id;
END//
DELIMITER ;

CALL Delete_from_Teevriin_heregsliin_turul('TT5');

-- ---------------------- Teevriin_heregsliin_turul UPDATE ------------------------

DROP PROCEDURE IF EXISTS Update_Teevriin_heregsliin_turul;
DELIMITER //
CREATE PROCEDURE Update_Teevriin_heregsliin_turul(IN id VARCHAR(3), IN update_ner VARCHAR(100), IN update_too INT)
BEGIN
    UPDATE Teevriin_heregsliin_turul SET Teevriin_heregsliin_turul_ner = update_ner, Suudliin_too = update_too WHERE Teevriin_heregsliin_turul_no = id;
END//
DELIMITER ;

CALL Update_Teevriin_heregsliin_turul('TT4', 'Унтлагын автобус', 50);

-- SELECT  from Teevriin_heregsliin_turul;

-- -------------------------------Teevriin_heregsel INSERT ------------------------

DROP PROCEDURE IF EXISTS Insert_into_Teevriin_heregsel;
DELIMITER //
CREATE PROCEDURE Insert_into_Teevriin_heregsel(
    in_heregsliin_no VARCHAR(5),
    in_turul_no VARCHAR(3),
    in_ulus_dugaar VARCHAR(10),
    in_mark_no VARCHAR(5),
    in_vildwerlegch_no VARCHAR(5)
)
BEGIN
    INSERT INTO Teevriin_heregsel (Teevriin_heregsliin_no, Teevriin_heregsliin_turul_no, Ulsiin_dugaar, Teevriin_heregsliin_mark_no, Vildwerlegch_no)
    VALUES (in_heregsliin_no, in_turul_no, in_ulus_dugaar, in_mark_no, in_vildwerlegch_no);
END//
DELIMITER ;
CALL Insert_into_Teevriin_heregsel("TH001", "TT2", "41-72 УНЗ", "TM004", "TV004");
CALL Insert_into_Teevriin_heregsel("TH002", "TT3", "68-39 УЕА", "TM001", "TV001");
CALL Insert_into_Teevriin_heregsel("TH003", "TT4", "65-89 УЕЕ", "TM002", "TV004");
CALL Insert_into_Teevriin_heregsel("TH004", "TT4", "06-90 УНК", "TM003", "TV002");
CALL Insert_into_Teevriin_heregsel("TH005", "TT3", "68-39 УЕА", "TM004", "TV003");
CALL Insert_into_Teevriin_heregsel("TH006", "TT1", "36-39 УБД", "TM006", "TV006");
CALL Insert_into_Teevriin_heregsel("TH007", "TT4", "79-79 УАЕ", "TM001", "TV004");
CALL Insert_into_Teevriin_heregsel("TH008", "TT3", "06-06 УНЦ", "TM003", "TV005");
CALL Insert_into_Teevriin_heregsel("TH009", "TT1", "06-77 УНБ", "TM005", "TV006");
CALL Insert_into_Teevriin_heregsel("TH010", "TT2", "06-64 УНА", "TM007", "TV003");

CALL Insert_into_Teevriin_heregsel('TH011', 'TT1', '02-47 УБА', 'TM008', 'TV008');

-- -------------------------------Teevriin_heregsel DELETE ------------------------

DROP PROCEDURE IF EXISTS Delete_from_Teevriin_heregsel;
DELIMITER //
CREATE PROCEDURE Delete_from_Teevriin_heregsel(
    del_heregsliin_no VARCHAR(5)
)
BEGIN
    DELETE FROM Teevriin_heregsel WHERE Teevriin_heregsliin_no = del_heregsliin_no;
END//
DELIMITER ;

CALL Delete_from_Teevriin_heregsel('TH011');

-- -------------------------------Teevriin_heregsel UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Teevriin_heregsel(
    up_heregsliin_no VARCHAR(5),
    up_new_turul_no VARCHAR(3),
    up_new_ulus_dugaar VARCHAR(10),
    up_new_mark_no VARCHAR(5),
    up_new_vildwerlegch_no VARCHAR(5)
)
BEGIN
    UPDATE Teevriin_heregsel
    SET 
        Teevriin_heregsliin_turul_no = up_new_turul_no,
        Ulsiin_dugaar = up_new_ulus_dugaar,
        Teevriin_heregsliin_mark_no = up_new_mark_no,
        Vildwerlegch_no = up_new_vildwerlegch_no
    WHERE Teevriin_heregsliin_no = up_heregsliin_no;
END//
DELIMITER ;

CALL Update_Teevriin_heregsel('TH004', 'TT3', '99-88 УНД', 'TM009', 'TV010');

-- SELECT  from Teevriin_heregsel;

-- -------------------------Suudliin_turul_lavlah INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Suudliin_turul_lavlah(
    in_turul_no VARCHAR(3),
    in_turul_ner VARCHAR(50)
)
BEGIN
    INSERT INTO Suudliin_turul_lavlah (Suudliin_turul_no, Suudliin_turul_ner)
    VALUES (in_turul_no, in_turul_ner);
END//
DELIMITER ;

CALL Insert_into_Suudliin_turul_lavlah("ST1", "Энгийн");
CALL Insert_into_Suudliin_turul_lavlah("ST2", "Хөгжлийн бэрхшээлтэй");

CALL Insert_into_Suudliin_turul_lavlah("ST3", "Хүүхдийн");

-- -------------------------Suudliin_turul_lavlah DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Suudliin_turul_lavlah(
    del_turul_no VARCHAR(3)
)
BEGIN
    DELETE FROM Suudliin_turul_lavlah WHERE Suudliin_turul_no = del_turul_no;
END//
DELIMITER ;

CALL Delete_from_Suudliin_turul_lavlah('ST3');

-- -------------------------Suudliin_turul_lavlah UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Suudliin_turul_lavlah(
    up_turul_no VARCHAR(3),
    up_new_turul_ner VARCHAR(50)
)
BEGIN
    UPDATE Suudliin_turul_lavlah
    SET Suudliin_turul_ner = up_new_turul_ner
    WHERE Suudliin_turul_no = up_turul_no;
END//
DELIMITER ;

CALL Update_Suudliin_turul_lavlah('ST2', 'Тусгай хэрэгцээт хүн');

-- SELECT  from suudliin_turul_lavlah;

-- -------------------------------Suudal INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Suudal(
    in_Suudal_no VARCHAR(7),
    in_Suudliin_turul_no VARCHAR(3),
    in_Teevriin_heregsliin_no VARCHAR(5)
)
BEGIN
    INSERT INTO Suudal (Suudal_no, Suudliin_turul_no, Teevriin_heregsliin_no)
    VALUES (in_Suudal_no, in_Suudliin_turul_no, in_Teevriin_heregsliin_no);
END//
DELIMITER ;

CALL Insert_into_Suudal("TH00101", "ST2", "TH001");
CALL Insert_into_Suudal("TH00102", "ST2", "TH001");
CALL Insert_into_Suudal("TH00103", "ST1", "TH001");
CALL Insert_into_Suudal("TH00104", "ST1", "TH001");
CALL Insert_into_Suudal("TH00105", "ST1", "TH001");
CALL Insert_into_Suudal("TH00106", "ST1", "TH001");
CALL Insert_into_Suudal("TH00107", "ST1", "TH001");
CALL Insert_into_Suudal("TH00108", "ST1", "TH001");
CALL Insert_into_Suudal("TH00109", "ST1", "TH001");
CALL Insert_into_Suudal("TH00110", "ST1", "TH001");
CALL Insert_into_Suudal("TH00111", "ST1", "TH001");
CALL Insert_into_Suudal("TH00112", "ST1", "TH001");
CALL Insert_into_Suudal("TH00113", "ST1", "TH001");
CALL Insert_into_Suudal("TH00114", "ST1", "TH001");
CALL Insert_into_Suudal("TH00115", "ST1", "TH001");
CALL Insert_into_Suudal("TH00116", "ST1", "TH001");
CALL Insert_into_Suudal("TH00117", "ST1", "TH001");
CALL Insert_into_Suudal("TH00118", "ST1", "TH001");
CALL Insert_into_Suudal("TH00119", "ST1", "TH001");
CALL Insert_into_Suudal("TH00120", "ST1", "TH001");
CALL Insert_into_Suudal("TH00121", "ST1", "TH001");
CALL Insert_into_Suudal("TH00122", "ST1", "TH001");
CALL Insert_into_Suudal("TH00123", "ST1", "TH001");
CALL Insert_into_Suudal("TH00124", "ST1", "TH001");
CALL Insert_into_Suudal("TH00125", "ST1", "TH001");
CALL Insert_into_Suudal("TH00201", "ST2", "TH002");
CALL Insert_into_Suudal("TH00202", "ST2", "TH002");
CALL Insert_into_Suudal("TH00203", "ST1", "TH002");
CALL Insert_into_Suudal("TH00204", "ST1", "TH002");
CALL Insert_into_Suudal("TH00205", "ST1", "TH002");
CALL Insert_into_Suudal("TH00206", "ST1", "TH002");
CALL Insert_into_Suudal ("TH00207", "ST1", "TH002");
CALL Insert_into_Suudal("TH00208", "ST1", "TH002");
CALL Insert_into_Suudal ("TH00209", "ST1", "TH002");
CALL Insert_into_Suudal("TH00210", "ST1", "TH002");
CALL Insert_into_Suudal("TH00211", "ST1", "TH002");
CALL Insert_into_Suudal("TH00212", "ST1", "TH002");
CALL Insert_into_Suudal("TH00213", "ST1", "TH002");
CALL Insert_into_Suudal("TH00214", "ST1", "TH002");
CALL Insert_into_Suudal("TH00215", "ST1", "TH002");
CALL Insert_into_Suudal("TH00216", "ST1", "TH002");
CALL Insert_into_Suudal("TH00217", "ST1", "TH002");
CALL Insert_into_Suudal("TH00218", "ST1", "TH002");
CALL Insert_into_Suudal("TH00219", "ST1", "TH002");   
CALL Insert_into_Suudal("TH00220", "ST1", "TH002");
CALL Insert_into_Suudal("TH00221", "ST1", "TH002");
CALL Insert_into_Suudal("TH00222", "ST1", "TH002");
CALL Insert_into_Suudal("TH00223", "ST1", "TH002");
CALL Insert_into_Suudal("TH00224", "ST1", "TH002");    
CALL Insert_into_Suudal("TH00225", "ST1", "TH002");
CALL Insert_into_Suudal("TH00226", "ST1", "TH002");
CALL Insert_into_Suudal("TH00227", "ST1", "TH002");
CALL Insert_into_Suudal("TH00228", "ST1", "TH002");    
CALL Insert_into_Suudal("TH00229", "ST1", "TH002");    
CALL Insert_into_Suudal("TH00230", "ST1", "TH002");    
CALL Insert_into_Suudal("TH00231", "ST1", "TH002");  
CALL Insert_into_Suudal("TH00232", "ST1", "TH002");
CALL Insert_into_Suudal("TH00233", "ST1", "TH002");
CALL Insert_into_Suudal("TH00234", "ST1", "TH002");
CALL Insert_into_Suudal("TH00235", "ST1", "TH002");
CALL Insert_into_Suudal("TH00301", "ST2", "TH003");
CALL Insert_into_Suudal("TH00302", "ST2", "TH003");
CALL Insert_into_Suudal("TH00303", "ST1", "TH003");
CALL Insert_into_Suudal("TH00304", "ST1", "TH003");
CALL Insert_into_Suudal("TH00305", "ST1", "TH003");
CALL Insert_into_Suudal("TH00306", "ST1", "TH003");
CALL Insert_into_Suudal("TH00307", "ST1", "TH003");
CALL Insert_into_Suudal("TH00308", "ST1", "TH003");
CALL Insert_into_Suudal("TH00309", "ST1", "TH003");
CALL Insert_into_Suudal("TH00310", "ST1", "TH003");
CALL Insert_into_Suudal("TH00311", "ST1", "TH003");
CALL Insert_into_Suudal("TH00312", "ST1", "TH003");
CALL Insert_into_Suudal("TH00313", "ST1", "TH003");
CALL Insert_into_Suudal("TH00314", "ST1", "TH003");
CALL Insert_into_Suudal("TH00315", "ST1", "TH003");
CALL Insert_into_Suudal("TH00316", "ST1", "TH003");
CALL Insert_into_Suudal("TH00317", "ST1", "TH003");
CALL Insert_into_Suudal("TH00318", "ST1", "TH003");
CALL Insert_into_Suudal("TH00319", "ST1", "TH003");
CALL Insert_into_Suudal("TH00320", "ST1", "TH003");
CALL Insert_into_Suudal("TH00321", "ST1", "TH003");
CALL Insert_into_Suudal("TH00322", "ST1", "TH003");
CALL Insert_into_Suudal("TH00323", "ST1", "TH003");
CALL Insert_into_Suudal("TH00324", "ST1", "TH003");
CALL Insert_into_Suudal("TH00325", "ST1", "TH003");
CALL Insert_into_Suudal("TH00326", "ST1", "TH003");
CALL Insert_into_Suudal("TH00327", "ST1", "TH003");
CALL Insert_into_Suudal("TH00328", "ST1", "TH003");
CALL Insert_into_Suudal("TH00329", "ST1", "TH003");
CALL Insert_into_Suudal("TH00330", "ST1", "TH003");
CALL Insert_into_Suudal("TH00331", "ST1", "TH003");
CALL Insert_into_Suudal("TH00332", "ST1", "TH003");
CALL Insert_into_Suudal("TH00333", "ST1", "TH003");
CALL Insert_into_Suudal("TH00334", "ST1", "TH003");
CALL Insert_into_Suudal("TH00335", "ST1", "TH003");
CALL Insert_into_Suudal("TH00336", "ST1", "TH003");
CALL Insert_into_Suudal("TH00337", "ST1", "TH003");
CALL Insert_into_Suudal("TH00338", "ST1", "TH003");
CALL Insert_into_Suudal("TH00339", "ST1", "TH003");
CALL Insert_into_Suudal("TH00340", "ST1", "TH003");
CALL Insert_into_Suudal("TH00341", "ST1", "TH003");
CALL Insert_into_Suudal("TH00342", "ST1", "TH003");
CALL Insert_into_Suudal("TH00343", "ST1", "TH003");
CALL Insert_into_Suudal("TH00344", "ST1", "TH003");
CALL Insert_into_Suudal("TH00345", "ST1", "TH003");
CALL Insert_into_Suudal("TH00401", "ST2", "TH004");
CALL Insert_into_Suudal("TH00402", "ST2", "TH004");
CALL Insert_into_Suudal("TH00403", "ST1", "TH004");
CALL Insert_into_Suudal("TH00404", "ST1", "TH004");
CALL Insert_into_Suudal("TH00405", "ST1", "TH004");
CALL Insert_into_Suudal("TH00406", "ST1", "TH004");
CALL Insert_into_Suudal("TH00407", "ST1", "TH004");
CALL Insert_into_Suudal("TH00408", "ST1", "TH004");
CALL Insert_into_Suudal("TH00409", "ST1", "TH004");
CALL Insert_into_Suudal("TH00410", "ST1", "TH004");
CALL Insert_into_Suudal("TH00411", "ST1", "TH004");
CALL Insert_into_Suudal("TH00412", "ST1", "TH004");
CALL Insert_into_Suudal("TH00413", "ST1", "TH004");
CALL Insert_into_Suudal("TH00414", "ST1", "TH004");
CALL Insert_into_Suudal("TH00415", "ST1", "TH004");
CALL Insert_into_Suudal("TH00416", "ST1", "TH004");
CALL Insert_into_Suudal("TH00417", "ST1", "TH004");
CALL Insert_into_Suudal("TH00418", "ST1", "TH004");
CALL Insert_into_Suudal("TH00419", "ST1", "TH004");
CALL Insert_into_Suudal("TH00420", "ST1", "TH004");
CALL Insert_into_Suudal("TH00421", "ST1", "TH004");
CALL Insert_into_Suudal("TH00422", "ST1", "TH004");
CALL Insert_into_Suudal("TH00423", "ST1", "TH004");
CALL Insert_into_Suudal("TH00424", "ST1", "TH004");
CALL Insert_into_Suudal("TH00425", "ST1", "TH004");
CALL Insert_into_Suudal("TH00426", "ST1", "TH004");
CALL Insert_into_Suudal("TH00427", "ST1", "TH004");
CALL Insert_into_Suudal("TH00428", "ST1", "TH004");
CALL Insert_into_Suudal("TH00429", "ST1", "TH004");
CALL Insert_into_Suudal("TH00430", "ST1", "TH004");
CALL Insert_into_Suudal("TH00431", "ST1", "TH004");
CALL Insert_into_Suudal("TH00432", "ST1", "TH004");
CALL Insert_into_Suudal("TH00433", "ST1", "TH004");
CALL Insert_into_Suudal("TH00434", "ST1", "TH004");
CALL Insert_into_Suudal("TH00435", "ST1", "TH004");
CALL Insert_into_Suudal("TH00436", "ST1", "TH004");
CALL Insert_into_Suudal("TH00437", "ST1", "TH004");
CALL Insert_into_Suudal("TH00438", "ST1", "TH004");
CALL Insert_into_Suudal("TH00439", "ST1", "TH004");
CALL Insert_into_Suudal("TH00440", "ST1", "TH004");
CALL Insert_into_Suudal("TH00441", "ST1", "TH004");
CALL Insert_into_Suudal("TH00442", "ST1", "TH004");
CALL Insert_into_Suudal("TH00443", "ST1", "TH004");
CALL Insert_into_Suudal("TH00444", "ST1", "TH004");
CALL Insert_into_Suudal("TH00445", "ST1", "TH004");

CALL Insert_into_Suudal("TH00501", "ST2", "TH005");
CALL Insert_into_Suudal("TH00502", "ST2", "TH005");
CALL Insert_into_Suudal("TH00503", "ST1", "TH005");
CALL Insert_into_Suudal("TH00504", "ST1", "TH005");
CALL Insert_into_Suudal("TH00505", "ST1", "TH005");
CALL Insert_into_Suudal("TH00506", "ST1", "TH005");
CALL Insert_into_Suudal("TH00507", "ST1", "TH005");
CALL Insert_into_Suudal("TH00508", "ST1", "TH005");
CALL Insert_into_Suudal("TH00509", "ST1", "TH005");
CALL Insert_into_Suudal("TH00510", "ST1", "TH005");
CALL Insert_into_Suudal("TH00511", "ST1", "TH005");
CALL Insert_into_Suudal("TH00512", "ST1", "TH005");
CALL Insert_into_Suudal("TH00513", "ST1", "TH005");
CALL Insert_into_Suudal("TH00514", "ST1", "TH005");
CALL Insert_into_Suudal("TH00515", "ST1", "TH005");
CALL Insert_into_Suudal("TH00516", "ST1", "TH005");
CALL Insert_into_Suudal("TH00517", "ST1", "TH005");
CALL Insert_into_Suudal("TH00518", "ST1", "TH005");
CALL Insert_into_Suudal("TH00519", "ST1", "TH005");
CALL Insert_into_Suudal("TH00520", "ST1", "TH005");
CALL Insert_into_Suudal("TH00521", "ST1", "TH005");
CALL Insert_into_Suudal("TH00522", "ST1", "TH005");
CALL Insert_into_Suudal("TH00523", "ST1", "TH005");
CALL Insert_into_Suudal("TH00524", "ST1", "TH005");
CALL Insert_into_Suudal("TH00525", "ST1", "TH005");
CALL Insert_into_Suudal("TH00526", "ST1", "TH005");
CALL Insert_into_Suudal("TH00527", "ST1", "TH005");
CALL Insert_into_Suudal("TH00528", "ST1", "TH005");
CALL Insert_into_Suudal("TH00529", "ST1", "TH005");
CALL Insert_into_Suudal("TH00530", "ST1", "TH005");
CALL Insert_into_Suudal("TH00531", "ST1", "TH005");
CALL Insert_into_Suudal("TH00532", "ST1", "TH005");
CALL Insert_into_Suudal("TH00533", "ST1", "TH005");
CALL Insert_into_Suudal("TH00534", "ST1", "TH005");
CALL Insert_into_Suudal("TH00535", "ST1", "TH005");
CALL Insert_into_Suudal("TH00601", "ST1", "TH006");
CALL Insert_into_Suudal("TH00602", "ST1", "TH006");
CALL Insert_into_Suudal("TH00603", "ST1", "TH006");
CALL Insert_into_Suudal("TH00604", "ST1", "TH006");
CALL Insert_into_Suudal("TH00701", "ST2", "TH007");
CALL Insert_into_Suudal("TH00702", "ST2", "TH007");
CALL Insert_into_Suudal("TH00703", "ST1", "TH007");
CALL Insert_into_Suudal("TH00704", "ST1", "TH007");
CALL Insert_into_Suudal("TH00705", "ST1", "TH007");
CALL Insert_into_Suudal("TH00706", "ST1", "TH007");
CALL Insert_into_Suudal("TH00707", "ST1", "TH007");
CALL Insert_into_Suudal("TH00708", "ST1", "TH007");
CALL Insert_into_Suudal("TH00709", "ST1", "TH007");
CALL Insert_into_Suudal("TH00710", "ST1", "TH007");
CALL Insert_into_Suudal("TH00711", "ST1", "TH007");
CALL Insert_into_Suudal("TH00712", "ST1", "TH007");
CALL Insert_into_Suudal("TH00713", "ST1", "TH007");
CALL Insert_into_Suudal("TH00714", "ST1", "TH007");
CALL Insert_into_Suudal("TH00715", "ST1", "TH007");
CALL Insert_into_Suudal("TH00716", "ST1", "TH007");
CALL Insert_into_Suudal("TH00717", "ST1", "TH007");
CALL Insert_into_Suudal("TH00718", "ST1", "TH007");
CALL Insert_into_Suudal("TH00719", "ST1", "TH007");
CALL Insert_into_Suudal("TH00720", "ST1", "TH007");
CALL Insert_into_Suudal("TH00721", "ST1", "TH007");
CALL Insert_into_Suudal("TH00722", "ST1", "TH007");
CALL Insert_into_Suudal("TH00723", "ST1", "TH007");
CALL Insert_into_Suudal("TH00724", "ST1", "TH007");
CALL Insert_into_Suudal("TH00725", "ST1", "TH007");
CALL Insert_into_Suudal("TH00726", "ST1", "TH007");
CALL Insert_into_Suudal("TH00727", "ST1", "TH007");
CALL Insert_into_Suudal("TH00728", "ST1", "TH007");
CALL Insert_into_Suudal("TH00729", "ST1", "TH007");
CALL Insert_into_Suudal("TH00730", "ST1", "TH007");
CALL Insert_into_Suudal("TH00731", "ST1", "TH007");
CALL Insert_into_Suudal("TH00732", "ST1", "TH007");
CALL Insert_into_Suudal("TH00733", "ST1", "TH007");
CALL Insert_into_Suudal("TH00734", "ST1", "TH007");
CALL Insert_into_Suudal("TH00735", "ST1", "TH007");
CALL Insert_into_Suudal("TH00736", "ST1", "TH007");
CALL Insert_into_Suudal("TH00737", "ST1", "TH007");
CALL Insert_into_Suudal("TH00738", "ST1", "TH007");
CALL Insert_into_Suudal("TH00739", "ST1", "TH007");
CALL Insert_into_Suudal("TH00740", "ST1", "TH007");
CALL Insert_into_Suudal("TH00741", "ST1", "TH007");
CALL Insert_into_Suudal("TH00742", "ST1", "TH007");
CALL Insert_into_Suudal("TH00743", "ST1", "TH007");
CALL Insert_into_Suudal("TH00744", "ST1", "TH007");
CALL Insert_into_Suudal("TH00745", "ST1", "TH007");
CALL Insert_into_Suudal("TH00801", "ST2", "TH008");
CALL Insert_into_Suudal("TH00802", "ST2", "TH008");
CALL Insert_into_Suudal("TH00803", "ST1", "TH008");
CALL Insert_into_Suudal("TH00804", "ST1", "TH008");
CALL Insert_into_Suudal("TH00805", "ST1", "TH008");
CALL Insert_into_Suudal("TH00806", "ST1", "TH008");
CALL Insert_into_Suudal("TH00807", "ST1", "TH008");
CALL Insert_into_Suudal("TH00808", "ST1", "TH008");
CALL Insert_into_Suudal("TH00809", "ST1", "TH008");
CALL Insert_into_Suudal("TH00810", "ST1", "TH008");
CALL Insert_into_Suudal("TH00811", "ST1", "TH008");
CALL Insert_into_Suudal("TH00812", "ST1", "TH008");
CALL Insert_into_Suudal("TH00813", "ST1", "TH008");
CALL Insert_into_Suudal("TH00814", "ST1", "TH008");
CALL Insert_into_Suudal("TH00815", "ST1", "TH008");
CALL Insert_into_Suudal("TH00816", "ST1", "TH008");
CALL Insert_into_Suudal("TH00817", "ST1", "TH008");
CALL Insert_into_Suudal("TH00818", "ST1", "TH008");
CALL Insert_into_Suudal("TH00819", "ST1", "TH008");
CALL Insert_into_Suudal("TH00820", "ST1", "TH008");
CALL Insert_into_Suudal("TH00821", "ST1", "TH008");
CALL Insert_into_Suudal("TH00822", "ST1", "TH008");
CALL Insert_into_Suudal("TH00823", "ST1", "TH008");
CALL Insert_into_Suudal("TH00824", "ST1", "TH008");
CALL Insert_into_Suudal("TH00825", "ST1", "TH008");
CALL Insert_into_Suudal("TH00826", "ST1", "TH008");
CALL Insert_into_Suudal("TH00827", "ST1", "TH008");
CALL Insert_into_Suudal("TH00828", "ST1", "TH008");
CALL Insert_into_Suudal("TH00829", "ST1", "TH008");
CALL Insert_into_Suudal("TH00830", "ST1", "TH008");
CALL Insert_into_Suudal("TH00831", "ST1", "TH008");
CALL Insert_into_Suudal("TH00832", "ST1", "TH008");
CALL Insert_into_Suudal("TH00833", "ST1", "TH008");
CALL Insert_into_Suudal("TH00834", "ST1", "TH008");
CALL Insert_into_Suudal("TH00835", "ST1", "TH008");
CALL Insert_into_Suudal("TH00901", "ST1", "TH009");
CALL Insert_into_Suudal("TH00902", "ST1", "TH009");
CALL Insert_into_Suudal("TH00903", "ST1", "TH009");
CALL Insert_into_Suudal("TH00904", "ST1", "TH009");
CALL Insert_into_Suudal("TH01001", "ST2", "TH010");
CALL Insert_into_Suudal("TH01002", "ST2", "TH010");
CALL Insert_into_Suudal("TH01003", "ST1", "TH010");
CALL Insert_into_Suudal("TH01004", "ST1", "TH010");
CALL Insert_into_Suudal("TH01005", "ST1", "TH010");
CALL Insert_into_Suudal("TH01006", "ST1", "TH010");
CALL Insert_into_Suudal("TH01007", "ST1", "TH010");
CALL Insert_into_Suudal("TH01008", "ST1", "TH010");
CALL Insert_into_Suudal("TH01009", "ST1", "TH010");
CALL Insert_into_Suudal("TH01010", "ST1", "TH010");
CALL Insert_into_Suudal("TH01011", "ST1", "TH010");
CALL Insert_into_Suudal("TH01012", "ST1", "TH010");
CALL Insert_into_Suudal("TH01013", "ST1", "TH010");
CALL Insert_into_Suudal("TH01014", "ST1", "TH010");
CALL Insert_into_Suudal("TH01015", "ST1", "TH010");
CALL Insert_into_Suudal("TH01016", "ST1", "TH010");
CALL Insert_into_Suudal("TH01017", "ST1", "TH010");
CALL Insert_into_Suudal("TH01018", "ST1", "TH010");
CALL Insert_into_Suudal("TH01019", "ST1", "TH010");
CALL Insert_into_Suudal("TH01020", "ST1", "TH010");
CALL Insert_into_Suudal("TH01021", "ST1", "TH010");
CALL Insert_into_Suudal("TH01022", "ST1", "TH010");
CALL Insert_into_Suudal("TH01023", "ST1", "TH010");
CALL Insert_into_Suudal("TH01024", "ST1", "TH010");
CALL Insert_into_Suudal("TH01025", "ST1", "TH010");

-- SELECT  from Suudal;

-- -------------------------------Suudal DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Suudal(
    del_Suudal_no VARCHAR(7)
)
BEGIN
    DELETE FROM Suudal WHERE Suudal_no = del_Suudal_no;
END//
DELIMITER ;

CALL Delete_from_Suudal('TH00730');
CALL Delete_from_Suudal('TH00309');

-- SELECT  from Suudal;
CALL Insert_into_Suudal("TH00730", "ST1", "TH007");
CALL Insert_into_Suudal("TH00309", "ST1", "TH003");
-- -------------------------------Suudal UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Suudal(
    up_Suudal_no VARCHAR(7),
    up_Suudliin_turul_no VARCHAR(3),
    up_Teevriin_heregsliin_no VARCHAR(5)
)
BEGIN
    UPDATE Suudal
    SET Suudliin_turul_no = up_Suudliin_turul_no, Teevriin_heregsliin_no = up_Teevriin_heregsliin_no
    WHERE Suudal_no = up_Suudal_no;
END//
DELIMITER ;

CALL Update_Suudal('TH01025', 'ST2', 'TH009');
CALL Update_Suudal('TH00815', 'ST1', 'TH008');

-- SELECT  from suudal;


-- ------------------------------Zorchigch INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Zorchigch(
    zorchigchiin_code varchar(10),
    ovog varchar(50),
    ner varchar(50),
    rd varchar(10),
    utasnii_dugaar varchar(8)
)
BEGIN
    INSERT INTO Zorchigch VALUES (zorchigchiin_code, ovog, ner, rd, utasnii_dugaar);
END //
DELIMITER ;

CALL Insert_into_Zorchigch("ZO00000001", "Төгөлдөр", "Сүхбат", "УА80112309", "88321467");
CALL Insert_into_Zorchigch("ZO00000002", "Балдан", "Эгшиглэн", "УВ90101313", "99862364");
CALL Insert_into_Zorchigch("ZO00000003", "Эрдэнэ", "Эрдэнэбилгүүн", "УЖ10102304", "89763872");
CALL Insert_into_Zorchigch("ZO00000004", "Галбадрах", "Ирээдүй", "ЛЛ98050323", "80873269");
CALL Insert_into_Zorchigch("ZO00000005", "Сүх", "Отгонтуяа", "ТА19112059", "91273643");
CALL Insert_into_Zorchigch("ZO00000006", "Ганхуяг", "Батцэрэн", "ЗГ03310606", "90641222");
CALL Insert_into_Zorchigch("ZO00000007", "Одбаяр", "Номин", "ЗА89082367", "91631222");
CALL Insert_into_Zorchigch("ZO00000008", "Нарансүх", "Хулан", "ЙА97021189", "90635422");
CALL Insert_into_Zorchigch("ZO00000009", "Очир", "Чанарав", "УД01212873", "96413322");
CALL Insert_into_Zorchigch("ZO00000010", "Цэрэн", "Пүрэв", "ЗГ03250706", "89123456");
CALL Insert_into_Zorchigch("ZO00000011", "Болд-Эрдэнэ", "Ариунаа", "ЗД89120626", "89896213");
CALL Insert_into_Zorchigch("ZO00000012", "Бат", "Батбаатар", "ЗА89072367", "91631226");
CALL Insert_into_Zorchigch("ZO00000013", "Наран", "Саран", "ЙА97021089", "90635423");
CALL Insert_into_Zorchigch("ZO00000014", "Алтантулга", "Буянхишиг", "ТА90112314", "89090965");
CALL Insert_into_Zorchigch("ZO00000015", "Баяр", "Эрдэнэбат", "ЗГ03250706", "99113355");

-- SELECT  from zorchigch;

-- ------------------------------Zorchigch DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Zorchigch(id varchar(10))
BEGIN
    DELETE FROM Zorchigch 
    WHERE Zorchigchiin_code = id;
END //
DELIMITER ;

CALL Delete_from_Zorchigch('ZO00000001');

-- SELECT  from zorchigch;

CALL Insert_into_Zorchigch("ZO00000001", "Төгөлдөр", "Сүхбат", "УА80112309", "88321467");

-- ------------------------------Zorchigch UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Zorchigch(
    id_val varchar(10),
    Ovog_update_val varchar(50),
    Ner_update_val varchar(50),
    RD_update_val varchar(10),
    Utasnii_dugaar_update_val varchar(8)
)
BEGIN
    UPDATE Zorchigch
    SET Ovog = Ovog_update_val,
        Ner = Ner_update_val,
        RD = RD_update_val,
        Utasnii_dugaar = Utasnii_dugaar_update_val
    WHERE Zorchigchiin_code = id_val;
END //
DELIMITER ;

CALL Update_Zorchigch("ZO00000002", "Ганхүү", "Төмөрхүү", "ТА95322031", "99876543");
CALL Update_Zorchigch("ZO00000005", "Хүүхэнхүү", "Жаргал", "УФ02321102", "99247247");

-- SELECT  from zorchigch;

-- -------------------------------Suudliin_tuluv_lavlah INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Suudliin_tuluv_lavlah(
    Suudliin_tuluv_no_val varchar(4),
    Suudliin_tuluv_ner_val varchar(50)
)
BEGIN
    INSERT INTO Suudliin_tuluv_lavlah VALUES (
        Suudliin_tuluv_no_val,
        Suudliin_tuluv_ner_val
    );
END //
DELIMITER ;

CALL Insert_into_Suudliin_tuluv_lavlah("STL1", "Захиалсан");
CALL Insert_into_Suudliin_tuluv_lavlah("STL2", "Захиалаагүй");
CALL Insert_into_Suudliin_tuluv_lavlah("STL3", "Суусан");
CALL Insert_into_Suudliin_tuluv_lavlah("STL4", "Суугаагүй");

CALL Insert_into_Suudliin_tuluv_lavlah("STL5", "Буцаасан");

-- SELECT  from suudliin_tuluv_lavlah;

-- -------------------------------Suudliin_tuluv_lavlah DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Suudliin_tuluv_lavlah(id_val varchar(4))
BEGIN
    DELETE FROM Suudliin_tuluv_lavlah WHERE Suudliin_tuluv_no = id_val;
END //
DELIMITER ;

CALL Delete_from_Suudliin_tuluv_lavlah("STL5");

-- SELECT  from suudliin_tuluv_lavlah;

-- -------------------------------Suudliin_tuluv_lavlah UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Suudliin_tuluv_lavlah(
    id_val varchar(4),
    update_Suudliin_tuluv_ner varchar(50)
)
BEGIN
    UPDATE Suudliin_tuluv_lavlah
    SET Suudliin_tuluv_ner = update_Suudliin_tuluv_ner
    WHERE Suudliin_tuluv_no = id_val;
END //
DELIMITER ;

CALL Update_Suudliin_tuluv_lavlah("STL4", "Буусан");

-- SELECT  from suudliin_tuluv_lavlah;

-- --------------------------Ajiltan_turul INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Ajiltan_turul(
    Ajiltan_turul_no_val varchar(3),
    Ajiltan_turul_ner_val varchar(50)
)
BEGIN
    INSERT INTO Ajiltan_turul VALUES (
        Ajiltan_turul_no_val,
        Ajiltan_turul_ner_val
    );
END //
DELIMITER ;

CALL Insert_into_Ajiltan_turul("AT1","Захирал");
CALL Insert_into_Ajiltan_turul("AT2","Менежер");
CALL Insert_into_Ajiltan_turul("AT3","Жолооч");
CALL Insert_into_Ajiltan_turul("AT4","Оператор");

-- --------------------------Ajiltan_turul DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Ajiltan_turul(id_val varchar(3))
BEGIN
    DELETE FROM Ajiltan_turul WHERE Ajiltan_turul_no = id_val;
END //
DELIMITER ;

CALL Delete_from_Ajiltan_turul("AT1");
CALL Insert_into_Ajiltan_turul("AT1","Захирал");
-- --------------------------Ajiltan_turul UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Ajiltan_turul(
    id_val varchar(3),
    update_Ajiltan_turul_ner varchar(50)
)
BEGIN
    UPDATE Ajiltan_turul
    SET Ajiltan_turul_ner = update_Ajiltan_turul_ner
    WHERE Ajiltan_turul_no = id_val;
END //
DELIMITER ;

CALL Update_Ajiltan_turul("AT4", "Кассчин");


-- ---------------------------------Urtuu INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Urtuu(
    Urtoo_no_val int,
    Urtoo_ner_val varchar(100)
)
BEGIN
    INSERT INTO Urtuu VALUES (
        Urtoo_no_val,
        Urtoo_ner_val
    );
END //
DELIMITER ;

CALL Insert_into_Urtuu(1, "Ар.Өлзийт");
CALL Insert_into_Urtuu(2, "Ар.Хайрхан");
CALL Insert_into_Urtuu(3, "Ар.Эрдэнэмандал");
CALL Insert_into_Urtuu(4, "Ар.Жаргалант");
CALL Insert_into_Urtuu(5, "Ар.Ихтамир");
CALL Insert_into_Urtuu(6, "Ар.Өндөр-Улаан");
CALL Insert_into_Urtuu(7, "Ар.Чулуутын гүүр");
CALL Insert_into_Urtuu(8, "Ар.Тариат");
CALL Insert_into_Urtuu(9, "Ар.Цэцэрлэг");
CALL Insert_into_Urtuu(10, "Ар.Хотонт");
CALL Insert_into_Urtuu(11, "Ар.Цэнхэр");
CALL Insert_into_Urtuu(12, "Ар.Эрдэнэбулган");
CALL Insert_into_Urtuu(13, "Өв.Нарийнтээл");
CALL Insert_into_Urtuu(14, "Бн.Өлзийт");
CALL Insert_into_Urtuu(15, "Бн.Баянхонгор");
CALL Insert_into_Urtuu(16, "Бө.Өлгий");
CALL Insert_into_Urtuu(17, "Бу.Булган");
CALL Insert_into_Urtuu(18, "Бн.Бөмбөгөр");
CALL Insert_into_Urtuu(19, "Бн.Бууцагаан");
CALL Insert_into_Urtuu(20, "Го.Дэлгэр");
CALL Insert_into_Urtuu(21, "Го.Есөнбулаг");
CALL Insert_into_Urtuu(22, "Тө.Баянчандмань");
CALL Insert_into_Urtuu(23, "Сэ.Баянгол");
CALL Insert_into_Urtuu(24, "Да.Дархан");
CALL Insert_into_Urtuu(25, "Да.Шарын гол");
CALL Insert_into_Urtuu(26, "Гс.Чойр");
CALL Insert_into_Urtuu(27, "Дг.Даланжаргалан");
CALL Insert_into_Urtuu(28, "Дг.Айраг");
CALL Insert_into_Urtuu(29, "Дг.Сайншанд");
CALL Insert_into_Urtuu(30, "Хэ.Норовлин");
CALL Insert_into_Urtuu(31, "До.Баян-Уул");
CALL Insert_into_Urtuu(32, "До.Баяндун");
CALL Insert_into_Urtuu(33, "До.Дашбалбар");
CALL Insert_into_Urtuu(34, "Хэ.Бэрх");
CALL Insert_into_Urtuu(35, "Хэ.Норовлин");
CALL Insert_into_Urtuu(36, "До.Баян-Уул");
CALL Insert_into_Urtuu(37, "Сү.Түмэнцогт");
CALL Insert_into_Urtuu(38, "До.Хөлөнбуйр");
CALL Insert_into_Urtuu(39, "До.Хэрлэн");
CALL Insert_into_Urtuu(40, "Ду.Дэлгэрцогт");
CALL Insert_into_Urtuu(41, "Ду.Сайнцагаан");
CALL Insert_into_Urtuu(42, "Ду.Луус");
CALL Insert_into_Urtuu(43, "Ду.Хулт");
CALL Insert_into_Urtuu(44, "Ду.Сайхан-Овоо");
CALL Insert_into_Urtuu(45, "Сонгиохайрхан ЗТТөв");
CALL Insert_into_Urtuu(46, "Баянзүрх ЗТТөв");

-- ---------------------------------Urtuu DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Urtuu(Urtuu_no_param int)
BEGIN
   DELETE FROM Urtuu WHERE Urtuu_no = Urtuu_no_param;
END //
DELIMITER ;

CALL Delete_from_Urtuu(40);
CALL Insert_into_Urtuu(40, "Ду.Дэлгэрцогт");
-- ---------------------------------Urtuu UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Urtuu(Urtuu_no_param int, Urtuu_ner_param varchar(100))
BEGIN
   UPDATE Urtuu SET Urtuu_ner = Urtuu_ner_param WHERE Urtuu_no = Urtuu_no_param;
END //
DELIMITER ;

CALL Update_Urtuu(10, "Ар.Өлзийт");

-- SELECT  from urtuu;

-- ------------------------------Nasnii_angilal INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Nasnii_angilal(Nasnii_angilal_no_param varchar(2), Nasnii_angilal_ner_param varchar(50))
BEGIN
   INSERT INTO Nasnii_angilal VALUES (Nasnii_angilal_no_param, Nasnii_angilal_ner_param);
END //
DELIMITER ;

CALL Insert_into_Nasnii_angilal("HV", "Хүүхэд");
CALL Insert_into_Nasnii_angilal("TO", "Том хүн");

CALL Insert_into_Nasnii_angilal("HO", "Хөнгөлөлттэй зөрчигч");

-- ------------------------------Nasnii_angilal DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Nasnii_angilal(Nasnii_angilal_no_param varchar(2))
BEGIN
   DELETE FROM Nasnii_angilal WHERE Nasnii_angilal_no = Nasnii_angilal_no_param;
END //
DELIMITER ;

CALL Delete_from_Nasnii_angilal("HO");

-- ------------------------------Nasnii_angilal UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Nasnii_angilal(Nasnii_angilal_no_param varchar(2), Nasnii_angilal_ner_param varchar(50))
BEGIN
   UPDATE Nasnii_angilal SET Nasnii_angilal_ner = Nasnii_angilal_ner_param WHERE Nasnii_angilal_no = Nasnii_angilal_no_param;
END //
DELIMITER ;

CALL Update_Nasnii_angilal("HO", "Ахмад настан");

-- SELECT  from nasnii_angilal;

-- --------------------------------Chiglel INSERT ------------------------
DELIMITER //
CREATE PROCEDURE Insert_into_Chiglel(
	Chiglel_ID varchar(5),
    Chiglel_ner varchar(100),
    Chiglel_vne decimal(10,2)
)
BEGIN
	insert into Chiglel values
    (Chiglel_ID, Chiglel_ner, Chiglel_vne);
END//
DELIMITER ;
CALL Insert_into_Chiglel("CH001", "Сонгиохайрхан ЗТТөв - Ар. Жаргалант", 42800.00);
CALL Insert_into_Chiglel("CH002", "Сонгиохайрхан ЗТТөв - Ар.Тариат", 55000.00);
CALL Insert_into_Chiglel("CH003", "Сонгиохайрхан ЗТТөв - Ар.Цэцэрлэг", 42000.00);
CALL Insert_into_Chiglel("CH004", "Сонгиохайрхан ЗТТөв - Ар.Эрдэнэбулган", 45000.00);
CALL Insert_into_Chiglel("CH005", "Сонгиохайрхан ЗТТөв - Бн.Баянхонгор", 48000.00);
CALL Insert_into_Chiglel("CH006", "Сонгиохайрхан ЗТТөв - Бө.Баян-Өлгий", 128000.00);
CALL Insert_into_Chiglel("CH007", "Сонгиохайрхан ЗТТөв - Бу.Булган", 32800.00);
CALL Insert_into_Chiglel("CH008", "Сонгиохайрхан ЗТТөв - Го.Есөнбулаг" , 76000.00);
CALL Insert_into_Chiglel("CH009", "Сонгиохайрхан ЗТТөв - Дархан-Уул", 20000.00);
CALL Insert_into_Chiglel("CH010", "Сонгиохайрхан ЗТТөв - Да.Шарын гол", 20000.00);
CALL Insert_into_Chiglel("CH011", "Баянзүрх ЗТТөв - Дг.Сайншанд", 33600.00);
CALL Insert_into_Chiglel("CH012", "Баянзүрх ЗТТөв - До.Дашбалбар", 56700.00);
CALL Insert_into_Chiglel("CH013", "Баянзүрх ЗТТөв - До.Баян-Уул", 60000.00);
CALL Insert_into_Chiglel("CH014", "Баянзүрх ЗТТөв - До.Хэрлэн", 60000.00);
CALL Insert_into_Chiglel("CH015", "Баянзүрх ЗТТөв - Ду.Сайхан-Овоо", 37800.00);
-- SELECT FROM Chiglel;
-- --------------------------------Chiglel DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Chiglel(id varchar(5))
BEGIN
DELETE FROM Chiglel WHERE Chiglel_ID=id;
END //
DELIMITER ;
CALL Delete_from_Chiglel("CH015");

-- --------------------------------Chiglel UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Chiglel(id varchar(5), update_value_1 varchar(100), update_value_2 decimal(10,2))
BEGIN
UPDATE Chiglel SET 
Chiglel_ner=update_value_1,
Chiglel_vne=update_value_2
WHERE Chiglel_ID=id;
END //
DELIMITER ;
CALL Update_Chiglel("CH015", "Баянзүрх ЗТТөв - До.Хэрлэн_2", 65000.00);


-- ------------------------------------Marshrut INSERT ------------------------
DELIMITER //
CREATE PROCEDURE Insert_into_Marshrut(
    p_Marshrut_no varchar(5),
    p_Chiglel_ID varchar(5),
    p_Urtuu_no1 int,
    p_Urtuu_no2 int,
    p_Daraalliin_dugaar int
)
BEGIN
    INSERT INTO Marshrut
    VALUES (p_Marshrut_no, p_Chiglel_ID, p_Urtuu_no1, p_Urtuu_no2, p_Daraalliin_dugaar);
END //
DELIMITER ;
CALL Insert_into_Marshrut("M0001", "CH001", 45, 1, 1);
CALL Insert_into_Marshrut("M0002", "CH001", 1, 2, 2);
CALL Insert_into_Marshrut("M0003", "CH001", 2, 3, 3);
CALL Insert_into_Marshrut("M0004", "CH001", 3, 4, 4);
CALL Insert_into_Marshrut("M0005", "CH002", 45, 5, 1);
CALL Insert_into_Marshrut("M0006", "CH002", 5, 6, 2);
CALL Insert_into_Marshrut("M0007", "CH002", 6, 7, 3);
CALL Insert_into_Marshrut("M0008", "CH002", 7, 8, 4);
CALL Insert_into_Marshrut("M0009", "CH003", 45, 1, 1);
CALL Insert_into_Marshrut("M0010", "CH003", 1, 2, 2);
CALL Insert_into_Marshrut("M0011", "CH003", 2, 3, 3);
CALL Insert_into_Marshrut("M0012", "CH003", 3, 9, 4);
CALL Insert_into_Marshrut("M0013", "CH004", 45, 10, 1);
CALL Insert_into_Marshrut("M0014", "CH004", 10, 11, 2);
CALL Insert_into_Marshrut("M0015", "CH004", 11, 12, 3);
CALL Insert_into_Marshrut("M0016", "CH005", 45, 13, 1);
CALL Insert_into_Marshrut("M0017", "CH005", 13, 14, 2);
CALL Insert_into_Marshrut("M0018", "CH005", 14, 15, 3);
CALL Insert_into_Marshrut("M0019", "CH006", 45, 16, 1);
CALL Insert_into_Marshrut("M0020", "CH007", 45, 17, 1);
CALL Insert_into_Marshrut("M0021", "CH008", 45, 18, 1);
CALL Insert_into_Marshrut("M0022", "CH008", 18, 19, 2);
CALL Insert_into_Marshrut("M0023", "CH008", 19, 20, 3);
CALL Insert_into_Marshrut("M0024", "CH008", 20, 21, 4);
CALL Insert_into_Marshrut("M0025", "CH009", 45, 22, 1);
CALL Insert_into_Marshrut("M0026", "CH009", 22, 23, 2);
CALL Insert_into_Marshrut("M0027", "CH009", 23, 24, 3);
CALL Insert_into_Marshrut("M0028", "CH010", 45, 25, 1);
CALL Insert_into_Marshrut("M0029", "CH011", 46, 26, 1);
CALL Insert_into_Marshrut("M0030", "CH011", 26, 27, 2);
CALL Insert_into_Marshrut("M0031", "CH011", 27, 28, 3);
CALL Insert_into_Marshrut("M0032", "CH011", 28, 29, 4);
CALL Insert_into_Marshrut("M0033", "CH012", 46, 30, 1);
CALL Insert_into_Marshrut("M0034", "CH012", 30, 31, 2);
CALL Insert_into_Marshrut("M0035", "CH012", 31, 32, 3);
CALL Insert_into_Marshrut("M0036", "CH012", 32, 33, 4);
CALL Insert_into_Marshrut("M0037", "CH013", 46, 33, 1);
CALL Insert_into_Marshrut("M0038", "CH013", 34, 35, 2);
CALL Insert_into_Marshrut("M0039", "CH013", 35, 36, 3);
CALL Insert_into_Marshrut("M0040", "CH014", 46, 37, 1);
CALL Insert_into_Marshrut("M0041", "CH014", 37, 38, 2);
CALL Insert_into_Marshrut("M0042", "CH014", 38, 39, 3);
-- deer delete hiisn bsnaa butsaaj nemev
CALL Insert_into_Chiglel("CH015", "Баянзүрх ЗТТөв - Ду.Сайхан-Овоо", 37800.00);
CALL Insert_into_Marshrut("M0043", "CH015", 45, 40, 1);
CALL Insert_into_Marshrut("M0044", "CH015", 40, 41, 2);
CALL Insert_into_Marshrut("M0045", "CH015", 41, 42, 3);
CALL Insert_into_Marshrut("M0046", "CH015", 42, 43, 4);
CALL Insert_into_Marshrut("M0047", "CH015", 43, 44, 5);

-- ------------------------------------Marshrut UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Marshrut(
    p_Marshrut_no varchar(5),
    p_Chiglel_ID varchar(5),
    p_Urtuu_no1 int,
    p_Urtuu_no2 int,
    p_Daraalliin_dugaar int
)
BEGIN
    UPDATE Marshrut
    SET Chiglel_ID = p_Chiglel_ID,
        Urtuu_no1 = p_Urtuu_no1,
        Urtuu_no2 = p_Urtuu_no2,
        Daraalliin_dugaar = p_Daraalliin_dugaar
    WHERE Marshrut_no = p_Marshrut_no;
END //
DELIMITER ;
CALL Update_Marshrut('M0047', 'CH015', 43, 45, 2);

-- ------------------------------------Marshrut DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Marshrut(p_Marshrut_no varchar(5))
BEGIN
    DELETE FROM Marshrut
    WHERE Marshrut_no = p_Marshrut_no;
END //
DELIMITER ;
CALL Delete_from_Marshrut('M0047');
-- deer ustgasanaa dahij nemev
CALL Insert_into_Marshrut("M0047", "CH015", 43, 44, 5);
-- ----------------------------------Tarif INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Tarif(
    p_Tarif_no int,
    p_Marshrut_no varchar(5),
    p_Nasnii_angilal_no varchar(2),
    p_Vne decimal(10,2)
)
BEGIN
    INSERT INTO Tarif 
    VALUES (p_Tarif_no, p_Marshrut_no, p_Nasnii_angilal_no, p_Vne);
END //
DELIMITER ;
CALL Insert_into_Tarif(1,"M0001","TO", 28000.00);
CALL Insert_into_Tarif(2,"M0001","HV", 14000.00);
CALL Insert_into_Tarif(3,"M0002","TO", 6500.00);
CALL Insert_into_Tarif(4,"M0002","HV", 3250.00);
CALL Insert_into_Tarif(5,"M0003","TO", 3800.00);
CALL Insert_into_Tarif(6,"M0003","HV", 1900.00);
CALL Insert_into_Tarif(7,"M0004","TO", 4500.00);
CALL Insert_into_Tarif(8,"M0004","HV", 2250.00);
CALL Insert_into_Tarif(9,"M0005","TO", 33000.00);
CALL Insert_into_Tarif(10,"M0005","HV", 16500.00);
CALL Insert_into_Tarif(11,"M0006","TO", 15000.00);
CALL Insert_into_Tarif(12,"M0006","HV", 7500.00);
CALL Insert_into_Tarif(13,"M0007","TO", 2000.00);
CALL Insert_into_Tarif(14,"M0007","HV", 1000.00);
CALL Insert_into_Tarif(15,"M0008","TO", 2000.00);
CALL Insert_into_Tarif(16,"M0008","HV", 1000.00);
CALL Insert_into_Tarif(17,"M0009","TO", 5000.00);
CALL Insert_into_Tarif(18,"M0009","HV", 2500.00);
CALL Insert_into_Tarif(19,"M0010","TO", 28000.00);
CALL Insert_into_Tarif(20,"M0010","HV", 14000.00);
CALL Insert_into_Tarif(21,"M0011","TO", 6500.00);
CALL Insert_into_Tarif(22,"M0011","HV", 3250.00);
CALL Insert_into_Tarif(23,"M0012","TO", 3800.00);
CALL Insert_into_Tarif(24,"M0012","HV", 1900.00);
CALL Insert_into_Tarif(25,"M0013","TO", 3700.00);
CALL Insert_into_Tarif(26,"M0013","HV", 1850.00);
CALL Insert_into_Tarif(27,"M0014","TO", 37000.00);
CALL Insert_into_Tarif(28,"M0014","HV", 18500.00);
CALL Insert_into_Tarif(29,"M0015","TO", 6000.00);
CALL Insert_into_Tarif(30,"M0015","HV", 3000.00);
CALL Insert_into_Tarif(31,"M0016","TO", 2000.00);
CALL Insert_into_Tarif(32,"M0016","HV", 1000.00);
CALL Insert_into_Tarif(33,"M0017","TO", 42000.00);
CALL Insert_into_Tarif(34,"M0017","HV", 21000.00);
CALL Insert_into_Tarif(35,"M0018","TO", 4600.00);
CALL Insert_into_Tarif(36,"M0018","HV", 2300.00);
CALL Insert_into_Tarif(37,"M0019","TO", 1400.00);
CALL Insert_into_Tarif(38,"M0019","HV", 700.00);
CALL Insert_into_Tarif(39,"M0020","TO", 128000.00);
CALL Insert_into_Tarif(40,"M0020","HV", 64000.00);
CALL Insert_into_Tarif(41,"M0021","TO", 32800.00);
CALL Insert_into_Tarif(42,"M0021","HV", 16400.00);
CALL Insert_into_Tarif(43,"M0022","TO", 55000.00);
CALL Insert_into_Tarif(44,"M0022","HV", 27500.00);
CALL Insert_into_Tarif(45,"M0023","TO", 6000.00);
CALL Insert_into_Tarif(46,"M0023","HV", 3000.00);
CALL Insert_into_Tarif(47,"M0024","TO", 9000.00);
CALL Insert_into_Tarif(48,"M0024","HV", 4500.00);
CALL Insert_into_Tarif(49,"M0025","TO", 6000.00);
CALL Insert_into_Tarif(50,"M0025","HV", 3000.00);
CALL Insert_into_Tarif(51,"M0026","TO", 10000.00);
CALL Insert_into_Tarif(52,"M0026","HV", 5000.00);
CALL Insert_into_Tarif(53,"M0027","TO", 5000.00);
CALL Insert_into_Tarif(54,"M0027","HV", 2500.00);
CALL Insert_into_Tarif(55,"M0028","TO", 5000.00);
CALL Insert_into_Tarif(56,"M0028","HV", 2500.00);
CALL Insert_into_Tarif(57,"M0029","TO", 20000.00);
CALL Insert_into_Tarif(58,"M0029","HV", 10000.00);
CALL Insert_into_Tarif(59,"M0030","TO", 16600.00);
CALL Insert_into_Tarif(60,"M0030","HV", 8300.00);
CALL Insert_into_Tarif(61,"M0031","TO", 5800.00);
CALL Insert_into_Tarif(62,"M0031","HV", 2900.00);
CALL Insert_into_Tarif(63,"M0032","TO", 1900.00);
CALL Insert_into_Tarif(64,"M0032","HV", 950.00);
CALL Insert_into_Tarif(65,"M0033","TO", 9300.00);
CALL Insert_into_Tarif(66,"M0033","HV", 4650.00);
CALL Insert_into_Tarif(67,"M0034","TO", 40400.00);
CALL Insert_into_Tarif(68,"M0034","HV", 20200.00);
CALL Insert_into_Tarif(69,"M0035","TO", 5200.00);
CALL Insert_into_Tarif(70,"M0035","HV", 2600.00);
CALL Insert_into_Tarif(71,"M0036","TO", 4800.00);
CALL Insert_into_Tarif(72,"M0036","HV", 2400.00);
CALL Insert_into_Tarif(73,"M0037","TO", 7200.00);
CALL Insert_into_Tarif(74,"M0037","HV", 3600.00);
CALL Insert_into_Tarif(75,"M0038","TO", 30000.00);
CALL Insert_into_Tarif(76,"M0038","HV", 15000);
CALL Insert_into_Tarif(77,"M0039","TO", 22000.00);
CALL Insert_into_Tarif(78,"M0039","HV", 11000.00);
CALL Insert_into_Tarif(79,"M0040","TO", 8000.00);
CALL Insert_into_Tarif(80,"M0040","HV", 4000.00);
CALL Insert_into_Tarif(81,"M0041","TO", 42000.00);
CALL Insert_into_Tarif(82,"M0041","HV", 21000.00);
CALL Insert_into_Tarif(83,"M0042","TO", 6000.00);
CALL Insert_into_Tarif(84,"M0042","HV", 3000.00);
CALL Insert_into_Tarif(85,"M0043","TO", 12000.00);
CALL Insert_into_Tarif(86,"M0043","HV", 6000.00);
CALL Insert_into_Tarif(87,"M0044","TO", 17400.00);
CALL Insert_into_Tarif(88,"M0044","HV", 8700.00);
CALL Insert_into_Tarif(89,"M0045","TO", 3200.00);
CALL Insert_into_Tarif(90,"M0045","HV", 1600.00);
CALL Insert_into_Tarif(91,"M0046","TO", 3700.00);
CALL Insert_into_Tarif(92,"M0046","HV", 1850.00);
CALL Insert_into_Tarif(93,"M0047","TO", 2700.00);
CALL Insert_into_Tarif(94,"M0047","HV", 1350.00);

-- ----------------------------------Tarif UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Tarif(
    p_Tarif_no int,
    p_Marshrut_no varchar(5),
    p_Nasnii_angilal_no varchar(2),
    p_Vne decimal(10,2)
)
BEGIN
    UPDATE Tarif
    SET Marshrut_no = p_Marshrut_no,
        Nasnii_angilal_no = p_Nasnii_angilal_no,
        Vne = p_Vne
    WHERE Tarif_no = p_Tarif_no;
END //
DELIMITER ;
CALL Update_Tarif(9, 'M0047', 'HV', 1500.00);

-- ----------------------------------Tarif DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Tarif(p_Tarif_no int)
BEGIN
    DELETE FROM Tarif
    WHERE Tarif_no = p_Tarif_no;
END //
DELIMITER ;

CALL Delete_from_Tarif(94);
CALL Insert_into_Tarif(94,"M0047","HV", 1350.00);

-- --------------------------------Hungulultiin_Turul_Lavlah INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Hungulultiin_Turul_Lavlah(
    p_Hungulultiin_turul_no varchar(3),
    p_Hungulultiin_turul_ner varchar(50),
    p_Vniin_cof double
)
BEGIN
    INSERT INTO Hungulultiin_turul_lavlah (Hungulultiin_turul_no, Hungulultiin_turul_ner, Vniin_cof)
    VALUES (p_Hungulultiin_turul_no, p_Hungulultiin_turul_ner, p_Vniin_cof);
END //
DELIMITER ;
CALL Insert_into_Hungulultiin_Turul_Lavlah("H01", "+5 суудал захиалсан", 0.97);
CALL Insert_into_Hungulultiin_Turul_Lavlah("H02", "+10 суудал захиалсан", 0.9);
CALL Insert_into_Hungulultiin_Turul_Lavlah('H03', 'New Turul', 0.85);

-- --------------------------------Hungulultiin_Turul_Lavlah UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Hungulultiin_Turul_Lavlah(
    p_Hungulultiin_turul_no varchar(3),
    p_Hungulultiin_turul_ner varchar(50),
    p_Vniin_cof double
)
BEGIN
    UPDATE Hungulultiin_turul_lavlah
    SET Hungulultiin_turul_ner = p_Hungulultiin_turul_ner,
        Vniin_cof = p_Vniin_cof
    WHERE Hungulultiin_turul_no = p_Hungulultiin_turul_no;
END //
DELIMITER ;
DELIMITER ;
CALL Update_Hungulultiin_Turul_Lavlah('H03', 'Updated Turul', 0.88);

-- --------------------------------Hungulultiin_Turul_Lavlah DELETE------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Hungulultiin_Turul_Lavlah(p_Hungulultiin_turul_no varchar(3))
BEGIN
    DELETE FROM Hungulultiin_turul_lavlah
    WHERE Hungulultiin_turul_no = p_Hungulultiin_turul_no;
END //
DELIMITER ;
CALL Delete_from_Hungulultiin_Turul_Lavlah('H03');

-- SELECT FROM Hungulultiin_Turul_Lavlah;

-- -------------------------------Aylal INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Aylal(
    p_Aylal_no varchar(8),
    p_Chiglel_ID varchar(5),
    p_Hudluh_ognoo timestamp,
    p_Teevriin_heregsliin_no varchar(5)
)
BEGIN
    INSERT INTO Aylal
    VALUES (p_Aylal_no, p_Chiglel_ID, p_Hudluh_ognoo, p_Teevriin_heregsliin_no);
END //
DELIMITER ;
CALL Insert_into_Aylal('A0000001', 'CH001', '2023-11-20 08:00:00', 'TH001');
CALL Insert_into_Aylal('A0000002', 'CH001', '2023-11-20 13:30:00', 'TH002');
CALL Insert_into_Aylal('A0000003', 'CH002', '2023-11-20 09:00:00', 'TH003');
CALL Insert_into_Aylal('A0000004', 'CH002', '2023-11-21 10:00:00', 'TH004');
CALL Insert_into_Aylal('A0000005', 'CH005', '2023-11-21 18:00:00', 'TH005');
CALL Insert_into_Aylal('A0000006', 'CH006', '2023-11-22 08:00:00', 'TH001');
CALL Insert_into_Aylal('A0000007', 'CH007', '2023-11-22 14:00:00', 'TH006');
CALL Insert_into_Aylal('A0000008', 'CH008', '2023-11-22 10:30:00', 'TH007');
CALL Insert_into_Aylal('A0000009', 'CH009', '2023-11-23 15:45:00', 'TH009');
CALL Insert_into_Aylal('A0000010', 'CH010', '2023-11-24 12:20:00', 'TH008');
CALL Insert_into_Aylal('A0000011', 'CH011', '2023-11-24 17:00:00', 'TH010');
CALL Insert_into_Aylal('A0000012', 'CH012', '2023-11-24 08:00:00', 'TH006');
CALL Insert_into_Aylal('A0000013', 'CH013', '2023-11-25 15:00:00', 'TH008');
CALL Insert_into_Aylal('A0000014', 'CH014', '2023-11-26 12:00:00', 'TH002');
CALL Insert_into_Aylal('A0000015', 'CH015', '2023-11-27 13:00:00', 'TH003');

CALL Insert_into_Aylal('A0000016', 'CH003', '2023-11-28 09:30:00', 'TH005');

-- -------------------------------Aylal UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Aylal(
    p_Aylal_no varchar(8),
    p_Chiglel_ID varchar(5),
    p_Hudluh_ognoo timestamp,
    p_Teevriin_heregsliin_no varchar(5)
)
BEGIN
    UPDATE Aylal
    SET Chiglel_ID = p_Chiglel_ID,
        Hudluh_ognoo = p_Hudluh_ognoo,
        Teevriin_heregsliin_no = p_Teevriin_heregsliin_no
    WHERE Aylal_no = p_Aylal_no;
END //
DELIMITER ;
CALL Update_Aylal('A0000016', 'CH014', '2023-12-03 10:00:00', 'TH010');

-- -------------------------------Aylal DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Aylal(p_Aylal_no varchar(8))
BEGIN
    DELETE FROM Aylal
    WHERE Aylal_no = p_Aylal_no;
END //
DELIMITER ;
CALL Delete_from_Aylal('A0000016');

-- SELECT FROM Aylal;

-- -------------------------------Ajiltan INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Ajiltan(
    p_Ajiltnii_code varchar(10),
    p_Ovog varchar(50),
    p_Ner varchar(50),
    p_RD varchar(10),
    p_Hvis varchar(2),
    p_Utasnii_dugaar varchar(8),
    p_Email varchar(100),
    p_Ajiltan_turul_no varchar(3),
    p_Nevtreh_ner varchar(50),
    p_Nuuts_vg varchar(50),
    p_Ajillaj_ehelsen_ognoo date
)
BEGIN
    INSERT INTO Ajiltan
    VALUES (
        p_Ajiltnii_code, p_Ovog, p_Ner, p_RD, p_Hvis, p_Utasnii_dugaar,
        p_Email, p_Ajiltan_turul_no, p_Nevtreh_ner, p_Nuuts_vg, p_Ajillaj_ehelsen_ognoo
    );
END //
DELIMITER ;
CALL Insert_into_Ajiltan('A001', 'Галбадрах', 'Номин', 'ЗХ90120834', 'эм', '99892988', 'nomin@gmail.com', 'AT1', 'nomio', 'nomi2988', '2021-11-01');
CALL Insert_into_Ajiltan('A002', 'Содном', 'Одгэрэл', 'ЗХ97121824', 'эм', '89983421', 'odgerel@gmail.com', 'AT2', 'odgerel', 'odG1824', '2020-10-21');
CALL Insert_into_Ajiltan('A003', 'Амартүвшин', 'Эгшиглэн', 'НГ89310554', 'эм', '91283742', 'egshiglen@gmail.com', 'AT3', 'egshig', '0909', '2020-12-01');
CALL Insert_into_Ajiltan('A004', 'Гаадан', 'Билгүүн', 'ЭГ72221495', 'эр', '91129876', 'bilgvvn@gmail.com', 'AT3', 'bilgvvn', 'bek897', '2020-08-23');
CALL Insert_into_Ajiltan('A005', 'Очир', 'Мягмар', 'ЗГ77310607', 'эр', '95127281', 'myagmar@gmail.com', 'AT3', 'myagmar', 'myagmar56', '2021-01-01');
CALL Insert_into_Ajiltan('A006', 'Өлзийсайхан', 'Ариунтуяа', 'МГ89122738', 'эм', '88774334', 'ariuna@gmail.com', 'AT3', 'ariuk', 'ari987', '2019-01-01');
CALL Insert_into_Ajiltan('A007', 'Энхбаяр', 'Болор', 'ЛД88121378', 'эм', '90099880', 'bolor@gmail.com', 'AT3', 'bolor', 'blr235', '2019-01-01');
CALL Insert_into_Ajiltan('A008', 'Гочоо', 'Болд', 'ЗХ84220833', 'эр', '99771274', 'bold@gmail.com', 'AT4', 'bold', 'bld421', '2019-01-01');
CALL Insert_into_Ajiltan('A009', 'Даш', 'Дорж', 'ЛД88121379', 'эр', '96208754', 'dorj@gmail.com', 'AT4', 'dorj', 'sdfg32', '2019-01-01');
CALL Insert_into_Ajiltan('A010', 'Батбаяр', 'Саруул', 'ХГ91123037', 'эр', '80982342', 'saruul@gmail.com', 'AT4', 'saruul', 'sar45', '2019-01-01');
CALL Insert_into_Ajiltan('A011', 'Эх', 'Туршил', 'ЗХ12345678', 'эр', '98765432', 'turshil@gmail.com', 'AT1', 'turshil', 'turshil123', '2023-01-15');

-- -------------------------------Ajiltan UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Ajiltan(
    p_Ajiltnii_code varchar(10),
    p_Ovog varchar(50),
    p_Ner varchar(50),
    p_RD varchar(10),
    p_Hvis varchar(2),
    p_Utasnii_dugaar varchar(8),
    p_Email varchar(100),
    p_Ajiltan_turul_no varchar(3),
    p_Nevtreh_ner varchar(50),
    p_Nuuts_vg varchar(50),
    p_Ajillaj_ehelsen_ognoo date
)
BEGIN
    UPDATE Ajiltan
    SET
        Ovog = p_Ovog,
        Ner = p_Ner,
        RD = p_RD,
        Hvis = p_Hvis,
        Utasnii_dugaar = p_Utasnii_dugaar,
        Email = p_Email,
        Ajiltan_turul_no = p_Ajiltan_turul_no,
        Nevtreh_ner = p_Nevtreh_ner,
        Nuuts_vg = p_Nuuts_vg,
        Ajillaj_ehelsen_ognoo = p_Ajillaj_ehelsen_ognoo
    WHERE Ajiltnii_code = p_Ajiltnii_code;
END //
DELIMITER ;
CALL Update_Ajiltan('A011', 'Эх', 'Шинэ', 'ЗХ87654321', 'эр', '98765432', 'shineturshil@gmail.com', 'AT1', 'shineturshil', 'shineturshil123', '2023-02-01');

-- -------------------------------Ajiltan DELETE------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Ajiltan(p_Ajiltnii_code varchar(10))
BEGIN
    DELETE FROM Ajiltan
    WHERE Ajiltnii_code = p_Ajiltnii_code;
END //
DELIMITER ;
CALL Delete_from_Ajiltan('A011');

-- SELECT FROM Ajiltan;

-- -------------------------------AylalBaJolooch INSERT ------------------------
-- DESC AylalBaJolooch;
DROP PROCEDURE IF EXISTS Insert_into_AylalBaJolooch;
DELIMITER //
CREATE PROCEDURE Insert_into_AylalBaJolooch(
	id INT, 
    p_Aylal_no varchar(8),
    p_Ajiltnii_code varchar(10)
)
BEGIN
    INSERT INTO AylalBaJolooch (AylalBaJolooch, Aylal_no, Ajiltnii_code)
    VALUES (id, p_Aylal_no, p_Ajiltnii_code);
END //
DELIMITER ;
CALL Insert_into_AylalBaJolooch(1, 'A0000001', 'A001');
CALL Insert_into_AylalBaJolooch(2, 'A0000002', 'A002');
CALL Insert_into_AylalBaJolooch(3, 'A0000003', 'A003');
CALL Insert_into_AylalBaJolooch(4, 'A0000004', 'A004');
CALL Insert_into_AylalBaJolooch(5, 'A0000005', 'A005');
CALL Insert_into_AylalBaJolooch(6, 'A0000006', 'A006');
CALL Insert_into_AylalBaJolooch(7, 'A0000007', 'A007');
CALL Insert_into_AylalBaJolooch(8, 'A0000008', 'A008');
CALL Insert_into_AylalBaJolooch(9, 'A0000009', 'A009');
CALL Insert_into_AylalBaJolooch(10, 'A0000010', 'A010');
CALL Insert_into_AylalBaJolooch(11, 'A0000011', 'A001');
CALL Insert_into_AylalBaJolooch(12, 'A0000012', 'A003');
CALL Insert_into_AylalBaJolooch(13, 'A0000013', 'A004');
CALL Insert_into_AylalBaJolooch(14, 'A0000014', 'A007');
CALL Insert_into_AylalBaJolooch(15, 'A0000015', 'A002');
CALL Insert_into_AylalBaJolooch(16, 'A0000001', 'A006');
CALL Insert_into_AylalBaJolooch(17, 'A0000002', 'A007');
CALL Insert_into_AylalBaJolooch(18, 'A0000004', 'A003');
CALL Insert_into_AylalBaJolooch(19, 'A0000005', 'A004');
CALL Insert_into_AylalBaJolooch(20, 'A0000006', 'A005');
CALL Insert_into_AylalBaJolooch(21, 'A0000011', 'A003');

-- -------------------------------AylalBaJolooch UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_AylalBaJolooch(
    p_AylalBaJolooch_id int,
    p_Aylal_no varchar(8),
    p_Ajiltnii_code varchar(10)
)
BEGIN
    UPDATE AylalBaJolooch
    SET Aylal_no = p_Aylal_no, Ajiltnii_code = p_Ajiltnii_code
    WHERE AylalBaJolooch = p_AylalBaJolooch_id;
END //
DELIMITER ;
CALL Update_AylalBaJolooch(21, 'A0000010', 'A005');

-- -------------------------------AylalBaJolooch DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_AylalBaJolooch(IN p_AylalBaJolooch_id int)
BEGIN
    DELETE FROM AylalBaJolooch WHERE AylalBaJolooch = p_AylalBaJolooch_id;
END //
DELIMITER ;
CALL Delete_from_AylalBaJolooch(21);


-- -------------------------Zahialgiin_tuluv_lavlah INSERT------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Zahialgiin_tuluv_lavlah(
    p_Zahialgiin_tuluv_lavlah_no varchar(5),
    p_Zahialgiin_tuluv_lavlah_ner varchar(50)
)
BEGIN
    INSERT INTO Zahialgiin_tuluv_lavlah (Zahialgiin_tuluv_lavlah_no, Zahialgiin_tuluv_lavlah_ner)
    VALUES (p_Zahialgiin_tuluv_lavlah_no, p_Zahialgiin_tuluv_lavlah_ner);
END //
DELIMITER ;
CALL Insert_into_Zahialgiin_tuluv_lavlah("ZTL01", "Баталгаажаагүй");
CALL Insert_into_Zahialgiin_tuluv_lavlah("ZTL02", "Баталгаажсан");
CALL Insert_into_Zahialgiin_tuluv_lavlah("ZTL03", "Буцаасан");
CALL Insert_into_Zahialgiin_tuluv_lavlah("ZTL04", "Цуцлагдсан");
CALL Insert_into_Zahialgiin_tuluv_lavlah("ZTL05", "Шинээр нэмэгдэж буй");

-- -------------------------Zahialgiin_tuluv_lavlah UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Zahialgiin_tuluv_lavlah(
    p_Zahialgiin_tuluv_lavlah_no varchar(5),
    p_Zahialgiin_tuluv_lavlah_ner varchar(50)
)
BEGIN
    UPDATE Zahialgiin_tuluv_lavlah
    SET Zahialgiin_tuluv_lavlah_ner = p_Zahialgiin_tuluv_lavlah_ner
    WHERE Zahialgiin_tuluv_lavlah_no = p_Zahialgiin_tuluv_lavlah_no;
END //
DELIMITER ;
CALL Update_Zahialgiin_tuluv_lavlah("ZTL05", "Батал");

-- -------------------------Zahialgiin_tuluv_lavlah DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Zahialgiin_tuluv_lavlah(p_Zahialgiin_tuluv_lavlah_no varchar(5))
BEGIN
    DELETE FROM Zahialgiin_tuluv_lavlah WHERE Zahialgiin_tuluv_lavlah_no = p_Zahialgiin_tuluv_lavlah_no;
END //
DELIMITER ;
CALL Delete_from_Zahialgiin_tuluv_lavlah("ZTL05");


-- ------------------------------Zahialagch INSERT------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Zahialagch(
    p_Zahialagchiin_code varchar(10),
    p_Ovog varchar(10),
    p_Ner varchar(10),
    p_Email varchar(100),
    p_Nevtreh_ner varchar(50),
    p_Nuuts_vg varchar(50)
)
BEGIN
    INSERT INTO Zahialagch (Zahialagchiin_code, Ovog, Ner, Email, Nevtreh_ner, Nuuts_vg)
    VALUES (p_Zahialagchiin_code, p_Ovog, p_Ner, p_Email, p_Nevtreh_ner, p_Nuuts_vg);
END //
DELIMITER ;
CALL Insert_into_Zahialagch("ZA00000001", "Очир", "Батбаяр", "batbayr@gmail.com", "batbayr", "batbayr");
CALL Insert_into_Zahialagch("ZA00000002", "Гомбо", "Оюунбилэг", "oyunbileg@gmail.com", "oyunbileg", "oyunbileg");
CALL Insert_into_Zahialagch("ZA00000003", "Сүрэн", "Ану", "anu@gmail.com", "anu", "anu");
CALL Insert_into_Zahialagch("ZA00000004", "Гаадан", "Хишигбат", "hishigbat@gmail.com", "hishigbat", "hishigbat");
CALL Insert_into_Zahialagch("ZA00000005", "Билгүүн59", "Тэнгэр", "tenger@gmail.com", "tenger", "tenger");
CALL Insert_into_Zahialagch("ZA00000006", "Туяа", "Мөнхцэцэг", "munhtsetseg@gmail.com", "munhtsetseg", "munhtsetseg");
CALL Insert_into_Zahialagch("ZA00000007", "Мөнх", "Энхжаргал", "enhjargal@gmail.com", "enhjargal", "enhjargal");
CALL Insert_into_Zahialagch("ZA00000008", "Эрдэнэ", "Амарсайхан", "amarsaihan@gmail.com", "amarsaihan", "amarsaihan");
CALL Insert_into_Zahialagch("ZA00000009", "Баяр", "Саран", "saran@gmail.com", "saran", "saran");
CALL Insert_into_Zahialagch("ZA00000010", "Долгор", "Ганболд", "ganbold@gmail.com", "ganbold", "ganbold");
CALL Insert_into_Zahialagch("ZA00000011", "Эрдэнэ", "Батбаяр", "erdene@gmail.com", "erdene", "erdene");

-- ------------------------------Zahialagch UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Zahialagch(
    p_Zahialagchiin_code varchar(10),
    p_Ovog varchar(10),
    p_Ner varchar(10),
    p_Email varchar(100),
    p_Nevtreh_ner varchar(50),
    p_Nuuts_vg varchar(50)
)
BEGIN
    UPDATE Zahialagch
    SET
        Ovog = p_Ovog,
        Ner = p_Ner,
        Email = p_Email,
        Nevtreh_ner = p_Nevtreh_ner,
        Nuuts_vg = p_Nuuts_vg
    WHERE Zahialagchiin_code = p_Zahialagchiin_code;
END //
DELIMITER ;
CALL Update_Zahialagch("ZA00000011", "Очир", "Батбаяр", "newbatbayr@gmail.com", "newbatbayr", "newbatbayr");

-- ------------------------------Zahialagch DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Zahialagch(IN p_Zahialagchiin_code varchar(10))
BEGIN
    DELETE FROM Zahialagch WHERE Zahialagchiin_code = p_Zahialagchiin_code;
END //
DELIMITER ;
CALL Delete_from_Zahialagch("ZA00000011");

-- SELECT FROM Zahialagch;

-- -------------------------------Zahialga INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Zahialga(
    p_Ajiltnii_code VARCHAR(10),
    p_Zahialagchiin_code VARCHAR(10),
    p_Hungulultiin_turul_no VARCHAR(3)
)
BEGIN
    INSERT INTO Zahialga (Zahialgiin_code, Ajiltnii_code, Zahialagchiin_code, Hungulultiin_turul_no)
    VALUES (null, p_Ajiltnii_code, p_Zahialagchiin_code, p_Hungulultiin_turul_no);
END //
DELIMITER ;

-- --------------------------------Zahialgiin_tuluv INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Zahialgiin_tuluv(
    p_Tailbar VARCHAR(255),
    p_Zahialgiin_code INT
)
BEGIN
    INSERT INTO Zahialgiin_tuluv (Zahialgiin_tuluv_no, Tailbar, Zahialgiin_code)
    VALUES (null, p_Tailbar, p_Zahialgiin_code);
END //
DELIMITER ;


-- --------------------------------Zahialgiin_tuluv UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Zahialgiin_tuluv(
    p_Tailbar VARCHAR(255),
    p_Zahialgiin_tuluv_lavlah_no VARCHAR(5),
    p_Zahialgiin_code INT
)
BEGIN
    UPDATE Zahialgiin_tuluv
    SET
        Tailbar = p_Tailbar,
        Zahialgiin_tuluv_lavlah_no = p_Zahialgiin_tuluv_lavlah_no
    WHERE Zahialgiin_code = p_Zahialgiin_code;
END //
DELIMITER ;

-- --------------------------------Zahialgiin_tuluv DELETE------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Zahialgiin_tuluv(p_Zahialgiin_tuluv_no INT)
BEGIN
    DELETE FROM Zahialgiin_tuluv WHERE Zahialgiin_tuluv_no = p_Zahialgiin_tuluv_no;
END //
DELIMITER ;
CALL Delete_from_Zahialgiin_tuluv(11);


-- ------------------------------------- TRIGGER --------------------------------
DELIMITER //
CREATE TRIGGER after_Zahialga_insert
AFTER INSERT ON Zahialga
FOR EACH ROW
BEGIN
    CALL Insert_into_Zahialgiin_tuluv(null, NEW.Zahialgiin_code);
END //
DELIMITER ;





CALL Insert_into_Zahialga(  "A004", "ZA00000001", null);
CALL Insert_into_Zahialga(  "A003", "ZA00000002", null);
CALL Insert_into_Zahialga(  "A005", "ZA00000003", null);
CALL Insert_into_Zahialga(  "A006", "ZA00000004", null);
CALL Insert_into_Zahialga(  "A007", "ZA00000005", null);
CALL Insert_into_Zahialga(  "A003", "ZA00000006", null);
CALL Insert_into_Zahialga(  "A004", "ZA00000007", null);
CALL Insert_into_Zahialga(  "A005", "ZA00000008", null);
CALL Insert_into_Zahialga(  "A006", "ZA00000009", null);
CALL Insert_into_Zahialga( "A007", "ZA00000010", null);
CALL Insert_into_Zahialga( "A008", "ZA00000001", null);
-- SELECT FROM Ajiltan;

-- -------------------------------Zahialga UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Zahialga(
    p_Zahialgiin_code INT,
    p_Zahialgiin_ognoo DATETIME,
    p_Ajiltnii_code VARCHAR(10),
    p_Zahialagchiin_code VARCHAR(10),
    p_Hungulultiin_turul_no VARCHAR(3)
)
BEGIN
    UPDATE Zahialga
    SET
        Zahialgiin_ognoo = p_Zahialgiin_ognoo,
        Ajiltnii_code = p_Ajiltnii_code,
        Zahialagchiin_code = p_Zahialagchiin_code,
        Hungulultiin_turul_no = p_Hungulultiin_turul_no
    WHERE Zahialgiin_code = p_Zahialgiin_code;
END //
DELIMITER ;
CALL Update_Zahialga(11, "2023-11-21 09:00:00", "A009", "ZA00000002", null);
-- --------------------------------- Update_Zahialgiin_hungulult_id ----------------------------
drop PROCEDURE if exists Update_Zahialgiin_hungulult_id;
DELIMITER // 
CREATE PROCEDURE Update_Zahialgiin_hungulult_id(zah_id int)
BEGIN
	DECLARE hung_id varchar(3);

    DECLARE count_result INT;

    SELECT COUNT(*) INTO count_result
    FROM Zahialgiin_detail
    WHERE Zahialgiin_code = zah_id;

    IF count_result >= 10 THEN
        SET hung_id = 'H02';
    ELSEIF count_result >= 5 THEN
        SET hung_id = 'H01';
    ELSE
        SET hung_id = NULL;
    END IF;

    update Zahialga
    set Hungulultiin_turul_no =hung_id 
	where Zahialgiin_code = zah_id;
END //
DELIMITER ;
DELIMITER ;

call Update_Zahialgiin_hungulult_id(1);
call Update_Zahialgiin_hungulult_id(2);
call Update_Zahialgiin_hungulult_id(3);
call Update_Zahialgiin_hungulult_id(4);
call Update_Zahialgiin_hungulult_id(5);
call Update_Zahialgiin_hungulult_id(6);
call Update_Zahialgiin_hungulult_id(7);
call Update_Zahialgiin_hungulult_id(8);
call Update_Zahialgiin_hungulult_id(9);
-- SELECT  from Zahialga;

-- -------------------------------Zahialga DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Zahialga(p_Zahialgiin_code INT)
BEGIN
    DELETE FROM Zahialga WHERE Zahialgiin_code = p_Zahialgiin_code;
END //
DELIMITER ;

-- SELECT FROM Zahialga;


-- -----------------------------Zahialgiin_detail INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Zahialgiin_detail(
    in_Zahialgiin_detail_no int,
    in_Zahialgiin_code int,
    in_Zorchigchiin_code varchar(10),
    in_Suudal_no varchar(7),
    in_Suudliin_tuluv_no varchar(4),
    in_Aylal_no varchar(8)
)
BEGIN
    INSERT INTO Zahialgiin_detail VALUES (
        in_Zahialgiin_detail_no,
        in_Zahialgiin_code,
        in_Zorchigchiin_code,
        in_Suudal_no,
        in_Suudliin_tuluv_no,
        in_Aylal_no
    );
END //
DELIMITER ;
CALL Insert_into_Zahialgiin_detail(1, 1, "ZO00000001","TH00101", "STL1", "A0000001");
CALL Insert_into_Zahialgiin_detail(2, 2, "ZO00000001","TH00201", "STL1", "A0000002");
CALL Insert_into_Zahialgiin_detail(3, 2, "ZO00000002","TH00202", "STL1", "A0000002");
CALL Insert_into_Zahialgiin_detail(4, 2, "ZO00000003","TH00203", "STL1", "A0000002");
CALL Insert_into_Zahialgiin_detail(5, 2, "ZO00000004","TH00204", "STL1", "A0000002");
CALL Insert_into_Zahialgiin_detail(6, 2, "ZO00000005","TH00205", "STL1", "A0000002");
CALL Insert_into_Zahialgiin_detail(7, 2, "ZO00000006","TH00206", "STL1", "A0000002");
CALL Insert_into_Zahialgiin_detail(8, 3, "ZO00000001","TH00301", "STL1", "A0000003");
CALL Insert_into_Zahialgiin_detail(9, 3, "ZO00000002","TH00302", "STL1", "A0000003");
CALL Insert_into_Zahialgiin_detail(10, 3, "ZO00000003","TH00305", "STL1", "A0000003");
CALL Insert_into_Zahialgiin_detail(11, 3, "ZO00000004","TH00306", "STL1", "A0000003");
CALL Insert_into_Zahialgiin_detail(12, 3, "ZO00000005","TH00310", "STL1", "A0000003");
CALL Insert_into_Zahialgiin_detail(13, 3, "ZO00000006","TH00311", "STL1", "A0000003");
CALL Insert_into_Zahialgiin_detail(14, 3, "ZO00000007","TH00315", "STL1", "A0000003");
CALL Insert_into_Zahialgiin_detail(15, 3, "ZO00000008","TH00317", "STL1", "A0000003");
CALL Insert_into_Zahialgiin_detail(16, 3, "ZO00000009","TH00313", "STL1", "A0000003");
CALL Insert_into_Zahialgiin_detail(17, 3, "ZO00000010","TH00327", "STL1", "A0000003");
CALL Insert_into_Zahialgiin_detail(18, 4, "ZO00000011","TH00428", "STL1", "A0000004");
CALL Insert_into_Zahialgiin_detail(19, 5, "ZO00000012","TH00501", "STL1", "A0000005");
CALL Insert_into_Zahialgiin_detail(20, 6, "ZO00000013","TH00101", "STL1", "A0000006");
CALL Insert_into_Zahialgiin_detail(21, 7, "ZO00000014","TH00601", "STL1", "A0000007");
CALL Insert_into_Zahialgiin_detail(22, 7, "ZO00000015","TH00604", "STL1", "A0000007");
CALL Insert_into_Zahialgiin_detail(23, 8, "ZO00000001","TH00706", "STL1", "A0000008");
CALL Insert_into_Zahialgiin_detail(24, 8, "ZO00000002","TH00708", "STL1", "A0000008");
CALL Insert_into_Zahialgiin_detail(25, 9, "ZO00000005","TH00902", "STL1", "A0000009");
CALL Insert_into_Zahialgiin_detail(26, 9, "ZO00000004","TH00904", "STL1", "A0000009");
CALL Insert_into_Zahialgiin_detail(27, 10, "ZO00000007","TH00808", "STL1", "A0000010");
CALL Insert_into_Zahialgiin_detail(28, 10, "ZO00000009","TH00810", "STL1", "A0000010");
CALL Insert_into_Zahialgiin_detail(29, 10, "ZO00000011","TH00813", "STL1", "A0000010");
CALL Insert_into_Zahialgiin_detail(30, 10, "ZO00000015","TH00814", "STL1", "A0000010");
CALL Insert_into_Zahialgiin_detail(31, 10, "ZO00000015","TH00814", "STL1", "A0000010");

-- -----------------------------Zahialgiin_detail UPDATE ------------------------

DELIMITER //
CREATE PROCEDURE Update_Zahialgiin_detail(
    in_Zahialgiin_detail_no int,
    in_Zahialgiin_code int,
    in_Zorchigchiin_code varchar(10),
    in_Suudal_no varchar(7),
    in_Suudliin_tuluv_no varchar(4),
    in_Aylal_no varchar(8)
)
BEGIN
    UPDATE Zahialgiin_detail
    SET
        Zahialgiin_code = in_Zahialgiin_code,
        Zorchigchiin_code = in_Zorchigchiin_code,
        Suudal_no = in_Suudal_no,
        Suudliin_tuluv_no = in_Suudliin_tuluv_no,
        Aylal_no = in_Aylal_no
    WHERE Zahialgiin_detail_no = in_Zahialgiin_detail_no;
END //
DELIMITER ;
CALL Update_Zahialgiin_detail(31, 2, "ZO00000002", "TH00201", "STL2", "A0000002");

-- -----------------------------Zahialgiin_detail DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Zahialgiin_detail(
    in_Zahialgiin_detail_no int
)
BEGIN
    DELETE FROM Zahialgiin_detail
    WHERE Zahialgiin_detail_no = in_Zahialgiin_detail_no;
END //
DELIMITER ;
CALL Delete_from_Zahialgiin_detail(31);

-- SELECT FROM Zahialgiin_detail;

-- ---------------------------------Tulbur INSERT ------------------------

DELIMITER //
CREATE PROCEDURE Insert_into_Tulbur(
    Tulburiin_code_val varchar(10),
    Zahialgiin_code_val int,
    Tulbur_tulsun_ognoo_val datetime,
    Tulbur_helber_no_val varchar(3),
    Tuluh_dvn_val decimal(10, 2)
)
BEGIN
    INSERT INTO Tulbur (Tulburiin_code, Zahialgiin_code, Tulbur_tulsun_ognoo, Tulbur_helber_no, Tuluh_dvn)
    VALUES (Tulburiin_code_val, Zahialgiin_code_val, Tulbur_tulsun_ognoo_val, Tulbur_helber_no_val, Tuluh_dvn_val);
END //
DELIMITER ;
CALL Insert_into_Tulbur('TU00000001', 1, '2023-11-11 10:11:00', 'TH1', NULL);
CALL Insert_into_Tulbur('TU00000002', 2, '2023-11-12 14:26:23', 'TH1', NULL);
CALL Insert_into_Tulbur('TU00000003', 3, '2023-11-13 18:24:05', 'TH2', NULL);
CALL Insert_into_Tulbur('TU00000004', 4, '2023-11-14 15:15:46', 'TH4', NULL);
CALL Insert_into_Tulbur('TU00000005', 5, '2023-11-15 14:52:12', 'TH3', NULL);
CALL Insert_into_Tulbur('TU00000006', 6, '2023-11-16 20:01:30', 'TH2', NULL);
CALL Insert_into_Tulbur('TU00000007', 7, '2023-11-17 21:07:20', 'TH2', NULL);
-- ---------------------------------- TRIGGER ----------------------------
DELIMITER //
CREATE TRIGGER after_Tulbur_insert
AFTER INSERT ON Tulbur
FOR EACH ROW
BEGIN
    CALL Update_Zahialgiin_tuluv(null, "ZTL02", NEW.Zahialgiin_code);
END //
DELIMITER ;
-- -----------------------------------------------

CALL Insert_into_Tulbur('TU00000008', 8, '2023-11-18 22:33:46', 'TH4', NULL);
CALL Insert_into_Tulbur('TU00000009', 9, '2023-11-19 09:38:18', 'TH3', NULL);
CALL Insert_into_Tulbur('TU00000010', 10, '2023-11-19 09:38:18', 'TH3', NULL);
-- SELECT  from Zahialga;
-- ---------------------------------Tulbur DELETE ------------------------

DELIMITER //
CREATE PROCEDURE Delete_from_Tulbur(
    Tulburiin_code_val varchar(10)
)
BEGIN
    DELETE FROM Tulbur
    WHERE Tulburiin_code = Tulburiin_code_val;
END //
DELIMITER ;
CALL Delete_from_Tulbur('TU00000010');

CALL Insert_into_Tulbur('TU00000010', 10, '2023-11-19 09:38:18', 'TH3', NULL);

-- SELECT FROM Tulbur;



-- --------------------------------- Update_Zahialgiin_hungulult_id ----------------------------
drop PROCEDURE if exists Update_Zahialgiin_hungulult_id;
DELIMITER // 
CREATE PROCEDURE Update_Zahialgiin_hungulult_id(zah_id int)
BEGIN
	DECLARE hung_id varchar(3);

    DECLARE count_result INT;

    SELECT COUNT(*) INTO count_result
    FROM Zahialgiin_detail
    WHERE Zahialgiin_code = zah_id;

    CASE
        WHEN count_result >= 10 THEN
            SET hung_id = 'H02';
        WHEN count_result >= 5 THEN
            SET hung_id = 'H01';
        ELSE
            SET hung_id = NULL;
    END CASE;

    update Zahialga
    set Hungulultiin_turul_no =hung_id 
	where Zahialgiin_code = zah_id;
END //
DELIMITER ;
DELIMITER ;

call Update_Zahialgiin_hungulult_id(1);
call Update_Zahialgiin_hungulult_id(2);
call Update_Zahialgiin_hungulult_id(3);
call Update_Zahialgiin_hungulult_id(4);
call Update_Zahialgiin_hungulult_id(5);
call Update_Zahialgiin_hungulult_id(6);
call Update_Zahialgiin_hungulult_id(7);
call Update_Zahialgiin_hungulult_id(8);
call Update_Zahialgiin_hungulult_id(9);
-- SELECT  from Zahialga;

-- ---------------------------------------- nasni angilal id bodoh --------------------------
drop PROCEDURE if exists nas_angilal_no_bodoh;
DELIMITER //
CREATE PROCEDURE nas_angilal_no_bodoh(IN zcode VARCHAR(10), OUT nas_angilal_id VARCHAR(2))
BEGIN 
    DECLARE nas INT;
    
    select SUBSTRING(year(current_timestamp()), 3, 2) - SUBSTRING(RD, 3, 2) INTO nas
	FROM Zorchigch
	where Zorchigchiin_code = zcode;    
    IF nas < 0 THEN
        SET nas = nas + 100; 
    ELSEIF nas=0 THEN
        SET nas =  SUBSTRING(year(current_timestamp()), 3, 2);
    END IF;

    CASE
        WHEN nas >= 18 THEN
            SET nas_angilal_id = 'TO';
        ELSE
            SET nas_angilal_id = 'HV';
    END CASE;

END //
DELIMITER ;
-- ---------------------------------------- tarif bodoh --------------------------
DROP PROCEDURE IF EXISTS tarif_bodoh;
DELIMITER //
CREATE PROCEDURE tarif_bodoh(
    IN ayl_no varchar(8),
    IN zor_code VARCHAR(10),
    OUT tarif DECIMAL(10,2)
)
BEGIN
    DECLARE ehlel INT;
    DECLARE tugsgul INT;
    DECLARE chig_id varchar(5);
    DECLARE nas_angilal_id VARCHAR(2);
    DECLARE negj_une DECIMAL(10,2);
    CALL nas_angilal_no_bodoh(zor_code, nas_angilal_id);
    SELECT Chiglel_ID into chig_id from Aylal
    WHERE Aylal_no = ayl_no;
    SELECT Daraalliin_dugaar INTO ehlel
    FROM Marshrut
    WHERE Chiglel_ID = chig_id AND Urtuu_no1 = @urtuu1_id;

    SELECT Daraalliin_dugaar INTO tugsgul
    FROM Marshrut
    WHERE Chiglel_ID = chig_id AND Urtuu_no2 = @urtuu2_id;
    SET tarif=0;
    WHILE ehlel <= tugsgul DO
        SELECT Vne INTO negj_une FROM Tarif 
        WHERE Nasnii_angilal_no = nas_angilal_id AND Marshrut_no in (select Marshrut_no from Marshrut
        WHERE Chiglel_ID = chig_id AND Daraalliin_dugaar = ehlel);
        SET tarif  = (SELECT tarif) + negj_une;
        SET ehlel = ehlel + 1;
    END WHILE;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS tulbur_tootsoloh;
DELIMITER //
CREATE PROCEDURE tulbur_tootsoloh(
    IN zah_code int,
    OUT tulbur DECIMAL(10,2)
)
BEGIN
    DECLARE neg_detail_une DECIMAL(10,2);
    DECLARE done INT DEFAULT 0;
    DECLARE zor_code VARCHAR(10);
    DECLARE ayl_no varchar(8); 
    DECLARE cof double;
    
    DECLARE ordernumbers CURSOR
    FOR
    SELECT Zorchigchiin_code,Aylal_no FROM Zahialgiin_detail
    WHERE Zahialgiin_code=zah_code;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    SET tulbur=0;
    -- Курсороо нээнэ
    OPEN ordernumbers;
    -- Бүх бичлэгүүдийн хувьд давтана
    FETCH ordernumbers INTO zor_code, ayl_no;
    processing_loop: LOOP
        -- Check if no more rows to fetch
        IF done=1 THEN
            LEAVE processing_loop;
        END IF;
        
        call tarif_bodoh(ayl_no,zor_code,neg_detail_une);
        SET tulbur  = (SELECT tulbur) + neg_detail_une;
        FETCH ordernumbers INTO zor_code, ayl_no;
    END LOOP;
    -- Курсороо хаана
    CLOSE ordernumbers;

    select Vniin_cof into cof
    from Zahialga z
    inner join Hungulultiin_turul_lavlah h
    on z.Hungulultiin_turul_no = h.Hungulultiin_turul_no
    WHERE Zahialgiin_code=zah_code;
    SET tulbur  = (SELECT tulbur) * IFNULL(cof,1);
END //
DELIMITER ;



DROP PROCEDURE IF EXISTS UPDATE_Tulbur_Tuluh_dun;
DELIMITER //
CREATE PROCEDURE UPDATE_Tulbur_Tuluh_dun(zah_code int)
BEGIN
    DECLARE tulbur decimal(10,2);
    SET tulbur =0;
	call tulbur_tootsoloh(zah_code,tulbur);
    update Tulbur
    set Tuluh_dvn = tulbur
    where Zahialgiin_code=zah_code;
END //
DELIMITER ;

-- ------------------- Zahialgiin_code=1 M0001, M0002 marshrut
set @urtuu1_id = 45;
set @urtuu2_id = 2;
CALL UPDATE_Tulbur_Tuluh_dun(1);
-- ------------------- Zahialgiin_code=2 M0003 marshrut
set @urtuu1_id = 2;
set @urtuu2_id = 3;
CALL UPDATE_Tulbur_Tuluh_dun(2);
-- ------------------- Zahialgiin_code=3 M0006, M0007, M0008 marshrut
set @urtuu1_id = 5;
set @urtuu2_id = 8;
CALL UPDATE_Tulbur_Tuluh_dun(3);
-- ------------------- Zahialgiin_code=4  M0008 marshrut
set @urtuu1_id = 6;
set @urtuu2_id = 8;
CALL UPDATE_Tulbur_Tuluh_dun(4);
-- ------------------- Zahialgiin_code=5  M0017, M0018 marshrut
set @urtuu1_id = 13;
set @urtuu2_id = 15;
CALL UPDATE_Tulbur_Tuluh_dun(5);
-- ------------------- Zahialgiin_code=6  M0019 marshrut
set @urtuu1_id = 45;
set @urtuu2_id = 16;
CALL UPDATE_Tulbur_Tuluh_dun(6);
-- ------------------- Zahialgiin_code=7  M0020 marshrut
set @urtuu1_id = 45;
set @urtuu2_id = 17;
CALL UPDATE_Tulbur_Tuluh_dun(7);
-- ------------------- Zahialgiin_code=8  M0021, M0022, M0023, M0024 marshrut
set @urtuu1_id = 45;
set @urtuu2_id = 21;
CALL UPDATE_Tulbur_Tuluh_dun(8);
-- ------------------- Zahialgiin_code=9  M0026, M0027 marshrut
set @urtuu1_id = 22;
set @urtuu2_id = 24;
CALL UPDATE_Tulbur_Tuluh_dun(9);
-- SELECT FROM Tulbur;


-- ------------------------- Орлогын тайлан гаргах (сар) --------------------------
desc Tulbur;
DROP procedure if exists Orlogiin_tailan_Chiglel;
DELIMITER //
Create procedure Orlogiin_tailan_Chiglel(tyear int, tChiglel varchar(5), INOUT sum decimal(13,2))
BEGIN
DECLARE done int;
DECLARE s decimal(13,2);
DECLARE orlogo_tailan CURSOR FOR 
SELECT t.Tuluh_dvn FROM tulbur as t
join Zahialga as z on t.Zahialgiin_code = z.Zahialgiin_code
join zahialgiin_detail as zd on z.Zahialgiin_code = zd.Zahialgiin_code
join Aylal as a on zd.Aylal_no = a.Aylal_no
where a.Chiglel_id=tChiglel and year(Tulbur_tulsun_ognoo) = tyear
group by zd.Zahialgiin_code;
declare  continue handler for not found set done=1;
SET sum = 0;
OPEN orlogo_tailan;
	FETCH orlogo_tailan INTO s;
	orlogo_loop:LOOP
	IF done = 1 THEN LEAVE orlogo_loop;
	END IF;
	SET sum = sum + s;
	FETCH orlogo_tailan INTO s;
	END LOOP orlogo_loop;
CLOSE orlogo_tailan;
END // 
DELIMITER ;

SET @total = 0;
call Orlogiin_tailan_Chiglel(2023, "CH001", @total);
SELECT @total;
select * from Tulbur;

