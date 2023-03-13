-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema baseballplayerstat2022db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `baseballplayerstat2022db` ;

-- -----------------------------------------------------
-- Schema baseballplayerstat2022db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `baseballplayerstat2022db` DEFAULT CHARACTER SET utf8 ;
USE `baseballplayerstat2022db` ;

-- -----------------------------------------------------
-- Table `player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `player` ;

CREATE TABLE IF NOT EXISTS `player` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `team` VARCHAR(45) NOT NULL,
  `position` VARCHAR(15) NOT NULL,
  `hits` INT UNSIGNED NULL,
  `homeruns` INT UNSIGNED NULL,
  `batting_average` DOUBLE UNSIGNED NULL,
  `wins_above_replacement` DOUBLE NULL,
  `imgurl` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS baseballstat@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'baseballstat'@'localhost' IDENTIFIED BY 'baseballstat';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'baseballstat'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `player`
-- -----------------------------------------------------
START TRANSACTION;
USE `baseballplayerstat2022db`;
INSERT INTO `player` (`id`, `first_name`, `last_name`, `team`, `position`, `hits`, `homeruns`, `batting_average`, `wins_above_replacement`, `imgurl`) VALUES (1, 'Bryce', 'Harper', 'Phillies', 'RF', 106, 18, .286, 2.5, 'https://fivethirtyeight.com/wp-content/uploads/2019/03/Harper2.jpg?w=2700');
INSERT INTO `player` (`id`, `first_name`, `last_name`, `team`, `position`, `hits`, `homeruns`, `batting_average`, `wins_above_replacement`, `imgurl`) VALUES (2, 'Aaron ', 'Judge', 'Yankees', 'RF', 177, 62, .311, 10.6, 'https://nypost.com/wp-content/uploads/sites/2/2020/07/Aaron-Judge-11.jpg?quality=90&strip=all');
INSERT INTO `player` (`id`, `first_name`, `last_name`, `team`, `position`, `hits`, `homeruns`, `batting_average`, `wins_above_replacement`, `imgurl`) VALUES (3, 'Mike', 'Trout', 'Angels', 'CF', 124, 40, 2.83, 6.3, 'https://playersstats.com/wp-content/uploads/2020/04/mike-trout-networth-768x840.jpg');
INSERT INTO `player` (`id`, `first_name`, `last_name`, `team`, `position`, `hits`, `homeruns`, `batting_average`, `wins_above_replacement`, `imgurl`) VALUES (4, 'Didi', 'Gregorius', 'Phillies', 'SS', 45, 1, .210, -.4, 'https://nypost.com/wp-content/uploads/sites/2/2020/08/didi.jpg?quality=90&strip=all&w=947');
INSERT INTO `player` (`id`, `first_name`, `last_name`, `team`, `position`, `hits`, `homeruns`, `batting_average`, `wins_above_replacement`, `imgurl`) VALUES (5, 'Adley', 'Rutschman', 'Orioles', 'C', 101, 13, .254, 5.2, 'https://www.baltimoresun.com/resizer/_HvsEagYsCmDoOh9TEHRylavOc4=/1200x800/top/arc-anglerfish-arc2-prod-tronc.s3.amazonaws.com/public/6CHSWWA6ANGBRDV3OSZAHRSEUI.jpg');

COMMIT;

