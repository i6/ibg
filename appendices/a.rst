======================================
 Appendix A -- How to play an IF game
======================================

.. only:: html

  .. image:: /images/picP.png
     :align: left

|P|\laying IF requires just a bit of instruction.  All you have to do is
read the descriptions and situations that appear on the screen and then
tell the game what you'd like to happen next.  Imagine that you're saying
"I WANT TO ..."; you don't actually type those three words, but you *do*
type what follows, instructing the game to do something on your behalf.
Commands usually take the form of a simple imperative sentence, with a verb
and a direct object (for example, typing EXAMINE THE KETTLE will display a
description of the kettle, TAKE KETTLE will make it one of your belongings,
and so on).  If there's more than one kettle around, you can be specific
(TAKE RED KETTLE); otherwise, the game will ask you something like "Which
do you mean, the red kettle or the rusty kettle?"  Answering RED is enough
in a case like this.  Some commands refer to two objects, like: PUT KETTLE
ON TABLE.

To make them stand out on the page, we're showing the words that you type
in capital letters.  You can actually use upper-case or lower-case letters
-- it makes no difference -- and you can usually omit words like THE
(though TAKE A BATH and TAKE THE BATH may have different effects, as will
TAKE A COIN and TAKE THE COIN if there are several to choose from).

To move around, use the verb GO and one of the cardinal points: GO NORTH
will move you in the desired direction.  Movement happens quite a lot, so
you can shorten that to just NORTH, and you can even use the initial(s) of
the direction in which you want to travel (easier and faster to type): N,
S, E, W, NE, NW, SE and SW.  Also available are UP (U), DOWN (D) and,
occasionally, IN and OUT.  There is quite an impressive stock of standard
actions which can generally be relied upon to do something, even if only to
tell you that you're wasting your time:

.. include:: /tables/actions.rst

You don't have to play IF with a list like this open in front of you; the
idea is that a good game should understand whatever seems logical for you
to try next.  Sometimes that will be a standard action, sometimes a verb
like SALUTE or PHOTOGRAPH which, although less common, makes perfect sense
in context.

You'll discover that usually many of these actions are fairly irrelevant.
Try logical things first (if you have a torch, BURN may be promising, while
EAT probably not).  Of special interest are LOOK (or just L), to print a
description of the current location; EXAMINE (or X) *object*, which gives
you a detailed description of the object; INVENTORY (INV or I) lists the
objects you are carrying.  You may combine some of these verbs with
prepositions to expand the possibilities: LOOK THROUGH, LOOK AT, LOOK IN,
LOOK UNDER all perform different actions.  Remember that we're mentioning
only a selection of the possible verbs; if you feel that something else
ought to work, try it and see.

You can change the way the game offers descriptions of locations as you
arrive in them.  The default setting is usually BRIEF, which provides you
with long descriptions only the first time you enter a new location.  Some
people like to change this to VERBOSE, which *always* gives you long
location descriptions.  Here are some other special commands and
abbreviations you should know:

| AGAIN (G) repeats the action you've just performed.
| WAIT (Z) skips one turn of action while you loiter and see what happens.
| QUIT ends the game.
| SAVE saves your current position in the game.
| RESTORE reloads a previously saved position.
| RESTART starts again from the beginning.
| SCORE tells you the current state of progress.
| UNDO goes back one turn so that your most recent action never happened.

Often, there will be characters that you'll have to interact with.  Let's
suppose you find your cousin Maria: you may ASK (or TELL) MARIA ABOUT
something, GIVE (or SHOW) object TO MARIA or ASK MARIA FOR object.
Characters may be willing to help you, when you can indicate your wishes
with: MARIA, GO NORTH or MARIA, TAKE THE GUN.  If you are really fond of
Maria, you may want to KISS her and if she offends you beyond measure, you
might like to ATTACK her.

Once you've referred to an object or a character by name, you may use the
pronouns IT, HIM or HER to simplify the typing process.  These pronouns
will remain set until you refer to any other object or character.  If you
wish to check the current pronoun assignments, type PRONOUNS.  As a rule of
the thumb, try to keep your actions simple.  Most games will actually
understand long commands like TAKE ALL FROM THE BAG EXCEPT THE GREEN PEARL
THEN THROW CAMEMBERT CHEESE AT UGLY MATRON, but such things are hard to
type without mistakes.  Also, you'll find that other inputs don't work as
well: GO BACK TO THE KITCHEN or GET NEAR THE SINGING PIRATE or READ
NEWSPAPER OVER THE SHERIFF'S SHOULDER will all give you error messages of
some kind.  Understanding the conventions of command typing is fairly
intuitive and you'll quickly master it after a little experimentation.

.. note::

   We're talking here about the core capabilities that most Inform games
   provide (though much of this is equally applicable to other IF systems).
   Often the designer will have extended these capabilities by defining
   additional commands appropriate to the nature of the game; either you'll
   be told about these, or they'll come naturally to mind during play.
   Less frequently, some designers like to tamper with the default
   behaviour of the parser, the interface, or with the way that commands
   work -- maybe even disabling some of the standard ones completely.  When
   this happens, it's common and polite practice for the game to let you
   know.
