Inform Beginner's Guide
=======================

Introduction
------------

This repository contains the sources for the
[Inform Beginner's Guide](http://www.firthworks.com/roger/IBG.html),
henceforth known as the IBG.  This version is in a new source format that's
more version-control and contributor-friendly:
[Sphinx](http://sphinx-doc.org), a documentation build tool written in
[Python](http://python.org).  With Sphinx, the source files are in a very
readable format called
[reStructuredText](https://en.wikipedia.org/wiki/ReStructuredText).

This version of the IBG is a work-in-progress; see the
[issue tracker](https://github.com/i6/ibg/issues) for how it's going.
Initially it will be a straight conversion of the 3rd edition.  After that,
the 4th edition will be prepared.  The rationale for a 4th edition is:

* There have been quite a few updates to Inform and its support libraries
  in the time since 2004, when the 3rd edition was published.

* The nitty-gritty information about how to install and run programs goes
  stale pretty fast.

* Some old web links have gone away, to be replaced by new and better
  ones.

Building from source
--------------------

As well as these document sources, you will need:

* Sphinx.  You can find the complete installation instructions
  [here](http://www.sphinx-doc.org/en/stable/install.html).

* [Blockdiag](https://pypi.python.org/pypi/blockdiag) is used for some of
  the diagrams.

* To create the HTML version, you'll need a recent (>=0.7.8) version of the
  [Alabaster](https://pypi.python.org/pypi/alabaster) theme.

If you have `pip`, this command will be all you need:

    pip install -U sphinx blockdiag alabaster

After you have everything installed, you can build the HTML version of the
guide from a command prompt, like this:

	make html

For building the PDF version, you need a reasonably recent installation of
TeX Live.  Release 2014 will do.  You will also need the Emerald font
package from https://www.ctan.org/tex-archive/fonts/emerald/.  This cannot
be installed with `tlmgr`, nor does it seem to be packaged by the usual
Linux or BSD distributions.  Scripts for installing and uninstalling
Emerald are provided in the `tools` directory.  When you're ready, type
this:

	make latexpdf

Other formats are available; just type `make` for more details.

Conversion strategy
-------------------

The first three editions of the IBG were created with
[Adobe FrameMaker](http://www.adobe.com/products/framemaker.html).  And the
FrameMaker source files have kindly been supplied by Roger Firth to make
this update, which opened up the possibility of creating an auto-converter.

But unfortunately, what with FrameMaker being proprietary, there isn't much
out there apart from FrameMaker itself that can read them.  I was hoping
that conversion using [Mif2Go](http://mif2go.com) might be a possibility,
but it turns out that that's just a plugin for FrameMaker.  I guess I could
get a trial FrameMaker license, try to set up the plugin and get it to
autoconvert to some usable format, but it all looks far too messy.  But on
the plus side, the supplied GIF images are totally usable.

So, it's back to my original plan: use the PDF file.  Here's the first
(major) part of the work:

* Dump the text out of the PDF file
* Convert all the 3rd edition text to Sphinx format
* Get the online version to look good

After that comes the 4th edition changes, hopefully in collaboration with
others.  Also, in parallel with that, other niceties:

* Add a glossary
* Add an index
* Prepare a new PDF version, via the Sphinx LaTeX converter
