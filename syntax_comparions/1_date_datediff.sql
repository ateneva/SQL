
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


