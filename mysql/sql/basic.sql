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

INSERT INTO member2(
	seq
    ,name
    ,nickname
    ,email
    ,password
    ,gender
    ,dob
    ,phone
    ,profile
    )
VALUES (
	"1"
	,"Leegana"
	,"gana"
    ,"123@naver.com"
    ,"aaaa"
    ,"1"
    ,"19960101"
    ,"010-1111-1111"
    ,"a"
)
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

-- 컬럼 삭제
ALTER TABLE member2 drop COLUMN hobby;

-- row삭제 DELETE FROM WHERE seq = 1 먼저 쓴 후에 member2 넣기
DELETE FROM member2 WHERE seq = 1;

-- commit / rollback
SELECT * FROM member2;

-- 데이터 내용 변경 where 먼저 쓰기.
UPDATE member2 SET 
name= "leejaegu" 
, nickname="jaeng"
WHERE seq = "1";