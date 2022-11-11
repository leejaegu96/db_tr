use bigbang;

-- 인덱스 -----------------------------------------------------------------------------------------------
SHOW INDEX FROM infrMember;

-- 인덱스 추가
CREATE INDEX abc ON infrMember(ifmmSmsNy, ifmmMailNy )
;
-- 인덱스 삭제
ALTER TABLE infrMember DROP INDEX abc
;
-- 인덱스 끝 ----------------------------------------------------------------------------------------------
-- views ----------------------------------------------------------------------------------------------
CREATE VIEW sdWordV
as
SELECT
a.sdwSeq
,a.sdwWord
,c.sdwmNum
,c.sdwmPartOfSpeech
,c.sdwmContents
,d.sdweContents
,d.sdweTranslate
,b.sddDateChoice
FROM sdWord a
INNER JOIN sdDate b on b.sddSeq=a.sdDate_sddSeq
INNER JOIN sdwMean c on c.sdWord_sdwSeq=a.sdwSeq
INNER JOIN sdwExample d on d.sdwMean_sdwmSeq=c.sdwmSeq
WHERE 1=1
;

SELECT * FROM sdWordV
;

DROP VIEW sdWordV
;
-- views 끝 ----------------------------------------------------------------------------------------------
-- trigger ----------------------------------------------------------------------------------------------



-- trigger 끝 ----------------------------------------------------------------------------------------------
-- function ----------------------------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION getInfrMemberName (
seq bigint
) 
RETURNS varchar(100)
BEGIN
	
    declare rtName varchar(100);

	select
		ifmmName into rtName
	from
		infrMember
	where 1=1
		and ifmmSeq = seq
	;

	RETURN rtName;
END$$
DELIMITER ;

SELECT getInfrMemberName(144) AS COL;
-- function 끝 ----------------------------------------------------------------------------------------------

		SELECT
		a.sdwSeq
		,a.sdwWord
		,c.sdwmNum
		,c.sdwmPartOfSpeech
		,c.sdwmContents
		,d.sdweContents
		,d.sdweTranslate
		,b.sddDateChoice
		FROM sdWord a
		INNER JOIN sdDate b on b.sddSeq=a.sdDate_sddSeq
		INNER JOIN sdwMean c on c.sdWord_sdwSeq=a.sdwSeq
		INNER JOIN sdwExample d on d.sdwMean_sdwmSeq=c.sdwmSeq
		WHERE 1=1
		AND b.sddDateChoice = "2022-07-25"
        ;




-- ccg / ccgname   cc / ccname -> 1 통신사 1 skt
select
	a.ifcgSeq
    ,a.ifcgName
    ,b.ifcdSeq
    ,b.ifcdName
from infrCodeGroup a
inner join infrCode b on infrCodeGroup_ifcgSeq = a.ifcgSeq
;

select
	a.*
    ,b.*
from infrCode a
inner join infrCodeGroup b on a.infrCodeGroup_ifcgSeq = ifcgSeq
;

SELECT 
	COUNT(*)
FROM infrCode a
INNER JOIN infrCodeGroup b on a.infrCodeGroup_ifcgSeq = b.ifcgSeq
;

SELECT
			a.*
			,b.*
		FROM infrCode a
		INNER JOIN infrCodeGroup b on a.infrCodeGroup_ifcgSeq = b.ifcgSeq
		WHERE 1=1
			AND ifcdSeq
            ;

-- 로그인
select * from InfrMember a where a.IfmmEmail = "worncjfrn@naver.com" and a.IfmmPassword = "a123456"
;
-- 단어
SELECT
	a.sdwSeq
	,a.sdwWord
	,a.sdwNum
	,b.sddDateChoice
    ,c.sdfDelNY
    ,c.infrMember_ifmmSeq
	FROM sdWord a
	INNER JOIN sdDate b on b.sddSeq=a.sdDate_sddSeq
    INNER JOIN sdFavorite c on c.sdWord_sdwSeq = a.sdwSeq
	WHERE 1=1
	AND b.sddDateChoice = "2022-07-25"
;

-- 오늘의 단어
select
    a.sdwWord
    ,c.sdwmNum
    ,c.sdwmPartOfSpeech
    ,c.sdwmContents
    ,d.sdweContents
    ,d.sdweTranslate
    ,b.sddDateChoice
from sdWord a
inner join sdDate b on b.sddSeq=a.sdDate_sddSeq
inner join sdwMean c on c.sdWord_sdwSeq=a.sdwSeq
inner join sdwExample d on d.sdwMean_sdwmSeq=c.sdwmSeq
where 1=1 
	and a.sdwSeq = "1"
;

-- 나만의 단어장
select
	a.sdfDelNY
    ,b.ifmmName
    ,c.sdwWord
    ,d.sddDateChoice
    ,e.sdwmPartOfSpeech
    ,e.sdwmContents
    ,f.sdweContents
    ,f.sdweTranslate
from  sdFavorite a
inner join infrMember b on b.ifmmSeq=a.infrMember_ifmmSeq
inner join sdWord c on c.sdwSeq=a.sdWord_sdwSeq
inner join sdDate d on d.sddSeq=c.sdDate_sddSeq
inner join sdwMean e on e.sdWord_sdwSeq=c.sdwSeq
inner join sdwExample f on f.sdwMean_sdwmSeq=e.sdwmSeq
where 1=1
	and b.ifmmSeq="144"
;

SELECT
		a.sdfDelNY
		,b.ifmmName
		,c.sdwWord
		,d.sddDateChoice
		FROM sdFavorite a
		inner join infrMember b on b.ifmmSeq=a.infrMember_ifmmSeq
		inner join sdWord c on c.sdwSeq=a.sdWord_sdwSeq
		inner join sdDate d on d.sddSeq=c.sdDate_sddSeq
		WHERE 1=1
        group by c.sdwWord
        ;
