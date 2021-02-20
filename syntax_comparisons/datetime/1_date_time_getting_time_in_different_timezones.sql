
# https://gist.github.com/ateneva/77b6d5dfd21906d34b4a071cc1ddd1fe#file-sql_convert_a_timestamp_to_different_timezones-sql
# https://datageeking.wordpress.com/2017/10/23/how-do-i-convert-a-timestamp-to-another-timezone-in-sql/

# Title - How do I convert a timestamp to another timezone with SQL?
--------------------------------Vertica------------------------------------------------------------------

select
getdate() as ServerTime,
timestampadd('hour', -1, getdate())  as Chicago,
timestampadd('hour', -3, getdate())  as LA,
timestampadd('hour', 5,  getdate())  as GMT,
timestampadd('hour', 6,  getdate())  as CET,
timestampadd('hour', 7,  getdate())  as EET

Chicago             |LA                  |GMT                 |CET                 |EET                 |
--------------------|--------------------|--------------------|--------------------|--------------------|
2017-10-23 12:39:04 |2017-10-23 10:39:04 |2017-10-23 18:39:04 |2017-10-23 19:39:04 |2017-10-23 20:39:04 |

--------------------------------SQL Server---------------------------------------------------------------

select

dateadd(hour, -1, getdate())         as Chicago,
dateadd(hour, -3, getdate())         as LA,
dateadd(hour, 5, getdate())          as GMT,
dateadd(hour, 6, getdate())          as CET,
dateadd(hour, 7, getdate())          as EET

Chicago             |LA                  |GMT                 |CET                 |EET                 |
--------------------|--------------------|--------------------|--------------------|--------------------|
2017-10-23 12:39:04 |2017-10-23 10:39:04 |2017-10-23 18:39:04 |2017-10-23 19:39:04 |2017-10-23 20:39:04 |


---------------------------------MySQL---------------------------------------------------------------------

select

date_add(Now(), interval -1 hour)    as Chicago,
date_add(Now(), interval -3 hour)    as LA,
date_add(Now(), interval 5 hour)     as GMT,
date_add(Now(), interval 6 hour)     as CET,
date_add(Now(), interval 7 hour)     as EET

Chicago             |LA                  |GMT                 |CET                 |EET                 |
--------------------|--------------------|--------------------|--------------------|--------------------|
2017-10-23 12:39:04 |2017-10-23 10:39:04 |2017-10-23 18:39:04 |2017-10-23 19:39:04 |2017-10-23 20:39:04 |


--------------------------------PostgreSQL------------------------------------------------------------------

select

Now() - INTERVAL '1 hour'            as Chicago,
Now() - INTERVAL '3 hour'            as LA,
Now() + INTERVAL '5 hour'            as GMT,
Now() + INTERVAL '6 hour'            as CET,
Now() + INTERVAL '7 hour'            as EET

Chicago             |LA                  |GMT                 |CET                 |EET                 |
--------------------|--------------------|--------------------|--------------------|--------------------|
2017-10-23 12:39:04 |2017-10-23 10:39:04 |2017-10-23 18:39:04 |2017-10-23 19:39:04 |2017-10-23 20:39:04 |
