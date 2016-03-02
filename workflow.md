# Intended workflow for the MD conversions

## Journal general components:
    <!-- these parts can be automated for all issues -->
    * Automatically generated: cloneThisIssue.md
        * Instructions of how to pull issue from github and compile
        * Instructions of how to make a pull request to the issue to fix problems (let's embrace OSS after all?)
    * CC-By 4.0 License
    * Credits page
    * Link to Small Axe Project
    * Search box? (a huge maybe there)
        * We can do JS search box in pdf... 
        * for jekyll we would use elastic LUNR or LUNR => pain
    * General colophon

## Journal issue organisation:

* A cover (Title + Art + Fork me on github ribbon, Frontispice) 
* Colophon (containing all items in section "Journal general components")
* Table of Contents (Automatic)
* Table of Floats (Figures + iframes (youtube/soundcloud) + Tables) (Automatic)
* **An introduction**
* **5-6 Articles**
* **1-2 Project reviews**
* **A peer-reviewed, profiled DH project**
* A link to the github repo containing the journal issue
* Cite me (instructions on citation)
* A back-sheet

## Original Files

Editors will provide:

* An introduction and para-text for that issue:
    * introduction.md
    * acknowledgements.md

Authors will deliver to us:

* A zipped directory containing:
    * article.md
    * Images/
        * A folder with all images to be included.
    * Optional: bibliography.bib and .csl file
* Editors then add a short title to the .md, a reference (in case of cross referencing), and mint a DOI
    * These data are added to the article.md YAML



# Unit Tests

The steps carried out to verify all components are working and edge cases are covered.

Step #1: 
Step #2:
Step #3: 
Step #4:
Step #5: 

## MD -> ConTeXt (article)

* For each directory in unitTestMarkdowns/:
  * copy "nominal" directory from unitTestMarkdowns/$dir into ConTeXtUnitTestOutput/$dir
  * copy env_journal.tex into ConTeXtUnitTestOutput/$dir
  * For each *.md file in /$dir:
    * run ConTeXt/convert.sh on $file
      * Run pandoc on $file:
        * From format: Markdown
        * To format: Context
        * Apply template ConTtt/template.unitTest
        * apply filter pandoc-citeproc
        * Apply filter ConTeXt/contextStyles.py
        * Write $file.tex in same directory.
      * Run ConTeXt on $file
      * Run system pdf viewer on $file and cause logs to show in sublime text

  

  
## MD -> Jekyll (article)

* For each directory in unitTestMarkdowns/:
  * copy "nominal" directory from unitTestMarkdowns/$dir into JekyllUnitTestOutput/$dir
  * if $filename.pdf exists in ConTeXtUnitTestOutput/$dir
      * copy $filename.pdf into ???
    * else:
      * copy poetry.pdf from sandbox into ???
  * For each *.md file in /$dir:
    * run Jekyll/convert.sh on $file
      * Run pandoc on $file:
        * From format: Markdown
        * To format: Markdown
        * apply filter pandoc-citeproc
        * Write yyyy-mm-dd-output.md in JekyllUnitTestOutput/$dir/Jekyll/_posts/ directory
    * run a jekyll serve and log

## MD -> ??? (what's the third bit?)
Not worried about this right now. This may be an XML conversion from the original MD


# Production

The steps carried out during "production"

## Create Issue full process