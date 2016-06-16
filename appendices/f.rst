==============================
 Appendix F -- Inform library
==============================

.. |ADD| replace:: **+**

.. The ⊕ symbol doesn't work in LaTeX.

.. default-role:: samp

.. only:: html

   .. image:: /images/picL.png
      :align: left

|L|\ibrary files define Inform's model world, turning a conventional
programming language into a text adventure development system.  Here are
the library constants, variables and routines, the standard object
properties and attributes, the verb grammars and actions.

Library objects
===============

:obj:`compass`
  A :attr:`container` object holding the twelve direction objects
  :obj:`d_obj`, :obj:`e_obj`, :obj:`in_obj`, :obj:`n_obj`, :obj:`ne_obj`,
  :obj:`nw_obj`, :obj:`out_obj`, :obj:`s_obj`, :obj:`se_obj`,
  :obj:`sw_obj`, :obj:`u_obj`, :obj:`w_obj`.

:obj:`LibraryMessages`
  If defined (between Includes of `Parser` and `VerbLib`), changes standard
  library messages:

  | `Object LibraryMessages`
  |   `with before [;`
  |        `{action}: "{string}";`
  |        `{action}: "{string}";`
  |        `{action}: switch (lm_n) {`
  |                `{value}: "{string}";`
  |                `{value}: "{string}",`
  |                    `(a) lm_o,".";`
  |                `...`
  |                `}`
  |            `...`
  |        `];`

:obj:`selfobj`
  The default player object.  Avoid: use instead the :var:`player`
  variable, which usually refers to :obj:`selfobj`.

:obj:`thedark`
  A pseudo-room which becomes the :var:`location` when there is no light
  (although the player object is not moved there).

Library constants
=================

In addition to the standard constants :const:`true` (1), :const:`false` (0)
and :const:`nothing` (0), the Library defines :const:`NULL` (-1) for an
`{action}`, `{property}` or `{pronoun}` whose current value is undefined.

`LIBRARY_PARSER`, `LIBRARY_ENGLISH`, `LIBRARY_VERBLIB` and
`LIBRARY_GRAMMAR` are defined to mark the end of inclusion of `Parser.h`,
`English.h`, `VerbLib.h` and `Grammar.h` respectively.

User-defined constants
======================

Some constants control features rather than represent values.

`AMUSING_PROVIDED`
  Activates the `Amusing` entry point.

`COMMENT_CHARACTER = '{char}'`
  Introduces a comment line ignored by the parser (default "*").

`DEATH_MENTION_UNDO`
  Offers "UNDO the last move" at game end.

`DEBUG`
  Activates the debug commands.

`Headline = "{string}"`
  **Mandatory**: game style, copyright info, etc.

`MANUAL_PRONOUNS`
  Pronouns reflect only objects mentioned by the player.

`MAX_CARRIED = {expr}`
  Limit on direct possessions that the player can carry (default 100).

`MAX_SCORE = {expr}`
  Maximum game score (default 0).

`MAX_TIMERS = {expr}`
  Limit on active timers/daemons (default 32).

`NO_PLACES`
  "`OBJECTS`" and "`PLACES`" verbs are barred.

`NO_SCORE`
  Game doesn't use scoring.

`NUMBER_TASKS = {expr}`
  Number of `scored` tasks (default 1).

`OBJECT_SCORE = {expr}`
  For taking a `scored` object for the first time (default 4).

`ROOM_SCORE = {expr}`
  For visiting a `scored` room for the first time (default 5).

`SACK_OBJECT = {obj_id}`
  A `container` object where the game places held objects.

`START_MOVE = {expr}`
  Initial value of turns counter (default 0).

`Story = "{string}"`
  **Mandatory**: the name of the story.

`TASKS_PROVIDED`
  Activates the task scoring system.

`USE_MODULES`
  Activates linking with pre-compiled library modules.

`WITHOUT_DIRECTIONS`
  De-activates standard compass directions (bar "`IN`" and "`OUT`").  Place
  alternative directions in the :obj:`compass`.

Library variables
=================

.. index::
   pair: action; library variable

:var:`action`
  The current `{action}`.

.. index::
   pair: actor; library variable

:var:`actor`
  The target of an instruction: the player, or an NPC.

.. index::
   pair: deadflag; library variable

:var:`deadflag`
  Normally 0: 1 indicates a regular death, 2 indicates that the player has
  won, 3 or more denotes a user-defined end.

.. index::
   pair: inventory_stage; library variable

:var:`inventory_stage`
  Used by :prop:`invent` and :prop:`list_together` properties.

.. index::
   pair: keep_silent; library variable

:var:`keep_silent`
  Normally :const:`false`; :const:`true` makes most :ref:`group 2 actions
  <group-2-actions>` silent.

.. index::
   pair: location; library variable

:var:`location`
  The player's current room; unless that's dark, when it contains
  :obj:`thedark`, :var:`real_location` contains the room.

.. index::
   pair: notify_mode; library variable

:var:`notify_mode`
  Normally :const:`true`: :const:`false` remains silent when score changes.

.. index::
   pair: noun; library variable

:var:`noun`
  The primary focus object for the current action.

.. index::
   pair: player; library variable

:var:`player`
  The object acting on behalf of the human player.

.. index::
   pair: real_location; library variable

:var:`real_location`
  The player's current room when in the dark.

.. index::
   pair: score; library variable

:var:`score`
  The current score.

.. index::
   pair: second; library variable

:var:`second`
  The secondary focus object for the current action.

.. index::
   pair: self; library variable

