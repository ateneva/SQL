
# https://gist.github.com/ateneva/a396e711de4565a855f3ff48fcfe84e6#file-sql_instr_functions-sql
# https://datageeking.wordpress.com/2017/12/24/how-do-i-find-the-first-position-of-a-string-within-a-string-with-sql/

-------------------------------------MySQL------------------------------------------------------------------------

select

'The first agreement is to be impeccable with your word.
When you are impeccable, you take responsibility for your actions, but you do not judge or blame yourself!
Being impeccable with your word is not using the word against yourself.
Being impeccable with your word is the correct use of your energy' as phrase,

instr('The first agreement is to be impeccable with your word.
When you are impeccable, you take responsibility for your actions, but you do not judge or blame yourself!
Being impeccable with your word is not using the word against yourself.
Being impeccable with your word is the correct use of your energy', 'impeccable') as first_pos

phrase                                                                               |first_pos
-------------------------------------------------------------------------------------|----------
The first agreement is to be impeccable with your word. ¶When you are impeccable, you|30


-----------------------------------PostgreSQL---------------------------------------------------------------------

select

'The first agreement is to be impeccable with your word.
When you are impeccable, you take responsibility for your actions, but you do not judge or blame yourself!
Being impeccable with your word is not using the word against yourself.
Being impeccable with your word is the correct use of your energy' as phrase,

position('impeccable' in 'The first agreement is to be impeccable with your word.
When you are impeccable, you take responsibility for your actions, but you do not judge or blame yourself!
Being impeccable with your word is not using the word against yourself.
Being impeccable with your word is the correct use of your energy') as first_pos

phrase                                                                               |first_pos
-------------------------------------------------------------------------------------|----------
The first agreement is to be impeccable with your word. ¶When you are impeccable, you|30



-------------------------------------SQL server----------------------------------------------------------------
select

'The first agreement is to be impeccable with your word.
When you are impeccable, you take responsibility for your actions, but you do not judge or blame yourself!
Being impeccable with your word is not using the word against yourself.
Being impeccable with your word is the correct use of your energy' as phrase,

charindex('impeccable', 'The first agreement is to be impeccable with your word.
When you are impeccable, you take responsibility for your actions, but you do not judge or blame yourself!
Being impeccable with your word is not using the word against yourself.
Being impeccable with your word is the correct use of your energy') as first_pos,

charindex('impeccable', 'The first agreement is to be impeccable with your word.
When you are impeccable, you take responsibility for your actions, but you do not judge or blame yourself!
Being impeccable with your word is not using the word against yourself.
Being impeccable with your word is the correct use of your energy',32) as second_pos


phrase                                                                               |first_pos |second_pos |
-------------------------------------------------------------------------------------|----------|-----------|
The first agreement is to be impeccable with your word. ¶When you are impeccable, you|30        |71         |
