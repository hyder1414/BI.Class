DROP TABLE IF EXISTS `Surgery_CenterDim`;

CREATE TABLE `Surgery_CenterDim` (
  `Surgery_CenterDimKey` int(11) NOT NULL AUTO_INCREMENT,
  `YearOpened` int(11) DEFAULT NULL,
  `HoursPerWeekOfOperations` int(11) DEFAULT NULL,
  `NumberofStaff` int(11) DEFAULT NULL,
  `SurgeryCenterName` varchar(20) DEFAULT NULL,
  `day_int` int(11) DEFAULT NULL,
  `dow_abrev` varchar(4) DEFAULT NULL,
  `dow_txt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Surgery_CenterDimKey`)
);

DROP TABLE IF EXISTS `ProceduresDim`;

CREATE TABLE `ProceduresDim` (
  `ProceduresDimKey` int(11) NOT NULL AUTO_INCREMENT,
  `ProcedureName` varchar(20) DEFAULT NULL,
  `ProcedureCost` int(11) DEFAULT NULL,
  `ProcedureDuration` int(11) DEFAULT NULL,
  `TotalProcedureCost` int(11) DEFAULT NULL,
  `DateofProcedure` int(11) DEFAULT NULL,
  PRIMARY KEY (`Surgery_CenterDimKey`)
);

DROP TABLE IF EXISTS `PatientsJunkDim`;

CREATE TABLE `PatientsJunkDim` (
  `PatientsJunkDimKey` int(11) NOT NULL AUTO_INCREMENT,
  `PatientFName` varchar(20) DEFAULT NULL,
  `PatientLName` varchar(20) DEFAULT NULL,
  `HasInsurance` varchar(4) DEFAULT NULL,
  `HasCoInsurance` varchar(4) DEFAULT NULL,
  `PremiumCost` int(11) DEFAULT NULL,
  `PercentofBillPaidbyInsurance` int(11) DEFAULT NULL,
  PRIMARY KEY (`PatientsJunkDimKey`)
);

DROP TABLE IF EXISTS `PatientsJunkDim`;

CREATE TABLE `DoctorsJunkDim` (
  `DoctorsJunkDimKey` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorFName` varchar(20) DEFAULT NULL,
  `DoctorLName` varchar(20) DEFAULT NULL,
  `AreaofExpertiseCd` varchar(6) DEFAULT NULL,
  `AreaodExpertise` varchar(6) DEFAULT NULL,
  `PercentagePaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`DoctorsJunkDimKey`)
);


DROP TABLE IF EXISTS `DateDim`;

CREATE TABLE `DateDimKey` (
  `DoctorsJunkDimKey` int(11) NOT NULL AUTO_INCREMENT,
  `Year` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `MonthTxt` varchar(20) DEFAULT NULL,
  `MonAbrev` varchar(6) DEFAULT NULL,
  `Day` int(11) DEFAULT NULL,
  `DayTxt` varchar(20) DEFAULT NULL,
  `DayAbrev` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`DateDimKey`)
);


DROP TABLE IF EXISTS `OperationsFact`;

CREATE TABLE `OperationsFact` (
  `Surgery_CenterDimKey` int(11) NULL,
  `ProceduresDimKey` int(11) NULL,
  `PatientsJunkDimKey` int(11) NULL,
  `DoctorsJunkDimKey` int(11) NULL,
  `DateDimKey` int(11) NULL,
  `DayDimKey` int(11) NULL,
  
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