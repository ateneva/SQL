
--------------------------------------Vertica----------------------------------------------------------------------------------------------------

select

now() at time zone 'Pacific/Auckland NZ'          as NZT,   -- + 12.00 Welington, New Zealand
now() at time zone 'Australia/Brisbane'           as AEST,  -- Australa Eastern Standard Time = Brisbane, Sydney, Melbourne, Canberra
now() at time zone 'Australia/Adelaide'           as CAST,  -- Central Australia Standard Time = Adelaide
now() at time zone 'Asia/Tokyo Japan'             as JST,   -- Japan Standard Time = Tokyo, Seoul
now() at time zone 'Australia/Perth'              as AWST,  -- Australia Western Standard Time = Perth

now() at time zone 'Europe/Sofia'                 as EET,   -- Sofia, Athens, Vilnius, Bucharest
now() at time zone 'Europe/Amsterdam'             as CET,   -- Amsterdam, Paris, Berlin, Madrid, Rome
now() at time zone 'Europe/London'                as GMT,   -- London, Dublin

now() at time zone 'America/New_York'             as EST,   -- Toronto, New York, Boston, Rio De Janeiro
now() at time zone 'America/Chicago'              as CST,   -- Winnipeg, Chicago, Houston, Kansas, New Orleans
now() at time zone 'America/Denver'               as MST,   -- Edmonton, Calgary, Denver, Phoenix
now() at time zone 'America/Los_Angeles'          as PST    -- Vancouver, Los Angeles


--------------------------------------PostgreSQL--------------------------------------------------------------------------------------------------

select

now() at time zone 'NZT'                          as NZT,   -- + 12.00 Welington, New Zealand
now() at time zone 'AEST'                         as AEST,  -- Australa Eastern Standard Time = Brisbane, Sydney, Melbourne, Canberra
now() at time zone 'CAST'                         as cast,  -- Central Australia Standard Time = Adelaide
now() at time zone 'JST'                          as JST,   -- Japan Standard Time = Tokyo, Seoul
now() at time zone 'AWST'                         as AWST,  -- Australia Western Standard Time = Perth

now() at time zone 'EET'                          as EET,   -- Sofia, Athens, Vilnius, Bucharest
now() at time zone 'CET'                          as CET,   -- Amsterdam, Paris, Berlin, Madrid, Rome
now() at time zone 'GMT'                          as GMT,   -- London, Dublin

now() at time zone 'EST'                          as EST,   -- Toronto, New York, Boston, Rio De Janeiro
now() at time zone 'CST'                          as CST,   -- Winnipeg, Chicago, Houston, Kansas, New Orleans
now() at time zone 'MST'                          as MST,   -- Edmonton, Calgary, Denver, Phoenix
now() at time zone 'PST'                          as PST    -- Vancouver, Los Angeles



#--------------------------------------MySQL-----------------------------------------------------------------------------------------------------

select

convert_tz(now(), 'CET', 'Pacific/Auckland')      as NZT,   #-- + 12.00 Welington, New Zealand
convert_tz(now(), 'CET', 'Australia/Brisbane')    as AEST,  #-- Australa Eastern Standard Time = Brisbane, Sydney, Melbourne, Canberra
convert_tz(now(), 'CET', 'Australia/Adelaide')    as cast,  #-- Central Australia Standard Time = Adelaide
convert_tz(now(), 'CET', 'Asia/Tokyo')            as JST,   #-- Japan Standard Time = Tokyo, Seoul
convert_tz(now(), 'CET', 'Australia/Perth')       as AWST,  #-- Australia Western Standard Time = Perth

convert_tz(now(), 'CET', 'EET')                   as EET,   #-- Sofia, Athens, Vilnius, Bucharest
convert_tz(now(), 'CET', 'CET')                   as CET,   #-- Amsterdam, Paris, Berlin, Madrid, Rome
convert_tz(now(), 'CET', 'GMT')                   as GMT,   #-- London, Dublin

convert_tz(now(), 'CET', 'EST')                   as EST,   #-- Toronto, New York, Boston, Rio De Janeiro
convert_tz(now(), 'CET', 'America/Chicago')       as CST,   #-- Winnipeg, Chicago, Houston, Kansas, New Orleans
convert_tz(now(), 'CET', 'MST')                   as MST,   #-- Edmonton, Calgary, Denver, Phoenix
convert_tz(now(), 'CET', 'America/Los_Angeles')   as PST    #-- Vancouver, Los Angeles
