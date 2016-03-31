"""
IF transcript syntax highlighting.
"""

import re

from pygments.lexer import RegexLexer
from pygments.token import Generic, Text

class TranscriptLexer(RegexLexer):
    """
    IF transcript lexer.
    """

    name = 'Interactive Fiction transcript'
    aliases = ['transcript']
    filenames = ['*.scr']
    mimetypes = ['text/x-scr', 'application/x-scr']

    tokens = {
        'root': [
            (r'\n', Text),
            (r'^[^>].*', Text),
            (r'^>', Text, 'command'),
        ],
        'command': [
            (r'.*', Generic.Strong, '#pop'),
        ],
    }
