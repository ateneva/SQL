
# https://datageeking.wordpress.com/2018/08/20/how-do-i-change-the-case-of-a-string-with-sql/

--***********************************************************************************************************************
------------------------SQL Server-------------------------------------------------------------------------------------

----1) Get the first letter of the string & capitalize it
upper(left(ltrim(title),1)) as first_letter_first_word,

----2) Get the remaining string
right(lower(ltrim(title)), len(lower(ltrim(title)))-1) as remaining_string,

----3) Find the position of the first blank space-----------------
charindex(' ', right(lower(ltrim(title)), len(lower(ltrim(title)))-1)) as blank_position,

----4) Get the remainig firs word /without its first letter/
left(right(lower(ltrim(title)), len(lower(ltrim(title)))-1),
				charindex(' ', right(lower(ltrim(title)), len(lower(ltrim(title)))-1)) ) as remaing_first_word,

----5) Separate the second word from the rest of the strin--------------
right(right(lower(ltrim(title)), len(lower(ltrim(title)))-1),
			len(right(lower(ltrim(title)), len(lower(ltrim(title)))-1)) -
				charindex(' ', right(lower(ltrim(title)), len(lower(ltrim(title)))-1))) as second_word,

----6) Get the first letter of the second word and capitalize it--------------
upper(left(right(right(lower(ltrim(title)), len(lower(ltrim(title)))-1),
			len(right(lower(ltrim(title)), len(lower(ltrim(title)))-1)) -
				charindex(' ', right(lower(ltrim(title)), len(lower(ltrim(title)))-1))), 1)) as first_letter_second_word,

-----7) get the remaining second word----------------------------------------
right(right(right(lower(ltrim(title)), len(lower(ltrim(title)))-1),
			len(right(lower(ltrim(title)), len(lower(ltrim(title)))-1)) -
				charindex(' ', right(lower(ltrim(title)), len(lower(ltrim(title)))-1))),

		len(right(right(lower(ltrim(title)), len(lower(ltrim(title)))-1),
					len(right(lower(ltrim(title)), len(lower(ltrim(title)))-1)) -
						charindex(' ', right(lower(ltrim(title)), len(lower(ltrim(title)))-1)))) - 1) as remining_second_word,


-----------------------------------------------------------------------------------------------------------------------------
---first letter first word------
upper(left(ltrim(title),1)) +

---remaining first word--------------
left(right(lower(ltrim(title)), len(lower(ltrim(title)))-1),
				charindex(' ', right(lower(ltrim(title)), len(lower(ltrim(title)))-1)) ) +

---second word (with capital letter----------
concat(
---first letter to be replaces
			upper(left(right(right(lower(ltrim(title)), len(lower(ltrim(title)))-1),
			len(right(lower(ltrim(title)), len(lower(ltrim(title)))-1)) -
				charindex(' ', right(lower(ltrim(title)), len(lower(ltrim(title)))-1))), 1) ),


			right(right(right(lower(ltrim(title)), len(lower(ltrim(title)))-1),
						len(right(lower(ltrim(title)), len(lower(ltrim(title)))-1)) -
							charindex(' ', right(lower(ltrim(title)), len(lower(ltrim(title)))-1))),

					len(right(right(lower(ltrim(title)), len(lower(ltrim(title)))-1),
								len(right(lower(ltrim(title)), len(lower(ltrim(title)))-1)) -
									charindex(' ', right(lower(ltrim(title)), len(lower(ltrim(title)))-1)))) - 1)
				                                                                               ) as final_proper

from datageeking.dbo.films

--*******************************************************************************************************************************
-------------------------MySQL--------------------------------------------------------------------------------------------------
#----1) Get the first letter of the string & capitalize it
upper(left(ltrim(title),1)) as first_letter_first_word,


#----2) Get the remaining string
right(lower(ltrim(title)), length(lower(ltrim(title)))-1) as remaining_string,


#----3) Find the position of the first blank space-----------------
instr(right(lower(ltrim(title)), length(lower(ltrim(title)))-1), ' ') as blank_position,


#----4) Get the remainig firs word /without its first letter/
left(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
				instr(right(lower(ltrim(title)), length(lower(ltrim(title)))-1), ' ') ) as remaing_first_word,


#----5) Separate the second word from the rest of the strin--------------
right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
			length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
				instr(right(lower(ltrim(title)), length(lower(ltrim(title)))-1), ' ') ) as second_word,


