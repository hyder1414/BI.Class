DROP TABLE IF EXISTS `datedim`;

CREATE TABLE `datedim` (
  `datedimkey` int(11) NOT NULL AUTO_INCREMENT,
  `year_int` int(11) DEFAULT NULL,
  `month_int` int(11) DEFAULT NULL,
  `month_abrev` varchar(4) DEFAULT NULL,
  `month_txt` varchar(20) DEFAULT NULL,
  `day_int` int(11) DEFAULT NULL,
  `dow_abrev` varchar(4) DEFAULT NULL,
  `dow_txt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`datedimkey`)
);

DROP TABLE IF EXISTS `placedim`;

CREATE TABLE `placedim` (
  `placedimkey` int(11) NOT NULL AUTO_INCREMENT,
  `region_cd` varchar(10) DEFAULT NULL,
  `region_name` varchar(50) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `estimate_ins_cost` double DEFAULT NULL,
  `store_number` int(11) DEFAULT NULL,
  `store_txt` varchar(50) DEFAULT NULL,
  `insurance_cost` double DEFAULT NULL,
  PRIMARY KEY (`placedimkey`)
);

DROP TABLE IF EXISTS `placejunk`;

CREATE TABLE `placejunk` (
  `placejunkdimkey` int(11) NOT NULL AUTO_INCREMENT,
  `nl_cd` varchar(2) DEFAULT NULL,
  `night_loading` varchar(5) DEFAULT NULL,
  `automate_cd` varchar(2) DEFAULT NULL,
  `automation` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`placejunkdimkey`)
);

DROP TABLE IF EXISTS `boxjunkdim`;

CREATE TABLE `boxjunkdim` (
  `boxjunkdimkey` int(11) NOT NULL AUTO_INCREMENT,
  `box_cd` varchar(10) DEFAULT NULL,
  `box_txt` varchar(100) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `durability` int(11) DEFAULT NULL,
  PRIMARY KEY (`boxjunkdimkey`)
);

DROP TABLE IF EXISTS `shipmentfact`;

CREATE TABLE `shipmentfact` (
  `boxjunkdimkey` int(11) NULL,
  `b_placedimkey` int(11) NULL,
  `e_placedimkey` int(11) NULL,
  `b_pjdimkey` int(11) NULL,
  `e_pjdimkey` int(11) NULL,
  `datedimkey` int(11) NULL,
  `weight_of_ship` double DEFAULT NULL,
  `shipment_insurance_cost` double DEFAULT NULL,
  `base_value` double DEFAULT NULL,
  `cost_to_make` double DEFAULT NULL,
  `current_cost_of_shipement` double DEFAULT NULL,
  `value_of_shipment` double DEFAULT NULL,
  `total_value` double DEFAULT NULL,
  `CNT` int DEFAULT 1,
  KEY `fk_shipmentfact_1_idx` (`b_placedimkey`),
  KEY `fk_shipmentfact_2_idx` (`b_pjdimkey`),
  KEY `fk_shipmentfact_3_idx` (`e_placedimkey`),
  KEY `fk_shipmentfact_4_idx` (`e_pjdimkey`),
  KEY `fk_shipmentfact_5_idx` (`datedimkey`),
  KEY `fk_shipmentfact_6_idx` (`boxjunkdimkey`),
  CONSTRAINT `fk_shipmentfact_1` FOREIGN KEY (`b_placedimkey`) REFERENCES `placedim` (`placedimkey`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipmentfact_2` FOREIGN KEY (`b_pjdimkey`) REFERENCES `placejunk` (`placejunkdimkey`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipmentfact_3` FOREIGN KEY (`datedimkey`) REFERENCES `datedim` (`datedimkey`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipmentfact_4` FOREIGN KEY (`e_placedimkey`) REFERENCES `placedim` (`placedimkey`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipmentfact_5` FOREIGN KEY (`e_pjdimkey`) REFERENCES `placejunk` (`placejunkdimkey`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipmentfact_6` FOREIGN KEY (`boxjunkdimkey`) REFERENCES `boxjunkdim` (`boxjunkdimkey`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE VIEW `beginplacedim` AS 
SELECT `placedimkey` as `b_placedimkey`,
`region_cd` as `b_region_cd`,
`region_name` as `b_region_name`,
`state` as `b_state`,
`estimate_ins_cost` as `b_estimate_ins_cost`,
`store_number` as `b_store_number`,
`store_txt` as `b_store_txt`,
`insurance_cost` as `b_insurance_cost`
FROM `placedim`;

CREATE VIEW `endplacedim` AS 
SELECT `placedimkey` as `e_placedimkey`,
`region_cd` as `e_region_cd`,
`region_name` as `e_region_name`,
`state` as `e_state`,
`estimate_ins_cost` as `e_estimate_ins_cost`,
`store_number` as `e_store_number`,
`store_txt` as `e_store_txt`,
`insurance_cost` as `e_insurance_cost`
FROM `placedim`;

CREATE VIEW `beginplacejunk` AS 
SELECT `placejunkdimkey` as `b_placejunkdimkey`,
`nl_cd` as `b_nl_cd`,
`night_loading` as `b_night_loading`,
`automate_cd` as `b_automate_cd`,
`automation` as `b_automation`
FROM `placejunk`;

CREATE VIEW `endplacejunk` AS 
SELECT `placejunkdimkey` as `e_placejunkdimkey`,
`nl_cd` as `e_nl_cd`,
`night_loading` as `e_night_loading`,
`automate_cd` as `e_automate_cd`,
`automation` as `e_automation`
FROM `placejunk`;