-- 테스트 목록

select
	a.sdqNumber
    ,a.sdqKo
    ,a.sdqEng
    ,a.sdqAnswer
    ,b.sdrsUserAnswer
    ,b.sdTestNY
    ,c.sdtrsTotalScore
    ,d.sddDateChoice
    ,e.ifmmName
    ,e.ifmmEmail
    
from sdTestQuestion a
inner join sdTestResult b on b.sdTestQuestion_sdqseq=a.sdqSeq
inner join sdTotalResult c on c.sdtrsSeq=b.sdTotalResult_sdtrsSeq
inner join sdDate d on d.sddSeq=c.sdDate_sddSeq
inner join infrMember e on e.ifmmSeq=c.infrMember_ifmmSeq

where 1=1
	and d.sddDateChoice = "2022-07-25" and e.ifmmName = "Leejaegu"
;



-- 테스트 화면
select
	a.sdqNumber
    ,a.sdqKo
    ,a.sdqEng
    ,a.sdqAnswer
    ,b.sddDateChoice
    
from sdTestQuestion a
inner join sdDate b on b.sddSeq=a.sdDate_sddSeq
where 1=1
	and b.sddDateChoice = "2022-07-25"
;

-- 테스트 최종 수정 ----------------------------------------------------------------------------------------------------------
-- 테스트
select
	a.sdwNum
    ,a.sdwWord as answer
    ,SUBSTRING_INDEX(SUBSTRING_INDEX(d.sdweContents, a.sdwWord, 1), a.sdwWord, -1) as first
	,SUBSTRING_INDEX(SUBSTRING_INDEX(d.sdweContents, a.sdwWord, 2), a.sdwWord, -1) as second
    ,d.sdweTranslate
    ,b.sddDateChoice
from sdWord a
inner join sdDate b on b.sddSeq=a.sdDate_sddSeq
inner join sdwMean c on c.sdWord_sdwSeq=a.sdwSeq
inner join sdwExample d on d.sdwMean_sdwmSeq=c.sdwmSeq
where 1=1 
	
    AND d.sdweDefaultNy = 1
;

-- 랭킹 목록
select
	-- 
	a.infrMember_ifmmSeq
    ,(select aa.ifmmName from infrMember aa where 1=1 and aa.ifmmSeq = a.infrMember_ifmmSeq) as name
    ,a.sdtrsTotalScore
   ,sum(a.sdtrsTotalScore) as sum
    
from sdTotalResult a
	join sdDate b on b.sddSeq = a.sdDate_sddSeq
where 1=1
	and b.sddDateChoice between "2022-07-25" and "2022-07-27"
group by a.infrMember_ifmmSeq
order by sum desc
;



-- 연습

select
	a.IfmmName
    ,a.IfmmEmail
    ,a.IfmmGender
    ,a.IfmmPhone
    ,sum(b.SdtrsTotalScore) as sum
from InfrMember a
inner join SdTotalResult b on b.InfrMember_IfmmSeq=a.IfmmSeq
where 1=1
	and a.IfmmPhone like '%1111%'
-- group by a.IfmmName
union all
select
	a.IfmmName
    ,a.IfmmEmail
    ,a.IfmmGender
    ,a.IfmmPhone
    ,sum(b.SdtrsTotalScore) as sum
from InfrMember a
inner join SdTotalResult b on b.InfrMember_IfmmSeq=a.IfmmSeq
where 1=1
	and a.IfmmPhone like '%2222%'
-- group by a.IfmmName
;



select
	a.ifcgSeq
    ,(select count(ifcdName) from infrCode aa where 1=1 and aa.infrCodeGroup_ifcgSeq = a.ifcgSeq) as count
from infrCodeGroup a
;

INSERT INTO infrCodeGroup (
	ifcgName
    ,ifcgEngName
    ,ifcgUseNy
    ,ifcgRegDate
    ,ifcgModDate
	)
VALUES (
	#{ifcgName}
    ,#{ifcgEngName}
    ,1
    ,#{ifcgRegDate}
    ,#{ifcgModDate}
)
    

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





use bigbang;

SELECT
			a.*
		FROM infrMember a
		ORDER BY a.ifmmSeq DESC
        ;
        
SELECT
	a.infrCodeGroup_ifcgSeq
	,b.ifcgname
FROM infrCode a
inner join infrCodeGroup b on b.ifcgSeq = a.infrCodeGroup_ifcgSeq
;

SELECT
	a.ifcgName
    ,a.ifcgSeq
FROM infrCodeGroup a
;

SELECT a.ifmmSeq ,a.ifmmId ,a.ifmmPassword ,a.ifmmName FROM infrMember a WHERE 1=1 AND a.ifmmId 
= 'jaegu12' AND a.ifmmPassword = '77e3c4a17a6730d967667aa96eac53f8043deeb9749ff18defec29c77ff8c7dc' 
;
SELECT
			a.ifmmSeq
			,a.ifmmEmail
			,a.ifmmPassword
			,a.ifmmName
		FROM infrMember a
		WHERE 1=1 
			
			AND a.ifmmSeq = "144"
            ;
            
            SELECT a.ifmmSeq ,a.ifmmEmail ,a.ifmmPassword ,a.ifmmName FROM infrMember a WHERE 1=1 
            AND a.ifmmEmail 
= 'dlworn123@google.com' AND a.ifmmPassword = '2c9fa94a6259a521f6cfba2171f4886688c5d254f7c1f83d1508986185705d5e' 
AND a.ifmmPassword = 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855' 


AND a.ifmmSeq = "144";

