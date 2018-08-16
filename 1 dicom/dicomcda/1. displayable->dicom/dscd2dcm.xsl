<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:cda="urn:hl7-org:v3"
    xmlns:scd="urn:salud.uy/2014/signed-clinical-document"
    xmlns:sdtc="urn:hl7-org:sdtc"
    xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
    xmlns:etsi="http://uri.etsi.org/01903/v1.3.2#"
                xmlns:saxon="http://saxon.sf.net/" exclude-result-prefixes="saxon"
                version="2.0"
    >
    <xsl:output method="xml" indent="no"/>
    
    <xsl:param name="paramURL">param_d2dcm.xml</xsl:param>
    
    <xsl:template match="/">
    
    	<xsl:variable name="paramContents" select="document($paramURL)"/>
    	<xsl:variable name="institucion" xpath-default-namespace="" select="$paramContents/param/institucion" />
    	<xsl:variable name="studyUID" xpath-default-namespace="" select="$paramContents/param/studyuid" />
        <xsl:variable name="rrturl" xpath-default-namespace="" select="$paramContents/param/rrturl" />
        <xsl:variable name="urld" xpath-default-namespace="" select="$paramContents/param/urld"/>
 
 
 
 
        <xsl:variable name="rrtContents" select="document($rrturl)"/>        
        <xsl:variable name="TIPOHALLAZGO" xpath-default-namespace="http://www.w3.org/1999/xhtml" select="$rrtContents/html/body/p/select[@id='TIPOHALLAZGOselect']/option[@selected='']/@value"/>
        
        
        
        
        <xsl:variable name="dContents" select="document($urld)"/>   
        
        <xsl:variable name="ReferringPhysicianName" xpath-default-namespace="" select="$dContents/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient/cda:informationRecipient/cda:name"/>
        
        <xsl:variable name="ReadingPExtension" xpath-default-namespace="" select="$dContents/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:id/@extension"/>
        <xsl:variable name="ReadingPRoot" xpath-default-namespace="" select="$dContents/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:id/@root"/>
        <xsl:variable name="ReadingPName" xpath-default-namespace="" select="$dContents/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/cda:name"/>
        <xsl:variable name="ReadingIName" xpath-default-namespace="" select="$dContents/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:representedOrganization/cda:name"/>
        <xsl:variable name="ReadingIId" xpath-default-namespace="" select="$dContents/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:representedOrganization/cda:id/@root"/>
        
        <xsl:variable name="RequestingSId" xpath-default-namespace="" select="$dContents/$dContents/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient/cda:receivedOrganization/cda:id/@root"/>
        <xsl:variable name="RequestingSName" xpath-default-namespace="" select="$dContents/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument//cda:informationRecipient/cda:intendedRecipient/cda:receivedOrganization/cda:name"/>

        <xsl:variable name="ProcedureModality" xpath-default-namespace="" select="$dContents/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:code/cda:translation/@displayName"/>
        <xsl:variable name="ProcedureTitle" xpath-default-namespace="" select="$dContents/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:title"/>
        
        <xsl:variable name="HL7InstanceIdentifier" xpath-default-namespace="" select="$dContents/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:id/@root"/>
        
        <NativeDicomModel xml-space="preserved">
            <!-- **************************** -->
            <!-- ** Patient Module C.7.1.1 ** -->
            <!-- **************************** -->
            <DicomAttribute keyword="PatientName" tag="00100010" vr="PN" type="2">
                <PersonName number="1">
                    <Alphabetic>
                        <FamilyName><xsl:value-of select="/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:family[1]"/>&gt;<xsl:value-of select="//dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:family[2]"/></FamilyName>
                        <GivenName><xsl:value-of select="concat(/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:given[1],' ',/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:given[2])" /></GivenName>
                    </Alphabetic>
                </PersonName>
            </DicomAttribute>
            <DicomAttribute keyword="PatientID" tag="00100020" vr="LO" type="2">
                <Value number="1"><xsl:value-of select="//cda:patientRole/cda:id/@extension" /></Value>
            </DicomAttribute>
            <DicomAttribute keyword="IssuerOfPatientID" tag="00100021" vr="LO" type="3">
                <Value number="1"></Value>
            </DicomAttribute>
            <DicomAttribute keyword="PatientBirthDate" tag="00100030" vr="DA" type="2">
                <Value number="1"><xsl:value-of select="/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime/@value"/></Value>
            </DicomAttribute>
            <DicomAttribute keyword="PatientSex" tag="00100040" vr="CS" type="2">
                <Value number="1"><xsl:value-of select="substring(/dscd/scd:SignedClinicalDocument/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:administrativeGenderCode/@displayName,1,1)"/></Value>
            </DicomAttribute>
            <!-- 
            <DicomAttribute keyword="PatientIdentityRemoved" tag="00120062" vr="CS" type="3">
                <Value number="1"><xsl:value-of select="$patientIdentityRemoved"/></Value>
            </DicomAttribute>
            <DicomAttribute keyword="DeidentificationMethod" tag="00120063" vr="LO" type="1C">
                <Value number="1"></Value>
            </DicomAttribute>
            <DicomAttribute keyword="DeidentificationMethodCodeSequence" tag="00120064" vr="SQ" type="1C">
                <Item number="1">            
                    <DicomAttribute keyword="PersonIdentificationCodeSequence" tag="00401101" vr="SQ">
                        <Item number="1">M.8.8.1</Item>
                    </DicomAttribute>
                </Item>
            </DicomAttribute>
            -->
            
            
            <!-- ******************************** -->
            <!-- ** General Study Module C.7.3 ** -->
            <!-- ******************************** -->
            <DicomAttribute keyword="StudyInstanceUID" tag="0020000D" vr="UI" type="1">
                <Value number="1"><xsl:value-of select="$studyUID"/></Value>
            </DicomAttribute>
            <!-- 
            <DicomAttribute keyword="StudyDate" tag="00080020" vr="DA" type="2">
                <Value number="1"><xsl:value-of select="$studyDate"/></Value>
            </DicomAttribute>
            <DicomAttribute keyword="StudyTime" tag="00080030" vr="TM" type="2">
                <Value number="1"><xsl:value-of select="$studyTime"/></Value>
            </DicomAttribute>
            -->
            <DicomAttribute keyword="ReferringPhysicianName" tag="00080090" vr="PN" type="2">
                <Value number="1"><xsl:value-of select="$ReferringPhysicianName"/></Value>
            </DicomAttribute>
            <!--
            <DicomAttribute keyword="ReferringPhysicianIdentificationSequence" tag="00080096" vr="SQ" type="1">
                <Item number="1" maxOccurs="1">            
                    <DicomAttribute keyword="PersonIdentificationCodeSequence" tag="00401101" vr="SQ">
                        <Item number="1">M.10.1</Item>
                    </DicomAttribute>
                </Item>
            </DicomAttribute>
            StudyID 00200010
            AccessionNumber 00080050
            IssuerOfAccessionNumberSequence 00080051 (M.10.17)
            StudyDescription 00081030
            PhysiciansOfRecord 00081048
            PhysiciansOfRecordIdentificationSequence 00081049 (M.10.1)
            NameOfPhysiciansReadingStudy 00081060
            -->
            
            <DicomAttribute keyword="PhysicianReadingStudyIdentificationSequence" tag="00081062" vr="SQ" type="1">
                <Item number="1" minOccurs="1">            
                    <DicomAttribute keyword="PersonIdentificationCodeSequence" tag="00401101" vr="SQ">
                        <Item number="1">
                            <DicomAttribute keyword="CodeValue" tag="00080100" vr="SH">
                                <Value number="1"><xsl:value-of select="$ReadingPExtension"/></Value>
                            </DicomAttribute>
                            <!--
                            <DicomAttribute keyword="LongCodeValue" tag="00080119" vr="UC">
                                <Value number="1"><xsl:value-of select="concat($ReadingPRoot,'.',$ReadingPExtension)"/></Value>
                            </DicomAttribute>
                            -->
                            <DicomAttribute keyword="CodingSchemeDesignator" tag="00080102" vr="SH">
                                <Value number="1">UNAOID</Value>
                            </DicomAttribute>
                            <DicomAttribute keyword="CodeMeaning" tag="00080104" vr="LO">
                                <Value number="1"><xsl:value-of select="$ReadingPName"/></Value>
                            </DicomAttribute>
                        </Item>
                    </DicomAttribute>
                    <!-- 
                        PersonsAddress 00401102
                        PersonsTelephoneNumbers 00401103
                    -->
                    <DicomAttribute keyword="InstitutionName" tag="00080080" vr="LO">
                        <Value number="1"><xsl:value-of select="$ReadingIName"/></Value>
                    </DicomAttribute>
                    <!-- 
                        InstitutionAddress 00080081
                    -->                    
                    <DicomAttribute keyword="InstitutionCodeSequence" tag="00080082" vr="SQ">
                        <Item number="1">
                            <DicomAttribute keyword="CodeValue" tag="00080100" vr="SH">
                                <Value number="1"><xsl:value-of select="$ReadingIName"/></Value>
                            </DicomAttribute>
                            <!--
                            <DicomAttribute keyword="LongCodeValue" tag="00080119" vr="UC">
                                <Value number="1"><xsl:value-of select="$ReadingIId"/></Value>
                            </DicomAttribute>
                            -->
                            <DicomAttribute keyword="CodingSchemeDesignator" tag="00080102" vr="SH">
                                <Value number="1">UNAOID</Value>
                            </DicomAttribute>
                            <DicomAttribute keyword="CodeMeaning" tag="00080104" vr="LO">
                                <Value number="1"><xsl:value-of select="$ReadingIName"/></Value>
                            </DicomAttribute>
                        </Item>
                    </DicomAttribute>
                </Item>
            </DicomAttribute>
            <DicomAttribute keyword="RequestingServiceCodeSequence" tag="00321034" vr="SQ">
                <Item number="1">
                    <DicomAttribute keyword="CodeValue" tag="00080100" vr="SH">
                        <Value number="1"><xsl:value-of select="$RequestingSName"/></Value>
                    </DicomAttribute>
                    <!--
                    <DicomAttribute keyword="LongCodeValue" tag="00080119" vr="UC">
                        <Value number="1"><xsl:value-of select="$RequestingSId"/></Value>
                    </DicomAttribute>
                    -->
                    <DicomAttribute keyword="CodingSchemeDesignator" tag="00080102" vr="SH">
                        <Value number="1">UNAOID</Value>
                    </DicomAttribute>
                    <DicomAttribute keyword="CodeMeaning" tag="00080104" vr="LO">
                        <Value number="1"><xsl:value-of select="$RequestingSName"/></Value>
                    </DicomAttribute>
                </Item>
            </DicomAttribute>
            <!-- 
                ReferencedStudySequence 00081110
            -->
            
            <!-- copiado desde el estudio imagenológico. Permite saber a nivel estudio si se uso la modality worklist. -->
            <DicomAttribute keyword="ProcedureCodeSequence" tag="00081032" vr="SQ">
                <Item number="1">
                    <DicomAttribute keyword="CodeValue" tag="00080100" vr="SH">
                        <Value number="1">*</Value>
                    </DicomAttribute>
                    <!--
                    <DicomAttribute keyword="LongCodeValue" tag="00080119" vr="UC">
                        <Value number="1"><xsl:value-of select="concat($ProcedureModality,' - ',$ProcedureTitle)"/></Value>
                    </DicomAttribute>
                    -->
                    <DicomAttribute keyword="CodingSchemeDesignator" tag="00080102" vr="SH">
                        <Value number="1">UNAOID</Value>
                    </DicomAttribute>
                    <DicomAttribute keyword="CodeMeaning" tag="00080104" vr="LO">
                        <Value number="1"><xsl:value-of select="concat($ProcedureModality,' - ',$ProcedureTitle)"/></Value>
                    </DicomAttribute>
                </Item>
            </DicomAttribute>
            
            <!-- ************************************************* -->
            <!-- ** Encapsulated Document Series Module  C.24.1 ** -->
            <!-- ************************************************* -->
            <DicomAttribute keyword="Modality" tag="00080060" vr="CS">
                <Value number="1">DOC</Value>
            </DicomAttribute>
            <DicomAttribute keyword="SeriesInstanceUID" tag="0020000E" vr="UI">
                <Value number="1">1.2.6.1.4.1.23650.175.<xsl:value-of select="format-dateTime(current-dateTime(), '[Y][M01][D01][H01][m01][s01][f]')"/></Value>
            </DicomAttribute>
            <DicomAttribute keyword="SeriesNumber" tag="00200011" vr="IS">
                <Value number="1">-16</Value>
            </DicomAttribute>
            <DicomAttribute keyword="SeriesDescription" tag="0008103E" vr="LO">
                <Value number="1">SignedClinicalDocument</Value>
            </DicomAttribute>
            <DicomAttribute keyword="SeriesDate" tag="00080021" vr="DA">
                <Value number="1"><xsl:value-of select="format-dateTime(current-dateTime(), '[Y][M01][D01]')"/></Value>
            </DicomAttribute>
            <DicomAttribute keyword="SeriesTime" tag="00080031" vr="TM">
                <Value number="1"><xsl:value-of select="format-dateTime(current-dateTime(), '[H01][m01][s01]')"/></Value>
            </DicomAttribute>
            
            <!-- ************************************** -->
            <!-- ** General Equipment Module C.5.7.1 ** -->
            <!-- ************************************** -->
            <DicomAttribute keyword="Manufacturer" tag="00080070" vr="LO">
                <Value number="1">MEGA Ltd</Value>
            </DicomAttribute>
            <!-- 
                InstitutionName 00080080 ya presente en General Study Module
            -->
            <DicomAttribute keyword="InstitutionAddress" tag="00080081" vr="ST">
                <Value number="1">Torre Ejecutiva Torre Sur, Liniers 1324, Montevideo, Uruguay</Value>
            </DicomAttribute>
            <DicomAttribute keyword="SoftwareVersions" tag="00181020" vr="LO">
                <Value number="1">1.0</Value>
            </DicomAttribute>
            
            
            
            <!-- ************************************** -->
            <!-- ** SC Equipment Module C.5.7.1 ** -->
            <!-- ************************************** -->
            <DicomAttribute keyword="ConversionType" tag="00080064" vr="CS">
                <Value number="1">WSD</Value>
            </DicomAttribute>
            <!-- 
                Modality 00080060 ya definido en Encapsulated Document Series Module
            -->
            
            <!-- ********************************** -->
            <!-- ** Encapsulated Document Module ** -->
            <!-- ********************************** -->
            <DicomAttribute keyword="InstanceNumber" tag="00200013" vr="IS">
                <Value number="1">1</Value>
            </DicomAttribute>
            <DicomAttribute keyword="ContentDate" tag="00080023" vr="DA">
                <Value number="1">20120131</Value>
            </DicomAttribute>
            <DicomAttribute keyword="ContentTime" tag="00080033" vr="TM"/>
            <DicomAttribute keyword="AcquisitionDateTime" tag="0008002A" vr="DT"/>
            <DicomAttribute keyword="BurnedInAnnotation" tag="00280301" vr="CS">
                <Value number="1">YES</Value>
            </DicomAttribute>
            <DicomAttribute keyword="DocumentTitle" tag="00420010" vr="ST">
                <Value number="1">Diagnóstico Imagenológico</Value>
            </DicomAttribute>
            <DicomAttribute keyword="ConceptNameCodeSequence" tag="0040A043" vr="SQ">
                <Item number="1">
                    <DicomAttribute keyword="CodeValue" tag="00080100" vr="SH">
                        <Value number="1">18748-4</Value>
                    </DicomAttribute>
                    <DicomAttribute keyword="CodingSchemeDesignator" tag="00080102" vr="SH">
                        <Value number="1">LN</Value>
                    </DicomAttribute>
                    <DicomAttribute keyword="CodeMeaning" tag="00080104" vr="LO">
                        <Value number="1">INFORME IMAGENOLOGIGO</Value>
                    </DicomAttribute>
                </Item>
            </DicomAttribute>
            <xsl:choose>
                <xsl:when test="$TIPOHALLAZGO='normal'">
                    <DicomAttribute keyword="DocumentClassCodeSequence" tag="0040E008" vr="SQ">
                        <Item number="1">
                            <DicomAttribute keyword="CodeValue" tag="00080100" vr="SH">
                                <Value number="1">normal</Value>
                            </DicomAttribute>
                            <DicomAttribute keyword="CodingSchemeDesignator" tag="00080102" vr="SH">
                                <Value number="1">ridi.salud.uy</Value>
                            </DicomAttribute>
                            <DicomAttribute keyword="CodeMeaning" tag="00080104" vr="LO">
                                <Value number="1">normal</Value>
                            </DicomAttribute>
                            <!--
                            <DicomAttribute keyword="LongCodeValue" tag="00080119" vr="LO">
                                <Value number="1">normal</Value>
                            </DicomAttribute>
                            -->
                        </Item>
                    </DicomAttribute>
                </xsl:when>
                <xsl:when test="$TIPOHALLAZGO='patológico con relación al dato clinico'">
                    <DicomAttribute keyword="DocumentClassCodeSequence" tag="0040E008" vr="SQ">
                        <Item number="1">
                            <DicomAttribute keyword="CodeValue" tag="00080100" vr="SH">
                                <Value number="1">patologicoConf</Value>
                            </DicomAttribute>
                            <DicomAttribute keyword="CodingSchemeDesignator" tag="00080102" vr="SH">
                                <Value number="1">ridi.salud.uy</Value>
                            </DicomAttribute>
                            <DicomAttribute keyword="CodeMeaning" tag="00080104" vr="LO">
                                <Value number="1">patológico con relación al dato clinico</Value>
                            </DicomAttribute>
                            <!--
                            <DicomAttribute keyword="LongCodeValue" tag="00080119" vr="LO">
                                <Value number="1">patológico con relación al dato clinico</Value>
                            </DicomAttribute>
                            -->
                        </Item>
                    </DicomAttribute>
                </xsl:when>
                <xsl:when test="$TIPOHALLAZGO='patológico sin relación al dato clinico'">
                    <DicomAttribute keyword="DocumentClassCodeSequence" tag="0040E008" vr="SQ">
                        <Item number="1">
                            <DicomAttribute keyword="CodeValue" tag="00080100" vr="SH">
                                <Value number="1">patologicoNuevo</Value>
                            </DicomAttribute>
                            <DicomAttribute keyword="CodingSchemeDesignator" tag="00080102" vr="SH">
                                <Value number="1">ridi.salud.uy</Value>
                            </DicomAttribute>
                            <DicomAttribute keyword="CodeMeaning" tag="00080104" vr="LO">
                                <Value number="1">patológico sin relación con el dato clínico</Value>
                            </DicomAttribute>
                            <!--
                            <DicomAttribute keyword="LongCodeValue" tag="00080119" vr="LO">
                                <Value number="1">patológico sin relación con el dato clínico</Value>
                            </DicomAttribute>
                            -->
                        </Item>
                    </DicomAttribute>
                </xsl:when>
                <xsl:when test="$TIPOHALLAZGO='dudoso'">
                    <DicomAttribute keyword="DocumentClassCodeSequence" tag="0040E008" vr="SQ">
                        <Item number="1">
                            <DicomAttribute keyword="CodeValue" tag="00080100" vr="SH">
                                <Value number="1">dudoso</Value>
                            </DicomAttribute>
                            <DicomAttribute keyword="CodingSchemeDesignator" tag="00080102" vr="SH">
                                <Value number="1">ridi.salud.uy</Value>
                            </DicomAttribute>
                            <DicomAttribute keyword="CodeMeaning" tag="00080104" vr="LO">
                                <Value number="1">dudoso</Value>
                            </DicomAttribute>
                            <!--
                            <DicomAttribute keyword="LongCodeValue" tag="00080119" vr="LO">
                                <Value number="1">dudoso</Value>
                            </DicomAttribute>
                            -->
                        </Item>
                    </DicomAttribute>
                </xsl:when>
            </xsl:choose>
            <DicomAttribute keyword="VerificationFlag" tag="0040A493" vr="CS">
                <Value number="1">VERIFIED</Value>
            </DicomAttribute>
            <DicomAttribute keyword="HL7InstanceIdentifier" tag="0040E001" vr="ST">
                <Value number="1">1.2.3.4</Value>
            </DicomAttribute>
            <DicomAttribute keyword="MIMETypeOfEncapsulatedDocument" tag="00420012" vr="LO">
                <Value number="1">text/xml</Value>
            </DicomAttribute>
            <DicomAttribute keyword="ListofMIMETypes" tag="00420014" vr="LO">
                <Value number="1">application/hl7-v3+xml</Value>
            </DicomAttribute>
            <DicomAttribute keyword="EncapsulatedDocument" tag="00420011" vr="OB">
                <InlineBinary>
                    <xsl:value-of select="saxon:string-to-base64Binary(unparsed-text($urld),'UTF8')"/>
                </InlineBinary>
            </DicomAttribute>
            <!-- *********************** -->
            <!-- ** SOP Common Module ** -->
            <!-- *********************** -->
            <DicomAttribute keyword="SOPClassUID" tag="00080016" vr="UI">
                <Value number="1">1.2.840.10008.5.1.4.1.1.104.2</Value>
            </DicomAttribute>
            <DicomAttribute keyword="SOPInstanceUID" tag="00080018" vr="UI">
                <Value number="1">1.2.6.1.4.1.23650.175.<xsl:value-of select="format-dateTime(current-dateTime(), '[Y][M01][D01][H01][m01][s01][f]')"/></Value>
            </DicomAttribute>
            <DicomAttribute keyword="SpecificCharacterSet" tag="00080005" vr="CS">
                <Value number="1">ISO_IR 100</Value>
            </DicomAttribute>
            
            <DicomAttribute keyword="TimezoneOffsetFromUTC" tag="00080201" vr="SH">
                <Value number="1">-0300</Value>
            </DicomAttribute>
            <!-- ***************************** -->
            <!-- ** NO ESTAN EN DOC INFORME ** -->
            <!-- ***************************** -->
            <DicomAttribute keyword="FileMetaInformationVersion" tag="00020001" vr="OB">
                <InlineBinary>AAE=</InlineBinary>
            </DicomAttribute>
            <DicomAttribute keyword="MediaStorageSOPClassUID" tag="00020002" vr="UI">
                <Value number="1">1.2.840.10008.5.1.4.1.1.104.2</Value>
            </DicomAttribute>
            <DicomAttribute keyword="MediaStorageSOPInstanceUID" tag="00020003" vr="UI">
                <Value number="1">1.2.6.1.4.1.23650.175.<xsl:value-of select="format-dateTime(current-dateTime(), '[Y][M01][D01][H01][m01][s01][f]')"/></Value>
            </DicomAttribute>
            <DicomAttribute keyword="TransferSyntaxUID" tag="00020010" vr="UI">
                <Value number="1">1.2.840.10008.1.2</Value>
            </DicomAttribute>
            <DicomAttribute keyword="ImplementationClassUID" tag="00020012" vr="UI">
                <Value number="1">1.2.40.0.13.1.1.1</Value>
            </DicomAttribute>
            <DicomAttribute keyword="ImplementationVersionName" tag="00020013" vr="SH">
                <Value number="1">dcm4che-1.4.31</Value>
            </DicomAttribute>
        </NativeDicomModel>
    </xsl:template>
</xsl:stylesheet>
