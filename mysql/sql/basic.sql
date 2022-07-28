-- bigbang database를 사용하겠다.
USE bigbang;

CREATE TABLE IF NOT EXISTS `bigbang`.`member2` (
  `seq` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `nickname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `dob` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `profile` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

-- 전체 컬럼 조회
SELECT * FROM member2;

-- 컬럼 추가
ALTER TABLE member2 ADD COLUMN bobby VARCHAR(45);

ALTER TABLE member2 ADD COLUMN nameEng VARCHAR(45) AFTER name;

-- 컬럼 변경(데이터가 없을 때 가능)
ALTER TABLE member2 MODIFY COLUMN bobby VARCHAR(100);

-- 컬럼 이름 변경
ALTER TABLE member2 CHANGE COLUMN bobby hobby VARCHAR(100);