
# https://gist.github.com/ateneva/faedf5705737fd14b870e6757a782123#file-sql_left_mid_right-sql
# https://datageeking.wordpress.com/2017/12/18/how-do-i-get-a-part-of-a-string-with-sql-part-1/

---------------------------------MySQL-----------------------------------------------------
select

'I love you' as phrase,
left ('I love you', 1),
mid('I love you', 3, 4),
right('I love you', 3)

phrase     |left ('I love you', 1) |mid('I love you', 3, 4) |right('I love you', 3) |
-----------|-----------------------|------------------------|-----------------------|
I love you |I                      |love                    |you                    |


-------------------------------SQL Server----------------------------------------------------

select

'I love you' as phrase,
left ('I love you', 1),
right('I love you', 3),

--mid('I love you', 3, 4),
right(left('I love you', 6),4)


phrase     |left ('I love you', 1) |right('I love you', 3) |right(left('I love you', 6),4) |
-----------|-----------------------|-----------------------|-------------------------------|
I love you |I                      |you                    |love                           |


-------------------------------PostgreSQL----------------------------------------------------

select

'I love you' as phrase,
left ('I love you', 1),
right('I love you', 3),

--mid('I love you', 3, 4),
right(left('I love you', 6),4)

phrase     |left ('I love you', 1) |right('I love you', 3) |right(left('I love you', 6),4) |
-----------|-----------------------|-----------------------|-------------------------------|
I love you |I                      |you                    |love                           |
