
# https://snippets.cacher.io/snippet/0cb2a2d52ee0e4e66d1b
# https://gist.github.com/ateneva/0ca87334ae81fd7a2cf3673f7f16e9b4#file-sql_get_current_date_and_time-sql
# https://datageeking.com/2017/10/07/how-can-i-get-the-current-time-with-sql/

------------------------------------------Vertica---------------------------------------------------------------------------------------
select 

current_timestamp          as CurrentTimestamp,     ---current laptop/pc date and time
current_date               as CurrentDate,          ---current laptop/pc date
current_time               as CurrentTime,          ---current laptop/pc time

getutcdate()               as UTCDateAndTime,       ---date and time of UTC standard
getdate()                                           ---date and time supplied by the operating system of the server to which you are connected

Now()                      as MyTimeRightNow,       ---current laptop/pc date and time
date(Now())                as Today,                ---current laptop/pc date
time(Now())                as MyTime                ---current laptop/pc time

/*------------------------------------MySQL-----------------------------------------------------------------------------------------*/
select
utc_timestamp              as UTCDateAndTime,      #---date and time of UTC standard
utc_date                   as UTCDate,             #---date of UTC standard
utc_time                   as UTCTime,             #---time of UTC standard
current_timestamp          as MyLocalDateAndTime,  #---current laptop/pc date and time
current_date               as Today,               #---current laptop/pc date
current_time               as MyTimeNow,           #---current laptop/pc time

Now()                      as MyTimeRightNow,      #---current laptop/pc date and time
date(Now())                as Today,               #---current laptop/pc date
time(Now())                as MyTime               #---current laptop/pc time


UTCDateAndTime      |UTCDate    |UTCTime  |MyLocalDateAndTime  |Today      |MyTimeNow |MyTimeRightNow      |Today      |MyTime   |
--------------------|-----------|---------|--------------------|-----------|----------|--------------------|-----------|---------|
2017-10-07 10:54:27 |2017-10-07 |10:54:27 |2017-10-07 12:54:27 |2017-10-07 |12:54:27  |2017-10-07 12:54:27 |2017-10-07 |12:54:27 |

------------------------------------MS SQL Server----------------------------------------------------------------------------------------
select
getutcdate()               as UTCDateAndTime,
getdate()                  as LocalServerDateAndTime,
current_timestamp          as TodayDateAndTime,
convert(date,getdate())    as Today, 
convert(time,getdate())    as Now 

UTCDateAndTime      |LocalServerDateAndTime |TodayDateAndTime    |Today      |Now      |
--------------------|-----------------------|--------------------|-----------|---------|
2017-10-07 10:55:00 |2017-10-07 12:55:00    |2017-10-07 12:55:00 |2017-10-07 |12:55:00 |

-------------------------------------PostgreSQL-------------------------------------------------------------------------------------------
select 

current_timestamp          as CurrentTimestamp,     ---current laptop/pc date and time
current_date               as CurrentDate,          ---current laptop/pc date
current_time               as CurrentTime,          ---current laptop/pc time

Now()                      as MyTimeRightNow        ---current laptop/pc date and time

currenttimestamp    |currentdate |currenttime |mytimerightnow      |
--------------------|------------|------------|--------------------|
2017-10-07 12:55:53 |2017-10-07  |11:55:53    |2017-10-07 12:55:53 |

