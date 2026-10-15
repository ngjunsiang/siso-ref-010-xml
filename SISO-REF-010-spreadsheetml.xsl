<?xml version="1.0"?>
<!--
Copyright (c) 2011, 2013, 2017-2020, 2022 by the Simulation Interoperability Standards Organization, Inc.

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

  @file siso-ref-010-spreadsheetml.xsl
  Transform EBV-MR XML data file into SpreadsheetML file (Microsoft Excel compatibile)
  v3.0 - 12 Apr 2018
  update by David Ronnfeldt <david.ronnfeldt2@defence.gov.au>
  @author Peter Ross <peter.ross@dsto.defence.gov.au>
  
  v4.0 - 09 April 2020 <cr04302>
  update by david.ronnfeldt2@defence.gov.au
  
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40" xmlns:e="http://www.sisostds.org/schemas/SISO-REF-010/2.7" exclude-result-prefixes="e" version="1.0">
  <xsl:output method="xml" version="1.0" encoding="utf-8" standalone="yes" media-type="application/vnd.ms-excel"/>
  <xsl:template match="e:ebv">
    <xsl:processing-instruction name="mso-application">progid="Excel.Sheet"</xsl:processing-instruction>
    <Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:html="http://www.w3.org/TR/REC-html40">
      <o:DocumentProperties>
        <o:Title>
          <xsl:value-of select="@title"/>
        </o:Title>
        <o:Subject>
          <xsl:value-of select="@description"/>
        </o:Subject>
        <o:Company>
          <xsl:value-of select="@organisation"/>
        </o:Company>
        <o:Created>
          <xsl:value-of select="@date"/>
          <xsl:text>T00:00:00Z</xsl:text>
        </o:Created>
      </o:DocumentProperties>
      <o:CustomDocumentProperties>
        <o:Document_x0020_number dt:dt="string">
          <xsl:value-of select="@title"/>
        </o:Document_x0020_number>
        <o:Status dt:dt="string">
          <xsl:value-of select="@release"/>
        </o:Status>
        <o:Reference dt:dt="string">
          <xsl:value-of select="@href"/>
        </o:Reference>
      </o:CustomDocumentProperties>
      <Styles>
        <Style ss:ID="banner">
          <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
          <Font x:Family="Swiss" ss:Size="12" ss:Bold="1"/>
          <Interior ss:Color="#FF99CC" ss:Pattern="Solid"/>
        </Style>
        <Style ss:ID="heading">
          <Font x:Family="Swiss" ss:Bold="1"/>
          <Interior ss:Color="#CCFFCC" ss:Pattern="Solid"/>
        </Style>
        <Style ss:ID="hyperlink">
          <Font ss:Color="#0000FF" ss:Underline="Single"/>
        </Style>
        <Style ss:ID="valigncenter">
          <Alignment ss:Vertical="Center"/>
        </Style>
        <Style ss:ID="valigncenterwraptext">
          <Alignment ss:Vertical="Center" ss:WrapText="1"/>
        </Style>
        <Style ss:ID="deprecated">
          <Font ss:StrikeThrough="1"/>
        </Style>
		<Style ss:ID="status">
			<Font ss:Color="#FF0000"/>
		</Style>
        <Style ss:ID="hold">
          <Font ss:Color="#FF33EC"/>		
        </Style>
		<Style ss:ID="pending">
			<Font ss:Color="#C65911"/>
		</Style>
		<Style ss:ID="future">
			<Font ss:Color="#33FFCA"/>
		</Style>
		<Style ss:ID="Retired">
			<Font ss:Italic="1"/>
	    </Style>
      </Styles>
      <Worksheet ss:Name="Index">
        <Table ss:ExpandedColumnCount="4" x:FullColumns="1" x:FullRows="1">
          <Column ss:Width="50"/>
          <Column ss:Width="100"/>
          <Column ss:Width="350"/>
          <Column ss:Width="80"/>
          <Row ss:AutoFitHeight="0" ss:Height="32">
            <Cell ss:MergeAcross="3" ss:StyleID="banner">
              <Data ss:Type="String"><xsl:value-of select="@description"/></Data>
            </Cell>
          </Row>
          <Row ss:AutoFitHeight="0" ss:Height="20">
            <Cell ss:MergeAcross="3" ss:StyleID="banner">
              <Data ss:Type="String">
                <xsl:value-of select="@organisation"/>
              </Data>
            </Cell>
          </Row>
          <Row ss:AutoFitHeight="0" ss:Height="20">
            <Cell ss:MergeAcross="3" ss:StyleID="banner">
              <Data ss:Type="String">Title: <xsl:value-of select="@title"/>, Release: <xsl:value-of select="@release"/>, Date: <xsl:value-of select="@date"/>
            </Data>
            </Cell>
          </Row>
          <Row ss:AutoFitHeight="0"  ss:Height="138">
            <Cell ss:MergeAcross="3" ss:StyleID="valigncenterwraptext">
              <Data ss:Type="String"><xsl:value-of select="e:copyright"/></Data>
            </Cell>
          </Row>
          <Row>
          </Row>
          <Row>
            <Cell ss:StyleID="heading">
              <Data ss:Type="String">UID</Data>
            </Cell>
            <Cell ss:StyleID="heading">
              <Data ss:Type="String">Type</Data>
            </Cell>
            <Cell ss:StyleID="heading">
              <Data ss:Type="String">Name</Data>
            </Cell>
            <Cell ss:StyleID="heading">
              <Data ss:Type="String">CR</Data>
            </Cell>
          </Row>
          <xsl:apply-templates mode="index"/>
        </Table>
        <x:WorksheetOptions>
          <x:Selected/>
          <x:TabColorIndex>42</x:TabColorIndex>
        </x:WorksheetOptions>
        <AutoFilter xmlns="urn:schemas-microsoft-com:office:excel" x:Range="R6C1:R6C4"/>
      </Worksheet>
      <xsl:apply-templates mode="body"/>
    </Workbook>
  </xsl:template>
  <!--=== Index ===-->
  <xsl:template match="e:dict|e:enum|e:bitfield|e:cet|e:cot|e:record|e:jammer_technique" mode="index">
    <Row>
      <Cell ss:StyleID="hyperlink">
        <xsl:attribute name="ss:HRef">
          <xsl:value-of select="concat('#',@uid,'!A1')"/>
        </xsl:attribute>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="local-name(.)"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@name"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
  </xsl:template>
  <!--=== Revisions ===-->
  <xsl:template match="e:revisions" mode="body">
    <Worksheet ss:Name="Revisions">
      <Table ss:ExpandedColumnCount="4" ss:ExpandedRowCount="{count(e:revision)+2}" x:FullColumns="1" x:FullRows="1">
        <Column ss:Width="100"/>
        <Column ss:Width="100"/>
        <Column ss:Width="200"/>
        <Column ss:Width="200"/>
        <xsl:call-template name="tableheader">
          <xsl:with-param name="columns" select="4"/>
        </xsl:call-template>
        <Row>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Document Number</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Publication Date</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Change Requests Incorporated</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">UUID</Data>
          </Cell>
        </Row>
        <xsl:apply-templates select="e:revision"/>
      </Table>
      <x:WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
        <TabColorIndex>42</TabColorIndex>
        <FreezePanes/>
        <SplitHorizontal>2</SplitHorizontal>
        <TopRowBottomPane>2</TopRowBottomPane>
        <ActivePane>2</ActivePane>
      </x:WorksheetOptions>
    </Worksheet>
  </xsl:template>
  <xsl:template match="e:revision">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@title"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@date"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
    </Row>
  </xsl:template>
  <!--=== CRs ===-->
  <xsl:template match="e:cr" mode="cr">
     <xsl:value-of select="@value"/>
     <xsl:if test="position()!=last()">
         <xsl:text>, </xsl:text>
     </xsl:if>
  </xsl:template>
  <xsl:template match="e:cr_range" mode="cr">
     <xsl:value-of select="@value_min"/><xsl:text>-</xsl:text><xsl:value-of select="@value_max"/>
     <xsl:if test="position()!=last()">
         <xsl:text>, </xsl:text>
     </xsl:if>
  </xsl:template>
  <!--=== Dictionary (e.g. Acronyms) ===-->
  <xsl:template match="e:dict" mode="body">
    <Worksheet>
      <xsl:attribute name="ss:Name">
        <xsl:value-of select="@uid"/>
      </xsl:attribute>
      <Table ss:ExpandedColumnCount="4" ss:ExpandedRowCount="{count(e:dictrow)+2}" x:FullColumns="1" x:FullRows="1">
        <Column ss:Width="50"/>
        <Column ss:Width="250"/>
        <Column ss:Width="200"/>
        <Column ss:Width="80"/>
        <xsl:call-template name="tableheader">
          <xsl:with-param name="columns" select="4"/>
        </xsl:call-template>
        <Row>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Value</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Description</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">UUID</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">CR</Data>
          </Cell>
        </Row>
        <xsl:apply-templates select="e:dictrow"/>
      </Table>
      <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
        <FreezePanes/>
        <SplitHorizontal>2</SplitHorizontal>
        <TopRowBottomPane>2</TopRowBottomPane>
        <ActivePane>2</ActivePane>
      </WorksheetOptions>
      <AutoFilter xmlns="urn:schemas-microsoft-com:office:excel" x:Range="R2C1:R2C4"/>
    </Worksheet>
  </xsl:template>
  <xsl:template match="e:dictrow">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@value"/>
        </Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
  </xsl:template>
  <!--=== Enum ===-->
  <xsl:template match="e:enum" mode="body">
    <Worksheet>
      <xsl:attribute name="ss:Name">
        <xsl:value-of select="@uid"/>
      </xsl:attribute>
      <Table ss:ExpandedColumnCount="{6 + count(e:header/e:col)}" ss:ExpandedRowCount="{count(e:enumrow)+count(e:enumrow_range)+2}" x:FullColumns="1" x:FullRows="1">
        <Column ss:Width="50"/>
        <Column ss:Width="50"/>
        <Column ss:Width="250"/>
        <Column ss:Width="200"/>
        <xsl:if test="@group">
          <Column ss:Width="50"/>
        </xsl:if>
        <Column ss:Width="80"/>
        <xsl:call-template name="tableheader">
          <xsl:with-param name="columns" select="5+number(boolean(@group))"/>
        </xsl:call-template>
        <Row>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Value1</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Value2</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Description</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">UUID</Data>
          </Cell>
          <xsl:if test="@group">
			<Cell ss:StyleID="heading">
				<Data ss:Type="String">Group</Data>
			</Cell>
          </xsl:if>
          <xsl:apply-templates select="e:header"/>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">CR</Data>
          </Cell>
        </Row>
        <xsl:apply-templates select="e:enumrow|e:enumrow_range"/>
      </Table>
      <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
        <FreezePanes/>
        <SplitHorizontal>2</SplitHorizontal>
        <TopRowBottomPane>2</TopRowBottomPane>
        <ActivePane>2</ActivePane>
      </WorksheetOptions>
      <AutoFilter xmlns="urn:schemas-microsoft-com:office:excel" x:Range="{concat('R2C1:R2C',5+number(boolean(@group)))}"/>
    </Worksheet>
  </xsl:template>
  <xsl:template match="e:header">
    <xsl:apply-templates select="e:col"/>
  </xsl:template>
  <xsl:template match="e:col">
    <Cell ss:StyleID="heading">
      <Data ss:Type="String">
        <xsl:value-of select="@name"/>
      </Data>
    </Cell>
  </xsl:template>
  <xsl:template match="e:enumrow|e:enumrow_range">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:choose>
            <xsl:when test="@value">
              <xsl:value-of select="@value"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@value_min"/>
            </xsl:otherwise>
          </xsl:choose>
        </Data>
      </Cell>
      <Cell>
        <xsl:if test="@value_max">
          <Data ss:Type="Number">
            <xsl:value-of select="@value_max"/>
          </Data>
        </xsl:if>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <xsl:if test="@group">
		  <Cell>
			  <Data ss:Type="Number">
				<xsl:value-of select="@group"/>
			  </Data>
		  </Cell>
      </xsl:if>
      <xsl:if test="../e:header">
        <xsl:variable name="tmpnode" select="."/>
        <xsl:for-each select="../e:header/e:col">
          <xsl:variable name="tmpkey" select="@key"/>
          <Cell>
            <Data ss:Type="String">
              <xsl:value-of select="$tmpnode/e:meta[@key=$tmpkey]/@value"/>
            </Data>
          </Cell>
        </xsl:for-each>
      </xsl:if>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
  </xsl:template>
  <!--=== Bitmask ===-->
  <xsl:template match="e:bitfield" mode="body">
    <Worksheet>
      <xsl:attribute name="ss:Name">
        <xsl:value-of select="@uid"/>
      </xsl:attribute>
      <Table ss:ExpandedColumnCount="7" ss:ExpandedRowCount="{count(e:bitfieldrow)+count(e:bitfieldrow_range)+2}" x:FullColumns="1" x:FullRows="1">
        <Column ss:Width="100"/>
        <Column ss:Width="50"/>
        <Column ss:Width="50"/>
        <Column ss:Width="50"/>
        <Column ss:Width="200"/>
        <Column ss:Width="200"/>
        <Column ss:Width="80"/>
        <xsl:call-template name="tableheader">
          <xsl:with-param name="columns" select="7"/>
        </xsl:call-template>
        <Row>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Name</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Position</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Length</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Enum UID</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Purpose</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">UUID</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">CR</Data>
          </Cell>
        </Row>
        <xsl:apply-templates select="e:bitfieldrow|e:bitfieldrow_range"/>
      </Table>
      <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
        <FreezePanes/>
        <SplitHorizontal>2</SplitHorizontal>
        <TopRowBottomPane>2</TopRowBottomPane>
        <ActivePane>2</ActivePane>
      </WorksheetOptions>
      <AutoFilter xmlns="urn:schemas-microsoft-com:office:excel" x:Range="R2C1:R2C7"/>
    </Worksheet>
  </xsl:template>
  <xsl:template match="e:bitfieldrow|e:bitfieldrow_range">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@name"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@bit_position"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:choose>
            <xsl:when test="@length">
              <xsl:value-of select="@length"/>
            </xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
          </xsl:choose>
        </Data>
      </Cell>
      <Cell>
        <xsl:if test="@xref">
          <xsl:attribute name="ss:StyleID">hyperlink</xsl:attribute>
          <xsl:attribute name="ss:HRef">
            <xsl:value-of select="concat('#',@xref,'!A1')"/>
          </xsl:attribute>
          <Data ss:Type="Number">
            <xsl:value-of select="@xref"/>
          </Data>
        </xsl:if>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
  </xsl:template>
  <!--=== CET ===-->
  <xsl:template match="e:cet" mode="body">
    <Worksheet>
      <xsl:attribute name="ss:Name">
        <xsl:value-of select="@uid"/>
      </xsl:attribute>
      <Table ss:ExpandedColumnCount="12" x:FullColumns="1" x:FullRows="1">
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="250"/>
        <Column ss:Width="200"/>
        <Column ss:Width="50"/>
        <Column ss:Width="80"/>
        <xsl:call-template name="tableheader">
          <xsl:with-param name="columns" select="11"/>
        </xsl:call-template>
        <Row>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Kind</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Domain</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Country</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Category</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Subcategory</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Specific</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Extra</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Description</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">UUID</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">UID</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">CR</Data>
          </Cell>
        </Row>
        <xsl:apply-templates/>
      </Table>
      <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
        <FreezePanes/>
        <SplitHorizontal>2</SplitHorizontal>
        <TopRowBottomPane>2</TopRowBottomPane>
        <ActivePane>2</ActivePane>
      </WorksheetOptions>
      <AutoFilter xmlns="urn:schemas-microsoft-com:office:excel" x:Range="R2C1:R2C11"/>
    </Worksheet>
  </xsl:template>
  <xsl:template match="e:entity">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="e:category">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@country"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="e:category_range">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@country"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@value_min"/>..<xsl:value-of select="@value_max"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="e:subcategory">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@country"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="e:subcategory_xref">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@country"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@value"/>
        </Data>
      </Cell>
      <Cell ss:StyleID="hyperlink">
        <xsl:attribute name="ss:HRef">
          <xsl:value-of select="concat('#',@xref,'!A1')"/>
        </xsl:attribute>
        <Data ss:Type="String">X (#<xsl:value-of select="@xref"/>)</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="e:subcategory_range">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@country"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@value_min"/>..<xsl:value-of select="@value_max"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="e:specific">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../@country"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="e:specific_range">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../@country"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@value_min"/>..<xsl:value-of select="@value_max"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="e:extra">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../../@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../../@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../../@country"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@value"/>
        </Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="e:extra_range">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../../@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../../@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../../@country"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@value_min"/>..<xsl:value-of select="@value_max"/>
        </Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates/>
  </xsl:template>
  <!--=== COT ===-->
  <xsl:template match="e:cot" mode="body">
    <Worksheet>
      <xsl:attribute name="ss:Name">
        <xsl:value-of select="@uid"/>
      </xsl:attribute>
      <Table ss:ExpandedColumnCount="8" x:FullColumns="1" x:FullRows="1">
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="250"/>
        <Column ss:Width="200"/>
        <Column ss:Width="50"/>
        <Column ss:Width="80"/>
        <xsl:call-template name="tableheader">
          <xsl:with-param name="columns" select="7"/>
        </xsl:call-template>
        <Row>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Domain</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Kind</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Category</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Subcategory</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Description</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">UUID</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">UID</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">CR</Data>
          </Cell>
        </Row>
        <xsl:apply-templates select="e:object" mode="cot"/>
      </Table>
      <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
        <FreezePanes/>
        <SplitHorizontal>2</SplitHorizontal>
        <TopRowBottomPane>2</TopRowBottomPane>
        <ActivePane>2</ActivePane>
      </WorksheetOptions>
      <AutoFilter xmlns="urn:schemas-microsoft-com:office:excel" x:Range="R2C1:R2C8"/>
    </Worksheet>
  </xsl:template>
  <xsl:template match="e:object" mode="cot">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates select="e:category|e:category_range" mode="cot"/>
  </xsl:template>
  <xsl:template match="e:category|e:category_range" mode="cot">
    <Row>
      <Cell>
      <xsl:apply-templates select="." mode="outputstyle"/>
        <Data ss:Type="Number">
          <xsl:value-of select="../@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates select="e:subcategory|e:subcategory_xref" mode="cot"/>
  </xsl:template>
  <xsl:template match="e:subcategory|e:subcategory_xref" mode="cot">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@domain"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@kind"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@value"/>
        </Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@uid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
  </xsl:template>
  <!--=== Record ===-->
  <xsl:template match="e:record" mode="body">
    <Worksheet>
      <xsl:attribute name="ss:Name">
        <xsl:value-of select="@uid"/>
      </xsl:attribute>
      <Table ss:ExpandedColumnCount="3" x:FullColumns="1" x:FullRows="1">
        <Column ss:Width="150"/>
        <Column ss:Width="250"/>
        <Column ss:Width="80"/>
        <xsl:call-template name="tableheader">
          <xsl:with-param name="columns" select="3"/>
        </xsl:call-template>
        <Row>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Field</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Datatype</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">CR</Data>
          </Cell>
        </Row>
        <xsl:apply-templates select="e:field" mode="record"/>
      </Table>
      <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
        <FreezePanes/>
        <SplitHorizontal>2</SplitHorizontal>
        <TopRowBottomPane>2</TopRowBottomPane>
        <ActivePane>2</ActivePane>
      </WorksheetOptions>
      <AutoFilter xmlns="urn:schemas-microsoft-com:office:excel" x:Range="R2C1:R2C3"/>
    </Worksheet>
  </xsl:template>
  <xsl:template match="e:field" mode="record">
    <Row>
      <Cell ss:StyleID="valigncenter">
        <xsl:choose>
          <xsl:when test="count(e:datatype)=0">
            <xsl:attribute name="ss:MergeAcross">1</xsl:attribute>
          </xsl:when>
          <xsl:when test="count(e:datatype)=1">
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="ss:MergeDown">
              <xsl:value-of select="count(e:datatype)-1"/>
            </xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <Data ss:Type="String">
          <xsl:value-of select="@name"/>
        </Data>
      </Cell>
      <xsl:apply-templates select="e:datatype[position()=1]" mode="entry"/>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates select="e:datatype[position()&gt;1]" mode="record"/>
  </xsl:template>
  <xsl:template match="e:datatype" mode="entry">
    <Cell>
      <Data ss:Type="String">
        <xsl:if test="@name"><xsl:value-of select="@name"/> - </xsl:if>
        <xsl:value-of select="@type"/>
      </Data>
    </Cell>
  </xsl:template>
  <xsl:template match="e:datatype" mode="record">
    <Row>
      <Cell ss:Index="2">
        <Data ss:Type="String">
          <xsl:if test="@name"><xsl:value-of select="@name"/> - </xsl:if>
          <xsl:value-of select="@type"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
  </xsl:template>
  <!--=== Jammer Technique ===-->
  <xsl:template match="e:jammer_technique" mode="body">
    <Worksheet>
      <xsl:attribute name="ss:Name">
        <xsl:value-of select="@uid"/>
      </xsl:attribute>
      <Table ss:ExpandedColumnCount="8" x:FullColumns="1" x:FullRows="1">
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="40"/>
        <Column ss:Width="250"/>
        <Column ss:Width="200"/>
        <Column ss:Width="80"/>
        <xsl:call-template name="tableheader">
          <xsl:with-param name="columns" select="7"/>
        </xsl:call-template>
        <Row>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Kind</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Category</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Subcategory</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Specific</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">Description</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">UUID</Data>
          </Cell>
          <Cell ss:StyleID="heading">
            <Data ss:Type="String">CR</Data>
          </Cell>
        </Row>
        <xsl:apply-templates select="e:jammer_kind" mode="jammer"/>
      </Table>
      <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
        <FreezePanes/>
        <SplitHorizontal>2</SplitHorizontal>
        <TopRowBottomPane>2</TopRowBottomPane>
        <ActivePane>2</ActivePane>
      </WorksheetOptions>
      <AutoFilter xmlns="urn:schemas-microsoft-com:office:excel" x:Range="R2C1:R2C7"/>
    </Worksheet>
  </xsl:template>
  <xsl:template match="e:jammer_kind" mode="jammer">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates select="e:jammer_category" mode="jammer"/>
  </xsl:template>
  <xsl:template match="e:jammer_category" mode="jammer">
    <Row>
      <Cell>
        <xsl:apply-templates select="." mode="outputstyle"/>
        <Data ss:Type="Number">
          <xsl:value-of select="../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates select="e:jammer_subcategory" mode="jammer"/>
  </xsl:template>
  <xsl:template match="e:jammer_subcategory" mode="jammer">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">0</Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
    <xsl:apply-templates select="e:jammer_specific" mode="jammer"/>
  </xsl:template>
  <xsl:template match="e:jammer_specific" mode="jammer">
    <Row>
      <xsl:apply-templates select="." mode="outputstyle"/>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="../@value"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="Number">
          <xsl:value-of select="@value"/>
        </Data>
      </Cell>
      <Cell>
        <xsl:apply-templates select="." mode="outputdescription"/>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:value-of select="@uuid"/>
        </Data>
      </Cell>
      <Cell>
        <Data ss:Type="String">
          <xsl:apply-templates select="e:cr|e:cr_range" mode="cr"/>
        </Data>
      </Cell>
    </Row>
  </xsl:template>
  <!--=== Output Description ==-->
  <xsl:template match="*" mode="outputdescription">
    <Data ss:Type="String">
      <xsl:value-of select="@description"/>
    </Data>
    <xsl:if test="@footnote">
      <Comment ss:ShowAlways="1">
        <Data>
          <xsl:value-of select="@footnote"/>
        </Data>
      </Comment>
    </xsl:if>
  </xsl:template>
	<!--=== Output Style ==-->
	<xsl:template match="*" mode="outputstyle">
		<xsl:choose>
			<xsl:when test="@retired='true'">
				<xsl:attribute name="ss:StyleID">Retired</xsl:attribute>
			</xsl:when>
			<xsl:when test="@deprecated='1'">
				<xsl:attribute name="ss:StyleID">deprecated</xsl:attribute>
			</xsl:when>
			<xsl:when test="@deprecated='true'">
				<xsl:attribute name="ss:StyleID">deprecated</xsl:attribute>
			</xsl:when>
			<xsl:when test="@status='new'">
				<xsl:attribute name="ss:StyleID">status</xsl:attribute>
			</xsl:when>
			<xsl:when test="@status='hold'">
				<xsl:attribute name="ss:StyleID">hold</xsl:attribute>
			</xsl:when>
			<xsl:when test="@status='pending'">
				<xsl:attribute name="ss:StyleID">pending</xsl:attribute>
			</xsl:when>
			<xsl:when test="@status='future'">
				<xsl:attribute name="ss:StyleID">future</xsl:attribute>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
  <xsl:template name="tableheader">
    <xsl:param name="columns"/>
    <Row>
      <Cell ss:MergeAcross="{$columns - 1}" ss:StyleID="banner">
        <ss:Data xmlns="http://www.w3.org/TR/REC-html40" ss:Type="String"><B><xsl:value-of select="@name"/><xsl:text> </xsl:text><I>[UID <xsl:value-of select="@uid"/>]</I></B></ss:Data>
        <xsl:if test="@footnote">
          <Comment ss:ShowAlways="1">
            <Data>
              <xsl:value-of select="@footnote"/>
            </Data>
          </Comment>
        </xsl:if>  
      </Cell>
    </Row>
  </xsl:template>
    <!--=== Text ==-->
  <xsl:template match="text()" mode="body"/>
  <xsl:template match="text()" mode="index"/>
  <xsl:template match="text()" mode="cr"/>
  <xsl:template match="text()" mode="outputdescription"/>
  <xsl:template match="text()" mode="outputstyle"/>
  <xsl:template match="text()" mode="record"/>
</xsl:stylesheet>
