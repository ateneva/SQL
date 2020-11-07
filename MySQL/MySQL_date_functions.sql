'''
+ STR_TO_DATE(date, date_format)						---Convert a string to a date
+ CURDATE(), CURRENT_DATE(), CURRENT_DATE, UTC_DATE()	---Return the current date
+ DAY(), MONTH(), WEEK(), QUARTER(), YEAR()				---Return the day, month, quarter, year from the passed argument
+ DAYOFMONTH(), DAYOFWEEK(), DAYOFYEAR(), WEEKOFYEAR()	---Return the number index of the argument
DAYNAME(), MONTHNAME()									---Return the name of the weekday or month
YEARWEEK()												---Return the year and week

+ DATE(date or timestamp)								---Extract the date part of a date or datetime expression
MAKEDATE(year, dayofyear)								---Create a date from the year and day of year

+ EXTRACT(PART FROM DATE/TIMESTAMP)						---Extract part of a date

+ DATE_ADD(DATE/TIMESTAMP, INTERVAL, PART)				---Add datetime values (INTERVALs) to a date value
+ DATE_SUB(DATE/TIMESTAMP, INTERVAL, PART), 			---Subtract a datetime value (INTERVAL) from a date
+ ADDDATE(DATE, argument)								---Add dates to a date value
+ SUBDATE(DATE, argument)								---Subtract a date value from a date
+ PERIOD_ADD()											---Add a period to a year-month
PERIOD_DIFF()											---Return the number of months between periods

+ DATEDIFF(PART, DATE, DATE)							---Subtract two dates

DATE_FORMAT()											---Format date as specified
GET_FORMAT()											---Return a date format string
+ LAST_DAY(DATE)										---Return the last day of the month for the argument
FROM_DAYS()												---Convert a day number to a date
FROM_UNIXTIME()											---Format Unix timestamp as a date
'''

------------------------STR_TO_DATE-------------------------------------------------------------------------------------------
SELECT
'2017-03-31'                          as TextField,
STR_TO_DATE('2017-03-31', '%Y-%m-%d') as DateField


----------------------------STANDARD FUNCTIONS------------------------------------------------------------------------------
SELECT
NOW(),
DATE(CURRENT_DATE())          as Today,
YEAR(CURRENT_DATE())          as ThisYear,
QUARTER(CURRENT_DATE())       as ThisQuarter,
MONTH(CURRENT_DATE())         as ThisMonth,
DAY(CURRENT_DATE())           as ThisDay,

DAYOFYEAR(CURRENT_DATE())     as DayOfYear,
DAYOFMONTH(CURRENT_DATE())    as DayOfMonth,
DAYOFWEEK(CURRENT_DATE())     as DayofWeek,   #1 = Sunday, 2 = Monday, …, 7 = Saturday)
WEEKDAY(CURRENT_DATE())       as WeekdayNum,  #0 = Monday, 1 = Tuesday, … 6 = Sunday

WEEKOFYEAR(CURRENT_DATE())		as WeekNumUS,
WEEK(CURRENT_DATE())			as WeekNumUS

Now()               |Today      |ThisYear |ThisQuarter |ThisMonth |ThisDay |
--------------------|-----------|---------|------------|----------|--------|
2017-10-26 17:03:43 |2017-10-26 |2017     |4           |10        |26      |


DayOfYear |DayOfMonth |DayofWeek |WeekdayNum |WeekNumUS |WeekNumUS |
----------|-----------|----------|-----------|----------|----------|
299       |26         |5         |3          |43        |43        |

----------------------------------------------EXTRACT-----------------------------------------------------------------------*/
SELECT
CURRENT_TIMESTAMP                   as MyLocalDateAndTime,

EXTRACT(YEAR FROM CURRENT_TIMESTAMP)     as CurrentYear,            #----find current year
EXTRACT(QUARTER FROM CURRENT_TIMESTAMP)  as CurrentQuarter,         #----find current quarter
EXTRACT(month FROM CURRENT_TIMESTAMP)    as CurrentMonth,           #----find current month
EXTRACT(week FROM CURRENT_TIMESTAMP)     as CurrentWeek,            #----find current week
EXTRACT(day FROM CURRENT_TIMESTAMP)      as CurrentDay,             #----find current day
EXTRACT(hour FROM CURRENT_TIMESTAMP)     as CurrentHour             #----find current hour

MyLocalDateAndTime  |CurrentYear |CurrentQuarter |CurrentMonth |CurrentWeek |CurrentDay |CurrentHour |
--------------------|------------|---------------|-------------|------------|-----------|------------|
2017-10-13 13:44:51 |2017        |4              |10           |43          |13         |13          |


---------------------------------- DATE_ADD() / DATE_SUB() --------------------------------------------------------------------

