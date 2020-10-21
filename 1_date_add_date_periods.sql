
# https://snippets.cacher.io/snippet/89a65a71dc8974ee2b4c
# https://gist.github.com/ateneva/15b3234797ca54d6a6ac2d051278a2b5#file-sql_timestamp_add-sql
# https://datageeking.com/2017/10/10/how-to-find-the-date-that-is-a-number-of-months-frombefore-now-in-sql/

# Title: How do I find the date that is a number of months from/before now with SQL?

----------------------------------SQL Server----------------------------------------------------------------
select

dateadd(year,    -1, getdate())   as OneYearAgo,
dateadd(month,   -1, getdate())   as OneMonthAgo,
dateadd(week,    -1, getdate())   as OneWeekAgo,
dateadd(day,     -1, getdate())   as OneDayAgo,
dateadd(weekday, -1, getdate())   as OneWeekdayAgo,
dateadd(hour,    -1, getdate())   as OneHourAgo,

OneYearAgo          |OneMonthAgo         |OneWeekAgo          |OneDayAgo           |OneWeekdayAgo       |OneHourAgo          |
--------------------|--------------------|--------------------|--------------------|--------------------|--------------------|
2016-10-10 13:03:26 |2017-09-10 13:03:26 |2017-10-03 13:03:26 |2017-10-09 13:03:26 |2017-10-09 13:03:26 |2017-10-10 12:03:26 |


dateadd(year,     1, getdate())   as OneYearFromNow,
dateadd(month,    1, getdate())   as MonthFromNow,
dateadd(week,     1, getdate())   as OneWeekFromNow,
dateadd(day,      1, getdate())   as OneDayFromNow,
dateadd(weekday,  1, getdate())   as OneWeekdayFromNow,
dateadd(hour,     1, getdate())   as OneHourFromNow

OneYearFromNow      |MonthFromNow        |OneWeekFromNow      |OneDayFromNow       |OneWeekdayFromNow   |OneHourFromNow      |
--------------------|--------------------|--------------------|--------------------|--------------------|--------------------|
2018-10-10 13:04:15 |2017-11-10 13:04:15 |2017-10-17 13:04:15 |2017-10-11 13:04:15 |2017-10-11 13:04:15 |2017-10-10 14:04:15 |


#----------------------------------MySQL--------------------------------------------------------------------
select

date_sub(Now(), interval 1 year)    as OneYearAgo,
date_sub(Now(), interval 1 month)   as OneMonthAgo,
date_sub(Now(), interval 1 week)    as OneWeekAgo,
date_sub(Now(), interval 1 day)     as OneDayAgo,
date_sub(Now(), interval 1 hour)    as OneHourAgo,

#or

date_add(Now(), interval -1 year)    as OneYearAgo,
date_add(Now(), interval -1 month)   as OneMonthAgo,
date_add(Now(), interval -1 week)    as OneWeekAgo,
date_add(Now(), interval -1 day)     as OneDayAgo,
date_add(Now(), interval -1 hour)    as OneHourAgo,

#or

timestampadd(year,  -1, Now())    	as OneYearAgo,
timestampadd(month, -1, Now())    	as OneMonthAgo,
timestampadd(week, -1, Now())     	as OneWeekAgo,
timestampadd(day, -1, Now())      	as OneDayAgo,
timestampadd(hour, -1, Now())     	as OneHourAgo


OneYearAgo          |OneMonthAgo         |OneWeekAgo          |OneDayAgo           |OneHourAgo          |
--------------------|--------------------|--------------------|--------------------|--------------------|
2016-10-10 13:11:12 |2017-09-10 13:11:12 |2017-10-03 13:11:12 |2017-10-09 13:11:12 |2017-10-10 12:11:12 |


date_add(Now(), interval 1 year)    as OneYearFromNow,
date_add(Now(), interval 1 month)   as MonthFromNow,
date_add(Now(), interval 1 week)    as OneWeekFromNow,
date_add(Now(), interval 1 day)     as OneDayFromNow,
date_add(Now(), interval 1 hour)    as OneHourFromNow

#OR

timestampadd(year, 1, Now())        as OneYearFromNow,
timestampadd(month, 1, Now())       as MonthFromNow,
timestampadd(week, 1, Now())        as OneWeekFromNow,
timestampadd(day, 1, Now())         as OneDayFromNow,
timestampadd(hour, 1, Now())        as OneHourFromNow


OneYearFromNow      |MonthFromNow        |OneWeekFromNow      |OneDayFromNow       |OneHourFromNow      |
--------------------|--------------------|--------------------|--------------------|--------------------|
2018-10-10 13:18:56 |2017-11-10 13:18:56 |2017-10-17 13:18:56 |2017-10-11 13:18:56 |2017-10-10 14:18:56 |


-----------------------------------Vertica: timestampaddd----------------------------------------------------
select 

timestampadd('year',  -1, Now())    as OneYearAgo,
timestampadd('month', -1, Now())    as OneMonthAgo,
timestampadd('week', -1, Now())     as OneWeekAgo,
timestampadd('day', -1, Now())      as OneDayAgo,
timestampadd('hour', -1, Now())     as OneHourAgo,

timestampadd('year', 1, Now())      as OneYearFromNow,
timestampadd('month', 1, Now())     as MonthFromNow,
timestampadd('week', 1, Now())      as OneWeekFromNow,
timestampadd('day', 1, Now())       as OneDayFromNow,
timestampadd('hour', 1, Now())      as OneHourFromNow

--------------------------------------------PostgreSQL--------------------------------------------------------

select 

Now() - INTERVAL '1 year'    as OneYearAgo,
Now() - INTERVAL '1 month'   as OneMonthAgo,
Now() - INTERVAL '1 week'    as OneWeekAgo,
Now() - INTERVAL '1 day'     as OneDayAgo,
Now() - INTERVAL '1 hour'    as OneHourAgo

oneyearago          |onemonthago         |oneweekago          |onedayago           |onehourago          |
--------------------|--------------------|--------------------|--------------------|--------------------|
2016-10-10 13:05:48 |2017-09-10 13:05:48 |2017-10-03 13:05:48 |2017-10-09 13:05:48 |2017-10-10 12:05:48 |


Now() + INTERVAL '1 year'    as OneYearFromNow,
Now() + INTERVAL '1 month'   as OneMonthFromNow,
Now() + INTERVAL '1 week'    as OneWeekFromNow,
Now() + INTERVAL '1 day'     as OneDayFromNow,
Now() + INTERVAL '1 hour'    as OneHourFromNow


oneyearfromnow      |onemonthfromnow     |oneweekfromnow      |onedayfromnow       |onehourfromnow      |
--------------------|--------------------|--------------------|--------------------|--------------------|
2018-10-10 13:06:26 |2017-11-10 13:06:26 |2017-10-17 13:06:26 |2017-10-11 13:06:26 |2017-10-10 14:06:26 |


