Billy Bob is hot on the campaign trail and 
needs your help organizing his speaking schedule for the next two weeks!

* Each Tuesday, he speaks at local Rotary clubs
* Every Thursday, he speaks at City Hall
* Every Friday, he is unavailable due to date night with his wife
* In week 2, he has a special speaking engagement in Boston on Wednesday

Billy Bob would like for you to build a scheduling system for 
his speaking engagements.

Sample output:

```no-highlight
When would you like Billy to speak?
#> Next Tuesday
Sorry, Billy is at the Rotary Club, then.

When would you like Billy to speak?
#> Monday
Billy is available then! 
Where will he be speaking?
#> Local 400
Ok, got it!

When would you like Billy to speak?
#> Monday
Sorry, Billy is at the Local 400, then.

When would you like Billy to speak?
#> exit
```

Billy only speaks on weeknights, and can only speak once per day.

Utilize a 2-dimensional array to maintain Billy's schedule. 
Each nested array should represent a week of Billy's speaking time.
