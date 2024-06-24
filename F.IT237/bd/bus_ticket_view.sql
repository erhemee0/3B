USE Bus_ticket; 
SET Global log_bin_trust_function_creators = 1;
-- --------------------------------------------- Ажилтан -----------------------------------------------
DELIMITER //
CREATE FUNCTION fc_ajiltnii_code()
	RETURNS VARCHAR(10)
		BEGIN
			IF @a_code IS NULL THEN SET @a_code = "";
			END IF;
			RETURN @a_code;
		END //
DELIMITER ;
DELIMITER //
CREATE FUNCTION  fc_ajiltnii_ner()
	RETURNS VARCHAR(50)
		BEGIN
			IF @a_ner IS NULL THEN SET @a_ner = "";
			END IF;
			RETURN @a_ner;
		END //
DELIMITER ;        
DELIMITER //
CREATE FUNCTION  fc_ajiltnii_RD()
	RETURNS VARCHAR(10)
		BEGIN
			IF @a_rd IS NULL THEN SET @a_rd = "";
			END IF;
			RETURN @a_rd;
		END //   
 DELIMITER ;       
DELIMITER //
CREATE FUNCTION  fc_ajiltnii_phone()
	RETURNS VARCHAR(10)
		BEGIN
			IF @a_phone IS NULL THEN SET @a_phone = "";
			END IF;
			RETURN @a_phone;
		END // 
        DELIMITER ;
-- ------------------------------------------------------- Ажилтны жагсаалт харах ---------------------------------------------------------
DROP VIEW IF EXISTS v_ajiltan_list;
CREATE VIEW v_ajiltan_list
AS 
SELECT Ajiltnii_code AS Ажилтны_код,
	Ajiltan.Ner AS Нэр, 	
	Ajiltan.Utasnii_dugaar AS Утасны_дугаар, 	
	Ajiltan_turul.ajiltan_turul_ner AS Ажилтны_төрөл
FROM Ajiltan 
	INNER JOIN Ajiltan_turul ON Ajiltan.Ajiltan_turul_no = Ajiltan_turul.Ajiltan_turul_no ;

SELECT * FROM v_ajiltan_list;

-- ---------------------------------------------- Ажилтны дэлгэрэнгүй харах ----------------------------------------------------------

DROP VIEW IF EXISTS v_ajiltan_detail;
CREATE VIEW v_ajiltan_detail
AS 
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
    where Ajiltnii_code = fc_ajiltnii_code();
    
SET @a_code = "A003";
SELECT * FROM v_ajiltan_detail;
    
-- -------------------------------------------------------- Ажилтан хайх (CODE) ---------------------------------------------------
DROP VIEW IF EXISTS v_ajiltan_find_code;
CREATE VIEW v_ajiltan_find_code
AS 
SELECT Ajiltnii_code AS Ажилтны_код,
	Ajiltan.Ner AS Нэр, 	
	Ajiltan.Utasnii_dugaar AS Утасны_дугаар, 	
	Ajiltan_turul.ajiltan_turul_ner AS Ажилтны_төрөл
FROM Ajiltan 
	INNER JOIN Ajiltan_turul ON Ajiltan.Ajiltan_turul_no = Ajiltan_turul.Ajiltan_turul_no 
    where Ajiltnii_code = fc_ajiltnii_code();

SELECT * FROM v_ajiltan_find_code;
-- ----------------------------------------------------- Ажилтан хайх (Ner) ----------------------------------------------------------
DROP VIEW IF EXISTS v_ajiltan_find_ner;
CREATE VIEW v_ajiltan_find_ner
AS 
SELECT Ajiltnii_code AS Ажилтны_код,
	Ajiltan.Ner AS Нэр, 	
	Ajiltan.Utasnii_dugaar AS Утасны_дугаар, 	
	Ajiltan_turul.ajiltan_turul_ner AS Ажилтны_төрөл
