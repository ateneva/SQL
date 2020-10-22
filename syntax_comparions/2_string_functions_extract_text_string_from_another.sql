
# https://gist.github.com/ateneva/afbfebdcbfdbcf31c4ca0b2ec6e9f420#file-sql_substring-sql
# https://datageeking.wordpress.com/2017/12/21/how-do-i-get-part-of-a-string-with-sql-part-2/

-----------------------SQL server-------------------------------
select

'I love you' as phrase,
substring('I love you', 3,4) as phrase2

phrase     |phrase2 |
-----------|--------|
I love you |love    |

-----------------------PostgreSQL--------------------------------

select

'I love you' as phrase,
substring('I love you', 3,4) as phrase2,
substr('I love you', 3,4) as phrase3

phrase     |phrase2 |phrase3 |
-----------|--------|--------|
I love you |love    |love    |


------------------------MySQL-------------------------------------
select

'I love you' as phrase,
substring('i love you', 3, 4) as phrase2,
substr('I love you.', 3, 4) as phrase3

phrase     |phrase2 |phrase3 |
-----------|--------|--------|
I love you |love    |love    |
