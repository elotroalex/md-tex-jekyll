#!/usr/bin/env python
from __future__ import print_function

from pandocfilters import toJSONFilter, RawInline, Cite, Para, Header, Str, RawBlock, elt, BlockQuote
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
	if key == 'Header' and fmt == 'context':
				
		style = value[1][1]

		if "red" in style:

			value[2]= [context("\color[red]{")]+value[2]+[context('}')]
		
		return Header(value[0], value[1], value[2])
	elif key == "BulletList":
		try: 
			for val in value:
				
				if val[0] and  'c' in val[0] and {   u'c': u'{.red}', u't': u'Str'} in val[0]['c']:
					val[0]['c'].remove({   u'c': u'{.red}', u't': u'Str'})
					val[0]['c']=[context("\color[red]{")]+val[0]['c']+[context('}')]
		except KeyError:
			warning("")

	elif key == 'BlockQuote':
		if "BulletList" in value[0]['t']:
			value.insert(0,RawBlock('context',"\\definesymbol[bigsquare][]\setupitemize[symbol=bigsquare]"))
			



		#kvs = {key: value for key, value in kvs}
		

		#if "fig:" in kvs['citationId'] or "tab:" in kvs['citationId']:
		#	return [context("\in[")]+[context(kvs['citationId'])] + [context(']')]
		#else:
		
		
		
			

	# if key == 'Header' and fmt == 'context':
	# 	#warning(key)
	# 	#warning(value)
	# 	[level, contents, kvs] = value
		
	# 	if level == 1 and contents == ['references',[],[]]:
	# 		return RawBlock('context', "\completepublications")

	


if __name__ == "__main__":
	toJSONFilter(mycite)