#----6) Get the first letter of the second word and capitalize it--------------
upper(left(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
			length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
				instr(right(lower(ltrim(title)), length(lower(ltrim(title)))-1), ' ')), 1)) as first_letter_second_word,

#-----7) Get the remaining second word-------------------------------------------
right(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
			length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
				instr(right(lower(ltrim(title)), length(lower(ltrim(title)))-1), ' ')),

		length(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
					length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
						instr(right(lower(ltrim(title)), length(lower(ltrim(title)))-1), ' '))) - 1) as remining_second_word,

#---------------------------------------------------------------------------------------------------------
#---first letter first word------
Concat (upper(left(ltrim(title),1)),

#---remaining first word--------------
left(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
				instr(right(lower(ltrim(title)), length(lower(ltrim(title)))-1), ' ')),

#---first letter second word---------------------------------------------------------
upper(left(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
			length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
				instr(right(lower(ltrim(title)), length(lower(ltrim(title)))-1), ' ')), 1)),

#---remaining second word----------------------------------------------------------------
right(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
			length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
				instr(right(lower(ltrim(title)), length(lower(ltrim(title)))-1), ' ')),

		length(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
					length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
						instr(right(lower(ltrim(title)), length(lower(ltrim(title)))-1), ' '))) - 1)
				                                                                              )  as final_proper

 from sakila.film


 --***************************************************************************************************************************************
 ------------------------------PostgreSQL-----------------------------------------------------------------------------------------------
 ----1) Get the first letter of the string & capitalize it
upper(left(ltrim(title),1)) as first_letter_first_word,


----2) Get the remaining string
right(lower(ltrim(title)), length(lower(ltrim(title)))-1) as remaining_string,


----3) Find the position of the first blank space-----------------
position(' ' in right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) as blank_position,


----4) Get the remainig firs word /without its first letter/
left(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
				position(' ' in right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) ) as remaing_first_word,


----5) Separate the second word from the rest of the strin--------------
right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
			length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
				position(' ' in right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) ) as second_word,


----6) Get the first letter of the second word and capitalize it--------------
upper(left(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
			length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
				position(' ' in right(lower(ltrim(title)), length(lower(ltrim(title)))-1))), 1)) as first_letter_second_word,


-----7) Get the remaining second word-------------------------------------------
right(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
			length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
				position(' ' in right(lower(ltrim(title)), length(lower(ltrim(title)))-1))),

		length(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
					length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
						position(' ' in right(lower(ltrim(title)), length(lower(ltrim(title)))-1)))) - 1) as remining_second_word,

---------------------------------------------------------------------------------------------------------
---first letter first word------
Concat (upper(left(ltrim(title),1)),

---remaining first word--------------
left(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
				position(' ' in right(lower(ltrim(title)), length(lower(ltrim(title)))-1))),

-----first letter second word---------------------------------------------------------
upper(left(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
			length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
				position(' ' in right(lower(ltrim(title)), length(lower(ltrim(title)))-1))), 1)),

------remaining second word----------------------------------------------------------------
right(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
			length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
				position(' ' in right(lower(ltrim(title)), length(lower(ltrim(title)))-1))),

		length(right(right(lower(ltrim(title)), length(lower(ltrim(title)))-1),
					length(right(lower(ltrim(title)), length(lower(ltrim(title)))-1)) -
						position(' ' in right(lower(ltrim(title)), length(lower(ltrim(title)))-1)))) - 1)
				                                                                              )  as final_proper

from public.film