FROM Ajiltan 
	INNER JOIN Ajiltan_turul ON Ajiltan.Ajiltan_turul_no = Ajiltan_turul.Ajiltan_turul_no 
    WHERE Ner = fc_ajiltnii_ner();
    
SET @a_ner = "Ариунтуяа";
SELECT * FROM v_ajiltan_find_ner;

-- --------------------------------------------------------- Ажилтан хайх (RD) ---------------------------------------------------------------

DROP VIEW IF EXISTS v_ajiltan_find_rd;
CREATE VIEW v_ajiltan_find_rd
AS 
SELECT Ajiltnii_code AS Ажилтны_код,
	Ajiltan.Ner AS Нэр, 	
	Ajiltan.Utasnii_dugaar AS Утасны_дугаар, 	    
	Ajiltan_turul.ajiltan_turul_ner AS Ажилтны_төрөл
FROM Ajiltan 
	INNER JOIN Ajiltan_turul ON Ajiltan.Ajiltan_turul_no = Ajiltan_turul.Ajiltan_turul_no 
    WHERE RD = fc_ajiltnii_RD();
    
SET @a_rd = "ЛД88121379";
SELECT * FROM v_ajiltan_find_rd;

-- ------------------------------------------------ Ажилтан хайх (Phone number) ------------------------------------------------------------------

DROP VIEW IF EXISTS v_ajiltan_find_phone;
CREATE VIEW v_ajiltan_find_phone
AS 
SELECT Ajiltnii_code AS Ажилтны_код,
	Ajiltan.Ner AS Нэр, 	
	Ajiltan.Utasnii_dugaar AS Утасны_дугаар, 	
	Ajiltan_turul.ajiltan_turul_ner AS Ажилтны_төрөл
FROM Ajiltan 
	INNER JOIN Ajiltan_turul ON Ajiltan.Ajiltan_turul_no = Ajiltan_turul.Ajiltan_turul_no 
    WHERE Utasnii_dugaar = fc_ajiltnii_phone();
    
SET @a_phone = "80982342";
SELECT * FROM v_ajiltan_find_phone;

-- -------------------------------------------------------  Тээврийн хэрэгсэл -----------------------------------------------------
DELIMITER //
create function fc_teever_no()
	returns varchar(10)
		BEGIN
			IF @teever_no is null THEN SET @teever_no = "";
			END IF;
			return @teever_no;
		END //
 DELIMITER ;       
DELIMITER //
CREATE FUNCTION fc_teever_dugaar()
	RETURNS VARCHAR(10)
		BEGIN
			IF @ulsiin_dugaar IS NULL THEN SET @ulsiin_dugaar = "";
			END IF;
			return @ulsiin_dugaar;
		END //
   DELIMITER ;     
DELIMITER //
CREATE FUNCTION fc_teever_mark()
	RETURNS VARCHAR(100)
		BEGIN
			IF @teever_mark IS NULL THEN SET @teever_mark = "";
			END IF;
			return @teever_mark;
		END //
DELIMITER ;
DELIMITER //
CREATE FUNCTION fc_teever_angilal()
	RETURNS VARCHAR(100)
		BEGIN
			IF @teever_angilal IS NULL THEN SET @teever_angilal = "";
			END IF;
			return @teever_angilal;
		END //
DELIMITER ;
DELIMITER //
CREATE FUNCTION fc_teever_vildwerlegch()
	RETURNS VARCHAR(100)
		BEGIN
			IF @teever_vildwerlegch IS NULL THEN SET @teever_vildwerlegch = "";
			END IF;
			return @teever_vildwerlegch;
		END //
        DELIMITER ;
-- -----------------------------------------  Тээврийн хэрэгслийн жагсаалт харах -------------------------------------------------
DROP VIEW IF EXISTS v_teever_list;
CREATE VIEW v_teever_list
AS
SELECT ts.Ulsiin_dugaar AS Улсын_дугаар,
	tht.Teevriin_heregsliin_turul_ner AS Төрөл
