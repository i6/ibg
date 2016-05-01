======================================
 Appendix C -- "William Tell" story
======================================

.. highlight:: transcript

.. only:: html

  .. image:: /images/picW.png
     :align: left

|W|\illiam Tell, our second game, is also very straightforward. See
"William Tell: a tale is born" on page 69, "William Tell: the early years"
on page 79, "William Tell: in his prime" on page 91 and "William Tell: the
end is nigh" on page 103.

Transcript of play
==================

.. literalinclude:: /examples/Tell.txt
   :language: transcript

Game source code
================

.. literalinclude:: /examples/Tell.inf
   :language: inform6

.. _compile-as-you-go:

Compile-as-you-go
=================

Your understanding of how the "William Tell" game works will be 
considerably enhanced if you type in the code for yourself as you read 
through the guide. However, it takes us four chapters to describe the 
game, which isn't complete and playable until the end of Chapter 9. Even 
if you make no mistakes in your typing, the game won't compile without 
errors before that point, because of references in earlier chapters to 
objects which aren't presented until later chapters (for example, 
Chapter 6 mentions the ``bow`` and ``quiver`` objects, but we don't 
define them until Chapter 7). This is a bit of a nuisance, because as a 
general rule we advise you to compile frequently -- more or less after 
every change you make to a game -- in order to detect syntax and 
spelling mistakes as soon as possible.

Fortunately, there's a fairly easy way round the difficulty, though it 
involves a little bit of cheating. The trick is temporarily to add 
minimal definitions -- often called "stubs" -- of the objects whose full 
definitions have yet to be provided.

For example, if you try to compile the game in the state that it's 
reached by the end of Chapter 6, you’ll get this::

	Tell.inf(16): Warning: Class "Room" declared but not used
	Tell.inf(19): Warning: Class "Prop" declared but not used
	Tell.inf(27): Warning: Class "Furniture" declared but not used
	Tell.inf(44): Error: No such constant as "street"
	Tell.inf(46): Error: No such constant as "bow"
	Tell.inf(47): Error: No such constant as "quiver"
	Compiled with 3 errors and 3 warnings

However, by adding these lines to the end of your game file:

.. code-block:: inform

	! ===============================================================
	! TEMPORARY DEFINITIONS NEEDED TO COMPILE AT THE END OF CHAPTER 6

	Room    street;
	Object  bow;
	Object  quiver;

a compilation should now give only this::

	Tell.inf(19): Warning: Class "Prop" declared but not used
	Tell.inf(27): Warning: Class "Furniture" declared but not used
	Compiled with 2 warnings

That's a lot better. It's not worth worrying about those warnings, since 
it's easy to understand where they come from; anyway, they'll go away 
shortly. More important, there are no errors, which means that you've 
probably not made any major typing mistakes. It also means that the 
compiler has created a story file, so you can try "playing" the game. If 
you do, though, you'll get this::

	William Tell
	A simple Inform example
	by Roger Firth and Sonja Kesserich.
	Release 3 / Serial number 040804 / Inform v6.30 Library 6/11 SD

	(street)
	** Library error 11 (27,0) **
	** The room "(street)" has no "description" property **
	>

Whoops! We've fallen foul of Inform's rule saying that every room must 
have a ``description`` property, to be displayed by the interpreter when 
you enter that room. Our ``street`` stub hasn't got a ``description``, 
so although the game compiles successfully, it still causes an error to 
be reported at run-time.

The best way round this is to extend the definition of our ``Room`` 
class, thus:

.. code-block:: inform

	Class  Room
	  with description "UNDER CONSTRUCTION",
	  has  light;

By doing this, we ensure that *every* room has a description of some 
form; normally we'd override this default value with something 
meaningful -- "The narrow street runs north towards the town square..." 
and so on -- by including a ``description`` property in the object's 
definition. However, in a stub object used only for testing, a default 
description is sufficient (and less trouble)::

	William Tell
	A simple Inform example
	by Roger Firth and Sonja Kesserich.
	Release 3 / Serial number 040804 / Inform v6.30 Library 6/11 SD

	(street)
	UNDER CONSTRUCTION

	>INVENTORY
	You are carrying:
	  a (quiver) (being worn)
	  a (bow)

	>EXAMINE QUIVER
	You can't see any such thing.

	>

You'll notice a couple of interesting points. Because we didn't supply 
external names with our ``street`` , ``bow`` and ``quiver`` stubs, the 
compiler has provided some for us -- ``(street)`` , ``(bow)`` and 
``(quiver)`` -- simply by adding parentheses around the internal IDs 
which we used. And, because our ``bow`` and ``quiver`` stubs have no 
``name`` properties, we can't actually refer to those objects when 
playing the game. Neither of these points would be acceptable in a 
finished game, but for testing purposes at this early stage -- they'll 
do.

So far, we've seen how the addition of three temporary object 
definitions enables us to compile the incomplete game, in its state at 
the end of Chapter 6. But once we reach the end of Chapter 7, things 
have moved on, and we now need a different set of stub objects. For a 
test compilation at this point, remove the previous set of stubs, and 
instead add these -- ``south_square`` and ``apple`` objects, and a dummy 
action handler to satisfy the ``Talk`` action in Helga’s life property:

.. code-block:: inform

	! ===============================================================
	! TEMPORARY DEFINITIONS NEEDED TO COMPILE AT THE END OF CHAPTER 7

	Room    south_square;
	Object  apple;

	[ TalkSub; ];

Similarly, at the end of Chapter 8, replace the previous stubs by these 
if you wish to check that the game compiles:

.. code-block:: inform

	! ===============================================================
	! TEMPORARY DEFINITIONS NEEDED TO COMPILE AT THE END OF CHAPTER 8
	Room    marketplace;
	Object  apple;
	NPC     son;

	[ TalkSub; ];
	[ FireAtSub; ];
	[ SaluteSub; ];

Finally, by the end of Chapter 9 the game is complete, so you can delete 
the stubs altogether.

Used with care, this technique of creating a few minimal stub objects 
can be convenient -- it enables you to "sketch" a portion of your game 
in outline form, and to compile and test the game in that state, without 
needing to create complete object definitions. However, you've got very 
little interaction with your stubs, so don't create too many of them. 
And of course, never forget to flesh out the stubs into full definitions 
as soon as you can.
