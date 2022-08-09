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

-- 로그인
select * from InfrMember a where a.IfmmEmail = "worncjfrn@naver.com" and a.IfmmPassword = "a123456"
;

-- 오늘의 단어
select
    a.SdwWord
    ,a.SdwMean
    ,a.SdwExample
    ,b.SddDateChoice

from SdWord a
inner join SdDate b on b.SddSeq=a.SdDate_SddSeq
where 1=1 
	and b.SddDateChoice = "2022-07-25"
;

-- 나만의 단어장
select
	a.SdfDelNY
    ,b.IfmmName
    ,c.SdwWord
    ,c.SdwMean
    ,c.SdwExample
	,d.SddDateChoice
    
from  SdFavorite a
inner join InfrMember b on b.IfmmSeq=a.InfrMember_IfmmSeq
inner join SdWord c on c.SdwSeq=a.SdWord_SdwSeq
inner join SdDate d on d.SddSeq=c.SdDate_SddSeq
where 1=1
	and b.IfmmName="Leejaegu"
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
	a.SdtrsTotalScore
    ,a.InfrMember_IfmmSeq
    ,b.IfmmName
    ,c.SddDateChoice
    -- 개인의 주간합산 구해옴
    -- (select sum(SdtrsTotalScore) from SdTotalResult where 아이디, 기간) as alice.3
from SdTotalResult a
inner join InfrMember b on b.IfmmSeq=a.InfrMember_IfmmSeq
inner join SdDate c on c.SddSeq=a.SdDate_SddSeq
where 1=1
	and c.SddDateChoice="2022-07-25"
    -- 주단위 검색조건 필요.2 between
-- 순서 정하는 쿼리 : order 로 시작함.4
;