:var:`self`
  The object which received a message.  (Note: a run-time variable, not a
  compile-time constant.)

.. index::
   pair: sender; library variable

:var:`sender`
  The object which sent a message (or `nothing`).

.. index::
   pair: task_scores; library variable

:var:`task_scores`
  A byte array holding scores for the task scoring system.

.. index::
   pair: the_time; library variable

:var:`the_time`
  The game's clock, in minutes 0..1439 since midnight.

.. index::
   pair: turns; library variable

:var:`turns`
  The game's turn counter.

.. index::
   pair: wn; library variable

:var:`wn`
  The input stream word number, counting from 1.

.. _library-routines:

Library routines
================

.. index::
   pair: Achieved; library routine

`Achieved({expr})`
  A scored task has been achieved.

.. index::
   pair: AfterRoutines; library routine

`AfterRoutines()`
  In a :ref:`group 2 action <group-2-actions>`, controls output of "after"
  messages.

.. index::
   pair: AllowPushDir; library routine

`AllowPushDir()`
  An object can be pushed from one location to another.

.. index::
   pair: Banner; library routine

`Banner()`
  Prints the game banner.

.. index::
   pair: ChangePlayer; library routine

`ChangePlayer({obj_id,flag})`
  Player assumes the persona of the `{obj_id}`.  If the optional `{flag}`
  is :const:`true`, room descriptions include "(as `{object}`)".

.. index::
   pair: CommonAncestor; library routine

`CommonAncestor({obj_id1,obj_id2})`
  Returns the nearest object which has a parental relationship to both
  `{obj_ids}`, or `nothing`.

.. index::
   pair: DictionaryLookup; library routine

`DictionaryLookup({byte_array,length})`
  Returns address of word in dictionary, or 0 if not found.

.. index::
   pair: DrawStatusLine; library routine

`DrawStatusLine()`
  Refreshes the status line; happens anyway at end of each turn.

.. index::
   pair: GetGNAOfObject; library routine

`GetGNAOfObject({obj_id})`
  Returns gender-number-animation 0..11 of the `{obj_id}`.

.. index::
   pair: HasLightSource; library routine

`HasLightSource({obj_id})`
  Returns :const:`true` if the `{obj_id}` has light.

.. index::
   pair: IndirectlyContains; library routine

`IndirectlyContains({parnt_obj_id,obj_id})`
  Returns :const:`true` if `{obj_id}` is currently a child or grand-child
  or great-grand-child... of the `{parent_object}`.

.. index::
   pair: IsSeeThrough; library routine

`IsSeeThrough({obj_id})`
  Returns :const:`true` if light can pass through the `{obj_id}`.

.. index::
   pair: Locale; library routine

`Locale({obj_id,"string1","string2"})`
  Describes the contents of `{obj_id}`, and returns their number.  After
  objects with own paragraphs, the rest are listed preceded by `{string1}`
  or `{string2}`.

.. index::
   pair: LoopOverScope; library routine

`LoopOverScope({routine_id,actor})`
  Calls `{routine_id}({obj_id})` for each `{obj_id}` in scope.  If the
  optional `{actor}` is supplied, that defines the scope.

.. index::
   pair: MoveFloatingObjects; library routine

`MoveFloatingObjects()`
  Adjusts positions of game's `found_in` objects.

.. index::
   pair: NextWord; library routine

`NextWord()`
  Returns the next dictionary word in the input stream, incrementing
  :var:`wn` by one.  Returns :const:`false` if the word is not in the
  dictionary, or if the input stream is exhausted.

.. index::
   pair: NextWordStopped; library routine

`NextWordStopped()`
  Returns the next dictionary word in the input stream, incrementing
  :var:`wn` by one.  Returns :const:`false` if the word is not in the
  dictionary, -1 if the input stream is exhausted.

.. index::
   pair: NounDomain; library routine

`NounDomain({obj_id1,obj_id2,type})`
  Performs object parsing; see also `ParseToken()`.

.. index::
   pair: ObjectIsUntouchable; library routine

`ObjectIsUntouchable({obj_id,flag})`
  Tests whether there is a barrier - a container object which is not open -
  between player and `{obj_id}`.  Unless the optional `{flag}` is
  :const:`true`, outputs "You can't because ... is in the way".  Returns
  :const:`true` is a barrier is found, otherwise :const:`false`.

.. index::
   pair: OffersLight; library routine

`OffersLight({obj_id})`
  Returns :const:`true` if the `{obj_id}` offers light.

.. index::
   pair: ParseToken; library routine

`ParseToken({type,value})`
  Performs general parsing; see also `NounDomain()`.

.. index::
   pair: PlaceInScope; library routine

`PlaceInScope({obj_id})`
  Used in an :prop:`add_to_scope` property or `scope=` token to put the
  `{obj_id}` into scope for the parser.

.. index::
   pair: PlayerTo; library routine

`PlayerTo({obj_id,flag})`
  Moves the player to `{obj_id}`.  Prints its description unless optional
  `{flag}` is 1 (no description) or 2 (as if walked in).

.. index::
   pair: PrintOrRun; library routine

`PrintOrRun({obj_id,property,flag})`
  If `{obj_id.property}` is a string, output it (followed by a newline
  unless optional `{flag}` is :const:`true`), and return :const:`true`.  If
  it's a routine, run it and return what the routine returns.

.. index::
   pair: PronounNotice; library routine

`PronounNotice({obj_id})`
  Associates an appropriate pronoun with the `{obj_id}`.

.. index::
   pair: PronounValue; library routine

