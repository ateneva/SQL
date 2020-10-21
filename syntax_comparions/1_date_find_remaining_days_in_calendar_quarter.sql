
# https://snippets.cacher.io/snippet/ebde625f1bc8e7ab85c7
# https://gist.github.com/ateneva/3b1696e3172c21644d423f09ffbac36f#file-sql_calculate_remaining_days_in_calendar_quarter-sql
# https://datageeking.com/2017/11/07/how-do-i-calculate-the-remaining-days-until-the-end-of-a-calendar-quarter/

# Title: How do I calculate the remaining days until the end of a calendar quarter?

-------------------------------------------------Vertica----------------------------------------------------------------
---calculate remaining days in calendar quarter
select
Quarter(Now()) as CurrentCalendarQuarter,
	case 
		when Quarter(Now()) = 1 Then datediff('dd', Date(Now()), to_date(Concat(Year(Now()),'-03-31'), 'YYYY-MM-DD')) 
		when Quarter(Now()) = 2 Then datediff('dd', Date(Now()), to_date(Concat(Year(Now()),'-06-30'), 'YYYY-MM-DD')) 
		when Quarter(Now()) = 3 Then datediff('dd', Date(Now()), to_date(Concat(Year(Now()),'-09-30'), 'YYYY-MM-DD')) 
		when Quarter(Now()) = 4 Then datediff('dd', Date(Now()), to_date(Concat(Year(Now()),'-12-31'), 'YYYY-MM-DD')) 
		
	end as Remaining_In_Cal_Quarter
	
	
------------------------SQL Server---------------------------------------------------------------------------------------

select

datepart(quarter, getdate()) as CurrentCalendarQuarter

case 
	when datepart(quarter, getdate() ) = '1'
		then datediff(day, getdate(), convert(date, Concat(Year(getdate()),'-03-31')) ) 
		
	when datepart(quarter, getdate() ) = '2'
		then datediff(day, getdate(), convert(date, Concat(Year(getdate()),'-06-30')) ) 

	when datepart(quarter, getdate() ) = '3'	
		then datediff(day, getdate(), convert(date, Concat(Year(getdate()),'-09-30')) ) 

	when datepart(quarter, getdate() ) = '4'		
		then datediff(day, getdate(), convert(date, Concat(Year(getdate()),'-12-31')) )
		
end as Remaining_In_Cal_Quarter


#------------------------MySQL--------------------------------------------------------------------------------------------

select

extract(quarter from Now()) as CurrentCalendarQuarter,
	
case 
	when extract(quarter from Now()) = '1'
		then timestampdiff(day, Now(), str_to_date(Concat(Year(Now()),'-03-31'), '%Y-%m-%d'))
		
	when extract(quarter from Now()) = '2'
		then timestampdiff(day, Now(), str_to_date(Concat(Year(Now()),'-06-30'), '%Y-%m-%d'))
		
	when extract(quarter from Now()) = '3'
		then timestampdiff(day, Now(), str_to_date(Concat(Year(Now()),'-09-30'), '%Y-%m-%d'))
		
	when extract(quarter from Now()) = '4' 
		then timestampdiff(day, Now(), str_to_date(Concat(Year(Now()),'-12-31'), '%Y-%m-%d'))
		
end as Remaining_In_Cal_Quarter
 


------------------------PostgreSQL--------------------------------------------------------------------------------------

select

date_part('quarter', Now()) as CurrentCalendarQuarter

case 
	when date_part('quarter', Now()) = '1' 
		then date_part('day', to_date(date_part('year', current_date) || '-03-31', 'YYYY-MM-DD') - Now() ) + 1
	
	when date_part('quarter', Now()) = '2' 
		then date_part('day', to_date(date_part('year', current_date) || '-06-30', 'YYYY-MM-DD') - NoW() ) + 1 
		
	when date_part('quarter', Now()) = '3' 
		then date_part('day', to_date(date_part('year', current_date) || '-09-30', 'YYYY-MM-DD') - Now() ) + 1

	when date_part('quarter', Now()) = '4' 	
		then date_part('day', to_date(date_part('year', current_date) || '-12-31', 'YYYY-MM-DD') - Now() ) + 1
		
end as Remaining_In_Cal_Quarter




