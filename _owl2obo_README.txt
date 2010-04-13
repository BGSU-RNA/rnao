You will need an XSLT2-compatible XSL transformation engine for this, 
for example Saxon.

http://sourceforge.net/projects/saxon/files/

The output .obo file (OBO Format 1.2) is compatible with OBOEdit 2.1.

http://www.geneontology.org/GO.format.obo-1_2.shtml

Because of some limitations of OBO format and OBOEdit, not all of the
OWL file can be translated.  Exceptions include:

* cannot express that relations (=object properties) are disjoint
* will only ever have limited support for cross-products (=equivalent
  classes)
* cannot handle collections
* only supports single-class ranges and domains

Because we can't guarantee that every IAO_0000115 element (definition)
has an IAO_0000117 element (source) to go with it, the output has
defaulted to RNAO:ROC for each definition source.

Does not yet handle comment:s or intersection_of:s.

Colin Batchelor, 13th April 2010.