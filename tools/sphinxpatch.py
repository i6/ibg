"""
Various monkey-patches for sphinx.
"""

# Tweak Sphinx domain option regexp to add ~ for Inform options.
import re
import sphinx.domains.std as std

std.option_desc_re = re.compile(r'((?:/|--|-|\+)?[-?@~#_a-zA-Z0-9]+)(=?\s*.*)')

