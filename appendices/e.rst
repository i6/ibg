===============================
 Appendix E -- Inform language
===============================

.. default-role:: samp

.. only:: html

   .. image:: /images/picR.png
      :align: left

.. raw:: latex

    \dropcap{r}

efer to this appendix for a succinct but essentially complete summary of
the Inform programming language; it covers everything that we've met in
this guide, plus various constructs which didn't occur naturally, and
others of an advanced or obscure nature.

Literals
========

In the specialised language of computing, the basic unit of data storage is
an eight-bit **byte**, able to store a value 0..255.  That's too small to
be useful for holding anything other than a single character, so most
computers also work with a group of two, four or eight bytes known as a
**word** (not to be confused with Inform's dictionary word).  In the
Z-machine a storage word comprises two bytes, and you can specify in
various ways the literal values to be stored.

:Decimal: `-32768` to `32767`
:Hexadecimal: `$0` to `$FFFF`
:Binary: `$$0` to `$$1111111111111111`
:Action: `##Look`
:Character: `'a'`
:Dictionary word: `'aardvark'` (up to nine characters significant); use
   circumflex "^" to denote apostrophe.

:Plural word: `'aardvarks//p'`

:Single-character word: `"a"` (`name` property only) or `'a//'`
:String: `"aardvark's adventure"` (maximum around 4000 characters); can
   include special values including:

     =============   ====================================
     `^`             newline
     `~`             double quotes "`\"`"
     `@@64`          at sign "`@`"
     `@@92`          backslash "`\\`"
     `@@94`          circumflex "`^`"
     `@@126`         tilde "`~`"
     `@\`a`          a with a grave accent "`à`", et al
     `@LL`           pound sign "`£`", et al
     `@00 ... @31`   low string 0..31
     =============   ====================================

Names
=====

The identifier of an Inform `{const_id}`, `{var_id}`, `{array}`,
`{class_id}`, `{obj_id}`, `{property}`, `{attribute}`, `{routine_id}` or
`{label}`.  Up to 32 characters: alphabetic (case not significant), numeric
and underscore, with the first character not a digit.

Constants
=========

Named word values, unchanging at run-time, which are by default initialised
to zero:

  | `Constant {const_id}`;
  | `Constant {const_id} = {expr}`;

Standard constants are `true` (1), `false` (0) and `nothing` (0), also
`NULL` (-1).  Additionally, `WORDSIZE` is the number of bytes in a storage
word: 2 for the Z-machine, 4 for Glulx.

To define a constant (unless it already exists):

  | `Default {const_id expr}`;

Variables and arrays
====================

Named word/byte values which can change at run-time and are by default
initialised to zero.

A **global** variable is a single word:

  | `Global {var_id}`;
  | `Global {var_id} = {expr}`;

A **word array** is a set of global words accessed using
`{array}->0,{array}->1,... {array}->({N}-1)`:

  | `Array {array} --> {N};`
  | `Array {array} --> {expr1 expr2... exprN};`
  | `Array {array} --> "{string}";`

A **table array** is a set of global words accessed using `{array}->1,
{array}->2,... {array}->{N}`, with `{array}->0` initialised to `{N}`:

  | `Array {array} table {N};`
  | `Array {array} table {expr1... exprN};`
  | `Array {array} table "{string}";`

A **byte array** is a set of global bytes accessed using `{array}->0,
{array}->1,... {array}->({N}-1)`:

  | `Array {array} -> {N};`
  | `Array {array} -> {expr1 expr2... exprN};`
  | `Array {array} -> "{string}";`

A **string array** is a set of global bytes accessed using `array->1,
array->2,... array->{N}`, with `array->0` initialised to `{N}`:

  | `Array {array} string {N};`
  | `Array {array} string {expr1... exprN};`
  | `Array {array} string "{string}";`

A **buffer array** is a set of global bytes accessed using
`{array}->(WORDSIZE), {array}->(WORDSIZE+1), ...
{array}->(WORDSIZE+{N}-1)`, with the first **word** `{array}->0`
initialised to `{N}`:

  | `Array {array} buffer {N};`
  | `Array {array} buffer {expr1... exprN};`
  | `Array {array} buffer "{string}";`

In all these cases, the characters of the initialising `{string}` are
unpacked to the individual word/byte elements of the array.

See also Objects (for **property** variables) and Routines (for **local**
variables).

Expressions and operators
=========================

Use parentheses `(...)` to control the order of evaluation.

Arithmetic/logical expressions support these operators:

  ===========        ====================================
  `{p} + {q}`        addition
  `{p} - {q}`        subtraction
  `{p} * {q}`        multiplication
  `{p} / {q}`        integer division
  `{p} % {q}`        remainder
  `{p}++`            increments `{p}`, returns orig value
  `++{p}`            increments `{p}`, returns new value
  `{p}--`            decrements `{p}`, returns orig value
  `--{p}`            decrements `{p}`, returns new value
  `{p} & {q}`        bitwise AND
  `{p} | {q}`        bitwise OR
  `~{p}`             bitwise NOT (inversion)
  ===========        ====================================

Conditional expressions return `true` or `false`; `{q}` may be a list of
choices `{q1} or {q2} or ... {qN}`:

  ==================   ==========================================
  `{p} == {q}`         `{p}` is equal to `{q}`
  `{p} ~= {q}`         `{p}` isn't equal to `{q}`
  `{p} > {q}`          `{p}` is greater than `{q}`
  `{p} < {q}`          `{p}` is less than `{q}`
  `{p} >= {q}`         `{p}` is greater than or equal to `{q}`
  `{p} <= {q}`         `{p}` is less than or equal to `{q}`
  `{p} ofclass {q}`    object `{p}` is of class `{q}`
  `{p} in {q}`         object `{p}` is a child of object `{q}`
  `{p} notin {q}`      object `{p}` isn't a child of object `{q}`
  `{p} provides {q}`   object `{p}` provides property `{q}`
  `{p} has {q}`        object `{p}` has attribute `{q}`
  `{p} hasnt {q}`      object `{p}` hasn't attribute `{q}`
  ==================   ==========================================

Boolean expressions return `true` or `false`; if `{p}` has determined the
result, `{q}` is not evaluated:

  ============   ========================================
  `{p} && {q}`   both `{p}` and `{q}` are true (non-zero)
  `{p} || {q}`   either `{p}` or `{q}` is true (non-zero)
  `~~{p}`        `{p}` is false (zero)
  ============   ========================================

To return -1, 0 or 1 based on unsigned comparison:

    | `UnsignedCompare({p},{q})`

To return `true` if object `{q}` is a child or grandchild or... of `{p}`:

    | `IndirectlyContains({p},{q})`

To return the closest common parent of two objects (or nothing):

    | `CommonAncestor({p},{q})`

To return a random number `1..{N}`, or one from a list of constant values:

    | `random({N})`
    | `random({value,value, ... value})`

Classes and objects
===================

To declare a `{class_id}` - a template for a family of objects - where the
optional (`{N}`) limits instances created at run-time:

  | `Class {class_id}({N})`
  |  `class {class_id} {class_id}... {class_id}`
  |  `with {prop_def},`
  |        `...`
  |        `{prop_def},`
  |  `has   {attr_def} {attr_def}... {attr_def};`

To declare an `{obj_id}`, "`Object`" can instead be a `{class_id}`, the
remaining four header items are all optional, and `{arrows}` (`->`, `->
->`, ...)  and `{parent_obj_id}` are incompatible:

  | `Object {arrows obj_id} "{ext_name}" {parent_obj_id}`
  |  `class {class_id} {class_id}... {class_id}`
  |  `with {prop_def},`
  |         `...`
  |         `{prop_def},`
  |  `has    {attr_def} {attr_def}... {attr_def};`

The `class`, `with` and `has` (and also the rarely-used `private`) segments
are all optional, and can appear in any order.

To determine an object's class as one of `Class`, `Object`, `Routine`,
`String` (or `nothing`):

  | `metaclass({obj_id})`

**has segment**: Each `{attr_def}` is either of:

  | `{attribute}`
  | `~{attribute}`

To change attributes at run-time:

  | `give {obj_id attr_def... attr_def};`

**with/private segments**: Each `{prop_def}` declares a variable (or word
array) and can take any of these forms (where a `{value}` is an expression,
a string or an embedded routine):

  | `{property}`
  | `{property value}`
  | `{property value value... value}`

A property variable is addressed by `{obj_id.property}` (or within the
object's declaration as `{self.property}`).

Multiple `{values}` create a property array; in this case
`{obj_id.#property}` is the number of bytes occupied by the array, the
entries can be accessed using `{obj_id.&property}-->0`,
`{obj_id.&property}->1`, ..., and `{obj_id.property}` refers to the value
of the first entry.

A property variable inherited from an object's class is addressed by
`{obj_id.class_id}::{property}`; this gives the original value prior to any
changes within the object.

Manipulating the object tree
============================

To change object relationships at run-time:

  | `move {obj_id} to {parent_obj_id};`
  | `remove {obj_id};`

To return the parent of an object (or nothing):

  | `parent({obj_id})`

To return the first child of an object (or nothing):

  | `child({obj_id})`

To return the adjacent child of an object's parent (or nothing):

  | `sibling({obj_id})`

To return the number of child objects directly below an object:

  | `children({obj_id})`

Message passing
===============

To a class:

  | `{class_id}.remaining()`
  | `{class_id}.create()`
  | `{class_id}.destroy({obj_id})`
  | `{class_id}.recreate({obj_id})`
  | `{class_id}.copy({to_obj_id},{from_obj_id})`

To an object:

  | `{obj_id.property(a1,a2, ... a7)}`

To a routine:

  | `{routine_id}.call({a1,a2, ... a7})`

To a string:

  | `{string}.print()`
  | `{string}.print_to_array({array})`

Uncommon and deprecated statements
==================================

To jump to a labelled statement:

  | `jump {label};`
  | `...`
  | `.{label}; {statement};`

To terminate the program:

  | `quit;`

To save and restore the program state:

  | `save {label};`
  | `...`
  | `restore {label};`

To output the Inform compiler version number:

  | `inversion;`

To accept data from the current input stream:

  | `read {text_array parse_array routine_id};`

To assign to one of 32 'low string' variables:

  | `string {N} "{string}";`
  | `Lowstring {string_var} "{string}";`
  | `string {N string_var};`

Statements
==========

Each `{statement}` is terminated by a semicolon "`;`".

A `{statement_block}` is a single `{statement}` or a series of
`{statements}` enclosed in braces ``{...}``.

An exclamation "`!`" starts a comment - the rest of the line is ignored.

A common statement is the assignment:

  | `{var_id} = {expr};`

There are two forms of multiple assignment:

  | `{var_id} = {var_id} = ... = {expr};`
  | `{var_id} = {expr}, {var_id} = {expr}, ... ;`

Routines
========

A routine can have up to 15 **local variables**: word values which are
private to the routine and which by default are set to zero on each call.

Recursion is permitted.

A **standalone** routine:

* has a name, by which it is called using `{routine_id}();` can also be
  called indirectly using `indirect({routine_id,a1,a2, ... a7})`

* can take arguments, using `{routine_id}({a1,a2, ... a7})`, whose values
  initialise the equivalent local variables

* returns `true` at the final "`]`"

  | `[ {routine_id}`
  |     `{local_var} {local_var}... {local_var};`
  |     `{statement};`
  |     `{statement};`
  |     `...`
  |     `{statement};`
  | `];`

A routine **embedded** as the value of an object property:

* has no name, and is called when the property is invoked; can also be
  called explicitly using `{obj_id.property}()`

* accepts arguments only when called explicitly

* returns `false` at the final "`]`"

  | `property [`
  |     `{local_var} {local_var}... {local_var};`
  |     `{statement};`
  |     `{statement};`
  |     `...`
  |     `{statement};`
  | `]`

Routines return a single value, when execution reaches the final "`]`" or
an explicit `return` statement:

  | `return {expr};`
  | `return;`
  | `rtrue;`
  | `rfalse;`

Flow control
============

To execute statements if `{expr}` is `true`; optionally, to execute other
statements if `{expr}` is `false`:

  | `if ({expr})`
  |     `{statement_block}`
  |
  | `if ({expr})`
  |     `{statement_block}`
  | `else`
  |     `{statement_block}`

To execute statements depending on the value of `{expr}`:

  | `switch ({expr}) {`
  |     `{value}: {statement};... {statement};`
  |     `{value}: {statement};... {statement};`
  |     `...`
  |     `default: {statement};... {statement};`
  | `}`

where each `{value}` can be given as:

  | `{constant}`
  | `{lo_constant} to {hi_constant}`
  | `{constant,constant,... constant}`

And, if you really must:

  | `jump {label};`
  | `...`
  | `.{label}; {statement};`

Loop control
============

To execute statements while `{expr}` is true:

  | `while ({expr})`
  |     `{statement_block}`

To execute statements until `{expr}` is true:

  | `do`
  |      `{statement_block}`
  |      `until ({expr})`

To execute statements while a variable changes:

  | `for ({set_var} : {loop_while_expr} : {update_var})`
  |     `{statement_block}`

To execute statements for all defined objects:

  | `objectloop ({var_id})`
  |     `{statement_block}`

To execute statements for all objects selected by `{expr}`:

  | `objectloop ({expr_starting_with_var})`
  |     `{statement_block}`

To jump out of the current innermost loop or switch:

  | `break;`

To immediately start the next iteration of the current loop:

  | `continue;`

Displaying information
======================

To output a list of values:

  | `print {value},{value},... {value};`

To output a list of values followed by a newline, then return `true` from
the current routine:

  | `print_ret {value},{value},... {value};`

If the first (or only) `{value}` is a string, "`print_ret`" can be
omitted:

  | `"{string}",{value}, ... {value};`

Each `{value}` can be an expression, a string or a rule.

An **expression** is output as a signed decimal value.

A **string** in quotes "`...`" is output as text.

A **rule** is one of:

  ========================    ===============================================
  `(number) {expr}`           the `{expr}` in words
  `(char) {expr}`             the `{expr}` as a single character
  `(string) {addr}`           the string at the `{addr}`
  `(address) {addr}`          the dictionary word at the `{addr}`
  `(name) {obj_id}`           the external (short) name of the `{obj_id}`
  `(a) {obj_id}`              the short name preceded by "`a/an`",
                              by "`some`", or by nothing for proper nouns
  `(A) {obj_id}`              the short name preceded by "`A/An`",
                              by "`Some`", or by nothing for proper nouns
  `(the) {obj_id}`            the short name preceded by "`the`"
  `(The) {obj_id}`            the short name preceded by "`The`"
  `({routine_id}){value}`     the output when calling `{routine_id}({value})`
  ========================    ===============================================

To output a newline character:

  | `new_line;`

To output multiple spaces:

  | `spaces {expr};`

To output text in a display box:

  | `box "{string}" "{string}"... "{string}";`

To change from regular to fixed-pitch font:

  | `font off;`
  | `...`
  | `font on;`

To change the font attributes:

  | `style bold;          ! use any of these`
  | `style underline;     !`
  | `style reverse;       !`
  | `...`
  | `style roman;`

Verbs and actions
=================

To specify a new verb:

  | `Verb '{verb}' '{verb}'... '{verb}'`
  |   `* {token} {token}... {token} -> {action}`
  |   `* {token} {token}... {token} -> {action}`
  |   `...`
  |   `* {token} {token}... {token} -> {action}`

where instead "`Verb`" can be "`Verb meta`", "`{action}`" can be "`{action
reverse}`"; `{tokens}` are optional and each is one of:

  ====================   ==================================================
  `'{word}'`             that literal word
  `'{w1}'/'{w2}'/...`    any one of those literal words
  `{attribute}`          an object with that attribute
  `creature`             an object with `animate` attribute
  `held`                 an object held by the player
  `noun`                 an object in scope
  `noun={routine_id}`    an object for which `{routine_id}` returns `true`
  `scope={routine_id}`   an object in this re-definition of scope
  `multiheld`            one or more objects held by the player
  `multi`                one or more objects in scope
  `multiexcept`          as `multi`, omitting the specified object
  `multiinside`          as `multi`, omitting those in specified object
  `topic`                any text
  `number`               any number
  `{routine_id}`         a general parsing routine
  ====================   ==================================================

To add synonyms to an existing verb:

  | `Verb '{verb}' '{verb}'... =`
  |     `'{existing_verb}';`

To modify an existing verb:

  | `Extend '{existing_verb}' last`
  |   `* {token} {token}... {token} -> {action}`
  |   `* {token} {token}... {token} -> {action}`
  |   `...`
  |   `* {token} {token}... {token} -> {action}`

where instead "`Extend`" can be "`Extend only`" and "`last`" can be
omitted, or changed to "`first`" or "`replace`".

To explicitly trigger a defined action (both `{noun}` and `{second}` are
optional, depending on the `{action}`):

  | `<{action noun second}>;`

To explicitly trigger a defined action, then return `true` from the current
routine:

  | `<<{action noun second}>>;`

Other useful directives
=======================

To set compiler switches *at the very start* of the source file:

  | `!% {list_of_compiler_switches};`

To include a directive within a routine definition `[...]`, insert a hash
"`#`" as its first character.

To conditionally compile:

  | `Ifdef {name};       ! use any one of these`
  | `Ifndef {name};      !`
  | `Iftrue {expr};      !`
  | `Iffalse {expr};     !`
  |    `...`
  | `Ifnot;`
  |    `...`
  | `Endif;`

To display a compile-time message:

  | `Message "{string}";`

To include the contents of a file, searching the Library path:

  | `Include "{source_file}";`

To include the contents of a file in the same location as the current
file:

  | `Include ">{source_file}";`

To specify that a library routine is to be replaced:

  | `Replace {routine_id};`

To set the game's release number (default is 1), serial number (default is
today's `{yymmdd}`) and status line format (default is `score`):

  | `Release {expr};`
  | `Serial "{yymmdd}";`
  | `Statusline score;`
  | `Statusline time;`

To declare a new attribute common to all objects:

  | `Attribute {attribute};`

To declare a new property common to all objects:

  | `Property {property};`
  | `Property {property expr};`

Uncommon and deprecated directives
==================================

You're unlikely to need these; look them up in the |DM4| if necessary.

  | `Abbreviate "{string}"... "{string}";`
  | `End;`
  | `Import {var_id var_id} ... {var_id};`
  | `Link "{compiled_file}";`
  | `Stub {routine_id N};`
  | `Switches {list_of_compiler_switches};`
  | `System_file;`
