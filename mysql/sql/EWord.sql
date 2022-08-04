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
where a.SddDateChoice = "2022-07-25"
;


-- 코멘트 목록