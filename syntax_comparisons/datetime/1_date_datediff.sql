
# https://snippets.cacher.io/snippet/d605c6cc44365c321377
# https://gist.github.com/ateneva/164c90571e0f7526de1760aacbb8cd0d#file-sql_datediff_function-sql
# https://datageeking.com/2017/11/03/find-the-difference-between-dates/

# How do I find the difference between two dates with SQL?

----------------------------------Vertica--------------------------------------------------------------------------------------------------------

select

datediff('year',    '1988-06-21', Now()) as YearsBetweenDates,
datediff('quarter', '1988-06-21', Now()) as QuartersBetweenDates,
datediff('month',   '1988-06-21', Now()) as MonthsBetweenDates,
datediff('day',     '1988-06-21', Now()) as DaysBetweenDates,
datediff('hour',    '1988-06-21', Now()) as HoursBetweenDates,
datediff('minute',  '1988-06-21', Now()) as MinutesBetweenDates,
datediff('second',  '1988-06-21', Now()) as SecondsBetweenDates,


timestampdiff('year',   '2015-08-22', Now()) as YearsBetween,
timestampdiff('month',  '2015-08-22', Now()) as MonthsBetween,
timestampdiff('week',   '2015-08-22', Now()) as WeeksBetween,
timestampdiff('day',    '2015-08-22', Now()) as DaysBetween,
timestampdiff('hour',   '2015-08-22', Now()) as HoursBetween,
timestampdiff('minute', '2015-08-22', Now()) as MinutesBetwee


----------------------------------SQL Server-----------------------------------------------------------------------------------------------------

select

datediff(year,    '1988-06-21', getdate()) as YearsBetweenDates,
datediff(quarter, '1988-06-21', getdate()) as QuartersBetweenDates,
datediff(month,   '1988-06-21', getdate()) as MonthsBetweenDates,
datediff(day,     '1988-06-21', getdate()) as DaysBetweenDates,
datediff(hour,    '1988-06-21', getdate()) as HoursBetweenDates,
datediff(minute,  '1988-06-21', getdate()) as MinutesBetweenDates,
datediff(second,  '1988-06-21', getdate()) as SecondsBetweenDates

DaysBetween |YearsBetweenDates |QuartersBetweenDates |MonthsBetweenDates |DaysBetweenDates |HoursBetweenDates |MinutesBetweenDates |SecondsBetweenDates |
------------|------------------|---------------------|-------------------|-----------------|------------------|--------------------|--------------------|
10764       |29                |117                  |353                |10764            |258357            |15501421            |930085304           |

#------------------------------------MySQL----------------------------------------------------------------------------------------------------------

select

datediff(Now(), '1988-06-21') as DaysBetween,

timestampdiff(year,    '1988-06-21', Now()) as YearsBetweenDates,
timestampdiff(quarter, '1988-06-21', Now()) as QuartersBetweenDates,
timestampdiff(month,   '1988-06-21', Now()) as MonthsBetweenDates,
timestampdiff(day,     '1988-06-21', Now()) as DaysBetweenDates,
timestampdiff(hour,    '1988-06-21', Now()) as HoursBetweenDates,
timestampdiff(minute,  '1988-06-21', Now()) as MinutesBetweenDates,
timestampdiff(second,  '1988-06-21', Now()) as SecondsBetweenDates

DaysBetween |YearsBetweenDates |QuartersBetweenDates |MonthsBetweenDates |DaysBetweenDates |HoursBetweenDates |MinutesBetweenDates |SecondsBetweenDates |
------------|------------------|---------------------|-------------------|-----------------|------------------|--------------------|--------------------|
10764       |29                |117                  |353                |10764            |258357            |15501421            |930085304           |

------------------------------------PostgreSQL---------------------------------------------------------------------------------------------------------

select

age(Now(), '1988-06-21') as YearsBetweenDates

yearsbetweendates                                      |
-------------------------------------------------------|
29 years 5 mons 19 days 21 hours 0 mins 39.466046 secs |



