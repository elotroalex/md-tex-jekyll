#!/usr/bin/env python
from __future__ import print_function

from pandocfilters import toJSONFilter, RawInline, Cite, Para, Header, Str, RawBlock
import os, sys, pprint



"""
Pandoc filter that causes citations to be rendered in Context mkiv bib style
as per: http://modules.contextgarden.net/dl/bibmod-doc/doc/context/bib/bibmod-doc.pdf
and http://tex.stackexchange.com/questions/213372/where-to-find-a-comprehensive-overview-of-the-features-of-the-context-cite-comma

"""

def warning(*objs):
	pp = pprint.PrettyPrinter(indent=4, stream=sys.stderr)
	pp.pprint(*objs)

def context(s):
	return RawInline('context', s)


def mycite(key, value, fmt, meta):		
	if key == 'Cite' and fmt == 'context':
		
		
		kvs = value[0][0]

		warning(kvs)
		#kvs = {key: value for key, value in kvs}
		

		#if "fig:" in kvs['citationId'] or "tab:" in kvs['citationId']:
		#	return [context("\in[")]+[context(kvs['citationId'])] + [context(']')]
		#else:
		
		return [context("\\cite[")] +[context(kvs['citationId'])] + [context(']')]
		
			

	# if key == 'Header' and fmt == 'context':
	# 	#warning(key)
	# 	#warning(value)
	# 	[level, contents, kvs] = value
		
	# 	if level == 1 and contents == ['references',[],[]]:
	# 		return RawBlock('context', "\completepublications")

	


if __name__ == "__main__":
	toJSONFilter(mycite)