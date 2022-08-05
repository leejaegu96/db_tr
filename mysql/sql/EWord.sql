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
	a.SddDateChoice
    ,b.SdwWord
    ,b.SdwMean
    ,b.SdwExample

from SdDate a 
inner join SdWord b on b.SdDate_SddSeq=a.SddSeq
where a.SddDateChoice = "2022-07-25"
;

-- 나만의 단어장
select
	a.SddDateChoice
    ,b.SdwWord
    ,b.SdwMean
    ,b.SdwExample
    ,c.IfmmName
    ,d.SdfDelNY
    
from SdDate a 
inner join SdWord b on b.SdDate_SddSeq=a.SddSeq
inner join SdFavorite d on d.SdWord_SdwSeq=b.SdwSeq
inner join InfrMember c on c.IfmmSeq=d.InfrMember_IfmmSeq
where a.SddDateChoice = "2022-07-25" and c.IfmmName = "Leejaegu"
;

-- 테스트 목록
select
	a.SddDateChoice
    ,e.IfmmName
    ,e.IfmmEmail
    ,b.SdqNumber
    ,b.SdqKo
    ,b.SdqEng
    ,b.SdqAnswer
    ,c.SdrsUserAnswer
    ,c.SdTestNY
    ,d.SdtrsTotalScore
    
from SdDate a
inner join SdTestQuestion b on b.SdDate_SddSeq = a.SddSeq
inner join SdTestResult c on c.SdTestQuestion_Sdqseq = b.SdqSeq 
inner join SdTotalResult d on d.SdtrsSeq = c.SdTotalResult_SdtrsSeq
inner join InfrMember e on e.IfmmSeq = d.InfrMember_IfmmSeq
where 
	a.SddDateChoice = "2022-07-25" and e.IfmmName = "Leejaegu"
;


-- 랭킹 목록
select
	a.IfmmName
    ,b.SdtrsTotalScore
    ,c.SddDateChoice
from InfrMember a
inner join SdTotalResult b on b.InfrMember_IfmmSeq=a.IfmmSeq
inner join SdDate c on c.SddSeq=b.SdDate_SddSeq
;


