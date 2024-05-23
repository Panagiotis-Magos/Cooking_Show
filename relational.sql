-- MySQL Script generated by MySQL Workbench
-- Wed May 22 21:31:35 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Photo` (
  `file_name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(50) NULL,
  PRIMARY KEY (`file_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ethnic Cuisine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ethnic Cuisine` (
  `CU_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(30) NOT NULL,
  `file_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CU_ID`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE,
  INDEX `cu_photo_idx` (`file_name` ASC) VISIBLE,
  CONSTRAINT `cu_photo`
    FOREIGN KEY (`file_name`)
    REFERENCES `mydb`.`Photo` (`file_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Food Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Food Groups` (
  `FG_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(30) NOT NULL,
  `Desription` VARCHAR(50) NULL,
  `file_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FG_ID`),
  INDEX `fg_photo_idx` (`file_name` ASC) VISIBLE,
  CONSTRAINT `fg_photo`
    FOREIGN KEY (`file_name`)
    REFERENCES `mydb`.`Photo` (`file_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ingredients` (
  `ING_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Kcal per 100` INT NOT NULL DEFAULT 0,
  `FG_ID` INT NOT NULL,
  `File_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ING_ID`),
  INDEX `ing_photo_idx` (`File_name` ASC) VISIBLE,
  CONSTRAINT `ing_fg`
    FOREIGN KEY (`ING_ID`)
    REFERENCES `mydb`.`Food Groups` (`FG_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ing_photo`
    FOREIGN KEY (`File_name`)
    REFERENCES `mydb`.`Photo` (`file_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Theme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Theme` (
  `THEME_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(30) NOT NULL,
  `Description` VARCHAR(500) NULL,
  `File_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`THEME_ID`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE,
  INDEX `file_name_idx` (`File_Name` ASC) VISIBLE,
  CONSTRAINT `file_name`
    FOREIGN KEY (`File_Name`)
    REFERENCES `mydb`.`Photo` (`file_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Recipes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Recipes` (
  `REC_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Pastry` TINYINT NULL DEFAULT 0,
  `Difficulty` INT NULL,
  `Desctiprion` VARCHAR(100) NULL,
  `Tip1` VARCHAR(150) NULL,
  `Tip2` VARCHAR(150) NULL,
  `Tip3` VARCHAR(150) NULL,
  `Total Time` INT NULL,
  `Prep Time` INT NULL,
  `Characrerization` VARCHAR(20) NULL,
  `PRIM_ING_ID` INT NOT NULL,
  `CU_ID` INT NOT NULL,
  `THEME_ID` INT NOT NULL,
  `file_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`REC_ID`),
  INDEX `test_idx` (`CU_ID` ASC) VISIBLE,
  INDEX `Primary_ingr_idx` (`PRIM_ING_ID` ASC) VISIBLE,
  INDEX `Rec_Theme_idx` (`THEME_ID` ASC) VISIBLE,
  INDEX `photo_idx` (`file_name` ASC) VISIBLE,
  CONSTRAINT `cuisine_recipe`
    FOREIGN KEY (`CU_ID`)
    REFERENCES `mydb`.`Ethnic Cuisine` (`CU_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Primary_ingr`
    FOREIGN KEY (`PRIM_ING_ID`)
    REFERENCES `mydb`.`Ingredients` (`ING_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rec_Theme`
    FOREIGN KEY (`THEME_ID`)
    REFERENCES `mydb`.`Theme` (`THEME_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `photo`
    FOREIGN KEY (`file_name`)
    REFERENCES `mydb`.`Photo` (`file_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Type` (
  `TY_ID` INT NOT NULL AUTO_INCREMENT,
  `Meal_type` VARCHAR(20) NULL,
  `file_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TY_ID`),
  INDEX `type_photo_idx` (`file_name` ASC) VISIBLE,
  CONSTRAINT `type_photo`
    FOREIGN KEY (`file_name`)
    REFERENCES `mydb`.`Photo` (`file_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Label`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Label` (
  `LA_ID` INT NOT NULL AUTO_INCREMENT,
  `Label_Name` VARCHAR(20) NULL,
  `Label_Info` VARCHAR(45) NULL,
  `file_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`LA_ID`),
  INDEX `file_name_idx` (`file_name` ASC) VISIBLE,
  CONSTRAINT `file_name`
    FOREIGN KEY (`file_name`)
    REFERENCES `mydb`.`Photo` (`file_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gear`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gear` (
  `GR_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NULL,
  `Instructions` VARCHAR(500) NULL,
  `file_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`GR_ID`),
  INDEX `gear_photo_idx` (`file_name` ASC) VISIBLE,
  CONSTRAINT `gear_photo`
    FOREIGN KEY (`file_name`)
    REFERENCES `mydb`.`Photo` (`file_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Steps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Steps` (
  `REC_ID` INT NOT NULL,
  `Count` INT NOT NULL,
  `Step` VARCHAR(200) NULL,
  PRIMARY KEY (`REC_ID`, `Count`),
  CONSTRAINT `Step_Rec`
    FOREIGN KEY (`REC_ID`)
    REFERENCES `mydb`.`Recipes` (`REC_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Chefs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Chefs` (
  `CH_ID` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(15) NOT NULL,
  `Last_Name` VARCHAR(20) NOT NULL,
  `Phone` INT NOT NULL,
  `Birthday` INT NOT NULL,
  `Age` INT NULL,
  `Experience` INT NULL,
  `Class` INT NULL,
  `File_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CH_ID`),
  INDEX `chef_photo_idx` (`File_Name` ASC) VISIBLE,
  CONSTRAINT `chef_photo`
    FOREIGN KEY (`File_Name`)
    REFERENCES `mydb`.`Photo` (`file_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Episodes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Episodes` (
  `EP_ID` INT NOT NULL AUTO_INCREMENT,
  `Season` INT NOT NULL,
  `EP_Number` INT NOT NULL,
  `Winner` VARCHAR(36) NULL,
  `File_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EP_ID`),
  INDEX `file_name_idx` (`File_Name` ASC) VISIBLE,
  CONSTRAINT `ep_photo`
    FOREIGN KEY (`File_Name`)
    REFERENCES `mydb`.`Photo` (`file_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nutrition Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nutrition Info` (
  `REC_ID` INT NOT NULL,
  `Fat per serving` INT NULL DEFAULT 0,
  `Protein per serving` INT NULL DEFAULT 0,
  `Carbs per serving` INT NULL DEFAULT 0,
  `Kcal per serving` INT NULL DEFAULT 0,
  PRIMARY KEY (`REC_ID`),
  CONSTRAINT `recipe_nutrition`
    FOREIGN KEY (`REC_ID`)
    REFERENCES `mydb`.`Recipes` (`REC_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rec_Chef`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rec_Chef` (
  `CH_ID` INT NOT NULL,
  `REC_ID` INT NOT NULL,
  PRIMARY KEY (`CH_ID`, `REC_ID`),
  INDEX `REC_idx` (`REC_ID` ASC) VISIBLE,
  CONSTRAINT `Chef`
    FOREIGN KEY (`CH_ID`)
    REFERENCES `mydb`.`Chefs` (`CH_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `REC`
    FOREIGN KEY (`REC_ID`)
    REFERENCES `mydb`.`Recipes` (`REC_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rec_Label`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rec_Label` (
  `LA_ID` INT NOT NULL,
  `REC_ID` INT NOT NULL,
  PRIMARY KEY (`LA_ID`, `REC_ID`),
  INDEX `REC_idx` (`REC_ID` ASC) VISIBLE,
  CONSTRAINT `REC`
    FOREIGN KEY (`REC_ID`)
    REFERENCES `mydb`.`Recipes` (`REC_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `LABEL`
    FOREIGN KEY (`LA_ID`)
    REFERENCES `mydb`.`Label` (`LA_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rec_Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rec_Type` (
  `REC_ID` INT NOT NULL,
  `TY_ID` INT NOT NULL,
  PRIMARY KEY (`REC_ID`, `TY_ID`),
  INDEX `TY_idx` (`TY_ID` ASC) VISIBLE,
  CONSTRAINT `REC`
    FOREIGN KEY (`REC_ID`)
    REFERENCES `mydb`.`Recipes` (`REC_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `TY`
    FOREIGN KEY (`TY_ID`)
    REFERENCES `mydb`.`Type` (`TY_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Chef_CU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Chef_CU` (
  `CH_ID` INT NOT NULL,
  `CU_ID` INT NOT NULL,
  PRIMARY KEY (`CH_ID`, `CU_ID`),
  INDEX `CU_idx` (`CU_ID` ASC) VISIBLE,
  CONSTRAINT `CH`
    FOREIGN KEY (`CH_ID`)
    REFERENCES `mydb`.`Chefs` (`CH_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `CU`
    FOREIGN KEY (`CU_ID`)
    REFERENCES `mydb`.`Ethnic Cuisine` (`CU_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EP_CU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EP_CU` (
  `EP_ID` INT NOT NULL,
  `CU_ID` INT NOT NULL,
  PRIMARY KEY (`EP_ID`, `CU_ID`),
  INDEX `CU_idx` (`CU_ID` ASC) VISIBLE,
  CONSTRAINT `EP`
    FOREIGN KEY (`EP_ID`)
    REFERENCES `mydb`.`Episodes` (`EP_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `CU`
    FOREIGN KEY (`CU_ID`)
    REFERENCES `mydb`.`Ethnic Cuisine` (`CU_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REC_GEAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REC_GEAR` (
  `REC_ID` INT NOT NULL,
  `GR_ID` INT NOT NULL,
  PRIMARY KEY (`REC_ID`, `GR_ID`),
  INDEX `GR_idx` (`GR_ID` ASC) VISIBLE,
  CONSTRAINT `REC`
    FOREIGN KEY (`REC_ID`)
    REFERENCES `mydb`.`Recipes` (`REC_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `GR`
    FOREIGN KEY (`GR_ID`)
    REFERENCES `mydb`.`Gear` (`GR_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`JUDGES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`JUDGES` (
  `CH_ID` INT NOT NULL,
  `EP_ID` INT NOT NULL,
  PRIMARY KEY (`CH_ID`, `EP_ID`),
  INDEX `EP_idx` (`EP_ID` ASC) VISIBLE,
  CONSTRAINT `EP`
    FOREIGN KEY (`EP_ID`)
    REFERENCES `mydb`.`Episodes` (`EP_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `CH`
    FOREIGN KEY (`CH_ID`)
    REFERENCES `mydb`.`Chefs` (`CH_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PLAYS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PLAYS` (
  `CH_ID` INT NOT NULL,
  `EP_ID` INT NOT NULL,
  `Grade` INT NOT NULL,
  `PLAYScol` VARCHAR(45) NULL DEFAULT 0,
  PRIMARY KEY (`CH_ID`, `EP_ID`),
  INDEX `EP_idx` (`EP_ID` ASC) VISIBLE,
  CONSTRAINT `CH`
    FOREIGN KEY (`CH_ID`)
    REFERENCES `mydb`.`Chefs` (`CH_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `EP`
    FOREIGN KEY (`EP_ID`)
    REFERENCES `mydb`.`Episodes` (`EP_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REC_INGR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REC_INGR` (
  `REC_ID` INT NOT NULL,
  `ING_ID` INT NOT NULL,
  `Precise_Quantity` INT NOT NULL,
  `Inprecise_Quantity` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`REC_ID`, `ING_ID`),
  INDEX `ING_idx` (`ING_ID` ASC) VISIBLE,
  CONSTRAINT `REC`
    FOREIGN KEY (`REC_ID`)
    REFERENCES `mydb`.`Recipes` (`REC_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `ING`
    FOREIGN KEY (`ING_ID`)
    REFERENCES `mydb`.`Ingredients` (`ING_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb`;

DELIMITER $$
USE `mydb`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`Create_nutrition_info_for_recipe` AFTER INSERT ON `Nutrition Info` FOR EACH ROW
BEGIN
	DECLARE total_kcals INT;
    SELECT SUM(i.Kcal_per_100* ri.Precise_Quantity/100)
	INTO total_kcals
    FROM Ingredients i JOIN REC_INGR ri ON ri.ING_ID = i.ING_ID
    WHERE ri.REC_ID = NEW.REC_ID;
    
    UPDATE Nutrition_Info 
    SET Kcal_per_serving = total_kcals
    WHERE REC_ID= NEW.REC_ID;
    
END$$
/* This is wrong and doesnt compile
USE `mydb`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`Episode_grades` AFTER INSERT ON `Episodes` FOR EACH ROW
BEGIN
    DECLARE i INT =0;
    WHILE i<10
    BEGIN
    	SELECT floor(RAND()*16) AS rgrade;
	
    	INSERT INTO PLAYS(CH_ID,EP_ID,Grade) values(rCH_ID,rEP_ID,rgrade);
	
	SET i=i+1;
    END;
    

END$$
*/

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
