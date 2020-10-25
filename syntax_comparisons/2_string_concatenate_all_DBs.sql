
# https://gist.github.com/ateneva/5a2ef258c174fa9d7aecf52627dd5dab#file-sql_concatenate_strings-sql
# https://datageeking.wordpress.com/2017/10/04/how-do-i-concatenate-strings-with-sql/

/*--------------------MySQL--------------------------------------*/
select

Concat('2017','-Feb')               as TwoStrings,
Concat('2017','-','Feb')            as MultipleStrings

----------------------SQL Server-----------------------------------

select

Concat('2017','-Feb')                as TwoStrings,
Concat('2017','-','Feb')             as MultipleStrings

----------------------PostgreSQL-----------------------------------

select

'2017' || '-Feb'                     as TwoStrings,
'2017' || '-' || 'Feb'               as MultipleStrings

---------------------Vertica---------------------------------------
select

--concat in vertica is only applicable to two strings

Concat('2017','-Feb')                 as TwoStrings
Concat('2017',Concat('-', 'Feb'))     as MultipleStrings
'2017' || '-' || 'Feb'                as MultipleStrings
