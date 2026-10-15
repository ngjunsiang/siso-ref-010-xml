<?xml version="1.0"?>
<!--
Copyright (c) 2011, 2013, 2018-2020 by the Simulation Interoperability Standards Organization, Inc.

7901 4th St N, Suite 300-4043
St. Petersburg, FL 33702
All rights reserved.

This document is an approved product of Simulation Interoperability
Standards Organization (SISO), Inc. and therefore the copyright of this
document belongs to SISO, Inc. Permission is hereby granted for this
document to be used for production of both commercial and non-commercial
products. Removal of this copyright statement and claiming rights to
this document is prohibited. In addition, permission is hereby granted
for this document to be distributed in its original or modified format
(e.g. as part of a database; however, modification does not imply to the
content of this document) provided that no charge is invoked for the
provision. Permission is hereby granted by SISO for modification and
extension of products produced from this document providing that SISO's
copyright is acknowledged on the products developed.

SISO EXCOM
7901 4th St N, Suite 300-4043
St. Petersburg, FL 33702


  @file siso-ref-010-c99h.xsl
  Transform EBV-MR XML data file into C99 Header (.h) file
  v2.0 12 Apr 2018
  updated by David Ronnfeldt <david.ronnfeldt2@defence.gov.au>
  v3.0 29 August 2018 <cr03793>
  updated by David Ronnfeldt <david.ronnfeldt2@defence.gov.au> 
  @author Peter Ross <peter.ross@dsto.defence.gov.au>
  
  v4.0 09 April 2020 <cr04302>
  updated by david.ronnfeldt.com.au

-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:e="http://www.sisostds.org/schemas/SISO-REF-010/2.7" version="1.0">
  <xsl:output method="text" encoding="utf-8" media-type="text/plain"/>
  <xsl:template match="e:ebv">
    <xsl:text>/*!&#xA;</xsl:text>
    <xsl:text> * \file    siso-ref-010.h&#xA;</xsl:text>
    <xsl:text> * \brief   </xsl:text><xsl:value-of select="@description"/><xsl:text>&#xA;</xsl:text>
    <xsl:text> * \version </xsl:text><xsl:value-of select="@title"/><xsl:text> - </xsl:text><xsl:value-of select="@release"/><xsl:text>&#xA;</xsl:text>
    <xsl:text> * \date    </xsl:text><xsl:value-of select="@date"/><xsl:text>&#xA;</xsl:text>
    <xsl:text> * \author  </xsl:text><xsl:value-of select="@organisation"/><xsl:text>&#xA;</xsl:text>
    <xsl:text> */&#xA;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
    <xsl:text>#ifndef SISO_REF_010_H&#xA;</xsl:text>
    <xsl:text>#define SISO_REF_010_H&#xA;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
    <xsl:text>/*! for each enumeration table, declare its Unique Identifiers (UID). */&#xA;</xsl:text>
    <xsl:text>enum {&#xA;</xsl:text>
    <xsl:apply-templates match="*"/>
    <xsl:text>};&#xA;</xsl:text>
    <xsl:text>&#xA;</xsl:text>
    <xsl:text>#endif /* SISO_REF_010_H */&#xA;</xsl:text>
  </xsl:template>
  <xsl:template match="e:revisions|e:dict|e:enum|e:bitfield|e:cet|e:cot|e:record|e:jammer_technique">
    <xsl:text>    </xsl:text>
    <xsl:value-of select="translate(concat(name(current()),'_',@name), ' !&quot;#$%&amp;()*+,-./:;&lt;=&gt;?@[\]^`abcdefghijklmnopqrstuvwxyz{|}~', '___________________________ABCDEFGHIJKLMNOPQRSTUVWXYZ____')"/>
    <xsl:text> = </xsl:text>
    <xsl:value-of select="@uid"/>
    <xsl:if test="position()!=last()">
      <xsl:text>,</xsl:text>
    </xsl:if>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>
  <xsl:template match="text()"/>
</xsl:stylesheet>
