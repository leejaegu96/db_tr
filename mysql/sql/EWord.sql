use bigbang;

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

-- 오늘의 단어
select
    a.sdwWord
    ,c.sdwmPartOfSpeech
    ,c.sdwmContents
    ,d.sdweContents
    ,d.sdweTranslate
    ,b.sddDateChoice
from sdWord a
inner join sdDate b on b.sddSeq=a.sdDate_sddSeq
inner join sdwMean c on c.sdWord_sdwSeq=a.sdwSeq
inner join sdwExample d on d.sdWord_sdwSeq=a.sdwSeq
where 1=1 
	and b.sddDateChoice = "2022-07-25"
group by a.sdwWord
;

-- 나만의 단어장
select
	a.sdfDelNY
    ,b.ifmmName
    ,c.sdwWord
    ,e.sdwmPartOfSpeech
    ,e.sdwmContents
    ,f.sdweContents
    ,f.sdweTranslate
	,d.sddDateChoice
from  sdFavorite a
inner join infrMember b on b.ifmmSeq=a.infrMember_ifmmSeq
inner join sdWord c on c.sdwSeq=a.sdWord_sdwSeq
inner join sdDate d on d.sddSeq=c.sdDate_sddSeq
inner join sdwMean e on e.sdWord_sdwSeq=c.sdwSeq
inner join sdwExample f on f.sdWord_sdwSeq=c.sdwSeq
where 1=1
	and b.ifmmName="Leejaegu"
group by c.sdwWord
;

-- 테스트 목록

select
	a.SdqNumber
    ,a.SdqKo
    ,a.SdqEng
    ,a.SdqAnswer
    ,b.SdrsUserAnswer
    ,b.SdTestNY
    ,c.SdtrsTotalScore
    ,d.SddDateChoice
    ,e.IfmmName
    ,e.IfmmEmail
    
from SdTestQuestion a
inner join SdTestResult b on b.SdTestQuestion_Sdqseq=a.SdqSeq
inner join SdTotalResult c on c.SdtrsSeq=b.SdTotalResult_SdtrsSeq
inner join SdDate d on d.SddSeq=c.SdDate_SddSeq
inner join InfrMember e on e.IfmmSeq=c.InfrMember_IfmmSeq

where 1=1
	and d.SddDateChoice = "2022-07-25" and e.IfmmName = "Leejaegu"
;


-- 랭킹 목록
select
	-- 
	a.InfrMember_IfmmSeq
    ,(select aa.IfmmName from InfrMember aa where 1=1 and aa.IfmmSeq = a.InfrMember_IfmmSeq) as name
    ,a.SdtrsTotalScore
   ,sum(a.SdtrsRotalScore) as sum
    
from SdTotalResult a
	join SdDate b on b.SddSeq = a.SdDate_SddSeq
where 1=1
	and b.SddDateChoice between "2022-07-25" and "2022-07-27"
group by a.InfrMember_IfmmSeq
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
