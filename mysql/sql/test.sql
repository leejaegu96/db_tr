use bigbang;

CREATE TABLE IF NOT EXISTS `bigbang`.`SdTest` (
  `SdtSeq` INT NOT NULL AUTO_INCREMENT,
  `SdtDateChoice` DATE NULL,
  PRIMARY KEY (`SdtSeq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `bigbang`.`SdTestQuestion` (
  `Sdqseq` INT NOT NULL AUTO_INCREMENT,
  `SdqDiv` INT NULL COMMENT '1:test_Ko, 2:test_Eng, 3: test_Answer, 4.user_Answer',
  `SdqKo` VARCHAR(45) NULL COMMENT 'ko문장, eng문장, answer문장, user_answer문장',
  `SdqEng` VARCHAR(45) NULL,
  `SdqAnswer` VARCHAR(45) NULL,
  `SdTest_SdtSeq` INT NOT NULL,
  PRIMARY KEY (`Sdqseq`),
  INDEX `fk_SdTestQuestion_SdTest1_idx` (`SdTest_SdtSeq` ASC) VISIBLE,
  CONSTRAINT `fk_SdTestQuestion_SdTest1`
    FOREIGN KEY (`SdTest_SdtSeq`)
    REFERENCES `bigbang`.`SdTest` (`SdtSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `bigbang`.`SdTestResult` (
  `SdrsSeq` INT NOT NULL AUTO_INCREMENT,
  `SdrsUserAnswer` VARCHAR(45) NULL,
  `SdTestQuestion_Sdqseq` INT NOT NULL,
  PRIMARY KEY (`SdrsSeq`),
  INDEX `fk_SdTestResult_SdTestQuestion1_idx` (`SdTestQuestion_Sdqseq` ASC) VISIBLE,
  CONSTRAINT `fk_SdTestResult_SdTestQuestion1`
    FOREIGN KEY (`SdTestQuestion_Sdqseq`)
    REFERENCES `bigbang`.`SdTestQuestion` (`Sdqseq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `bigbang`.`SdWord` (
  `SdwSeq` INT NOT NULL AUTO_INCREMENT,
  `SdwWord` VARCHAR(45) NULL COMMENT '단어',
  `SdwMean` VARCHAR(45) NULL COMMENT '의미',
  `SdwCommentary` VARCHAR(45) NULL COMMENT '해설',
  `SdwExample` VARCHAR(45) NULL COMMENT '예시',
  `SdwDate` DATE NULL,
  PRIMARY KEY (`SdwSeq`))
ENGINE = InnoDB
;
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
CREATE TABLE IF NOT EXISTS `bigbang`.`SdFavorite` (
  `SdfSeq` INT NOT NULL AUTO_INCREMENT,
  `SdfDelNY` VARCHAR(45) NULL,
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
CREATE TABLE IF NOT EXISTS `bigbang`.`SdTotalResult` (
  `SdtrsSeq` INT NOT NULL AUTO_INCREMENT,
  `SdtrsTotalScore` INT NULL,
  `SdTestResult_SdrsSeq` INT NOT NULL,
  `SdTest_SdtSeq` INT NOT NULL,
  `InfrMember_IfmmSeq` INT NOT NULL,
  PRIMARY KEY (`SdtrsSeq`),
  INDEX `fk_SdTotalResult_SdTestResult1_idx` (`SdTestResult_SdrsSeq` ASC) VISIBLE,
  INDEX `fk_SdTotalResult_SdTest1_idx` (`SdTest_SdtSeq` ASC) VISIBLE,
  INDEX `fk_SdTotalResult_InfrMember1_idx` (`InfrMember_IfmmSeq` ASC) VISIBLE,
  CONSTRAINT `fk_SdTotalResult_SdTestResult1`
    FOREIGN KEY (`SdTestResult_SdrsSeq`)
    REFERENCES `bigbang`.`SdTestResult` (`SdrsSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SdTotalResult_SdTest1`
    FOREIGN KEY (`SdTest_SdtSeq`)
    REFERENCES `bigbang`.`SdTest` (`SdtSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SdTotalResult_InfrMember1`
    FOREIGN KEY (`InfrMember_IfmmSeq`)
    REFERENCES `bigbang`.`InfrMember` (`IfmmSeq`)
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
    ,"567@naver.com"
    ,"f123456"
    ,"1"
    ,"19920101"
    ,"010-5555-5555"
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
    ,"567@naver.com"
    ,"f123456"
    ,"1"
    ,"19920101"
    ,"010-5555-5555"
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
    ,"010-5555-5555"
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
    ,"010-7777-7777"
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
	"Leesaja"
	,"saja"
    ,"101112@naver.com"
    ,"i123456"
    ,"0"
    ,"19890101"
    ,"010-9999-9999"
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
WHERE 1 = 1
	-- AND IfmmSeq = 1
    -- AND IfmmName = "Leejaegu"
    -- AND IfmmNickname = "jaeng"
    -- AND IfmmEmail = "123@naver.com"
    -- AND IfmmPassword = "a123456"
    -- AND IfmmGender = "1"
    -- AND IfmmDob = "19900101"
	-- AND IfmmPhone = "010-9999-9999"
    -- AND IfmmMailNY = "1"
    AND IfmmSmsNY = "0"
;


INSERT INTO SdWord(
	SdwWord
    ,SdwMean
    ,SdwCommentary
    ,SdwExample
    ,SdwDate
    )
VALUES (
	"awful"
    ,"끔직한, 지독한, 엄청, 되게, 굉장히"
    ,"1. 형용사 비격식   끔직한, 지독한"
    ,"What blooming awful weather! 정말 날씨 짜증나게 안좋군!" 
    ,"20220725"
)
;
INSERT INTO SdWord(
	SdwWord
    ,SdwMean
    ,SdwCommentary
    ,SdwExample
    ,SdwDate
    )
VALUES (
	"hearten"
    ,"...에게 용기[희망]을 북돋우다."
    ,"1. 동사 타동사 [VN 주로 수동태로]  ...에게 용기[희망]을 북돋우다."
    ,"This news will hearten them. 소식은 그들을 고무할 것이다." 
    ,"20220725"
)
;
INSERT INTO SdWord(
	SdwWord
    ,SdwMean
    ,SdwCommentary
    ,SdwExample
    ,SdwDate
    )
VALUES (
	"dominate"
    ,"지배하다"
    ,"1. 동사  (특히 불쾌한 방식으로) 지배하다."
    ,"He tended to dominate the conversation." 
    ,"20220725"
)
;
SELECT
	SdwSeq
	,SdwWord
    ,SdwMean
    ,SdwCommentary
    ,SdwExample
    ,SdwDate
FROM SdWord
;

-- DELETE FROM SdWord WHERE SdwSeq = 10;

INSERT INTO SdWord(
	SdwWord
    ,SdwMean
    ,SdwCommentary
    ,SdwExample
    ,SdwDate
    )
VALUES (
	"awful"
    ,"끔직한, 지독한, 엄청, 되게, 굉장히"
    ,"1. 형용사 비격식   끔직한, 지독한"
    ,"What blooming awful weather!" 
    ,"20220725"
)
;
INSERT INTO SdWord(
	SdwWord
    ,SdwMean
    ,SdwCommentary
    ,SdwExample
    ,SdwDate
    )
VALUES (
	"hearten"
    ,"...에게 용기[희망]을 북돋우다."
    ,"1. 동사 타동사 [VN 주로 수동태로]  ...에게 용기[희망]을 북돋우다."
    ,"This news will hearten them." 
    ,"20220725"
)
;
INSERT INTO SdWord(
	SdwWord
    ,SdwMean
    ,SdwCommentary
    ,SdwExample
    ,SdwDate
    )
VALUES (
	"dominate"
    ,"지배하다"
    ,"1. 동사  (특히 불쾌한 방식으로) 지배하다."
    ,"He tended to dominate the conversation." 
    ,"20220725"
)
;
SELECT
	SdwSeq
	,SdwWord
    ,SdwMean
    ,SdwCommentary
    ,SdwExample
    ,SdwDate
FROM SdWord
;

INSERT INTO SdFavorite(
    InfrMember_IfmmSeq
    ,SdWord_SdwSeq
    ,SdfDelNY
    )
VALUES (
	"3"
    ,"13"
    ,"0"
)
;
SELECT
	SdfSeq
    ,InfrMember_IfmmSeq
    ,SdWord_SdwSeq
    ,SdfDelNY
FROM SdFavorite
;

INSERT INTO SdTest(
	SdtDateChoice
    )
VALUES (
	"20220727"
)
;

INSERT INTO SdTestQuestion(
	SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
    )
VALUES (
	"1"
    ,"괜찮아요?"
    ,"Are you all ______?"
    ,"right"
    ,"1"
)
;
INSERT INTO SdTestQuestion(
	SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
    )
VALUES (
	"2"
    ,"전 괜찮은 것 같아요. 당신은요?"
    ,"I think I'm _____. How about you?"
    ,"fine"
    ,"1"
)
;
INSERT INTO SdTestQuestion(
	SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
    )
VALUES (
	"3"
    ,"저는 괜찮은데 차가 좀 긁힌 것 같아요."
    ,"I'm fine but I ____ some scratches on my car"
    ,"got"
    ,"1"
)
;
INSERT INTO SdTestQuestion(
	SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
    )
VALUES (
	"4"
    ,"어떡하죠? 10분 뒤면 파티 시작이에요."
    ,"What ______ we go? The party begins in 10 minutes."
    ,"should"
    ,"1"
)
;
SELECT
	SdqSeq
    ,SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
FROM SdTestQuestion
;
INSERT INTO SdTestQuestion(
	SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
    )
VALUES (
	"1"
    ,"얼굴이 왜 그래?"
    ,"What _________ to your face?"
    ,"happened"
    ,"2"
)
;
INSERT INTO SdTestQuestion(
	SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
    )
VALUES (
	"2"
    ,"충치 치료했어."
    ,"I had to ____ a cavity filled today."
    ,"get"
    ,"2"
)
;
INSERT INTO SdTestQuestion(
	SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
    )
VALUES (
	"4"
    ,"말도 마."
    ,"I don't _____ want to talk about it."
    ,"even"
    ,"2"
)
;
INSERT INTO SdTestQuestion(
	SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
    )
VALUES (
	"1"
    ,"무엇을 주문하시겠어요?"
    ,"What would you like to ______?"
    ,"order"
    ,"3"
)
;
INSERT INTO SdTestQuestion(
	SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
    )
VALUES (
	"2"
    ,"영국식 아침 식사로 하고 싶습니다."
    ,"I'd like to ________ an English breakfast."
    ,"have"
    ,"3"
)
;
INSERT INTO SdTestQuestion(
	SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
    )
VALUES (
	"3"
    ,"계란은 어떻게 해드릴까요?"
    ,"How do you _____ your eggs?"
    ,"want"
    ,"3"
)
;
INSERT INTO SdTestQuestion(
	SdqDiv
    ,SdqKo
    ,SdqEng
    ,SdqAnswer
    ,SdTest_SdtSeq
    )
VALUES (
	"4"
    ,"어떤 게 있나요?"
    ,"What are my _____?"
    ,"choices"
    ,"3"
)
;
SELECT * FROM SdTestQuestion;

INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"right"
    ,"1"
)
;
INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"fine"
    ,"2"
)
;
INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"got"
    ,"3"
)
;
INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"should"
    ,"4"
)
;
INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"happened"
    ,"5"
)
;
INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"get"
    ,"6"
)
;
INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"hurt"
    ,"7"
)
;
INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"even"
    ,"8"
)
;
INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"order"
    ,"9"
)
;
INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"have"
    ,"10"
)
;
INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"want"
    ,"11"
)
;
INSERT INTO SdTestResult (
	SdrsUserAnswer
    ,SdTestQuestion_Sdqseq
    )
VALUES (
	"choices"
    ,"12"
)
;

SELECT * FROM InfrMember;
SELECT * FROM SdTest;
SELECT * FROM SdTestQuestion;
SELECT * FROM SdTestResult;

SELECT * FROM SdWord;
SELECT * FROM SdFavorite;


