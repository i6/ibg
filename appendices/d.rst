===================================
 Appendix D -- "Captain Fate" story
===================================

.. only:: html

  .. image:: /images/picC.png
     :align: left

|C|\aptain Fate is our third and final game; it's a little longer and more
complex than its predecessors.  See :doc:`/chapters/10`,
:doc:`/chapters/11`, :doc:`/chapters/12` and :doc:`/chapters/13`.

Transcript of play
==================

.. literalinclude:: /examples/Fate.txt
   :language: transcript

Game source code
================

.. literalinclude:: /examples/Fate.inf
   :language: inform6

Compile-as-you-go
=================

"Captain Fate" suffers from the same difficulty as "William Tell": if 
you type the code sequentially as you read through the guide, the game 
won't compile until you reach the end of Chapter 13. To compile and test 
as you go, add these stubs to the end of the game file when you reach 
the end of Chapter 10:

.. code-block:: inform

	! ================================================================
	! TEMPORARY DEFINITIONS NEEDED TO COMPILE AT THE END OF CHAPTER 10
	Room    cafe;
	Object  clothes;

Replace those stubs with these at the end of Chapter 11:

.. code-block:: inform

	! ================================================================
	! TEMPORARY DEFINITIONS NEEDED TO COMPILE AT THE END OF CHAPTER 11

	Room    toilet;
	Object	clothes;
	Object	costume;

and with these at the end of Chapter 12:

.. code-block:: inform

	! ================================================================
	! TEMPORARY DEFINITIONS NEEDED TO COMPILE AT THE END OF CHAPTER 12

	Room	toilet;
	Object	clothes;
	Object	costume;
	Object	coin;
	Object	coffee;
	Object	food;
	Object	menu;

At the end of Chapter 13 the game is complete, so you can delete the 
temporary stubs.
