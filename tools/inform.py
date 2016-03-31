"""
Inform syntax highlighting.

TODO: get it working!
"""

from pygments.lexer import RegexLexer
from pygments.token import (Text, Comment, Operator, Keyword, Name,
                            String, Number, Punctuation, Token)

objects = ["Class", "Nearby", "Object"]

directives = ["Abbreviate", "Array", "Attribute", "Btrace", "Class",
              "Constant", "Default", "Dictionary", "End", "Endif", "Etrace",
              "Extend", "Fake_action", "Global", "Ifdef", "Iffalse",
              "Ifndef", "Ifnot", "Iftrue", "Ifv3", "Ifv5", "Import",
              "Include", "Link", "Listsymbols", "Listdict", "Listverbs",
              "Lowstring", "Ltrace", "Message", "Nearby", "Nobtrace",
              "Noetrace", "Noltrace", "Notrace", "Object", "Property",
              "Release", "Replace", "Serial", "Statusline", "Stub",
              "Switches", "System_file", "Trace", "Verb", "Version",
              "Zcharacter"]

defining = ["[", "array", "attribute", "class", "constant", "fake_action",
            "global", "lowstring", "nearby", "object", "property"]

attributes = ["absent", "animate", "clothing", "concealed", "container",
              "door", "edible", "enterable", "female", "general", "light",
              "lockable", "locked", "male", "moved", "neuter", "on", "open",
              "openable", "pluralname", "proper", "scenery", "scored",
              "static", "supporter", "switchable", "talkable", "transparent",
              "visited", "workflag", "worn"]

properties = ["n_to", "s_to", "e_to", "w_to", "ne_to", "se_to", "nw_to",
              "sw_to", "u_to", "d_to", "in_to", "out_to", "add_to_scope",
              "after", "article", "articles", "before", "cant_go", "capacity",
              "daemon", "describe", "description", "door_dir", "door_to",
              "each_turn", "found_in", "grammar", "initial",
              "inside_description", "invent", "life", "list_together",
              "name", "number", "orders", "parse_name", "plural",
              "react_after", "react_before", "short_name", "short_name_indef",
              "time_left", "time_out", "when_closed", "when_open", "when_on",
              "when_off", "with_key"]

keywords = ["box", "break", "continue", "do", "else", "font off", "font on",
            "for", "give", "has", "hasnt", "if", "in", "inversion", "jump",
            "move", "new_line", "notin", "objectloop", "ofclass", "or",
            "print", "print_ret", "provides", "quit", "read", "remove",
            "restore", "return", "rfalse", "rtrue", "save", "spaces",
            "string", "style bold", "style fixed", "style reverse",
            "style roman", "style underline", "switch", "to", "until",
            "while"]

action_re = r"\s-*\*"

def wordlist(list):
    return "(" + "|".join(list) + r")\b"

class InformLexer(RegexLexer):
    """
    Inform code lexer.
    """

    name = 'Inform'
    aliases = ['inform']
    filenames = ['*.inf']
    mimetypes = ['text/x-inform', 'application/x-inform']

    tokens = {
        'root': [
            (r'\n', Text),
            (r'[^\S\n]+', Text),
            (r'!.*$', Comment.Single),
            (r'\\\n', Text),
            (r'\\', Text),
            (r'=', Operator),
            (r'"[^"]*"', String.Double),
            (r"'[^']*'", String.Single),
            (r"\S+:", Name.Label),
            (r"<<.+>>", Name.Label),

            (wordlist(objects), Name.Class),
            (wordlist(keywords), Token.Keyword.Reserved),
            (wordlist(properties), Name.Builtin),
            (wordlist(directives), Name.Entity),
            (wordlist(attributes), Name.Attribute),

            (r'[a-zA-Z_][a-zA-Z0-9_.]*', Name),
            (r'(\d+\.?\d*|\d*\.\d+)([eE][+-]?[0-9]+)?', Number.Float),
            (r'\d+', Number.Integer),

            (r'.', Punctuation),
        ],
    }