`PronounValue('{pronoun}')`
  Returns the object to which '`it`' (or '`him`', '`her`', '`them`')
  currently refers, or :const:`nothing`.

.. index::
   pair: ScopeWithin; library routine

`ScopeWithin({obj_id})`
  Used in an :prop:`add_to_scope` property or `scope=` token to put the
  contents of the `{obj_id}` in scope for the parser.

.. index::
   pair: SetPronoun; library routine

`SetPronoun('{pronoun}',{obj_id})`
  Defines the `{obj_id}` to which a given pronoun refers.

.. index::
   pair: SetTime; library routine

`SetTime({expr1,expr2})`
  Sets `the_time` to `{expr1}` (in mins 0..1439 since midnight), running at
  `{expr2}` -

  | +ve: `{expr2}` minutes pass each turn;
  | -ve: `{-expr2}` turns take one minute;
  | zero: time stands still.

.. index::
   pair: StartDaemon; library routine

`StartDaemon({obj_id})`
  Starts the `{obj_id}`\'s daemon.

.. index::
   pair: StartTimer; library routine

`StartTimer({obj_id,expr})`
  Starts the `{obj_id}`\'s timer, initialising its :prop:`time_left` to
  `{expr}`.  The object's :prop:`time_out` property will be called after
  that number of turns have elapsed.

.. index::
   pair: StopDaemon; library routine

`StopDaemon({obj_id})`
  Stops the `{obj_id}`\'s daemon.

.. index::
   pair: StopTimer; library routine

`StopTimer({obj_id})`
  Stops the `{obj_id}`\'s timer.

.. index::
   pair: TestScope; library routine

`TestScope({obj_id,actor})`
  Returns :const:`true` if the `{obj_id}` is in scope, otherwise
  :const:`false`.  If the optional `{actor}` is supplied, that defines the
  scope.

.. index::
   pair: TryNumber; library routine

`TryNumber({expr})`
  Parses word `{expr}` in the input stream as a number, recognising
  decimals, also English words one..twenty.  Returns the number 1..10000,
  or -1000 if the parse fails.

.. index::
   pair: UnsignedCompare; library routine

`UnsignedCompare({expr1,expr2})`
  Returns -1 if `{expr1}` is less than `{expr2}`, 0 if `{expr1}` equals
  `{expr2}`, and 1 if `{expr1}` is greater than `{expr2}`.  Both
  expressions are unsigned, in the range 0..65535.

.. index::
   pair: WordAddress; library routine

`WordAddress({expr})`
  Returns a byte array containing the raw text of word `{expr}` in the
  input stream.

.. index::
   pair: WordInProperty; library routine

`WordInProperty({word,obj_id,property})`
  Returns :const:`true` if the dictionary `{word}` is listed in the
  `{property}` values for the `{obj_id}`.

.. index::
   pair: WordLength; library routine

`WordLength({expr})`
  Returns the length of word `{expr}` in the input stream.

.. index::
   pair: WriteListFrom; library routine

`WriteListFrom({obj_id,expr})`
  Outputs a list of `{obj_id}` and its siblings, in the given style, an
  `{expr}` formed by adding any of: `ALWAYS_BIT`, `CONCEAL_BIT`,
  `DEFART_BIT`, `ENGLISH_BIT`, `FULLINV_BIT`, `INDENT_BIT`, `ISARE_BIT`,
  `NEWLINE_BIT`, `PARTINV_BIT`, `RECURSE_BIT`, `TERSE_BIT`, `WORKFLAG_BIT`.

.. index::
   pair: YesOrNo; library routine

`YesOrNo()`
  Returns :const:`true` if the player types "`YES`", :const:`false` for
  "`NO`".

.. index::
   pair: ZRegion; library routine

`ZRegion({arg})`
  Returns the type of its `{arg}` : 3 for a string address, 2 for a routine
  address, 1 for an object number, or 0 otherwise.

.. _object-props:

Object properties
=================

Where the `value` of a property can be a routine, several formats are
possible (but remember: embedded "`]`" returns :const:`false`, standalone
"`]`" returns :const:`true`):

  | `{property} [; {stmt}; {stmt}; ... ]`
  | `{property} [; return {routine_id}(); ]`
  | `{property} [; {routine_id}(); ]`
  | `{property} {routine_id}`

In this appendix, |ADD| marks an additive property.  Where a `Class` and an
`Object` of that class both define the same property, the value specified
for the `Object` normally overrides the value inherited from the `Class`.
However, if the property is additive then both values apply, with the
Object's value being considered first.

.. index::
   pair: add_to_scope; library property

:prop:`add_to_scope`
  For an object: additional objects which follow it in and out of scope.
  The `{value}` can be a space-separated list of `{obj_ids}`, or a routine
  which invokes `PlaceInScope()` or `ScopeWithin()` to specify objects.

.. index::
   pair: after; library property

:prop:`after` |ADD|
  For an object: receives every `{action}` and `{fake_action}` for which
  this is the `{noun}`.  For a room: receives every `{action}` which occurs
  here.

  The `{value}` is a routine of structure similar to a `switch` statement,
  having cases for the appropriate `{actions}` (and an optional `default`
  as well); it is invoked after the action has happened, but before the
  player has been informed.  The routine should return :const:`false` to
  continue, telling the player what has happened, or :const:`true` to stop
  processing the action and produce no further output.

.. index::
   pair: article; library property

:prop:`article`
  For an object: the object's indefinite article - the default is
  automatically "a", "an" or "some".  The `{value}` can be a string, or a
  routine which outputs a string.

