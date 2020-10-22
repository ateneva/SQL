
# https://gist.github.com/ateneva/f97eb062f6b82ce29a8ceec1261a08f6#file-sql_text_functions_length_left_right_instr-sql
# https://datageeking.wordpress.com/2018/01/03/how-do-i-analyse-a-string-length-and-punctuation-with-sql/

select
title as Adtitle,

--count the number of words in the title
length(title) - length(replace(title, ' ', '')) + 1 as AdTitleWordLength,

--analyse the punctuation of a title
case
	when left (title,1) in ('1', '2' ,'3' ,'4','5','6','7','8','9') then 'starts with a number'

	when instr(title, '-') !=0 then 'contains a dash'
	when instr(title, ':') !=0 then 'contains a colon'
	when instr(title, ',') !=0 then 'contains a comma'
	when instr(title, '"') !=0 then 'contains quoatation marks'

	when right(title,1) = '!' then 'ends with an exclamation mark'
	when right(title,1) = '?' then 'ends with a question mark'
	when right(title, 1) = '.' then 'ends with a dot'
	when right(title,1) not in ('?', '!', '.') then 'ends with no punctuation'
	when right(title,1) in ('1', '2' ,'3' ,'4','5','6','7','8','9') then 'ends with a number'
end as AdPunctuation,


--find tge number of characters and classify according to the following criteria
length(title) as TitleCharLength,
	case
	when length(title) < 40 then '0-40 characters'
	when length(title) >= 40 and length(title) < 70 then '40-70 charcaters'
	when length(title) >= 70 then 'more than 70 characters'
	end as AdTitleCharength,

---find the number of Upper case characters in the string
regexp_count(title, '[A-Z]') as NumberOfUpperCaseCharactersinTitle,

from
tbl_titles
