#!/usr/bin/env python

import frontmatter, sys

print sys.argv[1]
post = frontmatter.load(sys.argv[1])
if post["section"] == "articles":
	sys.exit(0)
sys.exit(1)	
    