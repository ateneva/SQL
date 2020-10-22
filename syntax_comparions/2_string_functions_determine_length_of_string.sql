
# https://gist.github.com/ateneva/905cffae481670a00e1a615db5eef72b#file-sql_length-sql
# https://datageeking.wordpress.com/2017/12/27/how-do-i-determine-the-length-of-a-string-with-sql/

---------------SQL Server---------------------------------------
select

'I love you' as phrase,
len('I love you') as phrase_length,
len(' I love you ') as phrase_length2,
datalength(' I love you ') as phrase_length3

phrase     |phrase_length |phrase_length2 |phrase_length3 |
-----------|--------------|---------------|---------------|
I love you |10            |11             |12             |

--------------MySQL----------------------------------------------
select

'I love you' as phrase,
length('I love you') as phrase_length

phrase     |phrase_length |
-----------|--------------|
I love you |10            |

--------------PostgreSQL-----------------------------------------
select

'I love you' as phrase,
length('I love you') as phrase_length


phrase     |phrase_length
-----------|--------------
I love you |10
