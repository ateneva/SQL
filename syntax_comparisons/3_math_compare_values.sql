
# https://gist.github.com/ateneva/1260ffa13621a59cbeb9a8ccb66b33d6#file-sql_compare_values-sql
# https://datageeking.wordpress.com/2017/12/12/how-can-i-compare-values-with-sql/

-----------------------------Vertica--------------------------------------------------------------------
select

greatest(5.5, 8.2, -8.2)  as HighestValue,     -- returns the higer number, taking the sign into account
least(5.5, 8.2, -8.2)     as LowestValue       -- returns the lower number, taking the sign into account

-----------------------------MySQL----------------------------------------------------------------------
select

greatest(5.5, 8.2, -8.2)  as HighestValue,     -- returns the higer number, taking the sign into account
least(5.5, 8.2, -8.2)     as LowestValue       -- returns the lower number, taking the sign into account

HighestValue |LowestValue |
-------------|------------|
8.2          |-8.2        |

-----------------------------PostgreSQL--------------------------------------------------------------------
select

greatest(5.5, 8.2, -8.2)  as HighestValue,     -- returns the higer number, taking the sign into account
least(5.5, 8.2, -8.2)     as LowestValue       -- returns the lower number, taking the sign into account

highestvalue |lowestvalue |
-------------|------------|
8.2          |-8.2        |

----------------------------SQL Server---------------------------------------------------------------------

select
max(MyValue)              as HighestValue,     -- returns the higer number, taking the sign into account
min(MyValue)              as LowestValue       -- returns the lower number, taking the sign into account
from (values (5.5), (8.2), (-8.2)) as a(MyValue)

HighestValue |LowestValue |
-------------|------------|
8.2          |-8.2        |
