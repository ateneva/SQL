
# https://snippets.cacher.io/snippet/069f03ef108a2fe69c70
# https://gist.github.com/ateneva/ae2117f1cbfe4aff54fa5a05abea2e86#file-sql_convert_string_to_a_date-sql
# https://datageeking.com/2017/10/01/how-do-i-convert-string-to-a-date-with-sql/

# Title: How do I convert string to a date with SQL?

-----------------------Vertica--------------------------------

select

'2017-03-31'                          as TextField,
to_date('2017-03-31', 'YYYY-MM-DD')   as Datefield

-----------------------PostgreSQL----------------------------

select

'2017-03-31'                          as TextField,
to_date('2017-03-31', 'YYYY-MM-DD')   as Datefield

------------------------MySQL---------------------------------

select

'2017-03-31'                          as TextField,
str_to_date('2017-03-31', '%Y-%m-%d') as DateField

-----------------------SQL Server-----------------------------

select

'2017-03-31'                          as TextField,
convert(date, '2017-03-31')           as DateField1,
cast('2017-03-31' as date)            as DateField2

----------------------BigQuery-------------------------------
SELECT
CURRENT_DATE() AS NOW,
PARSE_DATE("%Y/%m/%d", "2012/12/21") AS THE_DATE,
FORMAT_DATE("%Y-%b-%d",
    PARSE_DATE("%Y/%m/%d", "2012/12/21")) AS THE_DATE_FORMATTED

[
  {
    "NOW": "2020-11-08",
    "THE_DATE": "2012-12-21",
    "THE_DATE_FORMATTED": "2012-Dec-21"
  }
]
