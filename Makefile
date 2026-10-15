# Copyright (c) by the Simulation Interoperability Standards Organization, Inc.
#
# 7901 4th St N, Suite 300-4043
# St. Petersburg, FL 33702
# All rights reserved.
# 
# This document is an approved product of Simulation Interoperability
# Standards Organization (SISO), Inc. and therefore the copyright of this
# document belongs to SISO, Inc. Permission is hereby granted for this
# document to be used for production of both commercial and non-commercial
# products. Removal of this copyright statement and claiming rights to
# this document is prohibited. In addition, permission is hereby granted
# for this document to be distributed in its original or modified format
# (e.g. as part of a database; however, modification does not imply to the
# content of this document) provided that no charge is invoked for the
# provision. Permission is hereby granted by SISO for modification and
# extension of products produced from this document providing that SISO's
# copyright is acknowledged on the products developed.
# 
# SISO EXCOM
# 7901 4th St N, Suite 300-4043
# St. Petersburg, FL 33702

SRC=SISO-REF-010.xml
XSD=SISO-REF-010.xsd

XLS=SISO-REF-010.xls
C99H=SISO-REF-010.h

XSLTPROC=xsltproc
XSLTPROCFLAGS=--nonet
XMLLINT=xmllint
XMLLINTFLAGS=--nonet --noout
CC=cc
CCFLAGS=

all: $(XLS) $(C99H)

$(XLS): SISO-REF-010-spreadsheetml.xsl $(SRC)
	$(XSLTPROC) -o $@ $(XSLTPROCFLAGS) $^

$(C99H): SISO-REF-010-c99h.xsl $(SRC)
	$(XSLTPROC) -o $@ $(XSLTPROCFLAGS) $^

clean:
	rm -f $(XLS) $(C99H)

test: $(XLS) $(C99H)
	$(XMLLINT) $(XMLLINTFLAGS) $(XSD)
	$(XMLLINT) $(XMLLINTFLAGS) --schema $(XSD) $(SRC)
	$(XMLLINT) $(XMLLINTFLAGS) SISO-REF-010-spreadsheetml.xsl
	$(XMLLINT) $(XMLLINTFLAGS) SISO-REF-010-c99h.xsl
	$(XMLLINT) $(XMLLINTFLAGS) $(XLS)
	$(CC) $(CCFLAGS) -o /dev/null -c $(C99H)
