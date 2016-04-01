Inform Beginner's Guide
=======================

Introduction
------------

This repository contains the sources for the
[Inform Beginner's Guide](http://www.firthworks.com/roger/IBG.html),
henceforth known as the IBG.  This version is in a new source format that's
more contributor-friendly (see below).  It's a work-in-progress; see the
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

The new source format is [Sphinx](http://sphinx-doc.org), a documentation
build tool written in [Python](http://python.org), which you will need to
install if you want to build the document.  You can find the complete
installation instructions
[here](http://www.sphinx-doc.org/en/stable/install.html).

After you have Sphinx installed, you can build the HTML version of the
guide from a command prompt, like this:

	make html

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