-------------------BigQuery (datetime_expression, datetime_expression, part)----------------------------------
SELECT
CURRENT_DATE() AS NOW,
DATETIME_DIFF(CURRENT_DATE(), CAST('2019-01-21' AS DATE), YEAR )          AS YearsBetweenDatetimes,
DATETIME_DIFF(CURRENT_DATE(), CAST('2019-01-21' AS DATE), QUARTER)        AS QuartersBetweenDatetimes,
DATETIME_DIFF(CURRENT_DATE(), CAST('2019-01-21' AS DATE), MONTH)          AS MonthsBetweenDatetimes,
DATETIME_DIFF(CURRENT_DATE(), CAST('2019-01-21' AS DATE), ISOWEEK)        AS IsoWeeksBetweenDatetimes,
DATETIME_DIFF(CURRENT_DATE(), CAST('2019-01-21' AS DATE), WEEK)           AS WeeksBetweenDatetimes,
DATETIME_DIFF(CURRENT_DATE(), CAST('2019-01-21' AS DATE), WEEK(FRIDAY))   AS DefinedWeeksBetweenDatetimes,
DATETIME_DIFF(CURRENT_DATE(), CAST('2019-01-21' AS DATE), DAY)            AS DaysBetweenDatetimes,
DATETIME_DIFF(CURRENT_DATE(), CAST('2019-01-21' AS DATE), HOUR)           AS HoursBetweenDatetimes,
DATETIME_DIFF(CURRENT_DATE(), CAST('2019-01-21' AS DATE), MINUTE)         AS MinutesBetweenDatetimes,
DATETIME_DIFF(CURRENT_DATE(), CAST('2019-01-21' AS DATE), SECOND)         AS SecondsBetweenDatetimes,


DATETIME_DIFF(CAST('2019-01-21' AS DATE), CURRENT_DATE(), YEAR )          AS YearsBetweenDatetimes,
DATETIME_DIFF(CAST('2019-01-21' AS DATE), CURRENT_DATE(), QUARTER)        AS QuartersBetweenDatetimes,
DATETIME_DIFF(CAST('2019-01-21' AS DATE), CURRENT_DATE(), MONTH)          AS MonthsBetweenDatetimes,
DATETIME_DIFF(CAST('2019-01-21' AS DATE), CURRENT_DATE(), ISOWEEK)        AS IsoWeeksBetweenDatetimes,
DATETIME_DIFF(CAST('2019-01-21' AS DATE), CURRENT_DATE(), WEEK)           AS WeeksBetweenDatetimes,
DATETIME_DIFF(CAST('2019-01-21' AS DATE), CURRENT_DATE(), WEEK(FRIDAY))   AS DefinedWeeksBetweenDatetimes,
DATETIME_DIFF(CAST('2019-01-21' AS DATE), CURRENT_DATE(), DAY)            AS DaysBetweenDatetimes,
DATETIME_DIFF(CAST('2019-01-21' AS DATE), CURRENT_DATE(), HOUR)           AS HoursBetweenDatetimes,
DATETIME_DIFF(CAST('2019-01-21' AS DATE), CURRENT_DATE(), MINUTE)         AS MinutessBetweenDatetimes,
DATETIME_DIFF(CAST('2019-01-21' AS DATE), CURRENT_DATE(), SECOND)         AS SecondsBetweenDatetimes

[
  {
    "NOW": "2020-11-08",
    "YearsBetweenDatetimes": 1,
    "QuartersBetweenDatetimes": 7,
    "MonthsBetweenDatetimes": 22,
    "IsoWeeksBetweenDatetimes": 93,
    "WeeksBetweenDatetimes": 94,
    "DefinedWeeksBetweenDatetimes": 94,
    "DaysBetweenDatetimes": 657,
    "HoursBetweenDatetimes": 15768,
    "MinutesBetweenDatetimes": 946080,
    "SecondsBetweenDatetimes": 56764800,
    "YearsBetweenDatetimes_1": -1,
    "QuartersBetweenDatetimes_1": -7,
    "MonthsBetweenDatetimes_1": -22,
    "IsoWeeksBetweenDatetimes_1": -93,
    "WeeksBetweenDatetimes_1": -94,
    "DefinedWeeksBetweenDatetimes_1": -94,
    "DaysBetweenDatetimes_1": -657,
    "HoursBetweenDatetimes_1": -15768,
    "MinutessBetweenDatetimes": -946080,
    "SecondsBetweenDatetimes_1": -56764800
  }
]
