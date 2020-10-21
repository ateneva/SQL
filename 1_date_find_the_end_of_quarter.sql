
# https://snippets.cacher.io/snippet/bc1f227bedaf5dd661b1
# https://gist.github.com/ateneva/c750caf97374f312e4f4a83022643e95#file-sql_find_the_end_of_a_quarter-sql
# https://datageeking.com/2017/10/29/how-do-i-get-the-end-of-quarter-in-sql/

------------------------------------Vertica ------------------------------------------------------------------------
select

to_date(Concat(Year(Now()),'-03-31'), 'YYYY-MM-DD') as EndOfCalQ1,
to_date(Concat(Year(Now()),'-06-30'), 'YYYY-MM-DD') as EndOfCalQ2,
to_date(Concat(Year(Now()),'-09-30'), 'YYYY-MM-DD') as EndOfCalQ3,
to_date(Concat(Year(Now()),'-12-31'), 'YYYY-MM-DD') as EndOfCalQ4,

to_date(Concat(Year(Now()),'-01-31'), 'YYYY-MM-DD') as EndOfFQ1,
to_date(Concat(Year(Now()),'-04-30'), 'YYYY-MM-DD') as EndOfFQ2,
to_date(Concat(Year(Now()),'-07-31'), 'YYYY-MM-DD') as EndOfFQ3,
to_date(Concat(Year(Now()),'-10-31'), 'YYYY-MM-DD') as EndOfFQ4

------------------------------------PostgreSQL----------------------------------------------------------------------

select

to_date(date_part('year', current_date) || '-03-31', 'YYYY-MM-DD') as EndOfCalQ1,
to_date(date_part('year', current_date) || '-06-30', 'YYYY-MM-DD') as EndOfCalQ2,
to_date(date_part('year', current_date) || '-09-30', 'YYYY-MM-DD') as EndOfCalQ3,
to_date(date_part('year', current_date) || '-12-31', 'YYYY-MM-DD') as EndOfCalQ4,

to_date(date_part('year', current_date) || '-01-31', 'YYYY-MM-DD') as EndOfFQ1,
to_date(date_part('year', current_date) || '-04-30', 'YYYY-MM-DD') as EndOfFQ2,
to_date(date_part('year', current_date) || '-07-31', 'YYYY-MM-DD') as EndOfFQ3,
to_date(date_part('year', current_date) || '-10-31', 'YYYY-MM-DD') as EndOfFQ4


endofcalq1 |endofcalq2 |endofcalq3 |endofcalq4 |endoffq1   |endoffq2   |endoffq3   |endoffq4   |
-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
2017-03-31 |2017-06-30 |2017-09-30 |2017-12-31 |2017-01-31 |2017-04-30 |2017-07-31 |2017-10-31 |


/*------------------------------------MySQL----------------------------------------------------------------*/
select

str_to_date(Concat(Year(Now()),'-03-31'), '%Y-%m-%d') as EndOfCalQ1,      #--find the end of calendar Q1
str_to_date(Concat(Year(Now()),'-06-30'), '%Y-%m-%d') as EndofCalQ2,      #---find the end of calendar Q2'  
str_to_date(Concat(Year(Now()),'-09-30'), '%Y-%m-%d') as EndOfCalQ3,      #---find the end of calendar Q3'
str_to_date(Concat(Year(Now()),'-12-31'), '%Y-%m-%d') as EndOfCalQ4,      #---find the end of calendar Q4' 

str_to_date(Concat(Year(Now()),'-01-31'), '%Y-%m-%d') as EndOfFQ1,        #---find the end of fiscal Q1'
str_to_date(Concat(Year(Now()),'-04-30'), '%Y-%m-%d') as EndofFQ2,        #---find the end of fiscal Q2' 
str_to_date(Concat(Year(Now()),'-07-31'), '%Y-%m-%d') as EndOfFQ3,        #---find the end of fiscal Q3'
str_to_date(Concat(Year(Now()),'-10-31'), '%Y-%m-%d') as EndOfFQ4         #---find the end of fiscal Q4'


EndOfCalQ1 |EndofCalQ2 |EndOfCalQ3 |EndOfCalQ4 |EndOfFQ1   |EndofFQ2   |EndOfFQ3   |EndOfFQ4   |
-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
2017-03-31 |2017-06-30 |2017-09-30 |2017-12-31 |2017-01-31 |2017-04-30 |2017-07-31 |2017-10-31 |


--------------------- ------------SQL Server: Convert--------------------------------------------------------

select

convert(date, Concat(Year(getdate()),'-03-31')) as EndOfCalQ1,
convert(date, Concat(Year(getdate()),'-06-30')) as EndOfCalQ2,
convert(date, Concat(Year(getdate()),'-09-30')) as EndOfCalQ3,
convert(date, Concat(Year(getdate()),'-12-31')) as EndOfCalQ4,

convert(date, Concat(Year(getdate()),'-01-31')) as EndOfFQ1,
convert(date, Concat(Year(getdate()),'-04-30')) as EndOfFQ2,
convert(date, Concat(Year(getdate()),'-07-31')) as EndOfFQ3,
convert(date, Concat(Year(getdate()),'-10-31')) as EndOfFQ4

EndOfCalQ1 |EndOfCalQ2 |EndOfCalQ3 |EndOfCalQ4 |EndOfFQ1   |EndOfFQ2   |EndOfFQ3   |EndOfFQ4   |
-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
2017-03-31 |2017-06-30 |2017-09-30 |2017-12-31 |2017-01-31 |2017-04-30 |2017-07-31 |2017-10-31 |

---------------------------------SQL Server: Cast-------------------------------------------------------------

select
cast(Concat(Year(getdate()),'-03-31') as date) as EndOfCalQ1,
cast(Concat(Year(getdate()),'-06-30') as date) as EndOfCalQ2,
cast(Concat(Year(getdate()),'-09-30') as date) as EndOfCalQ3,
cast(Concat(Year(getdate()),'-12-31') as date) as EndOfCalQ4,

cast(Concat(Year(getdate()),'-01-31') as date) as EndOfFQ1,
cast(Concat(Year(getdate()),'-04-30') as date) as EndOfFQ2,
cast(Concat(Year(getdate()),'-07-31') as date) as EndOfFQ3,
cast(Concat(Year(getdate()),'-10-31') as date) as EndOfFQ4

EndOfCalQ1 |EndOfCalQ2 |EndOfCalQ3 |EndOfCalQ4 |EndOfFQ1   |EndOfFQ2   |EndOfFQ3   |EndOfFQ4   |
-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
2017-03-31 |2017-06-30 |2017-09-30 |2017-12-31 |2017-01-31 |2017-04-30 |2017-07-31 |2017-10-31 |