.. index::
   pair: articles; library property

:prop:`articles`
  For a non-English object: its definite and indefinite articles.  The
  `{value}` is an array of strings.

.. index::
   pair: before; library property

:prop:`before` |ADD|
  For an object: receives every `{action}` and `{fake_action}` for which
  this is the `{noun}`.  For a room: receives every action which occurs
  here.

  The `{value}` is a routine invoked before the action has happened.  See
  :prop:`after`.

.. index::
   pair: cant_go; library property

:prop:`cant_go`
  For a room: the message when the player attempts an impossible exit.  The
  `{value}` can be a string, or a routine which outputs a string.

.. index::
   pair: capacity; library property

:prop:`capacity`
  For a :attr:`container` or :attr:`supporter` object: the number of
  objects which can be placed in or on it - the default is 100.

  For the player: the number which can be carried - :obj:`selfobj` has an
  initial capacity of `MAX_CARRIED`.

  The `{value}` can be a number, or a routine which returns a number.

.. index::
   pair: d_to; library property

:prop:`d_to`
  For a room: a possible exit.  The `{value}` can be

  * :const:`false` (the default): not an exit;
  * a string: output to explain why this is not an exit;
  * a `{room}`: the exit leads to this room;
  * a :obj:`door` object: the exit leads through this door;
  * a routine which should return :const:`false`, a string, a `{room}`, a
    :obj:`door` object, or :const:`true` to signify "not an exit" and
    produce no further output.

.. index::
   pair: daemon; library property

:prop:`daemon`
  The `{value}` is a routine which can be activated by
  `StartDaemon({obj_id})` and which then runs once each turn until
  deactivated by `StopDaemon({obj_id})`.

.. index::
   pair: describe; library property

:prop:`describe` |ADD|
  For an object: called before the object's description is output.  For a
  room: called before the room's (long) description is output.

  The `{value}` is a routine which should return :const:`false` to continue,
  outputting the usual description, or :const:`true` to stop processing and
  produce no further output.

.. index::
   pair: description; library property

:prop:`description`
  For an object: its description (output by `Examine`).

  For a room: its long description (output by `Look`).

  The `{value}` can be a string, or a routine which outputs a string.

.. index::
   pair: door_dir; library property

:prop:`door_dir`
  For a :obj:`compass` object (:obj:`d_obj`, :obj:`e_obj`, ...): the
  direction in which an attempt to move to this object actually leads.

  For a :obj:`door` object: the direction in which this door leads.

  The `{value}` can be a directional property (:prop:`d_to`, :prop:`e_to`,
  \...), or a routine which returns such a property.

.. index::
   pair: door_to; library property

:prop:`door_to`
  For a `door` object: where it leads.  The value can be

  * :const:`false` (the default): leads nowhere;
  * a string: output to explain why door leads nowhere;
  * a `{room}`: the door leads to this room;
  * a routine which should return :const:`false`, a string, a `{room}`, or
    :const:`true` to signify "leads nowhere" without producing any output.

.. index::
   pair: e_to; library property

:prop:`e_to`
  See :prop:`d_to`.

.. index::
   pair: each_turn; library property

:prop:`each_turn` |ADD|
  Invoked at the end of each turn (after all appropriate daemons and
  timers) whenever the object is in scope.  The `{value}` can be a string,
  or a routine.

.. index::
   pair: found_in; library property

:prop:`found_in`
  For an object: the rooms where this object can be found, unless it has
  the :attr:`absent` attribute.  The `{value}` can be

  * a space-separated list of `{rooms}` (where this object can be found) or
     `{obj_ids}` (whose locations are tracked by this object);
  * a routine which should return :const:`true` if this object can be found
     in the current location, otherwise :const:`false`.

.. index::
   pair: grammar; library property

:prop:`grammar`
  For an :attr:`animate` or :attr:`talkable` object: the `{value}` is a
  routine called when the parser knows that this object is being addressed,
  but has yet to test the grammar.  The routine should return
  :const:`false` to continue, :const::const:`true` to indicate that the
  routine has parsed the entire command, or a dictionary word ('`word`' or
  -'`word`').

.. index::
   pair: in_to; library property

:prop:`in_to`
  See :prop:`d_to`.

.. index::
   pair: initial; library property

:prop:`initial`
  For an object: its description before being picked up.

  For a room: its description when the player enters the room.

  The `{value}` can be a string, or a routine which outputs a string.

.. index::
   pair: inside_description; library property

:prop:`inside_description`
  For an `enterable` object: its description, output as part of the room
  description when the player is inside the object.

  The `{value}` can be a string, or a routine which outputs a string.

.. index::
   pair: invent; library property

:prop:`invent`
  For an object: the `{value}` is a routine for outputting the object's
  inventory listing, which is called twice.  On the first call nothing has
  been output; :var:`inventory_stage` has the value 1, and the routine
  should return :const:`false` to continue, or :const:`true` to stop
  processing and produce no further output.  On the second call the
  object's indefinite article and short name have been output, but not any
  subsidiary information; :var:`inventory_stage` has the value 2, and the
  routine should return :const:`false` to continue, or :const:`true` to
  stop processing and produce no further output.

.. index::
   pair: life; library property

:prop:`life` |ADD|
  For an `animate` object: receives person-to-person actions (`Answer`,
  `Ask`, `Attack`, `Give`, `Kiss`, `Order`, `Show`, `Tell`, `ThrowAt` and
  `WakeOther`) for which this is the `{noun}`.  The `{value}` is a routine
  of structure similar to a `switch` statement, having cases for the
  appropriate `{actions}` (and an optional default as well).  The routine
  should return :const:`false` to continue, telling the player what has
  happened, or :const:`true` to stop processing the action and produce no
  further output.