FROM Teevriin_heregsel AS ts
	INNER JOIN Teevriin_heregsliin_turul AS tht ON ts.Teevriin_heregsliin_turul_no = tht.Teevriin_heregsliin_turul_no;
    
SELECT * FROM v_teever_list;

-- ------------------------------------------  Тээврийн хэрэгслийн дэлгэрэнгүй харах --------------------------------------------

DROP VIEW IF EXISTS v_teever_detail;
CREATE VIEW v_teever_detail
AS
SELECT ts.Ulsiin_dugaar AS Улсын_дугаар,
	tht.Teevriin_heregsliin_turul_ner AS Төрөл,
	tsm.Teevriin_heregsliin_mark_ner AS Марк, 
	v.Vildwerlegch_ner AS Үйлдвэрлэгч
FROM Teevriin_heregsel AS ts
	INNER JOIN Teevriin_heregsliin_turul AS tht ON ts.Teevriin_heregsliin_turul_no = tht.Teevriin_heregsliin_turul_no
	INNER JOIN Teevriin_heregsliin_mark AS tsm ON ts.Teevriin_heregsliin_mark_no = tsm.Teevriin_heregsliin_mark_no
	INNER JOIN Teevriin_heregsliin_vildwerlegch AS v ON ts.Vildwerlegch_no = v.Vildwerlegch_no
    where ts.Teevriin_heregsliin_no = fc_teever_no();

SET @teever_no = "TH005";
SELECT * FROM v_teever_detail;

-- ------------------------------------------  Тээврийн хэрэгсэл хайх (ТЭЭВРИЙН ХЭРЭГСЛИЙН ДУГААР)---------------------------------------------
DROP VIEW IF EXISTS v_teever_find_no;
CREATE VIEW v_teever_find_no
AS
SELECT  ts.Ulsiin_dugaar AS Улсын_дугаар,
	tht.Teevriin_heregsliin_turul_ner AS Төрөл,
	tsm.Teevriin_heregsliin_mark_ner AS Марк, 
	v.Vildwerlegch_ner AS Үйлдвэрлэгч
FROM Teevriin_heregsel AS ts
	INNER JOIN Teevriin_heregsliin_turul AS tht ON ts.Teevriin_heregsliin_turul_no = tht.Teevriin_heregsliin_turul_no
	INNER JOIN Teevriin_heregsliin_mark AS tsm ON ts.Teevriin_heregsliin_mark_no = tsm.Teevriin_heregsliin_mark_no
	INNER JOIN Teevriin_heregsliin_vildwerlegch AS v ON ts.Vildwerlegch_no = v.Vildwerlegch_no
    WHERE Teevriin_heregsliin_no = fc_teever_no();
    
SET @teever_no = "TH005";
SELECT * FROM v_teever_find_no;

-- ---------------------------------------------- Тээврийн хэрэгсэл хайх (УЛСЫН ДУГААР) -----------------------------------------------
        
DROP VIEW IF EXISTS v_teever_find_mark;
CREATE VIEW v_teever_find_mark
AS
SELECT  ts.Ulsiin_dugaar AS Улсын_дугаар,
	tht.Teevriin_heregsliin_turul_ner AS Төрөл,
	tsm.Teevriin_heregsliin_mark_ner AS Марк, 
	v.Vildwerlegch_ner AS Үйлдвэрлэгч
FROM Teevriin_heregsel AS ts
	INNER JOIN Teevriin_heregsliin_turul AS tht ON ts.Teevriin_heregsliin_turul_no = tht.Teevriin_heregsliin_turul_no
	INNER JOIN Teevriin_heregsliin_mark AS tsm ON ts.Teevriin_heregsliin_mark_no = tsm.Teevriin_heregsliin_mark_no
	INNER JOIN Teevriin_heregsliin_vildwerlegch AS v ON ts.Vildwerlegch_no = v.Vildwerlegch_no
    WHERE ts.Ulsiin_dugaar = fc_teever_dugaar();

