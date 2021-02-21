
# https://snippets.cacher.io/snippet/60b4f6494e81d1d3eb59
# https://gist.github.com/ateneva/24082be9f8e050ae635ee4c76f1b3ff6#file-sql_date_standard_functions-sql
# https://datageeking.com/2017/10/26/how-do-i-extract-part-of-a-date-with-sql-2/

# Title: How do I extract part of a date with SQL? (2)

---------------------------Vertica----------------------------------------------------------------------------
select

Now(),                                 ---find current timestamp

Date(Now()),                           ---find today's date
Year(Now()),                           ---find today's year
Quarter(Now()),                        ---find today's quarter
Month(Now()),                          ---find today's month
Day(Now()),                            ---find today's day

dayofyear(Now()) as DayOfYear,         ---find day of the year
dayofweek(Now()) as WeekdayUS,         ---find day of the week (number from 1 to 7, week starts on Sunday)
dayofweek_iso(Now()) as WeekdayEU,     ---find day of the week (number from 1 to 7, week starts on Monday)

week(Now())     as WeekNumUS,          ---week number, US standard
week_iso(Now()) as WeekNumEU           ---week numbeer, ISO standard

----------------------------MySQL------------------------------------------------------------------------------

select

Now(),
Date(Now())          as Today,
Year(Now())          as ThisYear,
Quarter(Now())       as ThisQuarter,
Month(Now())         as ThisMonth,
Day(Now())           as ThisDay,

dayofyear(Now())     as DayOfYear,
dayofmonth(Now())    as DayOfMonth,
dayofweek(Now())     as DayofWeek,   #1 = Sunday, 2 = Monday, …, 7 = Saturday)
weekday(Now())       as WeekdayNum,  #0 = Monday, 1 = Tuesday, … 6 = Sunday

weekofyear(Now())    as WeekNumUS,
week(Now())        	 as WeekNumUS

Now()               |Today      |ThisYear |ThisQuarter |ThisMonth |ThisDay |
--------------------|-----------|---------|------------|----------|--------|
2017-10-26 17:03:43 |2017-10-26 |2017     |4           |10        |26      |


DayOfYear |DayOfMonth |DayofWeek |WeekdayNum |WeekNumUS |WeekNumUS |
----------|-----------|----------|-----------|----------|----------|
299       |26         |5         |3          |43        |43        |


------------------------- MS SQL Server----------------------------------------------------------------------------

select

getdate()              as Now,
Year(getdate())        as ThisYear,
Month(getdate())       as ThisMonth,
Day(getdate())         as Today


Now                 |ThisYear |ThisMonth |Today |
--------------------|---------|----------|------|
2017-10-26 16:21:57 |2017     |10        |26    |


------------------------BigQuery -----------------------------------------------------------------------------------
SELECT
CURRENT_DATE() AS NOW,
EXTRACT(YEAR FROM CURRENT_DATE())        AS CurrentYear,
EXTRACT(QUARTER FROM CURRENT_DATE())     AS CurrentQuarter,
EXTRACT(MONTH FROM CURRENT_DATE())       AS CurrentMonth,
EXTRACT(WEEK FROM CURRENT_DATE())        AS CurrentWeek,     --starts by default on Sunday, but argument can be passed
EXTRACT(ISOWEEK FROM CURRENT_DATE())     AS CurrentIsoWeek,  --starts on Monday
EXTRACT(DAY FROM CURRENT_DATE())         AS CurrentDay,
EXTRACT(DAYOFYEAR FROM CURRENT_DATE())   AS CurrentDayOfYear,
EXTRACT(DAYOFWEEK FROM CURRENT_DATE())   AS CurrentDayOfWeek

[
  {
    "NOW": "2020-11-08",
    "CurrentYear": 2020,
    "CurrentQuarter": 4,
    "CurrentMonth": 11,
    "CurrentWeek": 45,
    "CurrentIsoWeek": 45,
    "CurrentDay": 8,
    "CurrentDayOfYear": 313,
    "CurrentDayOfWeek": 1
  }
]
