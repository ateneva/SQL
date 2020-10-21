
# https://snippets.cacher.io/snippet/0349373fcd9da69ca3bb
# https://gist.github.com/ateneva/d12ca6489eb27cca8f26e58100283406#file-sql_calculate_remaining_days_in_fiscal_quarter-sql
# https://datageeking.com/2017/11/09/how-do-i-calculate-the-remaining-days-until-the-end-of-a-fiscal-quarter/

# How do I calculate the remaining days until the end of a fiscal quarter?

----------------------------------------Vertica----------------------------------------------------------------------------------

---calculate remaining days in fiscal quarter
select
case 
	when Month(Now()) in (11,12,1) then 'FQ1'
	when Month(Now()) in (2,3,4) then 'FQ2'
	when Month(Now()) in (5,6,7) then 'FQ3'
	when Month(Now()) in (8,9,10) then 'FQ4'
end as CurrentFiscalQuarter,

case 
	when Month(Now()) in (11,12,1) Then datediff('dd', Date(Now()), to_date(Concat(Year(Now()),'-01-31'), 'YYYY-MM-DD')) 
	when Month(Now()) in (2,3,4) Then datediff('dd', Date(Now()), to_date(Concat(Year(Now()),'-04-30'), 'YYYY-MM-DD')) 
	when Month(Now()) in (5,6,7) Then datediff('dd', Date(Now()), to_date(Concat(Year(Now()),'-07-31'), 'YYYY-MM-DD')) 
	when Month(Now()) in (8,9,10) Then datediff('dd', Date(Now()), to_date(Concat(Year(Now()),'-10-31'), 'YYYY-MM-DD')) 
end as RemainingDaysInQuarter


--------------------------------SQL Server--------------------------------------------------------------------------------------

select

case 
	when Month(getdate()) in (11,12,1) then 'FQ1'
	when Month(getdate()) in (2,3,4) then 'FQ2'
	when Month(getdate()) in (5,6,7) then 'FQ3'
	when Month(getdate()) in (8,9,10) then 'FQ4'
end as CurrentFiscalQuarter,

case 
	when Month(getdate()) in (11,12,1)
		then datediff(day, getdate(), convert(date, Concat(Year(getdate())+1,'-01-31')) ) 
		
	when Month(getdate()) in (2,3,4)
		then datediff(day, getdate(), convert(date, Concat(Year(getdate()),'-04-30')) ) 

	when Month(getdate()) in (5,6,7)
		then datediff(day, getdate(), convert(date, Concat(Year(getdate()),'-07-31')) ) 

	when Month(getdate()) in (8,9,10)	
		then datediff(day, getdate(), convert(date, Concat(Year(getdate()),'-10-31')) )
		

--------------------------------MySQL--------------------------------------------------------------------------------------
		
select		

case 
	when Month(Now()) in (11,12,1) then 'FQ1'
	when Month(Now()) in (2,3,4) then 'FQ2'
	when Month(Now()) in (5,6,7) then 'FQ3'
	when Month(Now()) in (8,9,10) then 'FQ4'
end as CurrentFiscalQuarter,

case 
	when Month(Now()) in (11,12,1)
		then timestampdiff(day, Now(), str_to_date(Concat(Year(Now())+1,'-01-31'), '%Y-%m-%d') ) 
		
	when Month(Now()) in (2,3,4)
		then timestampdiff(day, Now(), str_to_date(Concat(Year(Now()),'-04-30'), '%Y-%m-%d') ) 

	when Month(Now()) in (5,6,7)
		then timestampdiff(day, Now(), str_to_date(Concat(Year(Now()),'-07-31'), '%Y-%m-%d') ) 

	when Month(Now()) in (8,9,10)	
		then timestampdiff(day, Now(), str_to_date(Concat(Year(Now()),'-10-31'), '%Y-%m-%d') )
		
end as Remaining_in_Fis_Quarter
 
 
 --------------------------------PostgreSQL--------------------------------------------------------------------------------------
 
 select

 case 
	when date_part('month', Now()) in (11,12,1) then 'FQ1'
	when date_part('month', Now()) in (2,3,4) then 'FQ2'
	when date_part('month', Now()) in (5,6,7) then 'FQ3'
	when date_part('month', Now()) in (8,9,10) then 'FQ4'
end as CurrentFiscalQuarter,

case 
	when date_part('month', Now()) in (11,12,1)
		then date_part('day', to_date(date_part('year', current_date)+1 || '-01-31', 'YYYY-MM-DD') - Now() ) + 1
	
	when date_part('month', Now()) in (2,3,4)
		then date_part('day', to_date(date_part('year', current_date) || '-04-30', 'YYYY-MM-DD') - NoW() ) + 1 
		
	when date_part('month', Now()) in (5,6,7) 
		then date_part('day', to_date(date_part('year', current_date) || '-07-31', 'YYYY-MM-DD') - Now() ) + 1

	when date_part('month', Now()) in (8,9,10)	
		then date_part('day', to_date(date_part('year', current_date) || '-10-31', 'YYYY-MM-DD') - Now() ) + 1
		
end as Remaining_In_Fis_Quarter