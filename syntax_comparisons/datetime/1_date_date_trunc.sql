
# https://snippets.cacher.io/snippet/cb25cb816a132e233931
# https://gist.github.com/ateneva/795d948577b5d04bc3e9da84142e6786#file-sql_date_trunc_syntax-sql
# https://datageeking.com/2017/11/12/how-do-i-find-the-firstlast-day-of-a-weekmonth-in-sql/

# Title: How do I find the first day of the current week with SQL?

---------------Vertica------------------------------------------------------------------------

select

Date(date_trunc('week', Now()))  as FirstDayOfCurrentWeek,
Date(date_trunc('month', Now())) as FirstDayofCurrentMonth,
Date(date_trunc('year', Now()))  as FirstDayOfCurrentYear

firstdayofcurrentweek |firstdayofcurrentmonth |firstdayofcurrentyear |
----------------------|-----------------------|----------------------|
2017-11-06            |2017-11-01             |2017-01-01            |

---------------PostgreSQL----------------------------------------------------------------------

select

Date(date_trunc('week', Now()))  as FirstDayOfCurrentWeek,
Date(date_trunc('month', Now())) as FirstDayofCurrentMonth,
Date(date_trunc('year', Now()))  as FirstDayOfCurrentYear

firstdayofcurrentweek |firstdayofcurrentmonth |firstdayofcurrentyear |
----------------------|-----------------------|----------------------|
2017-11-06            |2017-11-01             |2017-01-01            |

----------------------------SQL Server---------------------------------------------------------

select

convert(date, getdate()) as Today,
datepart(dw, getdate()) as Weekday,

case ----------------------------Mon-Sun week-----------------------------------------
	when datepart(dw, getdate()) = 1 then convert(date, dateadd(day, -6, getdate()))
	when datepart(dw, getdate()) = 2 then convert(date, dateadd(day,  0, getdate()))
	when datepart(dw, getdate()) = 3 then convert(date, dateadd(day, -1, getdate()))
	when datepart(dw, getdate()) = 4 then convert(date, dateadd(day, -2, getdate()))
	when datepart(dw, getdate()) = 5 then convert(date, dateadd(day, -3, getdate()))
	when datepart(dw, getdate()) = 6 then convert(date, dateadd(day, -4, getdate()))
	when datepart(dw, getdate()) = 7 then convert(date, dateadd(day, -5, getdate()))
                                                          end as FirstDayofCurrentWeek,


convert(date, convert(varchar(7), getdate(), 120) + '-01')    as FirstDayofCurrentMonth,
convert(date, convert(varchar(4), getdate(), 120) + '-01-01') as FirstDayofCurrentYear


Today      |Weekday |FirstDayofCurrentWeek |FirstDayofCurrentMonth |FirstDayofCurrentYear |
-----------|--------|----------------------|-----------------------|----------------------|
2017-11-12 |1       |2017-11-06            |2017-11-01             |2017-01-01            |


-------------------------------MySQL--------------------------------------------------------------

select

Date(Now())                                                  as Today,
weekday(Now())                                               as WeekdayToday,

case #---------------------------Mon-Sun week--------------------------------
	when weekday(Now()) = 0 then date(Now())
	when weekday(Now()) = 1 then date(date_add(Now(), interval -1 day))
	when weekday(Now()) = 2 then date(date_add(Now(), interval -2 day))
	when weekday(Now()) = 3 then date(date_add(Now(), interval -3 day))
	when weekday(Now()) = 4 then date(date_add(Now(), interval -4 day))
	when weekday(Now()) = 5 then date(date_add(Now(), interval -5 day))
	when weekday(Now()) = 6 then date(date_add(Now(), interval -6 day))
                                                         end as FirstDayofCurrentWeek,

date_format(Now(), '%Y-%m-01')                               as FirstDayofCurrentMonth,
date_format(Now(), '%Y-01-01')                               as FirstDayofCurrentYear

Today      |WeekdayToday |FirstDayofCurrentWeek |FirstDayofCurrentMonth |FirstDayofCurrentYear |
-----------|-------------|----------------------|-----------------------|----------------------|
2017-11-12 |6            |2017-11-06            |2017-11-01             |2017-01-01            |


------------------------------BigQuery-----------------------------------------------------------------

SELECT
CURRENT_DATE() AS NOW,
DATE_TRUNC(CURRENT_DATE(), WEEK)           AS FirstDayOfCurrentWeek,
DATE_TRUNC(CURRENT_DATE(), WEEK(FRIDAY))   AS FirstDayOfDefinedCurrentWeek,
DATE_TRUNC(CURRENT_DATE(), ISOWEEK)        AS FirstDayOfCurrentISOWeek,
DATE_TRUNC(CURRENT_DATE(), MONTH)          AS FirstDayofCurrentMonth,
DATE_TRUNC(CURRENT_DATE(), QUARTER)        AS FirstDayofCurrentQuarter,
DATE_TRUNC(CURRENT_DATE(), YEAR)           AS FirstDayOfCurrentYear,
DATE_TRUNC(CURRENT_DATE(), ISOYEAR)        AS FirstDayOfCurrentISOYear

[
  {
    "NOW": "2020-11-08",
    "FirstDayOfCurrentWeek": "2020-11-08",
    "FirstDayOfDefinedCurrentWeek": "2020-11-06",
    "FirstDayOfCurrentISOWeek": "2020-11-02",
    "FirstDayofCurrentMonth": "2020-11-01",
    "FirstDayofCurrentQuarter": "2020-10-01",
    "FirstDayOfCurrentYear": "2020-01-01",
    "FirstDayOfCurrentISOYear": "2019-12-30"
  }
]
