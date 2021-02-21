
# https://snippets.cacher.io/snippet/d35c3561424111fee6d7
# https://gist.github.com/ateneva/816b6790cfadf0781232884271cad148#file-sql_date_part_function-sql
# https://datageeking.com/2017/10/13/how-to-extract-part-of-a-date-in-sql/

# Title: How do I extract part of a date with SQL?


------------------------------------Vertica----------------------------------------------------------------
select
current_date()                      as Today,
current_time                        as TimeNow,
current_timestamp                   as TodayDateAndTime,        ----find current timestamp
Now(),
date_part('century', Now())         as Century,                 ----find current century
date_part('decade', Now())          as Decade,                  ----find current decade
date_part('doy', Now())             as DayOfYear,               ----find day of current year
date_part('doq', Now())             as DayofQuarter,            ----find day of current quarter
date_part('dow', Now())             as DayOfWeek,               ----find day of current week (0 to 6)
date_part('isoyear', Now())         as ISOYear,                 ----find current year
date_part('isoweek', Now())         as ISOWeek,                 ----find current week number
date_part('isodow', Now())          as DayOfISOWeek,            ----find day of current week (1 to 7)
date_part('year', Now())            as CurrentYear,             ----find current year
date_part('quarter', Now())         as CurrentQuarter,          ----find current quarter
date_part('month', Now())           as CurrentMonth,            ----find current month
date_part('day', Now())             as CurrentDay,              ----find current day
date_part('hour', Now())            as CurrentHour              ----find current hour

------------------------------------MS SQL Server--------------------------------------------------------------------------
select
current_timestamp                   as TodayDateAndTime,

datepart(yyyy, current_timestamp)   as CurrentYear,             ----find current year
datepart(qq, current_timestamp)     as CurrentQuarter,          ----find current quarter
datepart(mm, current_timestamp)     as CurrentMonth,            ----find current month
datepart(wk, current_timestamp)     as Week,                    ----find current week number (count as of 1st January),
datepart(isowk, current_timestamp)  as ISOWeek,                 ----find current week number (count as of 1st full week)
datepart(dd, current_timestamp)     as CurrentDay,              ----find current month
datepart(dy, current_timestamp)     as DayOfYear,               ----find day of current year
datepart(dw, current_timestamp)     as DayOfWeek,                ----find day of current week (Sun-Sat)
datepart(hh, current_timestamp)     as Hour                     ----find the current hour

TodayDateAndTime    |CurrentYear |CurrentQuarter |CurrentMonth |Week |ISOWeek |CurrentDay |DayOfYear |DayOfWeek |Hour |
--------------------|------------|---------------|-------------|-----|--------|-----------|----------|----------|-----|
2017-10-13 13:44:07 |2017        |4              |10           |43   |43      |13         |296       |2         |13   |

/*----------------------------------------------MySQL-----------------------------------------------------------------------*/
select

current_timestamp                   as MyLocalDateAndTime,

extract(year from current_timestamp)     as CurrentYear,            #----find current year
extract(quarter from current_timestamp)  as CurrentQuarter,         #----find current quarter
extract(month from current_timestamp)    as CurrentMonth,           #----find current month
extract(week from current_timestamp)     as CurrentWeek,            #----find current week
extract(day from current_timestamp)      as CurrentDay,             #----find current day
extract(hour from current_timestamp)     as CurrentHour             #----find current hour

MyLocalDateAndTime  |CurrentYear |CurrentQuarter |CurrentMonth |CurrentWeek |CurrentDay |CurrentHour |
--------------------|------------|---------------|-------------|------------|-----------|------------|
2017-10-13 13:44:51 |2017        |4              |10           |43          |13         |13          |

/*---------------------------------------- PostgreSQL: date_part----------------------------------------------------------------*/

select
current_timestamp,
date_part('century', current_timestamp)         as Century,                 ----find current century
date_part('decade', current_timestamp)          as Decade,                  ----find current decade
date_part('doy', current_timestamp)             as DayOfYear,               ----find day of current year
date_part('dow', current_timestamp)             as DayOfWeek,               ----find day of current week (0 to 6)
date_part('isoyear', current_timestamp)         as ISOYear,                 ----find current year
date_part('year', current_timestamp)            as CurrentYear,             ----find current year
date_part('quarter', current_timestamp)         as CurrentQuarter,          ----find current quarter
date_part('month', current_timestamp)           as CurrentMonth,             ----find current month
date_part('day', current_timestamp)             as CurrentDay,              ----find current day
date_part('hour', current_timestamp)            as CurrentHour              ----find current hour

now                 |century |decade |dayofyear |dayofweek |isoyear |currentyear |currentquarter |currentmonth |currentday |currenthour |
--------------------|--------|-------|----------|----------|--------|------------|---------------|-------------|-----------|------------|
2017-10-13 13:45:32 |21      |201    |296       |1         |2017    |2017        |4              |10           |13         |13          |

/*---------------------------------------- PostgreSQL: extract----------------------------------------------------------------*/

select
current_timestamp,
extract(century from current_timestamp)         as Century,                 ----find current century
extract(decade from current_timestamp)          as Decade,                  ----find current decade
extract(doy from current_timestamp)             as DayOfYear,               ----find day of current year
extract(dow from current_timestamp)             as DayOfWeek,               ----find day of current week (0 to 6)
extract(isoyear from current_timestamp)         as ISOYear,                 ----find current year
extract(year from current_timestamp)            as CurrentYear,             ----find current year
extract(quarter from current_timestamp)         as CurrentQuarter,          ----find current quarter
extract(month from current_timestamp)           as CurrentMonth,            ----find current month
extract(day from current_timestamp)             as CurrentDay,              ----find current day
extract(hour from current_timestamp)            as CurrentHour              ----find current hour

now                 |century |decade |dayofyear |dayofweek |isoyear |currentyear |currentquarter |currentmonth |currentday |currenthour |
--------------------|--------|-------|----------|----------|--------|------------|---------------|-------------|-----------|------------|
2017-10-13 13:45:32 |21      |201    |296       |1         |2017    |2017        |4              |10           |13         |13          |


------------------------------------BigQuery: extract ------------------------------------------------------------------------------------

SELECT ---- also supports MILISECOND, MICROSECOND
CURRENT_DATETIME() AS NOW,
EXTRACT(YEAR FROM CURRENT_DATETIME())        AS CurrentYear,
EXTRACT(QUARTER FROM CURRENT_DATETIME())     AS CurrentQuarter,
EXTRACT(MONTH FROM CURRENT_DATETIME())       AS CurrentMonth,
EXTRACT(WEEK FROM CURRENT_DATETIME())        AS CurrentWeek,     --starts by default on Sunday, but argument can be passed
EXTRACT(ISOWEEK FROM CURRENT_DATETIME())     AS CurrentIsoWeek,  --starts on Monday
EXTRACT(DAY FROM CURRENT_DATETIME())         AS CurrentDay,
EXTRACT(DAYOFYEAR FROM CURRENT_DATETIME())   AS CurrentDayOfYear,
EXTRACT(DAYOFWEEK FROM CURRENT_DATETIME())   AS CurrentDayOfWeek,
EXTRACT(HOUR FROM CURRENT_DATETIME())        AS CurrentHour,
EXTRACT(MINUTE FROM CURRENT_DATETIME())      AS CurrentMinute,
EXTRACT(SECOND FROM CURRENT_DATETIME())      AS CurrentSecond

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
    "CurrentDayOfWeek": 1,
    "CurrentHour": 8,
    "CurrentMinute": 31,
    "CurrentSecond": 14
  }
]
