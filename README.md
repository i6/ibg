Inform Beginner's Guide
=======================

Introduction
------------

This repository contains the sources for an updated version of the
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

If you want a preview of how the online HTML version of the new guide
looks, you can find it [here](http://inform-beginners-guide.readthedocs.org).

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

For building the PDF version, you need a reasonably recent installation 
of TeX Live.  Release 2014 will do.  You will also need the iftex 
package, which may or may not be automatically installed.  For Debian 
and Debian-derived systems, the "texlive-generic-extra" package will 
take care of this.

You will also need the Emerald font package from 
https://www.ctan.org/tex-archive/fonts/emerald/.  This cannot be 
installed with `tlmgr`, nor does it seem to be packaged by the usual 
Linux or BSD distributions.  Scripts for installing and uninstalling 
Emerald are provided in the `tools` directory.  When you're ready, type 
this:

	make latexpdf

Other formats are available; just type `make` for more details.