.. index::
   pair: list_together; library property

:prop:`list_together`
  For an object: groups related objects when outputting an inventory or
  room contents list.  The `{value}` can be

  * a `{number}`: all objects having this value are grouped;
  * a `{string}`: all objects having this value are grouped as a count of
    the string;
  * a routine which is called twice.  On the first call nothing has been
    output; :var:`inventory_stage` has the value 1, and the routine should
    return :const:`false` to continue, or :const::const:`true` to stop
    processing and produce no further output.  On the second call the list
    has been output; :var:`inventory_stage` has the value 2, and there is
    no test on the return value.

.. index::
   pair: n_to; library property

:prop:`n_to`
  See :prop:`d_to`.

.. index::
   pair: name; library property

:prop:`name` |ADD|
  Defines a space-separated list of words which are added to the Inform
  dictionary.  Each word can be supplied in apostrophes '...'  or quotes
  "..."; in all other cases only words in apostrophes update the
  dictionary.

  For an object: identifies this object.

  For a room: outputs "does not need to be referred to".

.. index::
   pair: ne_to; library property

:prop:`ne_to`
  See :prop:`d_to`.

.. index::
   pair: number; library property

:prop:`number`
  For an object or room: the `{value}` is a general-purpose variable freely
  available for use by the program.  A :var:`player` object must provide
  (but not use) this variable.

.. index::
   pair: nw_to; library property

:prop:`nw_to`
  See :prop:`d_to`.

.. index::
   pair: orders; library property

:prop:`orders` |ADD|
  For an :attr:`animate` or :attr:`talkable` object: the `{value}` is a
  routine called to carry out the player's orders.  The routine should
  return :const:`false` to continue, or :const:`true` to stop processing
  the action and produce no further output.

.. index::
   pair: out_to; library property

:prop:`out_to`
  See :prop:`d_to`.

.. index::
   pair: parse_name; library property

:prop:`parse_name`
  For an object: the `{value}` is a routine called to parse an object's
  name.  The routine should return zero if the text makes no sense, -1 to
  cause the parser to resume, or the positive number of words matched.

.. index::
   pair: plural; library property

:prop:`plural`
  For an object: its plural form, when in the presence of others like it.
  The `{value}` can be a string, or a routine which outputs a string.

.. index::
   pair: react_after; library property

:prop:`react_after`
  For an object: detects nearby actions - those which take place when this
  object is in scope.  The `{value}` is a routine invoked after the action
  has happened, but before the player has been informed.  See :prop:`after`.

.. index::
   pair: react_before; library property

:prop:`react_before`
  For an object: detects nearby actions - those which take place when this
  object is in scope.  The `{value}` is a routine invoked before the action
  has happened.  See :prop:`after`.

.. index::
   pair: s_to; library property

:prop:`s_to`
  See :prop:`d_to`.

.. index::
   pair: se_to; library property

:prop:`se_to`
  See :prop:`d_to`.

.. index::
   pair: short_name; library property

:prop:`short_name`
  For an object: an alternative or extended short name.  The `{value}` can
  be a string, or a routine which outputs a string.  The routine should
  return :const:`false` to continue by outputting the object's *actual*
  short name (from the head of the object definition), or :const:`true` to
  stop processing the action and produce no further output.

.. index::
   pair: short_name_indef; library property

:prop:`short_name_indef`
  For a non-English object: the short name when preceded by an indefinite
  object.  The `{value}` can be a string, or a routine which outputs a
  string.

.. index::
   pair: sw_to; library property

:prop:`sw_to`
  See :prop:`d_to`.

.. index::
   pair: time_left; library property

:prop:`time_left`
  For a timer object: the `{value}` is a variable to hold the number of
  turns left until this object's timer - activated and initialised by
  `StartTimer({obj_id})` - counts down to zero and invokes the object's
  `time_out` property.

.. index::
   pair: time_out; library property

:prop:`time_out`
  For a timer object: the `{value}` is a routine which is run when the
  object's :prop:`time_left` value - initialised by `StartTimer({obj_id})`,
  and not in the meantime cancelled by `StopTimer({obj_id})` - counts down
  to zero.

.. index::
   pair: u_to; library property

:prop:`u_to`
  See :prop:`d_to`.

.. index::
   pair: w_to; library property

:prop:`w_to`
  See :prop:`d_to`.

.. index::
   pair: when_closed; library property

:prop:`when_closed`

.. index::
   pair: when_open; library property

:prop:`when_open`
  For a :attr:`container` or :attr:`door` object: used when including this
  object in a room's long description.  The `{value}` can be a string, or a
  routine which outputs a string.

.. index::
   pair: when_off; library property

:prop:`when_off`

.. index::
   pair: when_on; library property

:prop:`when_on`
  For a :attr:`switchable` object: used when including this object in a
  room's long description.  The `{value}` can be a string, or a routine
  which outputs a string.

.. index::
   pair: with_key; library property

:prop:`with_key`
  For a :attr:`lockable` object: the `{obj_id}` (generally some kind of
  key) needed to lock and unlock the object, or :const:`nothing` if no key
  fits.

.. _object-attrs:

Object attributes
=================

.. index::
   pair: absent; library attribute

:attr:`absent`
   For a floating object (one with a :prop:`found_in` property, which can
   appear in many rooms): is no longer there.

.. index::
   pair: animate; library attribute

