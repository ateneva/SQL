
# https://gist.github.com/ateneva/82a347577c909dcb167a8c5482ef64e4#file-sql_upper_lower-sql
# https://datageeking.wordpress.com/2018/08/20/how-do-i-change-the-case-of-a-string-with-sql/
---------------------SQL Server----------------------------------------------------------------

select

title,
lower(title) as lowercase_string,
upper(title) as uppercase_string

from datageeking.dbo.films

/*
title                       |lowercase_string            |uppercase_string            |
----------------------------|----------------------------|----------------------------|
ACADEMY DINOSAUR            |academy dinosaur            |ACADEMY DINOSAUR            |
ACE GOLDFINGER              |ace goldfinger              |ACE GOLDFINGER              |
ADAPTATION HOLES            |adaptation holes            |ADAPTATION HOLES            |
AFFAIR PREJUDICE            |affair prejudice            |AFFAIR PREJUDICE            |
AFRICAN EGG                 |african egg                 |AFRICAN EGG                 |
AGENT TRUMAN                |agent truman                |AGENT TRUMAN                |*/

---------------------MySQL-----------------------------------------------------------------------

select

title,
lower(title) as lowercase_string,
upper(title) as uppercase_string,

lcase(title) as lowercase_string,
ucase(title) as uppercase_string

from sakila.film

/*
title                       |lowercase_string            |uppercase_string            |
----------------------------|----------------------------|----------------------------|
ACADEMY DINOSAUR            |academy dinosaur            |ACADEMY DINOSAUR            |
ACE GOLDFINGER              |ace goldfinger              |ACE GOLDFINGER              |
ADAPTATION HOLES            |adaptation holes            |ADAPTATION HOLES            |
AFFAIR PREJUDICE            |affair prejudice            |AFFAIR PREJUDICE            |
AFRICAN EGG                 |african egg                 |AFRICAN EGG                 |
AGENT TRUMAN                |agent truman                |AGENT TRUMAN                |*/

----------------------PostgreSQL--------------------------------------------------------------------

select

title,
lower(title),
upper(title),

from public.film

/*
title                       |lowercase_string            |uppercase_string            |
----------------------------|----------------------------|----------------------------|
ACADEMY DINOSAUR            |academy dinosaur            |ACADEMY DINOSAUR            |
ACE GOLDFINGER              |ace goldfinger              |ACE GOLDFINGER              |
ADAPTATION HOLES            |adaptation holes            |ADAPTATION HOLES            |
AFFAIR PREJUDICE            |affair prejudice            |AFFAIR PREJUDICE            |
AFRICAN EGG                 |african egg                 |AFRICAN EGG                 |
AGENT TRUMAN                |agent truman                |AGENT TRUMAN                |*/
