
# https://gist.github.com/ateneva/b824179ba25611a22e67b83143dd2029#file-sql_round_numbers-sql
# https://datageeking.wordpress.com/2017/12/15/how-do-i-round-numbers-with-sql/
-----------------------Vertica-----------------------------------------------------------------------------------------------

select

ceiling(285.32)     as ceiling,          -- rounds up to the closest higher integer
floor(285.82)       as floor,            -- rounds down to the closest lower integer

285.253             as number1,
round(285.253,0)    as roundless5to0,    -- rounds to 0 decimal points
round(285.253,1)    as roundless5to1,    -- rounds to 1 decimal point
round(285.253,2)    as roundless5to2,    -- rounds to 2 decimal points

285.753             as number2,
round(285.753,0)    as roundmore5to0,    -- rounds to 0 decimal points
round(285.753,1)    as roundmore5to1,    -- rounds to 1 decimal point
round(285.753,2)    as roundmore5to2     -- rounds to 2 decimal points

-----------------------SQL Server----------------------------------------------------------------------------------------------

select

ceiling(285.32)     as ceiling,          -- rounds up to the closest highest integer
floor(285.82)       as floor,            -- rounds down to the closest lowest integer

285.253             as number1,
round(285.253,0)    as roundless5to0,    -- rounds to 0 decimal points
round(285.253,1)    as roundless5to1,    -- rounds to 1 decimal point
round(285.253,2)    as roundless5to2,    -- rounds to 2 decimal points

285.753             as number2,
round(285.753,0)    as roundmore5to0,    -- rounds to 0 decimal points
round(285.753,1)    as roundmore5to1,    -- rounds to 1 decimal point
round(285.753,2)    as roundmore5to2     -- rounds to 2 decimal points


ceiling |floor |number1 |roundless5to0 |roundless5to1 |roundless5to2 |number2 |roundmore5to0 |roundmore5to1 |roundmore5to2 |
--------|------|--------|--------------|--------------|--------------|--------|--------------|--------------|--------------|
286     |285   |285.253 |285.000       |285.300       |285.250       |285.753 |286.000       |285.800       |285.750       |


-----------------------MySQL----------------------------------------------------------------------------------------------------

select

ceiling(285.32)     as ceiling,          -- rounds up to the closest highest integer
floor(285.82)       as floor,            -- rounds down to the closest lowest integer

285.253             as number1,
round(285.253,0)    as roundless5to0,    -- rounds to 0 decimal points
round(285.253,1)    as roundless5to1,    -- rounds to 1 decimal point
round(285.253,2)    as roundless5to2,    -- rounds to 2 decimal points

285.753             as number2,
round(285.753,0)    as roundmore5to0,    -- rounds to 0 decimal points
round(285.753,1)    as roundmore5to1,    -- rounds to 1 decimal point
round(285.753,2)    as roundmore5to2     -- rounds to 2 decimal points

ceiling |floor |number1 |roundless5to0 |roundless5to1 |roundless5to2 |number2 |roundmore5to0 |roundmore5to1 |roundmore5to2 |
--------|------|--------|--------------|--------------|--------------|--------|--------------|--------------|--------------|
286     |285   |285.253 |285           |285.3         |285.25        |285.753 |286           |285.8         |285.75        |


-----------------------PostgreSQL-------------------------------------------------------------------------------------------------

select

ceiling(285.32)     as ceiling,          -- rounds up to the closest highest integer
floor(285.82)       as floor,            -- rounds down to the closest lowest integer

285.253             as number1,
round(285.253,0)    as roundless5to0,    -- rounds to 0 decimal points
round(285.253,1)    as roundless5to1,    -- rounds to 1 decimal point
round(285.253,2)    as roundless5to2,    -- rounds to 2 decimal points

285.753             as number2,
round(285.753,0)    as roundmore5to0,    -- rounds to 0 decimal points
round(285.753,1)    as roundmore5to1,    -- rounds to 1 decimal point
round(285.753,2)    as roundmore5to2     -- rounds to 2 decimal points

ceiling |floor |number1 |roundless5to0 |roundless5to1 |roundless5to2 |number2 |roundmore5to0 |roundmore5to1 |roundmore5to2 |
--------|------|--------|--------------|--------------|--------------|--------|--------------|--------------|--------------|
286     |285   |285.253 |285           |285.3         |285.25        |285.753 |286           |285.8         |285.75        |
