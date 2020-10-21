
# https://snippets.cacher.io/snippet/149c780ffbbed4b86e14
# https://gist.github.com/ateneva/027fa0534246f578ac0cee01b6dfa128#file-sql_find_first_day_previous_next_week-sql
# https://datageeking.com/2017/11/15/how-do-i-find-the-first-day-of-previous-next-week-with-sql/

# https://datageeking.com/2017/11/15/how-do-i-find-the-first-day-of-previous-next-week-with-sql/

----------------------------SQL Server-----------------------------------------------------------------------------------

select 
----------------------------Mon-Sun week-------------------------------------------------
convert(date, getdate()) as Today,
datepart(dw, getdate()) as Weekday,

case ---------------previous week--------------------------------------------------------
	when datepart(dw, getdate()) = 1 then convert(date, dateadd(day, -13, getdate()))
	when datepart(dw, getdate()) = 2 then convert(date, dateadd(day, -7, getdate()))
	when datepart(dw, getdate()) = 3 then convert(date, dateadd(day, -8, getdate()))
	when datepart(dw, getdate()) = 4 then convert(date, dateadd(day, -9, getdate()))
	when datepart(dw, getdate()) = 5 then convert(date, dateadd(day, -10, getdate()))
	when datepart(dw, getdate()) = 6 then convert(date, dateadd(day, -11, getdate()))
	when datepart(dw, getdate()) = 7 then convert(date, dateadd(day, -12, getdate()))
                                                          end as FirstDayofPreviousWeek,                                                         
                                                         
 case ---------------next week--------------------------------------------------------
	when datepart(dw, getdate()) = 1 then convert(date, dateadd(day, +1, getdate()))
	when datepart(dw, getdate()) = 2 then convert(date, dateadd(day, +7, getdate()))
	when datepart(dw, getdate()) = 3 then convert(date, dateadd(day, +6, getdate()))
	when datepart(dw, getdate()) = 4 then convert(date, dateadd(day, +5, getdate()))
	when datepart(dw, getdate()) = 5 then convert(date, dateadd(day, +4, getdate()))
	when datepart(dw, getdate()) = 6 then convert(date, dateadd(day, +3, getdate()))
	when datepart(dw, getdate()) = 7 then convert(date, dateadd(day, +2, getdate()))
                                                          end as FirstDayofNextWeek,         

convert(date, convert(varchar(7), dateadd(month, -1, getdate()) , 120) + '-01') as FirstDayofPreviousMonth,														  
convert(date, convert(varchar(7), dateadd(month, +1, getdate()) , 120) + '-01') as FirstDayofNextMonth

Today      |Weekday |FirstDayofPreviousWeek |FirstDayofNextWeek |FirstDayofPreviousMonth |FirstDayofNextMonth |
-----------|--------|-----------------------|-------------------|------------------------|--------------------|
2017-11-15 |4       |2017-11-06             |2017-11-20         |2017-10-01              |2017-12-01          |


# --------------------------MySQL------------------------------------------------------------------------------------

select 
Date(Now())  as Today,

case #----------------------previous week---------------------------------
	when weekday(Now()) = 0 then date(date_add(Now(), interval -7 day))
	when weekday(Now()) = 1 then date(date_add(Now(), interval -8 day))
	when weekday(Now()) = 2 then date(date_add(Now(), interval -9 day))
	when weekday(Now()) = 3 then date(date_add(Now(), interval -10 day))
	when weekday(Now()) = 4 then date(date_add(Now(), interval -11 day))
	when weekday(Now()) = 5 then date(date_add(Now(), interval -12 day))
	when weekday(Now()) = 6 then date(date_add(Now(), interval -13 day))
                                                          end as FirstDayofPreviousWeek,
                          
 
 case #----------------------next week---------------------------------
	when weekday(Now()) = 0 then date(date_add(Now(), interval +7 day))
	when weekday(Now()) = 1 then date(date_add(Now(), interval +6 day))
	when weekday(Now()) = 2 then date(date_add(Now(), interval +5 day))
	when weekday(Now()) = 3 then date(date_add(Now(), interval +4 day))
	when weekday(Now()) = 4 then date(date_add(Now(), interval +3 day))
	when weekday(Now()) = 5 then date(date_add(Now(), interval +2 day))
	when weekday(Now()) = 6 then date(date_add(Now(), interval +1 day))
                                                           end as FirstDayofNextWeek,
																  
 date_format(date_add(Now(), interval -1 month), '%Y-%m-01')   as FirstDayofPreviousMonth,                                           
 date_format(date_add(Now(), interval +1 month), '%Y-%m-01')   as FirstDayofNextMonth
 
 
 Today     |FirstDayofPreviousWeek |FirstDayofNextWeek |FirstDayofPreviousMonth |FirstDayofNextMonth |
-----------|-----------------------|-------------------|------------------------|--------------------|
2017-11-15 |2017-11-06             |2017-11-20         |2017-10-01              |2017-12-01          |

 ------------------------------PostgreSQL--------------------------------------------------------------------
 
select

Date(Now()) as Today,

Date(date_trunc('week',  Now()  - interval '7 day'))   as FirstDayOfPreviousWeek,
Date(date_trunc('month', Now()  - interval '1 month')) as FirstDayofPrevioustMonth,
Date(date_trunc('year',  Now()  - interval '1 year'))  as FirstDayOfPreviousYear,

Date(date_trunc('week',  Now()  + interval '7 day'))   as FirstDayOfNextWeek,
Date(date_trunc('month', Now()  + interval '1 month')) as FirstDayofNextMonth,
Date(date_trunc('year',  Now()  + interval '1 year'))  as FirstDayOfNextYear

today      |firstdayofpreviousweek |firstdayofprevioustmonth |firstdayofpreviousyear 
-----------|-----------------------|-------------------------|-----------------------
2017-11-15 |2017-11-06             |2017-10-01               |2016-01-01             


|firstdayofnextweek |firstdayofnextmonth |firstdayofnextyear |
|-------------------|--------------------|-------------------|
|2017-11-20         |2017-12-01          |2018-01-01         |

 ------------------------------Vertica-----------------------------------------------------------------------
 
select

Date(Now()) as Today,

Date(date_trunc('week',  timestampadd('week', -1, Now())))   as FirstDayOfPreviousWeek,
Date(date_trunc('month', timestampadd('month', -1, Now())))  as FirstDayofPrevioustMonth,
Date(date_trunc('year',  timestampadd('year', -1, Now())))   as FirstDayOfPreviousYear,

Date(date_trunc('week',  timestampadd('week', +1, Now())))   as FirstDayOfNextWeek,
Date(date_trunc('month', timestampadd('month', +1, Now())))  as FirstDayofNextMonth,
Date(date_trunc('year',  timestampadd('year', +1, Now())))   as FirstDayOfNextYear


 Today     |FirstDayofPreviousWeek |FirstDayofNextWeek |FirstDayofPreviousMonth |FirstDayofNextMonth |
-----------|-----------------------|-------------------|------------------------|--------------------|
2017-11-15 |2017-11-06             |2017-11-20         |2017-10-01              |2017-12-01          |
 
 