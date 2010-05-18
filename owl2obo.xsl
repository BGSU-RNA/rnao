<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:obo="http://purl.obolibrary.org/obo/"
		xmlns:dc="http://purl.org/dc/elements/1.1/"
		xmlns:owl="http://www.w3.org/2002/07/owl#"
		xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
		xmlns:roc="http://roc.bgsu.edu/">
  <xsl:output method="text"/>

  <xsl:template match="/">
    <xsl:text>format-version: 1.2

</xsl:text>
    <xsl:apply-templates select="rdf:RDF/owl:Class"/>
    <xsl:apply-templates select="rdf:RDF/owl:ObjectProperty"/>

  </xsl:template>

  <!-- entities -->
  <xsl:template match="owl:Class[@rdf:about]">
    <xsl:text>

[Term]
</xsl:text>
    <xsl:text>id: </xsl:text><xsl:value-of select="roc:owlid2oboid(@rdf:about)"/>
    <xsl:apply-templates select="rdfs:label"/>
    <xsl:apply-templates select="dc:description"/>
    <xsl:apply-templates select="rdfs:subClassOf"/>
  </xsl:template>

  <!-- relations -->
  <xsl:template match="owl:ObjectProperty">
    <xsl:text>

[Typedef]
</xsl:text>
    <xsl:text>id: </xsl:text><xsl:value-of select="roc:owlid2oboid(@rdf:about)"/>
    <xsl:apply-templates select="rdfs:label"/>
    <xsl:apply-templates select="rdfs:subPropertyOf"/>
    <xsl:apply-templates select="owl:inverseOf"/>
    <xsl:apply-templates select="rdf:type"/>
    <xsl:apply-templates select="rdfs:range"/>
    <xsl:apply-templates select="rdfs:domain"/>
  </xsl:template>

  <xsl:template match="rdfs:label">
    <xsl:text>
name: </xsl:text><xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="rdfs:subPropertyOf">
    <xsl:text>
is_a: </xsl:text><xsl:value-of select="roc:owlid2oboid(@rdf:resource)"/>
  </xsl:template>

  <xsl:template match="owl:inverseOf">
    <xsl:text>
inverse_of: </xsl:text><xsl:value-of select="roc:owlid2oboid(@rdf:resource)"/>
  </xsl:template>

  <xsl:template match="rdf:type">
    <xsl:choose>
      <xsl:when test="matches(@rdf:resource,'FunctionalProperty')">
	<xsl:text>
is_functional: true</xsl:text>
      </xsl:when>
      <xsl:when test="matches(@rdf:resource,'SymmetricProperty')">
	<xsl:text>
is_symmetric: true</xsl:text>
      </xsl:when>
      <xsl:when test="matches(@rdf:resource,'TransitiveProperty')">
	<xsl:text>
is_transitive: true</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <!-- contains test for class unions: only lets through simple domains -->
  <xsl:template match="rdfs:domain">
    <xsl:if test="@rdf:resource">
      <xsl:text>
domain: </xsl:text><xsl:value-of select="roc:owlid2oboid(@rdf:resource)"/>
    </xsl:if>
  </xsl:template>

  <!-- contains test for class unions: only lets through simple ranges -->
  <xsl:template match="rdfs:range">
    <xsl:if test="@rdf:resource">
      <xsl:text>
range: </xsl:text><xsl:value-of select="roc:owlid2oboid(@rdf:resource)"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="dc:description">
    <xsl:text>
def: &#x22;</xsl:text><xsl:value-of select="normalize-space(.)"/>
    <xsl:text>&#x22; [RNAO:ROC]</xsl:text>
  </xsl:template>

  <xsl:template match="rdfs:subClassOf[@rdf:resource]">
    <xsl:text>
is_a: </xsl:text><xsl:value-of select="roc:owlid2oboid(@rdf:resource)"/>
  </xsl:template>

  <xsl:template match="rdfs:subClassOf[owl:Class]"/>
  <xsl:template match="rdfs:subClassOf[owl:Restriction/owl:allValuesFrom]"/>
  <xsl:template match="rdfs:subClassOf[owl:Restriction/owl:someValuesFrom/owl:Class]"/>
  <xsl:template match="rdfs:subClassOf[owl:Restriction/not(owl:allValuesFrom) and not(descendant::owl:Class)]">
    <xsl:text>
relationship: </xsl:text>
    <xsl:apply-templates select="owl:Restriction"/>
  </xsl:template>

  <xsl:template match="owl:Restriction[not(descendant::owl:Class)]">
    <xsl:value-of select="roc:owlid2oboid(owl:onProperty/@rdf:resource)"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="roc:owlid2oboid(owl:someValuesFrom/@rdf:resource)"/>
    <xsl:value-of select="roc:owlid2oboid(owl:onClass/@rdf:resource)"/>
  </xsl:template>

  <xsl:template match="owl:disjointWith">
    <xsl:text>
disjoint_from: </xsl:text><xsl:value-of select="roc:owlid2oboid(@rdf:resource)"/>
  </xsl:template>

  <!-- functions -->
  <xsl:function name="roc:owlid2oboid">
    <xsl:param name="id"/>
    <xsl:value-of select="replace(replace($id,'[^/]*/',''),'([A-Z])_([0-9])','$1:$2')"/>
  </xsl:function>

</xsl:stylesheet>