:attr:`animate`
   For an object: is a living creature.

.. index::
   pair: clothing; library attribute

:attr:`clothing`
   For an object: can be worn.

.. index::
   pair: concealed; library attribute

:attr:`concealed`
   For an object: is present but hidden from view.

.. index::
   pair: container; library attribute

:attr:`container`
   For an object: other objects can be put in (but not on) it.

.. index::
   pair: door; library attribute

:attr:`door`
   For an object: is a door or bridge between rooms.

.. index::
   pair: edible; library attribute

:attr:`edible`
   For an object: can be eaten.

.. index::
   pair: enterable; library attribute

:attr:`enterable`
   For an object: can be entered.

.. index::
   pair: female; library attribute

:attr:`female`
   For an :attr:`animate` object: is female.

.. index::
   pair: general; library attribute

:attr:`general`
   For an object or room: a general-purpose flag.

.. index::
   pair: light; library attribute

:attr:`light`
   For an object or room: is giving off light.

.. index::
   pair: lockable; library attribute

:attr:`lockable`
   For an object: can be locked; see the :prop:`with_key` property.

.. index::
   pair: locked; library attribute

:attr:`locked`
   For an object: can't be opened.

.. index::
   pair: male; library attribute

:attr:`male`
   For an :attr:`animate` object: is male.

.. index::
   pair: moved; library attribute

:attr:`moved`
   For an object: is being, or has been, taken by the player.

.. index::
   pair: neuter; library attribute

:attr:`neuter`
   For an :attr:`animate` object: is neither male nor female.

.. index::
   pair: on; library attribute

:attr:`on`
   For a :attr:`switchable` object: is switched on.

.. index::
   pair: open; library attribute

:attr:`open`
   For a :attr:`container` or door object: is open.

.. index::
   pair: openable; library attribute

:attr:`openable`
   For a :attr:`container` or :attr:`door` object: can be opened.

.. index::
   pair: pluralname; library attribute

:attr:`pluralname`
   For an object: is plural.

.. index::
   pair: proper; library attribute

:attr:`proper`
   For an object: the short name is a proper noun, therefore not to be
   preceded by "The" or "the".

.. index::
   pair: scenery; library attribute

:attr:`scenery`
   For an object: can't be taken; is not listed in a room description.

.. index::
   pair: scored; library attribute

:attr:`scored`
   For an object: awards `OBJECT_SCORE` points when taken for the first
   time.  For a room: awards `ROOM_SCORE` points when visited for the
   first time.

.. index::
   pair: static; library attribute

:attr:`static`
   For an object: can't be taken.

.. index::
   pair: supporter; library attribute

:attr:`supporter`
   For an object: other objects can be put on (but not in) it.

.. index::
   pair: switchable; library attribute

:attr:`switchable`
   For an object: can be switched off or on.

.. index::
   pair: talkable; library attribute

:attr:`talkable`
   For an object: can be addressed in "object, do this" style.

.. index::
   pair: transparent; library attribute

:attr:`transparent`
   For a :attr:`container` object: objects inside it are visible.

.. index::
   pair: visited; library attribute

:attr:`visited`
   For a room: is being, or has been, visited by the player.

.. index::
   pair: workflag; library attribute

:attr:`workflag`
   Temporary internal flag, also available to the program.

.. index::
   pair: worn; library attribute

:attr:`worn`
   For a :attr:`clothing` object: is being worn.

.. _entry-points:

Optional entry points
=====================

These routines, if you supply them, are called when shown.

`AfterLife()`
  Player has died; `deadflag=0` resurrects.

`AfterPrompt()`
  The ">" prompt has been output.

`Amusing()`
  Player has won; `AMUSING_PROVIDED` is defined.

`BeforeParsing()`
  The parser has input some text, set up the buffer and parse tables, and
  initialised :var:`wn` to 1.

`ChooseObjects({object,flag})`
  Parser has found "`ALL`" or an ambiguous noun phrase and decided that
  `{object}` should be excluded (`flag` is 0), or included (`flag` is 1).
  The routine should return 0 to let this stand, 1 to force inclusion, or 2
  to force exclusion.  If `flag` is 2, parser is undecided; routine should
  return appropriate score 0..9.

`DarkToDark()`
  The player has gone from one dark room to another.

`DeathMessage()`
  The player has died; `deadflag` is 3 or more.

`GamePostRoutine()`
  Called after all actions.

`GamePreRoutine()`
  Called before all actions.

`Initialise()`
  **Mandatory; note British spelling**: called at start.  Must set
  `location`; can return 2 to suppress game banner.

`InScope()`
  Called during parsing.

`LookRoutine()`
  Called at the end of every `Look` description.

`NewRoom()`
  Called when room changes, before description is output.

`ParseNoun({object})`
  Called to parse the `{object}`\'s name.

`ParseNumber({byte_array,length})`
  Called to parse a number.

`ParserError({number})`
  Called to handle an error.

`PrintRank()`
  Completes the output of the score.

`PrintTaskName({number})`
  Prints the name of the task.

`PrintVerb({addr})`
  Called when an unusual verb is printed.

`TimePasses()`
  Called after every turn.

`UnknownVerb()`
  Called when an unusual verb is encountered.

.. _group-1-actions:

Group 1 actions
===============

Group 1 actions support the 'meta' verbs.  These are the standard actions
and their triggering verbs.

