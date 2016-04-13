.. raw:: latex

   \newpage

========================
 Appendix G -- Glossary
========================

.. only:: html

   .. image:: /images/picD.png
      :align: left

.. raw:: latex

    \dropcap{d}

uring our travels, we've encountered certain terms which have particular
significance in the context of the Inform text adventure development
system; here are brief definitions of many of those specialised words and
phrases.

.. glossary::

   action
       The generated effect of the player's input, usually by the
       :term:`parser` but also occasionally by the designer's code.  It
       refers to a single task to be processed by Inform, such as DROP
       KETTLE, and it's stored in four numbers: one each for the action
       itself and the ``actor`` object who is to perform it (the player or
       an :term:`NPC`), one for the ``noun`` -- or direct object, if
       present -- and a fourth for the ``second`` noun -- if it exists, for
       example the "POT" in THROW KETTLE AT POT.  See also :term:`fake
       action`.

   alpha-testing
       The testing which is carried out by the game's :term:`designer`, in
       a futile attempt to ensure that it does everything that it should
       and nothing that it shouldn't.  See also :term:`beta-testing`.

   argument
       A parameter supplied in a call to a :term:`routine`, which is the
       actual value for one of the routine's defined local variables.  For
       example, the argument is 8 in the call ``MyRoutine(8)``.  The
       definition of the routine includes the variable that will hold the
       argument, in this case ``x``: ``[ MyRoutine x; ... ];``

   ASCII file
       See :term:`text file`.

   assignment
       A statement which sets or changes the value of a :term:`variable`.
       There are three in Inform: ``=`` (set equal to), ``++`` (add one to
       the current value), ``--`` (subtract one from the current value).

   attributes
       Named flags that can be defined for an object after the keyword
       ``has`` .  An attribute is either present (on) or not present
       (off).  The designer may test from any other part of the program
       *if* an object *has* a certain attribute, *give* an attribute to an
       object or take it away as need arises.  For instance, the attribute
       ``container`` states that the object is capable of having other
       objects placed inside it.

   avatar
       See :term:`player`.

   banner

       Information about a game which is displayed at the start of play.

   beta-testing
       The testing which is carried out by a small band of trusted
       volunteers, prior to general public release, during which the gross
       inadequacy of the designer's :term:`alpha-testing` effort becomes
       painfully apparent.

   binary file

       A computer file containing binary data -- 0s and 1s -- which is
       created by a program and which only a program can understand.

   bold type
       Used to highlight a term explained in this glossary.

   child
       See :term:`object tree`.

   class
       A special :term:`object` template from which other objects can
       inherit :term:`properties` and/or :term:`attributes`.  The template
       must begin with the word ``Class`` and must have an internal
       identifier.  Objects that wish to inherit from a class usually
       begin with the internal ID of the class in place of the word
       ``Object`` , but may instead define a segment ``class`` followed by
       the class's internal ID.  The designer may test whether an object
       belongs to -- is a member of -- a class.

   code block
       See :term:`statement block`.

   comment
       Text which starts with an exclamation mark ``!`` and which is
       ignored by the compiler when it reads the :term:`source file`;
       added to improve the file's layout or for explanatory notes.

   compile-time
       The time when the :term:`compiler` is at work making the
       :term:`story file`.  See also :term:`run-time`.

   compiler
       A program that reads the source code written by the designer and
       turns it into a :term:`story file`, which can then be played by a
       Z-machine :term:`interpreter`.

   constant
       A particular value which is defined at :term:`compile-time`, always
       stays the same and cannot be changed while the game is being
       played.  Common examples include numbers, strings and the internal
       IDs of objects, any of which can be either written out explicitly
       or set as the value of a named ``Constant``.

   Debug mode
       A option which causes to compiler to include extra code into the
       story file, thus making it easier for the designer to understand
       what's happening while a game is being tested prior to release.
       See also :term:`Strict mode`.

   designer
       A person who uses Inform to create a text adventure game: in other
       words, gentle reader, you.

   dictionary
       The collection of all input words "understood" by the game.

   dictionary word
       A word written in single quotes '...'  within the :term:`source
       file`, usually (but not exclusively) as one of the values assigned
       to an object's ``name`` property.  All such words are stored in the
       :term:`dictionary`, which is consulted by the :term:`parser` when
       attempting to make sense of a player's command.  Only the first
       nine characters are significant (thus ``'cardiogram'`` and
       ``'cardiograph'`` are treated as the same word).  Use
       ``'coins//p'`` to mark "``coins``" as plural, referring to all coin
       objects which are present.  Use ``'t//'`` to enter the
       single-character word "t" into the dictionary (``'t'`` is a
       constant representing a character value).

   directive
       A line of Inform code which asks the :term:`compiler` to do
       something there and then, at :term:`compile-time`; typical examples
       are to Include the contents of another file, or to set aside some
       space within the story file where a variable value may be stored.
       Not to be confused with a :term:`statement`, which asks the
       compiler to compose an instruction which the interpreter will obey
       at :term:`run-time`; typical examples are to display some text, or
       to change the value held within a variable's storage space.

   editor
       A general-purpose program for creating and modifying :term:`text
       file`\s.

   embedded routine
       A routine that is defined in the body of an object, as the value of
       one of its :term:`properties`.  Unlike a :term:`standalone
       routine`, an embedded routine doesn't have a name of its own, and
       returns ``false`` if execution reaches the terminating marker
       ``]``.

   entry point
       One of a predefined list of optional routines which, if you provide
       it, will be called by the library either to produce some
       supplementary output or to return a value causing the library to
       change its default behaviour.

   fake action
       An action generated indirectly by the library rather than directly
       by what the player types.  For example, PUT X IN Y triggers a real
       action of Insert (which can be intercepted by X) and a fake action
       of Receive (which can be intercepted by Y).

   false
       A logical state which is the opposite of :term:`true`, represented
       by the value 0.

   flag
       A variable which can take only two possible values.

   function
       See :term:`routine`.

   global variable
       A variable not specific to any routine or object, which can be used
       by any routine in the game.

   inheritance
       The process by which an :term:`object` belonging to a :term:`class`
       acquires the properties and attributes of said class.  Inheritance
       happens automatically; the designer has just to create class
       definitions, followed by objects having those classes.

   interpreter
       A program that reads the :term:`story file` of a game and enables
       people to play it.  Interpreters must be platform-specific (that
       is, they will be different programs for each operating system),
       thus allowing the story file to be universal and
       platform-independent.

   italic type
       Used for emphasis, and as a placeholder to represent a value which
       you should supply.

   library
       A group of text files, part of the Inform system, that includes the
       :term:`parser`, definitions for the :term:`model world`, language
       files, grammar definitions and a customised stock of default
       answers and behaviour for the player's actions.  The library will
       make frequent calls to the game file to see if the designer wants
       to override those defaults.

   library files
       The actual files containing the source code of the library.  There
       are basically three (although these three Include other files as
       well): ``parser.h`` , ``verblib.h`` and ``grammar.h``, and they
       should be Included in every Inform game.

   library routine
       One of a set of routines included as part of the library which the
       designer can call to perform some commonly useful task.

   local variable
       A variable which is part of only one :term:`routine`; its value
       remains unavailable to other routines in the game.  The value of a
       local variable is *not* preserved between calls to the routine.

   model world
       The imaginary environment which the player character inhabits.

   newline
       The ASCII control character(s) used to mark the end of a line of
       text.

   NPC
       A non-player character; any character other than the protagonist.
       Could range from an opponent or love interest to a pet gerbil or a
       random pedestrian.

   object
       A group of :term:`routine`\s and variables bundled up together in a
       coherent unit.  Objects represent the items that make up the
       :term:`model world` (a torch; a car; a beam of light; etc.), a fact
       which organises the designer's code in sensible chunks, easy to
       manage.  Each object has two parts: the header, which comprises the
       internal ID, the external name and its defined parent (all fields
       are optional), and the body, which comprises the property variables
       and attribute flags particular to that object, if any.

   object tree
       A hierarchy that defines objects' relationships in terms of
       containment.  Each :term:`object` is either contained within
       another object -- its parent -- or is *not* contained; objects such
       as rooms which are not within another object have the constant
       ``nothing`` (0) as a parent.  An object contained within another is
       a child.  For example, a shoe inside a box: the box is the shoe's
       parent and the shoe is a child of the box.  Consider now this box
       being inside the wardrobe.  The box is a child of the wardrobe, but
       the shoe is still a child of the box, not the wardrobe.  In a
       normal game, the object tree will undergo many transformations as
       the result of the player's activities.

   parent
       See :term:`object tree`.

   parser
       Part of the :term:`library` which is responsible for analysing the
       player's input and trying to make sense of it, dividing it into
       separate words (verb, nouns) and trying to match them against the
       words stored in the game's :term:`dictionary` and the actions
       defined in the game's grammar.  If the player's input makes sense,
       the parser will trigger the resulting :term:`action`; if not, it
       will complain that it didn't understand.

   PC
       1. a personal computer;
       2. the player character (see :term:`player`).

   player
       1. the final user of the game, normally a person full of radical
	  opinions about your capabilities as a designer;
       2. a variable referring to the :term:`object` -- sometimes known as
	  an "avatar" -- which currently represents that user within the
	  :term:`model world`.

   print rule
       A customised rule to apply while in a ``print`` or ``print_ret``
       statement, to control the manner in which an item of data is to be
       displayed.  For example: ``print (The) noun, " is mine."`` is
       telling the game to use a capitalised definite article for the
       noun.  The library defines a stock of print rules, and designers
       may create some of their own.

   properties
       Variables attached to a single :term:`object`, of which they are a
       part.  They are defined in the body of the object after the keyword
       ``with`` and have a name and a value.  The latter (which defaults
       to 0) can be a number, a string "...", a dictionary word '...' or
       an embedded routine ``[;...]``; it can also be a list of those
       separated by spaces.  The value of an object's property can be
       tested and changed from any part of the game.  The fact that an
       object provides a property may be tested.

   RAIF
       The ``rec.arts.int-fiction`` Usenet newsgroup for IF designers.

   RGIF

       The ``rec.games.int-fiction`` Usenet newsgroup for IF players.

   room
       An :term:`object` which defines a geographical unit into which the
       map of the :term:`model world` is divided.  Rooms have no parent
       object (or, more precisely, their parent object is ``nothing``) and
       they represent the places where the player character is at any
       given moment -- the player character can't be in more than one room
       at a time.  Note that the name "room" does not imply necessarily
       "indoors".  A clearing, a sandy beach, the top of a tree, even
       floating in outer space -- these are all possible room objects.

   routine
       In general terms, a routine is a computer program that makes some
       specific calculation, following an ordered set of instructions;
       this is the only unit of coherent and executable code understood by
       Inform.  More practically, a routine is a collection of
       :term:`statement`\s which are written between markers ``[...]``.
       When a routine is "called", possibly with arguments -- specific
       values for its defined variables, if they exist -- the interpreter
       executes the statements in sequence.  If the interpreter encounters
       a ``return`` statement, or reaches the ``]`` at the end of the
       routine, it immediately stops executing statements in the routine
       and resumes execution at the statement which called that routine.
       Every routine returns a value, which is either supplied by the
       return statement or implied by the ] at the end of the routine.
       See :term:`embedded routine` and :term:`standalone routine`.

   run-time
       The period of time when the :term:`interpreter` is running a
       :term:`story file` (that is, someone is playing the game).  See
       also :term:`compile-time`.

   source file
       A text file containing your game defined using the Inform language.

   standalone routine
       A routine which is not part of an object.  Unlike an
       :term:`embedded routine`, it must provide a name of its own, and it
       returns ``true`` when execution reaches the terminating marker
       ``]``.

   statement
       A single instruction to be executed at :term:`run-time`.  See also
       :term:`directive`.

   statement block
       A group of :term:`statement`\s bundled up together between braces
       ``{...}``, which are then treated as a single unit -- as if they
       were only one statement.  They commonly appear in loops and
       conditions.

   story file
       A binary file which is the output of the :term:`compiler` and can
       be played through the use of an :term:`interpreter` (also known as
       Z-code file or game file).  The format of story files is standard
       and platform-independent.

   Strict mode
       An option which causes the :term:`compiler` to include extra code
       into the story file, thus making it easier to detect certain design
       mistakes while a game is being played.

   string
       A piece of text between double quotes "...", to be displayed for
       the player's benefit at :term:`run-time`.

   switch
       1. an optional keyword or symbol to operate special features of the
	  compiler.
       2. a statement which decides among different paths of execution
	  according to the value of an expression.

   text file
       A computer file containing words and phrases which a human can
       read.

   true
       A logical state which is the opposite of :term:`false`, represented
       by any value other than zero (typically 1).

   variable
       A named value which can change during :term:`run-time`.  It must be
       declared before use, either as a ``Global`` variable (available to
       any routine within the game), or as a local variable (part of one
       specific routine and usable by that routine alone).  Variables have
       a name and a value; it's the value which is capable of change, not
       the name.  Object :term:`properties` behave as variables.

   Z-code file
       See :term:`story file`.

   Z-machine
       A virtual machine (an imaginary computer simulated by the
       :term:`interpreter`) on which story files run.  Z stands for
       "Zork", the first ever Infocom title.
