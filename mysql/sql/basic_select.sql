use bigbang;



select
	a.ifmmSeq
    ,a.ifmmName
    ,a.ifmmEmail
    ,b.SdtrsTotalScore
    ,c.SddDateChoice
from InfrMember a
-- left join infrMemberAddress b on b.InfrMember_IfmmSeq = a.ifmmSeq
inner join SdTotalResult b on b.InfrMember_IfmmSeq = a.ifmmSeq
inner join SdDate c on c.SddSeq = b.SdDate_SddSeq
-- join infrMemberAddress b on b.ifmmSeq = a.ifmmSeq
;