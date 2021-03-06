
# https://snippets.cacher.io/snippet/91415a854e9ddef9f791
# https://gist.github.com/ateneva/0a1a2fe8418abef04a7f11f86f63a9c3#file-sql_find_the_last_day_of_a_month-sql
# https://datageeking.com/2017/11/18/how-do-i-find-the-last-day-of-the-previous-next-month-with-sql/

# Title: How do I find the last day of the previous/next month with SQL?

---------------------------------SQL Server-------------------------------------------------------------------------

select

convert(date,getdate()) as Today,
eomonth(getdate(),-1)   as LastDayPreviousMonth,
eomonth(getdate(),+0)   as LastDayThisMonth,
eomonth(getdate(),+1)   as LastDayNextMonth


Today      |LastDayPreviousMonth |LastDayThisMonth |LastDayNextMonth |
-----------|---------------------|-----------------|-----------------|
2017-11-18 |2017-10-31           |2017-11-30       |2017-12-31       |

---------------------------------Vertica----------------------------------------------------------------------------

select

now()                          as Today
last_day(Now())                as LastDayofCurrentMonth,
last_day(add_months(Now(),-1)) as LastDayofPreviousMonth,
last_day(add_months(Now(), 1)) as LastDayofNextMonth


Today      |LastDayPreviousMonth |LastDayThisMonth |LastDayNextMonth |
-----------|---------------------|-----------------|-----------------|
2017-11-18 |2017-10-31           |2017-11-30       |2017-12-31       |


#--------------------------------MySQL-------------------------------------------------------------------------------

select

date(now())                   as Today,
last_day(adddate(Now(), -31)) as LastDayPreviousMonth,
last_day(Now())               as LastDayThisMonth,
last_day(adddate(Now(), +31)) as LastDayNextMonth


Today      |LastDayPreviousMonth |LastDayThisMonth |LastDayNextMonth |
-----------|---------------------|-----------------|-----------------|
2017-11-18 |2017-10-31           |2017-11-30       |2017-12-31       |


---------------------------------PostgreSQL----------------------------------------------------------------------------

select

Date(Now()) as Today,
Date(date_trunc('month', Now() + interval '0 month') - interval '1 day')  as LastDayPreviousMonth,
Date(date_trunc('month', Now() + interval '1 month') - interval '1 day')  as LastDayThisMonth,
Date(date_trunc('month', Now() + interval '2 month') - interval '1 day')  as LastDayNextMonth


today      |lastdaypreviousmonth |lastdaythismonth |lastdaynextmonth |
-----------|---------------------|-----------------|-----------------|
2017-11-18 |2017-10-31           |2017-11-30       |2017-12-31       |


-------------------------------BigQuery -----------------------------------------------------------------------------
SELECT
CURRENT_DATE() AS NOW,
LAST_DAY(CURRENT_DATE(), WEEK)            AS LastDayOfCurrentWeek,
LAST_DAY(CURRENT_DATE(), WEEK(FRIDAY))    AS LastDayOfCurrentDefinedWeek,
LAST_DAY(CURRENT_DATE(), ISOWEEK)         AS LastDayOfCurrentISOWeek,
LAST_DAY(CURRENT_DATE(), MONTH)           AS LastDayofCurrentMonth,
LAST_DAY(CURRENT_DATE(), QUARTER)         AS LastDayofCurrentQuarter,
LAST_DAY(CURRENT_DATE(), YEAR)            AS LastDayOfCurrentYear,
LAST_DAY(CURRENT_DATE(), ISOYEAR)         AS LastDayOfCurrentISOYear

[
  {
    "NOW": "2020-11-08",
    "LastDayOfCurrentWeek": "2020-11-14",
    "LastDayOfCurrentDefinedWeek": "2020-11-12",
    "LastDayOfCurrentISOWeek": "2020-11-08",
    "LastDayofCurrentMonth": "2020-11-30",
    "LastDayofCurrentQuarter": "2020-12-31",
    "LastDayOfCurrentYear": "2020-12-31",
    "LastDayOfCurrentISOYear": "2021-01-03"
  }
]
