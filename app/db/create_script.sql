-- Step: 01
-- Goal: Create a new database Mvc-2209c-P4
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Arjan de Ruijter            New
-- **********************************************************************************/

-- Check if the database exists
DROP DATABASE IF EXISTS `Mvc-2209c-P4`;

-- Create a new Database
CREATE DATABASE IF NOT EXISTS `Mvc-2209c-P4`;

-- Use database Mvc-2209c-P4
Use `Mvc-2209c-P4`;


-- Step: 02
-- Goal: Create a new table Examen
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Arjan de Ruijter            New
-- **********************************************************************************/

-- Drop table Examen
DROP TABLE IF EXISTS Examen;

CREATE TABLE IF NOT EXISTS Examen
(
    Id                  TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,StudentId           TINYINT                         NOT NULL
   ,Rijschool           VARCHAR(30)                     NOT NULL
   ,Stad                VARCHAR(30)                     NOT NULL
   ,Rijbewijscategorie  VARCHAR(5)                      NOT NULL
   ,Datum               DATE                            NOT NULL
   ,Uitslag             VARCHAR(10)                     NOT NULL
   ,IsActief            BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                     NOT NULL
   ,DatumGewijzigd      DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Examen_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 03
-- Goal: Fill table Examen with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Arjan de Ruijter            New
-- **********************************************************************************/

INSERT INTO Examen
(             
    StudentId           
   ,Rijschool           
   ,Stad                
   ,Rijbewijscategorie  
   ,Datum               
   ,Uitslag             
   ,IsActief          
   ,Opmerkingen            
   ,DatumAangemaakt     
   ,DatumGewijzigd 
)
VALUES
     (100234, 'VolGasVooruit', 'Rotterdam', 'B', '2023-04-03', 'Geslaagd', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(123432, 'InZijnVierDoorDeBocht', 'Sliedrecht', 'C', '2023-03-01', 'Geslaagd', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(103234, 'LinksomRechtsom', 'Dordrecht', 'D', '2023-05-15', 'Geslaagd', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(106452, 'OpDeVluchtStrook', 'Zwijndrecht', 'AM', '2023-05-08', 'Gezakt', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(104546, 'RechtDoorEnGaan', 'Rotterdam', 'B', '2010-04-17', 'Gezakt', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(100333, 'AltijdGeslaagd', 'Dordrecht', 'B', '2010-05-12', 'Geslaagd', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(124444, 'RijlesVoorJou', 'Rotterdam', 'B', '2010-04-12', 'Geslaagd', 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step: 06
-- Goal: Create a new table Examinator
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Arjan de Ruijter            New
-- **********************************************************************************/

-- Drop table Examinator
DROP TABLE IF EXISTS Examinator;

CREATE TABLE IF NOT EXISTS Examinator
(
    Id                  TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,Voornaam            VARCHAR(30)                     NOT NULL
   ,Tussenvoegsel       VARCHAR(10)                     NOT NULL
   ,Achternaam          VARCHAR(30)                     NOT NULL
   ,Mobiel              VARCHAR(20)                     NOT NULL   
   ,IsActief            BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                     NOT NULL
   ,DatumGewijzigd      DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Examinator_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 07
-- Goal: Fill table Examinator with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Arjan de Ruijter            New
-- **********************************************************************************/

INSERT INTO Examinator
(
     
     Voornaam
    ,Tussenvoegsel
    ,Achternaam
    ,Mobiel
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
     ('Manuel', 'van', 'Meekeren', '06-28493823', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Lissette', 'den', 'Dongen', '06-24383299', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Jurswailly', '', 'Luciano', '06-48293846', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Naswha', '', 'Salawi', '06-34291219', 1, NULL, SYSDATE(6), SYSDATE(6));



-- Step: 08
-- Step: 04
-- Goal: Create a new table ExamenPerExaminator
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Arjan de Ruijter            New
-- **********************************************************************************/

-- Drop table ExamenPerExaminator
DROP TABLE IF EXISTS ExamenPerExaminator;

CREATE TABLE IF NOT EXISTS ExamenPerExaminator
(
    Id                  TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,ExamenId            TINYINT         UNSIGNED        NOT NULL
   ,ExaminatorId        TINYINT         UNSIGNED        NOT NULL
   ,IsActief            BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                     NOT NULL
   ,DatumGewijzigd      DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_ExamenPerExaminator_Id   PRIMARY KEY CLUSTERED(Id)
   ,CONSTRAINT      FK_ExamenPerExaminator_ExamenId_Examen_Id  FOREIGN KEY (ExamenId) REFERENCES Examen(Id)
   ,CONSTRAINT      FK_ExamenPerExaminator_ExaminatorId_Examinator_Id FOREIGN KEY (ExaminatorId) REFERENCES Examinator(Id)
) ENGINE=InnoDB;

-- Step: 05
-- Goal: Fill table ExamenPerExaminator with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Arjan de Ruijter            New
-- **********************************************************************************/

INSERT INTO ExamenPerExaminator
(
    ExamenId
    ,ExaminatorId
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
     (1, 3, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(3, 3, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(2, 2, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(4, 1, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(7, 3, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(6, 2, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(5, 4, 1, NULL, SYSDATE(6), SYSDATE(6));
   
