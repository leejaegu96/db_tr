use bigbang;

CREATE TABLE IF NOT EXISTS `bigbang`.`InfrMember` (
  `IfmmSeq` INT NOT NULL AUTO_INCREMENT,
  `IfmmName` VARCHAR(45) NULL,
  `IfmmNickname` VARCHAR(45) NULL,
  `IfmmEmail` VARCHAR(45) NULL,
  `IfmmPassword` VARCHAR(45) NULL,
  `IfmmGender` TINYINT NULL,
  `IfmmDob` DATE NULL,
  `IfmmPhone` VARCHAR(45) NULL,
  `IfmmProfile` VARCHAR(45) NULL,
  `IfmmMailNY` TINYINT NULL,
  `IfmmSmsNY` TINYINT NULL,
  PRIMARY KEY (`IfmmSeq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `bigbang`.`SdDate` (
  `SddSeq` INT NOT NULL AUTO_INCREMENT,
  `SddDateChoice` DATE NULL,
  PRIMARY KEY (`SddSeq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `bigbang`.`SdWord` (
  `SdwSeq` INT NOT NULL AUTO_INCREMENT,
  `SdwWord` VARCHAR(45) NULL COMMENT '단어',
  `SdwMean` VARCHAR(255) NULL COMMENT '의미',
  `SdwExample` VARCHAR(255) NULL COMMENT '예시',
  `SdWordDate_Sdwdsdq` INT NOT NULL,
  `SdDate_SddSeq` INT NOT NULL,
  PRIMARY KEY (`SdwSeq`),
  INDEX `fk_SdWord_SdDate1_idx` (`SdDate_SddSeq` ASC) VISIBLE,
  CONSTRAINT `fk_SdWord_SdDate1`
    FOREIGN KEY (`SdDate_SddSeq`)
    REFERENCES `bigbang`.`SdDate` (`SddSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `bigbang`.`SdFavorite` (
  `SdfSeq` INT NOT NULL AUTO_INCREMENT,
  `SdfDelNY` TINYINT NULL,
  `InfrMember_IfmmSeq` INT NOT NULL,
  `SdWord_SdwSeq` INT NOT NULL,
  PRIMARY KEY (`SdfSeq`),
  INDEX `fk_SdFavorite_InfrMember_idx` (`InfrMember_IfmmSeq` ASC) VISIBLE,
  INDEX `fk_SdFavorite_SdWord1_idx` (`SdWord_SdwSeq` ASC) VISIBLE,
  CONSTRAINT `fk_SdFavorite_InfrMember`
    FOREIGN KEY (`InfrMember_IfmmSeq`)
    REFERENCES `bigbang`.`InfrMember` (`IfmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SdFavorite_SdWord1`
    FOREIGN KEY (`SdWord_SdwSeq`)
    REFERENCES `bigbang`.`SdWord` (`SdwSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `bigbang`.`SdTestQuestion` (
  `SdqSeq` INT NOT NULL AUTO_INCREMENT,
  `SdqNumber` INT NULL COMMENT '1:test_Ko, 2:test_Eng, 3: test_Answer, 4.user_Answer',
  `SdqKo` VARCHAR(255) NULL COMMENT 'ko문장, eng문장, answer문장, user_answer문장',
  `SdqEng` VARCHAR(255) NULL,
  `SdqAnswer` VARCHAR(45) NULL,
  `SdDate_SddSeq` INT NOT NULL,
  PRIMARY KEY (`SdqSeq`),
  INDEX `fk_SdTestQuestion_SdDate1_idx` (`SdDate_SddSeq` ASC) VISIBLE,
  CONSTRAINT `fk_SdTestQuestion_SdDate1`
    FOREIGN KEY (`SdDate_SddSeq`)
    REFERENCES `bigbang`.`SdDate` (`SddSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `bigbang`.`SdTotalResult` (
  `SdtrsSeq` INT NOT NULL AUTO_INCREMENT,
  `InfrMember_IfmmSeq` INT NOT NULL,
  `SdDate_SddSeq` INT NOT NULL,
  `SdtrsTotalScore` INT NULL,
  PRIMARY KEY (`SdtrsSeq`),
  INDEX `fk_SdTotalResult_InfrMember1_idx` (`InfrMember_IfmmSeq` ASC) VISIBLE,
  INDEX `fk_SdTotalResult_SdDate1_idx` (`SdDate_SddSeq` ASC) VISIBLE,
  CONSTRAINT `fk_SdTotalResult_InfrMember1`
    FOREIGN KEY (`InfrMember_IfmmSeq`)
    REFERENCES `bigbang`.`InfrMember` (`IfmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SdTotalResult_SdDate1`
    FOREIGN KEY (`SdDate_SddSeq`)
    REFERENCES `bigbang`.`SdDate` (`SddSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `bigbang`.`SdTestResult` (
  `SdrsSeq` INT NOT NULL AUTO_INCREMENT,
  `SdrsUserAnswer` VARCHAR(45) NULL,
  `SdTestQuestion_Sdqseq` INT NOT NULL,
  `SdTotalResult_SdtrsSeq` INT NOT NULL,
  `SdTestNY` TINYINT NULL,
  PRIMARY KEY (`SdrsSeq`),
  INDEX `fk_SdTestResult_SdTestQuestion1_idx` (`SdTestQuestion_Sdqseq` ASC) VISIBLE,
  INDEX `fk_SdTestResult_SdTotalResult1_idx` (`SdTotalResult_SdtrsSeq` ASC) VISIBLE,
  CONSTRAINT `fk_SdTestResult_SdTestQuestion1`
    FOREIGN KEY (`SdTestQuestion_Sdqseq`)
    REFERENCES `bigbang`.`SdTestQuestion` (`SdqSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SdTestResult_SdTotalResult1`
    FOREIGN KEY (`SdTotalResult_SdtrsSeq`)
    REFERENCES `bigbang`.`SdTotalResult` (`SdtrsSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `bigbang`.`SdWord` (
  `SdwSeq` INT NOT NULL AUTO_INCREMENT,
  `SdwWord` VARCHAR(45) NULL COMMENT '단어',
  `SdwMean` VARCHAR(255) NULL COMMENT '의미',
  `SdwExample` VARCHAR(255) NULL COMMENT '예시',
  `SdDate_SddSeq` INT NOT NULL,
  PRIMARY KEY (`SdwSeq`),
  INDEX `fk_SdWord_SdDate1_idx` (`SdDate_SddSeq` ASC) VISIBLE,
  CONSTRAINT `fk_SdWord_SdDate1`
    FOREIGN KEY (`SdDate_SddSeq`)
    REFERENCES `bigbang`.`SdDate` (`SddSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `bigbang`.`SdFavorite` (
  `SdfSeq` INT NOT NULL AUTO_INCREMENT,
  `SdfDelNY` TINYINT NULL,
  `InfrMember_IfmmSeq` INT NOT NULL,
  `SdWord_SdwSeq` INT NOT NULL,
  PRIMARY KEY (`SdfSeq`),
  INDEX `fk_SdFavorite_InfrMember_idx` (`InfrMember_IfmmSeq` ASC) VISIBLE,
  INDEX `fk_SdFavorite_SdWord1_idx` (`SdWord_SdwSeq` ASC) VISIBLE,
  CONSTRAINT `fk_SdFavorite_InfrMember`
    FOREIGN KEY (`InfrMember_IfmmSeq`)
    REFERENCES `bigbang`.`InfrMember` (`IfmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SdFavorite_SdWord1`
    FOREIGN KEY (`SdWord_SdwSeq`)
    REFERENCES `bigbang`.`SdWord` (`SdwSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

INSERT INTO InfrMember(
	IfmmName
    ,IfmmNickname
    ,IfmmEmail
    ,IfmmPassword
    ,IfmmGender
    ,IfmmDob
    ,IfmmPhone
    ,IfmmProfile
    ,IfmmMailNY
    ,IfmmSmsNY
    )
VALUES (
	"Leejaegu"
	,"Jaeng"
    ,"worncjfrn@naver.com"
    ,"a123456"
    ,"1"
    ,"19961211"
    ,"010-0000-0000"
    ,"a"
    ,"1"
    ,"1"
)
;
INSERT INTO InfrMember(
	IfmmName
    ,IfmmNickname
    ,IfmmEmail
    ,IfmmPassword
    ,IfmmGender
    ,IfmmDob
    ,IfmmPhone
    ,IfmmProfile
    ,IfmmMailNY
    ,IfmmSmsNY
    )
VALUES (
	"Leegana"
	,"gana"
    ,"123@naver.com"
    ,"b123456"
    ,"1"
    ,"19960101"
    ,"010-1111-1111"
    ,"a"
    ,"1"
    ,"1"
)
;
INSERT INTO InfrMember(
	IfmmName
    ,IfmmNickname
    ,IfmmEmail
    ,IfmmPassword
    ,IfmmGender
    ,IfmmDob
    ,IfmmPhone
    ,IfmmProfile
    ,IfmmMailNY
    ,IfmmSmsNY
    )
VALUES (
	"Leedara"
	,"dara"
    ,"234@naver.com"
    ,"c123456"
    ,"1"
    ,"19950101"
    ,"010-2222-2222"
    ,"a"
    ,"1"
    ,"1"
)
;
INSERT INTO InfrMember(
	IfmmName
    ,IfmmNickname
    ,IfmmEmail
    ,IfmmPassword
    ,IfmmGender
    ,IfmmDob
    ,IfmmPhone
    ,IfmmProfile
    ,IfmmMailNY
    ,IfmmSmsNY
    )
VALUES (
	"Leemaba"
	,"maba"
    ,"345@naver.com"
    ,"d123456"
    ,"0"
    ,"19940101"
    ,"010-3333-3333"
    ,"a"
    ,"0"
    ,"1"
)
;
INSERT INTO InfrMember(
	IfmmName
    ,IfmmNickname
    ,IfmmEmail
    ,IfmmPassword
    ,IfmmGender
    ,IfmmDob
    ,IfmmPhone
    ,IfmmProfile
    ,IfmmMailNY
    ,IfmmSmsNY
    )
VALUES (
	"Leesaa"
	,"saa"
    ,"456@naver.com"
    ,"e123456"
    ,"0"
    ,"19930101"
    ,"010-4444-4444"
    ,"a"
    ,"1"
    ,"1"
)
;

INSERT INTO InfrMember(
	IfmmName
    ,IfmmNickname
    ,IfmmEmail
    ,IfmmPassword
    ,IfmmGender
    ,IfmmDob
    ,IfmmPhone
    ,IfmmProfile
    ,IfmmMailNY
    ,IfmmSmsNY
    )
VALUES (
	"Leejacha"
	,"jacha"
    ,"101010@naver.com"
    ,"k123456"
    ,"1"
    ,"19920101"
    ,"010-6666-6666"
    ,"a"
    ,"1"
    ,"1"
)
;
INSERT INTO InfrMember(
	IfmmName
    ,IfmmNickname
    ,IfmmEmail
    ,IfmmPassword
    ,IfmmGender
    ,IfmmDob
    ,IfmmPhone
    ,IfmmProfile
    ,IfmmMailNY
    ,IfmmSmsNY
    )
VALUES (
	"Leekata"
	,"kata"
    ,"678@naver.com"
    ,"e123456"
    ,"0"
    ,"19910101"
    ,"010-7777-7777"
    ,"a"
    ,"1"
    ,"0"
)
;
INSERT INTO InfrMember(
	IfmmName
    ,IfmmNickname
    ,IfmmEmail
    ,IfmmPassword
    ,IfmmGender
    ,IfmmDob
    ,IfmmPhone
    ,IfmmProfile
    ,IfmmMailNY
    ,IfmmSmsNY
    )
VALUES (
	"Leepaha"
	,"paha"
    ,"789@naver.com"
    ,"g123456"
    ,"1"
    ,"19910101"
    ,"010-8888-8888"
    ,"a"
    ,"1"
    ,"1"
)
;
INSERT INTO InfrMember(
	IfmmName
    ,IfmmNickname
    ,IfmmEmail
    ,IfmmPassword
    ,IfmmGender
    ,IfmmDob
    ,IfmmPhone
    ,IfmmProfile
    ,IfmmMailNY
    ,IfmmSmsNY
    )
VALUES (
	"Leebada"
	,"bada"
    ,"8910@naver.com"
    ,"h123456"
    ,"0"
    ,"19900101"
    ,"010-9999-9999"
    ,"a"
    ,"1"
    ,"1"
)
;
INSERT INTO InfrMember(
	IfmmName
    ,IfmmNickname
    ,IfmmEmail
    ,IfmmPassword
    ,IfmmGender
    ,IfmmDob
    ,IfmmPhone
    ,IfmmProfile
    ,IfmmMailNY
    ,IfmmSmsNY
    )
VALUES (
	"Leesaja"
	,"saja"
    ,"101112@naver.com"
    ,"i123456"
    ,"0"
    ,"19890101"
    ,"010-1234-1234"
    ,"a"
    ,"1"
    ,"1"
)
;


SELECT
	IfmmSeq
	,IfmmName
    ,IfmmNickname
    ,IfmmEmail
    ,IfmmPassword
    ,IfmmGender
    ,IfmmDob
    ,IfmmPhone
    ,IfmmProfile
    ,IfmmMailNY
    ,IfmmSmsNY
FROM InfrMember
;

INSERT INTO SdDate(
	SddDateChoice
    )
VALUES (
	"2022-07-27"
)
;

INSERT INTO SdWord (
	SdwWord
    ,SdwMean
    ,SdwExample
    ,SdDate_SddSeq
)
VALUES (
	"temperature"
    ,"  1.	명사 온도, 기온
		2.	명사 체온; (몸의) 신열[고열]"
	,"  to take sb’s temperature
		…의 체온을 재다"
	,"3"
)
;

SELECT * FROM SdWord;
	
INSERT INTO SdFavorite (
	SdfDelNY
    ,InfrMember_IfmmSeq
    ,SdWord_SdwSeq
)
VALUES (
	"0"
    ,"1"
    ,"1"
)
;

SELECT * FROM SdFavorite;

INSERT INTO SdTestQuestion (
	SdqNumber
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdDate_SddSeq
)
VALUES (
	"1"
    ,"얼굴이 왜 그래?"
    ,"What _________ to your face?"
    ,"happened"
    ,"1"
)
;
SELECT * FROM SdTestQuestion;
