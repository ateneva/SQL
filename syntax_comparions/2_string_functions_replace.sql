
# https://gist.github.com/ateneva/7b5406443300935ebc2411c892fd61c3#file-sql_replace_trim-sql
# https://datageeking.wordpress.com/2017/12/30/how-do-i-replace-a-string-in-sql-and-make-sure-it-has-no-extra-spaces/

-----------------------------------------------Vertica-------------------------------------------------------------
select

replace('We love you', 'We', 'I'),  -- reolaces a string with another

'     I love you   ' as MyPhrase,
ltrim('     I love you   '),      --removes spaces on the left
rtrim('     I love you   '),      --removes spaces on the right
trim('  I love you ')             --removes spaces on both sides

------------------------------------------------MySQL---------------------------------------------------------------

select

replace('I love you', 'I', 'We') as replace_,

length('I love you ') as before_rtrim,
rtrim('I love you ') as rtrim_,
length(rtrim('I love you ')) as after_rtrim,

length(' I love you') as before_ltrim,
ltrim(' I love you') as ltrim_,
length(ltrim(' I love you')) as after_ltrim,

trim(' I love you  ') as trim_,
length(trim(' I love you  ')) as after_trim

replace_    |before_rtrim |rtrim_     |after_rtrim |before_ltrim |ltrim_     |after_ltrim |trim_      |after_trim |
------------|-------------|-----------|------------|-------------|-----------|------------|-----------|-----------|
We love you |11           |I love you |10          |11           |I love you |10          |I love you |10         |


------------------------------------------------PostgreSQL---------------------------------------------------------------

select

replace('I love you', 'I', 'We'),

length('I love you ') as before_rtrim,
rtrim('I love you ') as rtrim_,
length(rtrim('I love you ')) as after_rtrim,

length(' I love you') as before_ltrim,
ltrim(' I love you') as ltrim_,
length(ltrim(' I love you')) as after_ltrim,

trim(' I love you  ') as trim_,
length(trim(' I love you  ')) as after_trim

replace     |before_rtrim |rtrim_     |after_rtrim |before_ltrim |ltrim_     |after_ltrim |trim_      |after_trim |
------------|-------------|-----------|------------|-------------|-----------|------------|-----------|-----------|
We love you |11           |I love you |10          |11           |I love you |10          |I love you |10         |

---------------------------------------------SQL Server--------------------------------------------------------------------

select

replace('I love you', 'I', 'We') as replace_,

datalength('I love you ') as before_rtrim,
rtrim('I love you ') as rtrim_,
datalength(rtrim('I love you ')) as after_rtrim,

datalength(' I love you') as before_ltrim,
ltrim(' I love you') as ltrim_,
datalength(ltrim(' I love you')) as after_ltrim