SET @ulsiin_dugaar = "06-64 УНА";
select * from v_teever_find_mark;

-- --------------------------------------------  Тээврийн хэрэгсэл хайх (Марк)----------------------------------------------------
        
DROP VIEW IF EXISTS v_teever_find_mark;
CREATE VIEW v_teever_find_mark
AS
SELECT ts.Ulsiin_dugaar AS Улсын_дугаар,
	tht.Teevriin_heregsliin_turul_ner AS Төрөл,
	tsm.Teevriin_heregsliin_mark_ner AS Марк, 
	v.Vildwerlegch_ner AS Үйлдвэрлэгч
FROM Teevriin_heregsel AS ts
	INNER JOIN Teevriin_heregsliin_turul AS tht ON ts.Teevriin_heregsliin_turul_no = tht.Teevriin_heregsliin_turul_no
	INNER JOIN Teevriin_heregsliin_mark AS tsm ON ts.Teevriin_heregsliin_mark_no = tsm.Teevriin_heregsliin_mark_no
	INNER JOIN Teevriin_heregsliin_vildwerlegch AS v ON ts.Vildwerlegch_no = v.Vildwerlegch_no
    WHERE tsm.Teevriin_heregsliin_mark_ner = fc_teever_mark();

SET @teever_mark = "Granbird";
select * from v_teever_find_mark;

-- -------------------------------------------  Тээврийн хэрэгсэл хайх (үйлдвэрлэгч)--------------------------------------------------
        
DROP VIEW IF EXISTS v_teever_find_vildwerlegch;
CREATE VIEW v_teever_find_vildwerlegch
AS
SELECT ts.Ulsiin_dugaar AS Улсын_дугаар,
	tht.Teevriin_heregsliin_turul_ner AS Төрөл,
	tsm.Teevriin_heregsliin_mark_ner AS Марк, 
	v.Vildwerlegch_ner AS Үйлдвэрлэгч
FROM Teevriin_heregsel AS ts
	INNER JOIN Teevriin_heregsliin_turul AS tht ON ts.Teevriin_heregsliin_turul_no = tht.Teevriin_heregsliin_turul_no
	INNER JOIN Teevriin_heregsliin_mark AS tsm ON ts.Teevriin_heregsliin_mark_no = tsm.Teevriin_heregsliin_mark_no
	INNER JOIN Teevriin_heregsliin_vildwerlegch AS v ON ts.Vildwerlegch_no = v.Vildwerlegch_no
    WHERE v.Vildwerlegch_ner = fc_teever_vildwerlegch();

SET @teever_vildwerlegch = "Toyota";
SELECT * FROM v_teever_find_vildwerlegch;
 
 -- ----------------------------------------  Тээврийн хэрэгсэл хайх (үйлдвэрлэгч)---------------------------------
        
DROP VIEW IF EXISTS v_teever_find_angilal;
CREATE VIEW v_teever_find_angilal
AS
SELECT ts.Ulsiin_dugaar AS Улсын_дугаар,
	tht.Teevriin_heregsliin_turul_ner AS Төрөл,
	tsm.Teevriin_heregsliin_mark_ner AS Марк, 
	v.Vildwerlegch_ner AS Үйлдвэрлэгч
FROM Teevriin_heregsel AS ts
	INNER JOIN Teevriin_heregsliin_turul AS tht ON ts.Teevriin_heregsliin_turul_no = tht.Teevriin_heregsliin_turul_no
	INNER JOIN Teevriin_heregsliin_mark AS tsm ON ts.Teevriin_heregsliin_mark_no = tsm.Teevriin_heregsliin_mark_no
	INNER JOIN Teevriin_heregsliin_vildwerlegch AS v ON ts.Vildwerlegch_no = v.Vildwerlegch_no
    WHERE tht.Teevriin_heregsliin_turul_ner = fc_teever_angilal();