==============  =====================================================
`CommandsOff`   "`RECORDING OFF`"
`CommandsOn`    "`RECORDING [ON]`"
`CommandsRead`  "`REPLAY`"
`FullScore`     "`FULLSCORE`", "`FULL [SCORE]`"
`LMode1`        "`BRIEF`", "`NORMAL`"
`LMode2`        "`LONG`", "`VERBOSE`"
`LMode3`        "`SHORT`", "`SUPERBRIEF`"
`NotifyOff`     "`NOTIFY OFF`"
`NotifyOn`      "`NOTIFY [ON]`"
`Objects`       "`OBJECTS`"
`Places`        "`PLACES`"
`Pronouns`      "`[PRO]NOUNS`"
`Quit`          "`DIE`", "`Q[UIT]`"
`Restart`       "`RESTART`"
`Restore`       "`RESTORE`"
`Save`          "`CLOSE`"
`Score`         "`SCORE`"
`ScriptOff`     "`[TRAN]SCRIPT OFF`", "`NOSCRIPT`", "`UNSCRIPT`"
`ScriptOn`      "`[TRAN]SCRIPT [ON]`"
`Verify`        "`VERIFY`"
`Version`       "`VERSION`"
==============  =====================================================

and the debug tools.

===============   ===================================================
`ActionsOff`      "`ACTIONS OFF`"
`ActionsOn`       "`ACTIONS [ON]`"
`ChangesOff`      "`CHANGES OFF`"
`ChangesOn`       "`CHANGES [ON]`"
`Gonear`          "`GONEAR`"
`Goto`            "`GOTO`"
`Predictable`     "`RANDOM`"
`RoutinesOff`     "`MESSAGES OFF`", "`ROUTINES OFF`"
`RoutinesOn`      "`MESSAGES [ON]`", "`ROUTINES [ON]`"
`Scope`           "`SCOPE`"
`Showobj`         "`SHOWOBJ`"
`Showverb`        "`SHOWVERB`"
`TimersOff`       "`DAEMONS OFF`", "`TIMERS OFF`"
`TimersOn`        "`DAEMONS [ON]`", "`TIMERS [ON]`"
`TraceLevel`      "`TRACE number`"
`TraceOff`        "`TRACE OFF`"
`TraceOn`         "`TRACE [ON]`"
`XAbstract`       "`ABSTRACT`"
`XPurloin`        "`PURLOIN`"
`XTree`           "`TREE`"
===============   ===================================================

.. _group-2-actions:

Group 2 actions
===============

Group 2 actions usually work, given the right circumstances.

.. tabularcolumns:: |l|p{5in}|

=============   =============================================================
`Close`         "`CLOSE [UP]`", "`COVER [UP]`", "`SHUT [UP]`"
`Disrobe`       "`DISROBE`", "`DOFF`", "`REMOVE`", "`SHED`", "`TAKE OFF`"
`Drop`          "`DISCARD`", "`DROP`", "`PUT DOWN`", "`THROW`"
`Eat`           "`EAT`"
`Empty`         "`EMPTY [OUT]`"
`EmptyT`        "`EMPTY IN|INTO|ON|ONTO|TO`"
`Enter`         "`CROSS`", "`ENTER`", "`GET IN|INTO|ON|ONTO`",
                "`GO IN|INSIDE|INTO|THROUGH`",
                "`LEAVE IN|INSIDE|INTO|THROUGH`", "`LIE IN|INSIDE|ON`",
                "`LIE ON TOP OF`",
                "`RUN IN|INSIDE|INTO|THROUGH`", "`SIT IN|INSIDE|ON`",
                "`SIT ON TOP OF`", "`STAND ON`",
                "`WALK IN|INSIDE|INTO|THROUGH`"
`Examine`       "`CHECK,`" "`DESCRIBE`", "`EXAMINE`",
                "`L[OOK] AT`", "`READ`", "`WATCH`", "`X`"
`Exit`          "`EXIT`", "`GET OFF|OUT|UP`",
                "`LEAVE`", "`OUT[SIDE]`", "`STAND [UP]`"
`GetOff`        "`GET OFF`"
`Give`          "`FEED [TO]`", "`GIVE [TO]`", "`OFFER [TO]`", "`PAY [TO]`"
`Go`            "`GO`", "`LEAVE`", "`RUN`", "`WALK`"
`GoIn`          "`CROSS`", "`ENTER`", "`IN[SIDE]`"
`Insert`        "`DISCARD IN|INTO`",
                "`DROP DOWN|IN|INTO`",
                "`INSERT IN|INTO`",
                "`PUT IN|INSIDE|INTO`",
                "`THROW DOWN|IN|INTO`"
`Inv`           "`I[NV]`", "`INVENTORY`", "`TAKE INVENTORY`"
`InvTall`       "`I[NV] TALL`", "`INVENTORY TALL`"
`InvWide`       "`I[NV] WIDE`", "`INVENTORY WIDE`"
`Lock`          "`LOCK WITH`"
`Look`          "`L[OOK]`"
`Open`          "`OPEN`", "`UNCOVER`", "`UNDO`", "`UNWRAP`"
`PutOn`         "`DISCARD ON|ONTO`",
                "`DROP ON|ONTO`",
                "`PUT ON|ONTO`",
                "`THROW ON|ONTO`"
`Remove`        "`GET FROM`", "`REMOVE FROM`", "`TAKE FROM|OFF`"
`Search`        "`L[OOK] IN|INSIDE|INTO|THROUGH`", "`SEARCH`"
`Show`          "`DISPLAY [TO]`", "`PRESENT [TO]`", "`SHOW [TO]`"
`SwitchOff`     "`CLOSE OFF`", "`SCREW OFF`",
                "`SWITCH OFF`", "`TURN OFF`",
                "`TWIST OFF`"
