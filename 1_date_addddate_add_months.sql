
# https://snippets.cacher.io/snippet/4e7dd3e11a5b245002f7
# https://gist.github.com/ateneva/088c93160f4b31b442e1d355dd5a8f21
# https://datageeking.com/2017/10/18/how-do-i-add-timestamps-to-a-date-with-sql/

-----------------------------------------Vertica---------------------------------------------------------------------------

select 
Now(),
add_months(Now(), 1) as 1MonthFromNow,
add_months(Now(),-1) as 1MonthAgo,

add_months(Now(), 5) as 5MonthsFromNow,
add_months(Now(),-5) as 5MonthsAgo,

add_months(Now(), 8) as 8MonthsFromNow,
add_months(Now(),-8) as 8MonthsAgo


-------------------------------------------MySQL----------------------------------------------------------------------------

select 

now(),
date(adddate(now(), 5)) as 5DaysFromNow,    
time(addtime(now(), 5)) as 5SecondsFromNow,

date(subdate(now(), 5)) as 5DaysAgo,
time(subtime(now(), 5)) as 5SecondsAgo,

#fixed input month
period_add(201801, 3) as 3MonthFromYM,
period_add(201801,-3) as 3MonthAgo,

concat(year(now()),  #get current year month
	case when month(now()) < 10 then concat(0, month(now())) else month(now()) end) as ThisYM,
	
#dynamic input month
period_add(concat(year(now()),  #get current year month
				case when month(now()) < 10 then concat(0, month(now())) else month(now()) end), 5) as 5MonthsFromNow

				
now()               |5DaysFromNow |5SecondsFromNow |5DaysAgo   |5SecondsAgo |3MonthFromYM |3MonthAgo |ThisYM |5MonthsFromNow |
--------------------|-------------|----------------|-----------|------------|-------------|----------|-------|---------------|
2017-10-18 16:17:29 |2017-10-23   |16:17:34        |2017-10-13 |16:17:24    |201804       |201710    |201710 |201803         |