SET @teever_angilal = "Дунд оврын автобус";
SELECT * FROM v_teever_find_angilal;

 -- ----------------------------------------------- Өртөөний жагсаалт харах -------------------------------------------------
DROP VIEW IF EXISTS v_urtuu_list;
CREATE VIEW v_urtuu_list
AS
SELECT Urtuu_no AS Өртөөний_дугаар,
	Urtuu_ner AS Өртөөний_нэр
FROM Urtuu;
    
SELECT * FROM v_urtuu_list;

 -- -------------------------------------------------- Өртөө хайх ----------------------------------------------
DROP FUNCTION IF EXISTS fc_urtuu_id;
DELIMITER //
CREATE FUNCTION fc_urtuu_id()
	RETURNS INT
		BEGIN
			IF @urtuu_id IS NULL THEN SET @urtuu_id = "";
			END IF;
			RETURN @urtuu_id;
		END //
  DELIMITER ;      
DROP VIEW IF EXISTS v_urtuu_find_ID;
CREATE VIEW v_urtuu_find_ID
AS
SELECT Urtuu_no AS Өртөөний_дугаар,
	Urtuu_ner AS Өртөөний_нэр
FROM Urtuu
    WHERE Urtuu_no = fc_urtuu_id();

SET @urtuu_id = 1;
SELECT * FROM v_urtuu_find_ID;

-- ------------------------------------------------ Маршрутын жагсаалт харах -----------------------------------------------------
DROP VIEW IF EXISTS v_marshrut_list;
CREATE VIEW v_marshrut_list
AS 
SELECT Marshrut.Marshrut_no as Маршрутын_дугаар,
	Chiglel.Chiglel_ner as Чиглэлийн_нэр, 
	urtuu1.Urtuu_ner as Өртөө1, 
	urtuu2.Urtuu_ner as Өртөө2,
	Marshrut.Daraalliin_dugaar as Дарааллын_дугаар
FROM Marshrut
	INNER JOIN Chiglel ON Chiglel.Chiglel_ID = Marshrut.Chiglel_ID
	INNER JOIN Urtuu as urtuu1 ON urtuu1.Urtuu_no = Marshrut.Urtuu_no1 
	INNER JOIN Urtuu as urtuu2 on urtuu2.Urtuu_no = Marshrut.Urtuu_no2;
    
SELECT * FROM v_marshrut_list;
-- -------------------------------------------------- Маршрут хайх ---------------------------------------------------
DROP FUNCTION IF EXISTS fc_chiglel_id;
DELIMITER //
CREATE FUNCTION fc_chiglel_id()
	RETURNS VARCHAR(5)
		BEGIN
			IF @chiglel_id IS NULL THEN SET @chiglel_id = "";
			END IF;
			RETURN @chiglel_id;
		END //
  DELIMITER ;      
DROP VIEW IF EXISTS v_marchrut_find;
CREATE VIEW v_marchrut_find
AS
SELECT Marshrut.Marshrut_no as Маршрутын_дугаар,
	Chiglel.Chiglel_ner as Чиглэлийн_нэр, 
	urtuu1.Urtuu_ner as Өртөө1, 
	urtuu2.Urtuu_ner as Өртөө2,
	Marshrut.Daraalliin_dugaar as Дарааллын_дугаар
FROM Marshrut
	INNER JOIN Chiglel ON Chiglel.Chiglel_ID = Marshrut.Chiglel_ID
	INNER JOIN Urtuu as urtuu1 ON urtuu1.Urtuu_no = Marshrut.Urtuu_no1 
	INNER JOIN Urtuu as urtuu2 on urtuu2.Urtuu_no = Marshrut.Urtuu_no2