SELECT
DATE_ADD(NOW(), INTERVAL 1 YEAR)    as OneYearFromNOW,
DATE_ADD(NOW(), INTERVAL 1 MONTH)   as MonthFromNOW,
DATE_ADD(NOW(), INTERVAL 1 WEEK)    as OneWeekFromNOW,
DATE_ADD(NOW(), INTERVAL 1 DAY)     as OneDayFromNOW,
DATE_ADD(NOW(), INTERVAL 1 HOUR)    as OneHourFromNOW

OneYearFromNOW      |MonthFromNOW        |OneWeekFromNOW      |OneDayFromNOW       |OneHourFromNOW      |
--------------------|--------------------|--------------------|--------------------|--------------------|
2018-10-10 13:18:56 |2017-11-10 13:18:56 |2017-10-17 13:18:56 |2017-10-11 13:18:56 |2017-10-10 14:18:56 |

SELECT
DATE_ADD(NOW(), INTERVAL -1 YEAR)    as OneYearAgo,
DATE_ADD(NOW(), INTERVAL -1 MONTH)   as OneMonthAgo,
DATE_ADD(NOW(), INTERVAL -1 WEEK)    as OneWeekAgo,
DATE_ADD(NOW(), INTERVAL -1 DAY)     as OneDayAgo,
DATE_ADD(NOW(), INTERVAL -1 HOUR)    as OneHourAgo,

# or

SELECT
DATE_SUB(NOW(), INTERVAL 1 YEAR)    as OneYearAgo,
DATE_SUB(NOW(), INTERVAL 1 MONTH)   as OneMonthAgo,
DATE_SUB(NOW(), INTERVAL 1 WEEK)    as OneWeekAgo,
DATE_SUB(NOW(), INTERVAL 1 DAY)     as OneDayAgo,
DATE_SUB(NOW(), INTERVAL 1 HOUR)    as OneHourAgo,


OneYearAgo          |OneMonthAgo         |OneWeekAgo          |OneDayAgo           |OneHourAgo          |
--------------------|--------------------|--------------------|--------------------|--------------------|
2016-10-10 13:11:12 |2017-09-10 13:11:12 |2017-10-03 13:11:12 |2017-10-09 13:11:12 |2017-10-10 12:11:12 |


----------------------------PERIOD_ADD / PERIOD_DIFF------------------------------------------------------------------------
#fixed input month
SELECT
NOW(),
PERIOD_ADD(201801, 3) as 3MonthFromYM,
PERIOD_ADD(201801,-3) as 3MonthAgo,

CONCAT(YEAR(NOW()),  #get current year month
	CASE
		WHEN MONTH(NOW()) < 10 THEN CONCAT(0, MONTH(NOW()))
		ELSE  MONTH(NOW())
	END) as ThisYM,

#dynamic input month
PERIOD_ADD(CONCAT(YEAR(NOW()),  #get current year month
				CASE
					WHEN MONTH(NOW()) < 10 THEN CONCAT(0, MONTH(NOW()))
					ELSE MONTH(NOW())
				END), 5) as 5MonthsFromNow


now()               |3MonthFromYM |3MonthAgo |ThisYM |5MonthsFromNow |
--------------------|-------------|----------|-------|---------------|
2017-10-18 16:17:29 |201804       |201710    |201710 |201803         |



#------------------------------------DATEDIFF--------------------------------------------------------------------------------

SELECT
DATEDIFF(NOW(), '1988-06-21') as DaysBetween,

DATEDIFF(YEAR,    '1988-06-21', NOW()) as YearsBetweenDates,
DATEDIFF(QUARTER, '1988-06-21', NOW()) as QuartersBetweenDates,
DATEDIFF(MONTH,   '1988-06-21', NOW()) as MonthsBetweenDates,
DATEDIFF(DAY,     '1988-06-21', NOW()) as DaysBetweenDates,
DATEDIFF(HOUR,    '1988-06-21', NOW()) as HoursBetweenDates,
DATEDIFF(MINUTE,  '1988-06-21', NOW()) as MinutesBetweenDates,
DATEDIFF(SECOND,  '1988-06-21', NOW()) as SecondsBetweenDates

DaysBetween |YearsBetweenDates |QuartersBetweenDates |MonthsBetweenDates |DaysBetweenDates |
------------|------------------|---------------------|-------------------|-----------------|
10764       |29                |117                  |353                |10764            |

|HoursBetweenDates |MinutesBetweenDates |SecondsBetweenDates |
------------------|--------------------|--------------------|
|258357            |15501421            |930085304

#--------------------------------LAST DAY--------------------------------------------------------------------------------------

SELECT
DATE(NOW())                   as Today,
LAST_DAY(ADDDATE(NOW(), -31)) as LastDayPreviousMonth,
LAST_DAY(NOW())               as LastDayThisMonth,
LAST_DAY(ADDDATE(Now(), +31)) as LastDayNextMonth


Today      |LastDayPreviousMonth |LastDayThisMonth |LastDayNextMonth |
-----------|---------------------|-----------------|-----------------|
2017-11-18 |2017-10-31           |2017-11-30       |2017-12-31       |
