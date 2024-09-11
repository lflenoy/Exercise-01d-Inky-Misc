/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 - A story with at least 6 knots
 - Vary some text via a loop
 - Create a function that serves as a timer. (This is shown in the video)
*/


VAR health = 5
VAR friend_name = ""
VAR weapons = 0
VAR keys = 0
VAR bravery = 0
VAR time = 0 // 0 Morning, 1 Noon, 2 Night


-> memory

== memory == 
As you stand in front of the school, you wish your best friend was with you now. The abandoned school might be less scary then. What is your best friend's name?

*[Lilah] 
~ friend_name = "Lilah"
-> school_entrance
*[Dex]
~ friend_name = "Dex"
-> school_entrance
*[Moxxie]
~ friend_name = "Moxxie"
-> school_entrance

-> school_entrance

== function advance_time == 
    ~ time = time + 1
    
    { 
        - time > 2:
            ~time = 0
    }
     
    {
    - time == 0:
            ~ return "Morning"
        - time == 1:
            ~ return "Noon"
        - time == 2:
            ~ return "Night"
    }
    
    ~return time




== school_entrance ==
You are at the entrance to an abandoned school. {not key_pickup:There is a key on the floor.} You also have a phone with a flashlight. The school has hallways that extends to the north, south, east and west.You also have the choice to go back home before its too late... 

It is {advance_time()}
If only {friend_name} was here...

You have {keys} keys
{keys == 1: Since you have 1 key, you can now unlock the east hallway door!}
{keys == 2: Since you have 2 keys, you can now unlock the north hallway door!}
{keys == 3: Since you have 3 keys, you can now unlock the south hallway door!}
{keys == 4: Since you have 4 keys, you can now unlock the west hallway door!}
{keys == 5: Since you have 5 keys, you can now unlock the gym doors!}
+[Take the east hallway] -> east_hallway
+[Take the west hallway] -> west_hallway
+[Take the north hallway] -> north_hallway
+[Take the south hallway] -> south_hallway
*{keys == 0}[Go home] -> home
+{keys ==5} [Go to the gym] -> gym_entrance
*[Pick up the key] -> key_pickup

== east_hallway ==
You are in the east hallway. It is very dark, you can't see anything.
+[Light hallway] -> east_hallway_lit
+ [Go Back] -> school_entrance
-> END

== west_hallway ==
You are in the west hallway. It is very dark, you can't see anything.
+[Light hallway] -> west_hallway_lit
+ [Go Back] -> school_entrance
-> END

== north_hallway ==
You are in the north hallway. It is very dark, you can't see anything.
+[Light hallway] -> north_hallway_lit
+ [Go Back] -> school_entrance
-> END

== south_hallway ==
You are in the south hallway.It is very dark, you can't see anything.
+[Light hallway] -> south_hallway_lit
+ [Go Back] -> school_entrance
-> END

==home==
You go back home and decided to go back to sleep!!!
-> END

=== key_pickup ===
~ keys = keys + 1
You now have a key. May it open locked doors!
+[Go Back] ->school_entrance
+{keys ==6} [Go back to gym entrace] -> gym_entrance
-> END

==east_hallway_lit ==
The light reveals a door. The door is locked.
{not keys ==1:  You can't open this door. Maybe you need to find a key somewhere...}
+{keys == 1} [Open door] -> east_door_open
+[Go Back] ->school_entrance



== east_door_open == 
The room reveals a bunch of dead bodies. There is also a key on the floor.
{ friend_name == "Dex": Dex would have been so scared if they were here|}
+[Pick up the key] -> key_pickup
+[Go Back] ->school_entrance
-> END


==west_hallway_lit ==
The light reveals a door. The door is locked.
{not keys ==4:  You can't open this door. Maybe you need to find a key or key(s) somewhere...}
+{keys == 4} [Open door] -> west_door_open
+[Go Back] ->school_entrance



== west_door_open == 
The room reveals a bunch of spiders.{not key_pickup:There is a key on the floor.} Do you go in?
{ friend_name == "Lilah": Man Lilah would have had an heart attack if they were here|}
*[Run] -> run
+[Pick up the key] -> key_pickup
+[Go Back] ->school_entrance
-> END


==north_hallway_lit ==
The light reveals a door.{not knife_pickup: The door is locked.There is also a knife on the floor.}
{keys !=2:  You can't open this door. Maybe you need to find another key or keys somewhere...}
+{keys == 2} [Open door] ->north_door_open
*[Pick up the knife] -> knife_pickup
+ [Go Back] -> school_entrance

== knife_pickup ==
~ weapons = weapons + 1
You now have a knife. May it protect you from whatever lurks in the dark..
+[Go Back] -> north_hallway_lit

==north_door_open ==
The room reveals a bunch of monsters!! What will you do?
+{weapons == 1} [attack]-> attack
*[Talk to them] -> talk_to_monsters
*[Run] -> run


== attack ==
~ weapons = weapons -1
You have {weapons} weapons left
~ bravery = bravery + 10
You have {bravery} bravery!

The monsters died from the knife! You survived the attack. You also found another key! Maybe this can open a locked door in one of the hallways..
*[Pick up the key] -> key_pickup
+[Go Back] ->school_entrance
-> END

== attack_2 ==
~ weapons = weapons -1
You have {weapons} weapons left
~ bravery = bravery + 10
You have {bravery} bravery!

The monsters died from the knife! You survived the attack. You also found another key! Maybe this can open a locked door in one of the hallways..
*[Pick up the key] -> key_pickup
+[Go Back] ->school_entrance
-> END

==run==
~health = health - 1
The monsters attacked you and you lost some health. rip.
You have {health} health left
~ bravery = bravery - 10
You also lost 10 bravery.
You now have {bravery} bravery
+[Go Back to the school entrance] ->school_entrance

->END

== talk_to_monsters ==
You try talking to the monsters in hopes they would not hurt you. You were wrong and they still attacked you, but you did gain 10 bravery!
~health = health - 1
~ bravery = bravery + 10
You have {health} health left
You now have {bravery} bravery
+[Go back] -> school_entrance

== south_hallway_lit ==
The light reveals a door. { keys !=3: The door is locked. Maybe you need to find another key or keys somewhere...}
*{keys == 3} [Open door] -> south_door_open
+[Go Back to the school entrance] ->school_entrance


== south_door_open ==
The door reveals {friend_name} ! why are they here...
{not knife_pickup2:There is also a knife on the ground.}
{friend_name} says they know a way out.. do you trust them?
*[Pick up the knife] -> knife_pickup2


*[Yes] -> trust_friend
*[no] -> dont_trust_friend
->END

== knife_pickup2 ==
~ weapons = weapons + 1
You now have a knife. May it protect you from whatever lurks in the dark..
+[Go Back] -> south_door_open

== trust_friend ==
~health = health - 1
{friend_name} turned out to be a monster and attacked you
-> END

== dont_trust_friend == 
{friend_name} turned out to be a monster! What will you do?
+{weapons == 1} [attack]-> attack_2
*[Run] -> run
-> END

== gym_entrance ==
You are in the gym
+{time == 0} [go towards the sunlight] -> sunlight
+{time == 1} [go towards the sunlight] -> sunlight
+{time == 0} [go towards the moonlight] -> moonlight
+[Go back] -> school_entrance

== sunlight ==
You stand under spot that has sun light, you see a key
[Go back to chool entrance] -> school_entrance
[Go back to gym entrace] -> gym_entrance

== moonlight ==
You stand under spot that has moon light, you see a key
[Go back to chool entrance] -> school_entrance
[Go back to gym entrace] -> gym_entrance