WHERE Chiglel.Chiglel_ID = fc_chiglel_id();

SET @chiglel_id = "CH001";
SELECT * FROM v_marchrut_find;

-- ------------------------------------------------ Захиалсан суудлын төлөвийн жагсаалт харах ------------------------------------------
DROP VIEW IF EXISTS v_Zsuudliin_tuluv_list;
CREATE VIEW v_Zsuudliin_tuluv_list
AS
	SELECT 
		Zahialgiin_detail_no as №, 
		Zahialgiin_code  AS Захиалгын_код, 
		Suudal_no AS Суудлын_дугаар, 
		Suudliin_tuluv_ner AS Суудлын_төлөв 
	FROM Zahialgiin_detail
	INNER JOIN Suudliin_tuluv_lavlah ON Suudliin_tuluv_lavlah.Suudliin_tuluv_no = Zahialgiin_detail.Suudliin_tuluv_no;

SELECT * FROM v_Zsuudliin_tuluv_list;

-- ----------------------------------------------- Чиглэлийн жагсаалт харах -----------------------------------------------------
DROP VIEW IF EXISTS v_chiglel_list;
CREATE VIEW v_chiglel_list
AS
	SELECT * FROM Chiglel;
    
SELECT * FROM v_chiglel_list;

-- ----------------------------------------------- Чиглэл хайх -----------------------------------------------------
DROP VIEW IF EXISTS v_chiglel_find;
CREATE VIEW v_chiglel_find
AS
	SELECT * FROM Chiglel
    WHERE Chiglel_ID = fc_chiglel_id();
    
SET @chiglel_id = "CH005";
SELECT * FROM v_chiglel_find;

-- -------------------------------------------- Төлбөрийн хэлбэрийн жагсаалт харах -------------------------------------------------
DROP VIEW IF EXISTS v_THelber_list;
CREATE VIEW v_THelber_list
AS
	SELECT * FROM Tulburiin_helberiin_lavlah;

SELECT * FROM v_THelber_list;


-- ---------------------------------------------- Аяллын дэлгэрэнгүй харах ---------------------------------------------------

DROP FUNCTION IF EXISTS fc_aylal_no;
DELIMITER //
CREATE FUNCTION fc_aylal_no()
	RETURNS VARCHAR(8)
		BEGIN
			IF @aylal_id IS NULL THEN SET @aylal_id = "";
			END IF;
			RETURN @aylal_id;
		END //
 DELIMITER ;       
        
DROP VIEW IF EXISTS v_Aylal_detail;
CREATE VIEW v_Aylal_detail
AS 
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
WHERE Aylal.Aylal_no = fc_aylal_no()
GROUP BY Aylal.Aylal_no, Chiglel_ner, Ulsiin_dugaar, Hudluh_ognoo;

set @aylal_id = "A0000001";
SELECT * FROM v_Aylal_detail;

-- --------------------------------------------- Аялал хайх (Чиглэл) ------------------------------------------------
DROP VIEW IF EXISTS v_Aylal_find_chiglel;
CREATE VIEW v_Aylal_find_chiglel
AS 
SELECT Aylal.Aylal_no AS Аялалын_дугаар, 
	Chiglel_ner AS Чиглэлийн_нэр, 
	Ulsiin_dugaar AS Улсын_дугаар,
	Hudluh_ognoo AS Хөдлөх_огноо	
FROM Aylal
	LEFT JOIN Chiglel ON Aylal.Chiglel_ID = Chiglel.Chiglel_ID
	LEFT JOIN Teevriin_heregsel ON Aylal.Teevriin_heregsliin_no = Teevriin_heregsel.Teevriin_heregsliin_no
where Aylal.Chiglel_ID = fc_chiglel_id()
GROUP BY Aylal.Aylal_no, Chiglel_ner, Ulsiin_dugaar, Hudluh_ognoo;

SET @chiglel_id = "CH008";
SELECT * FROM v_Aylal_find_chiglel;