`SwitchOn`      "`SCREW ON`", "`SWITCH ON`",
                "`TURN ON`", "`TWIST ON`"
`Take`          "`CARRY`", "`GET`", "`HOLD`",
                "`PEEL [OFF]`", "`PICK UP`",
                "`REMOVE`", "`TAKE`"
`Transfer`      "`CLEAR TO`", "`MOVE TO`",
                "`PRESS TO`", "`PUSH TO`",
                "`SHIFT TO`", "`TRANSFER TO`"
`Unlock`        "`OPEN WITH`", "`UNDO WITH`",
                "`UNLOCK WITH`"
`VagueGo`       "`GO`", "`LEAVE`", "`RUN`", "`WALK`"
`Wear`          "`DON`", "`PUT ON`", "`WEAR`"
=============   =============================================================

.. _group-3-actions:

Group 3 actions
===============

Group 3 actions are by default stubs which output a message and stop at the
"before" stage (so there is no "after" stage).

.. tabularcolumns:: |l|p{5in}|

=============   =============================================================
`Answer`        "`ANSWER TO`", "`SAY TO`",
                "`SHOUT TO`", "`SPEAK TO`"
`Ask`           "`ASK ABOUT`"
`AskFor`        "`ASK FOR`"
`Attack`        "`ATTACK`", "`BREAK`", "`CRACK`",
                "`DESTROY`", "`FIGHT`", "`HIT`",
                "`KILL`", "`MURDER`", "`PUNCH`",
                "`SMASH`", "`THUMP`", "`TORTURE`",
                "`WRECK`"
`Blow`          "`BLOW`"
`Burn`          "`BURN [WITH]`", "`LIGHT [WITH]`"
`Buy`           "`BUY`" "`PURCHASE`"
`Climb`         "`CLIMB [OVER|UP]`", "`SCALE`"
`Consult`       "`CONSULT ABOUT|ON`",
                "`LOOK UP IN`",
                "`READ ABOUT IN`", "`READ IN`"
`Cut`           "`CHOP,`" "`CUT`", "`PRUNE`", "`SLICE`"
`Dig`           "`DIG [WITH]`"
`Drink`         "`DRINK`", "`SIP`", "`SWALLOW`"
`Fill`          "`FILL`"
`Jump`          "`HOP`", "`JUMP`", "`SKIP`"
`JumpOver`      "`HOP OVER`", "`JUMP OVER`", "`SKIP OVER`"
`Kiss`          "`EMBRACE`", "`HUG`", "`KISS`"
`Listen`        "`HEAR`", "`LISTEN [TO]`"
`LookUnder`     "`LOOK UNDER`"
`Mild`          Various mild swearwords.
`No`            "`NO`"
`Pray`          "`PRAY`"
`Pull`          "`DRAG`" "`PULL`"
`Push`          "`CLEAR`", "`MOVE`", "`PRESS`",
                "`PUSH`", "`SHIFT`"
`PushDir`       "`CLEAR`", "`MOVE`", "`PRESS`",
                "`PUSH`", "`SHIFT`"
`Rub`           "`CLEAN`", "`DUST`", "`POLISH`",
                "`RUB`", "`SCRUB`", "`SHINE`",
                "`SWEEP`", "`WIPE`"
`Set`           "`ADJUST`", "`SET`"
`SetTo`         "`ADJUST TO`", "`SET TO`"
`Sing`          "`SING`"
`Sleep`         "`NAP`", "`SLEEP`"
`Smell`         "`SMELL`", "`SNIFF`"
`Sorry`         "`SORRY`"
`Squeeze`       "`SQUASH`", "`SQUEEZE`"
`Strong`        Various strong swearwords.
`Swim`          "`DIVE`", "`SWIM`"
`Swing`         "`SWING [ON]`"
`Taste`         "`TASTE`"
`Tell`          "`TELL ABOUT`"
`Think`         "`THINK`"
`ThrowAt`       "`THROW AGAINST|AT|ON|ONTO`"
`Tie`           "`ATTACH [TO]`", "`FASTEN [TO]`",
                "`FIX [TO]`", "`TIE [TO]`"
`Touch`         "`FEEL,`" "`FONDLE`", "`GROPE`", "`TOUCH`"
`Turn`          "`ROTATE`", "`SCREW`", "`TURN`",
                "`TWIST`", "`UNSCREW`"
`Wait`          "`WAIT`" "`Z`"
`Wake`          "`AWAKE[N]`", "`WAKE [UP]`"
`WakeOther`     "`AWAKE[N]`", "`WAKE [UP]`"
`Wave`          "`WAVE`"
`WaveHands`     "`WAVE`"
`Yes`           "`Y[ES]`"
=============   =============================================================

Fake actions
============

Fake actions handle some special cases, or represent "real" actions from
the viewpoint of the second object.

.. tabularcolumns:: |l|p{5in}|

================   ========================================================
`LetGo`            Generated by `Remove`.
`ListMiscellany`   Outputs a range of inventory messages.
`Miscellany`       Outputs a range of utility messages.
`NotUnderstood`    Generated when parser fails to interpret some `orders`.
`Order`            Receives things not handled by `orders`.
`PluralFound`      Tells the parser that `parse_name()` has identified a
                   plural object.
`Prompt`           Outputs the prompt, normally ">".
`Receive`          Generated by `Insert` and `PutOn`.
`TheSame`          Generated when parser can't distinguish between two
		   objects.
`ThrownAt`         Generated by `ThrowAt`.
================   ========================================================
