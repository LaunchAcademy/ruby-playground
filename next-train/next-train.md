### User Stories

```no-highlight
As a train commuter
I want to know the train I should take
So that I can return home
```

Acceptance Criteria:

* When I specify a time that I want to leave the office, the system should inform me of the next available train

```no-highlight
As a train commuter taking the midnight train
I want to see the lyrics from the Journey's masterpiece "Don't Stop Believin"
So that I can sing along
```

Acceptance Criteria:

* When the system identifies the midnight train as the next available train, the user should be presented with the lyrics from "Don't Stop Believin"

### Implementation Details

Given the following data, calculate the user's next train based on their input of when the earliest is that they can leave. For ease of development, use a 24 hour format where 1:15PM == 13.25.

```no-highlight
Train 1, 2
Train 2, 5
Train 3, 7.5
Train 4, 8.5
Train 5, 9
Train 6, 10
Train 7, 11.5
Train 8, 13.5
Train 9, 14.5
Train 10, 17
Train 11, 18
Train 12, 19
Train 13, 24
```

Sample Run:

```no-highlight
What time are you leaving?
> 12.5
You should catch Train 8 leaving at 13.5
```

As an extra challenge, simulate the following output if the user should catch Train 13.

Sample Run:

```no-highlight
What time are you leaving?
> 22
You should catch Train 13 leaving at 24

***DON'T STOP...BELIEVIN'!***

Just a small town girl
Living in a lonely world
She took the midnight train going anywhere
Just a city boy
Born and raised in South Detroit
He took the midnight train going anywhere

A singer in a smoky room
A smell of wine and cheap perfume
For a smile they can share the night
It goes on and on and on and on

Strangers waiting, up and down the boulevard
Their shadows searching in the night
Streetlights people, living just to find emotion
Hiding, somewhere in the night.
```