-- ------------------------------------------ Аялал хайх (Өртөө) ------------------------------------------
DROP VIEW IF EXISTS v_Aylal_find_urtuu;
CREATE VIEW v_Aylal_find_urtuu
AS 
SELECT Aylal.Aylal_no AS Аялалын_дугаар, 
	Chiglel_ner AS Чиглэлийн_нэр, 
	Ulsiin_dugaar AS Улсын_дугаар,
	Hudluh_ognoo AS Хөдлөх_огноо	
FROM Aylal
	LEFT JOIN Chiglel ON Aylal.Chiglel_ID = Chiglel.Chiglel_ID
	INNER JOIN Marshrut ON Marshrut.Chiglel_ID = Chiglel.Chiglel_ID
	INNER JOIN  Urtuu AS urtuu1 ON urtuu1.Urtuu_no = Marshrut.Urtuu_no1
	INNER JOIN  Urtuu AS urtuu2 ON urtuu2.Urtuu_no = Marshrut.Urtuu_no2
	LEFT JOIN Teevriin_heregsel ON Aylal.Teevriin_heregsliin_no = Teevriin_heregsel.Teevriin_heregsliin_no
WHERE Marshrut.Urtuu_no1 = fc_urtuu_id() OR Marshrut.Urtuu_no2 = fc_urtuu_id()
GROUP BY Aylal.Aylal_no, Chiglel_ner, Ulsiin_dugaar, Hudluh_ognoo;

SET @urtuu_id = 8;
SELECT * FROM v_Aylal_find_urtuu;

-- ------------------------------------ Аялал хайх (Тээврийн хэрэгслийн төрөл) --------------------------------------------
DROP VIEW IF EXISTS v_Aylal_find_teever_turul;
CREATE VIEW v_Aylal_find_teever_turul
AS 
SELECT Aylal.Aylal_no AS Аялалын_дугаар, 
	Chiglel_ner AS Чиглэлийн_нэр, 
	Ulsiin_dugaar AS Улсын_дугаар,
	Hudluh_ognoo AS Хөдлөх_огноо	
FROM Aylal
	LEFT JOIN Chiglel ON Aylal.Chiglel_ID = Chiglel.Chiglel_ID
	LEFT JOIN Teevriin_heregsel ON Aylal.Teevriin_heregsliin_no = Teevriin_heregsel.Teevriin_heregsliin_no
	INNER JOIN Teevriin_heregsliin_turul AS tht ON tht.Teevriin_heregsliin_turul_no = Teevriin_heregsel.Teevriin_heregsliin_turul_no
WHERE tht.Teevriin_heregsliin_turul_ner = fc_teever_angilal()
GROUP BY Aylal.Aylal_no, Chiglel_ner, Ulsiin_dugaar, Hudluh_ognoo;

SET @teever_angilal = "Дунд оврын автобус";
SELECT * FROM v_Aylal_find_teever_turul;

-- ----------------------------------------- Аяллын жагсаалт харах -------------------------------------------
DROP VIEW IF EXISTS v_Aylal_list;
CREATE VIEW v_Aylal_list
AS 
SELECT Aylal.Aylal_no AS Аялалын_дугаар, 
	Chiglel_ner AS Чиглэлийн_нэр, 
	Ulsiin_dugaar AS Улсын_дугаар,
	Hudluh_ognoo AS Хөдлөх_огноо	
FROM Aylal
	LEFT JOIN Chiglel ON Aylal.Chiglel_ID = Chiglel.Chiglel_ID
	LEFT JOIN Teevriin_heregsel ON Aylal.Teevriin_heregsliin_no = Teevriin_heregsel.Teevriin_heregsliin_no;

select * from v_Aylal_list;

