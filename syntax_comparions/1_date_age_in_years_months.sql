
# https://snippets.cacher.io/snippet/b73c23a32f8195441cc3
# https://gist.github.com/ateneva/286d30a9a9abc440d88aab5bbd7a46aa
# no blog article

------------------------------------------Vertica----------------------------------------------------------------------------------------

select

age_in_months(Now(), '1988-06-21'),                                  --calculates completed period without current month
age_in_years(Now(), '1988-06-21'),                                   --calculates completed period without current month

datediff('month', '1988-06-21', Now()) as MonthsBetweenDates,        --includes current month in calculation
datediff('year', '1988-06-21', Now()) as YearsBetweenDates,          --includes current month in calculation  

months_between (Now(),'2017-01-01')                                  -- calculates months between two dates as a float

-----------------------------------------MySQL------------------------------------------------------------------------------------------------

select

period_diff(201712, 201707) as Past,      --months between now and a past date
period_diff(201806, 201712) as Future     --months between now and a future date

