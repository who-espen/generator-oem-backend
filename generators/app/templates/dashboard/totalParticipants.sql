select * from (
select
  'Male' Sex,
  count(case when p_sex = 'Male' then 1 else null end) as Count

from public.joined_participant_and_lab_result p

union

select
  'Female' Sex,
  count(case when p_sex = 'Female' then 1 else null end) as Count

from public.joined_participant_and_lab_result  p

union

select
  'Excluded (<20 years old, consent...)' Sex,
  count(case when( p_sex ISNULL or p_sex ='' or p_age_yrs < 20) then 1 else null end) as Count
from joined_participant_and_lab_result p

) s