-- ---------------------------------- Аяллын зорчигчийн жагсаалт харах -----------------------------------
DROP VIEW IF EXISTS v_zorchigch_list;
CREATE VIEW v_zorchigch_list
AS 
SELECT Ner AS Зорчигчийн_нэр, 
	RD AS Регистрийн_дугаар, 
    Utasnii_dugaar AS Утасны_дугаар
FROM Zorchigch
	WHERE Zorchigchiin_code IN
		(SELECT Zorchigchiin_code
		FROM Zahialgiin_detail
		WHERE Aylal_no = fc_aylal_no());
        
SET @aylal_id = "A0000002";       
SELECT * FROM v_zorchigch_list;

-- ------------------------------------- Аяллын сул суудлын жагсаалт -------------------------------------
DROP VIEW IF EXISTS v_sul_suudal_list;
CREATE VIEW v_sul_suudal_list
AS 
SELECT Suudal.Suudal_no AS Сул_суудал 
FROM Suudal
	INNER JOIN Teevriin_heregsel AS th ON th.Teevriin_heregsliin_no = Suudal.Teevriin_heregsliin_no
	INNER JOIN Aylal ON Aylal.Teevriin_heregsliin_no = th.Teevriin_heregsliin_no
	INNER JOIN Chiglel ON Chiglel.Chiglel_ID = Aylal.Chiglel_ID
WHERE Suudal.Suudal_no NOT IN
		(SELECT Zahialgiin_detail.Suudal_no
			FROM Zahialgiin_detail
			WHERE Aylal_no = fc_aylal_no())
			AND Aylal.Aylal_no = fc_aylal_no(); 
            
SET @aylal_id = "A0000003";             
SELECT * FROM v_sul_suudal_list;

-- ------------------------------------ Захиалгын дэлгэрэнгүй харах ----------------------------------

DROP FUNCTION IF EXISTS fc_zahialga_no;
DELIMITER //
CREATE FUNCTION fc_zahialga_no()
	RETURNS INT 
		BEGIN
			IF @zahialga_id IS NULL THEN SET @zahialga_id = "";
			END IF;
			RETURN @zahialga_id;
		END //
  DELIMITER ;      
DROP VIEW IF EXISTS v_zahialga_delgerengvi;
CREATE VIEW v_zahialga_delgerengvi
AS       
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
				WHERE Zahialgiin_code = fc_zahialga_no()
				ORDER BY Aylal_no
				LIMIT 1
			)
		GROUP BY Aylal.Aylal_no, Ulsiin_dugaar, Hudluh_ognoo
		) AS Aylal_delgerengvi ON Aylal_delgerengvi.A_Aylal_no = ZD.Aylal_no
WHERE ZD.Zahialgiin_code = fc_zahialga_no()
GROUP BY Z.Zahialgiin_code, Zahialgiin_ognoo, A_Aylal_no, A_Chiglel_ner, A_Ulsiin_dugaar, A_Hudluh_ognoo, A_Utasnii_dugaar, A_Subquery_Chiglel_ner;

SET @zahialga_id = 1;
SELECT * FROM v_zahialga_delgerengvi;

-- ------------------------- Захиалгын төлөв харах ----------------------------

DROP VIEW IF EXISTS v_zahialgiin_tuluv;
CREATE VIEW v_zahialgiin_tuluv
AS 
	SELECT Zahialgiin_code  AS Захиалгын_код, 
			Ognoo AS Огноо, 
            Zahialgiin_tuluv_lavlah_ner AS Төлөв, 
            Tailbar AS Тайлбар
    FROM Zahialgiin_tuluv
    INNER JOIN Zahialgiin_tuluv_lavlah ON Zahialgiin_tuluv_lavlah.Zahialgiin_tuluv_lavlah_no = Zahialgiin_tuluv.Zahialgiin_tuluv_lavlah_no
    WHERE Zahialgiin_code = fc_zahialga_no();
    
SET @zahialga_id = 1;
SELECT * FROM v_zahialgiin_tuluv;