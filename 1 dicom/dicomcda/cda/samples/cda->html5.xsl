<?xml version="1.0" encoding="UTF-8"?>
   <xsl:stylesheet id="Transform" version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:cda="urn:hl7-org:v3" xmlns:scd="urn:salud.uy/2014/signed-clinical-document"
        xmlns:sdtc="urn:hl7-org:sdtc" xmlns:xhtml="http://www.w3.org/1999/xhtml"
        xmlns="http://www.w3.org/1999/xhtml">
        <xsl:variable name="cda" select="dscd/scd:SignedClinicalDocument/cda:ClinicalDocument"/>
        <xsl:template match="/">
            <html>
                <head>
                    <title>
                        <xsl:value-of select="$cda/cda:title/text()"/>
                    </title>
                    <style type="text/css"> body { color: #003366; background-color: #FFFFFF;
                        font-family: Verdana, Tahoma, sans-serif; font-size: 13px; } pre {
                        font-family: Verdana, Tahoma, sans-serif; } h2 { font-size: 17pt;
                        font-weight: bold; text-align: center; } h3 { font-size: 14pt; font-weight:
                        bold; margin-bottom: 0; padding-bottom: 0; } table { width: 768px; } dt {
                        float: left; clear: left; width: 200px; text-align: left; font-weight: bold;
                        color: green; } dt:after { content: ":"; } dd { margin: 0 0 0 210px;
                        padding: 0 0 0.5em 0; } section { margin: 0 0 0 0; padding: 0 0 0 0; } p {
                        margin: 0 0 0 0; padding: 0 0 0 0; }</style>
                </head>
                <body>
                    <h2>
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select="/dscd/cita/iRealizadora/@logoData"/>
                            </xsl:attribute>
                        </img>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="/dscd/cita/iRealizadora/@nombre"/>
                        <xsl:text>Informe imagenológico</xsl:text>
                    </h2>
                    <hr/>
                    <table>
                        <tr>
                            <td>
                                <xsl:text>Paciente: </xsl:text>
                                <b>
                                    <xsl:call-template name="getPersonName">
                                        <xsl:with-param name="personName"
                                            select="$cda/cda:recordTarget/cda:patientRole/cda:patient"
                                        />
                                    </xsl:call-template>
                                    <xsl:text> </xsl:text>
                                </b>
                            </td>
                            <td>
                                <xsl:text>Identificación del Paciente: </xsl:text>
                                <b>
                                    <xsl:call-template name="getExtension">
                                        <xsl:with-param name="oidPersona"
                                            select="$cda/cda:recordTarget/cda:patientRole/cda:id/@extension"
                                        />
                                    </xsl:call-template>
                                </b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <xsl:text>Fecha de Nacimiento: </xsl:text>
                                <b>
                                    <xsl:variable name="B"
                                        select="$cda/cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime/@value"/>
                                    <xsl:variable name="S"
                                        select="$cda/cda:componentOf/cda:encompassingEncounter/cda:effectiveTime/@value"/>
                                    <xsl:call-template name="formatDate">
                                        <xsl:with-param name="date" select="$B"/>
                                    </xsl:call-template>
                                    <xsl:text> (</xsl:text>
                                    <xsl:variable name="BY" select="substring($B, 1, 4)"/>
                                    <xsl:variable name="SY" select="substring($S, 1, 4)"/>
                                    <xsl:variable name="Y" select="$SY - $BY"/>
                                    <xsl:variable name="BM" select="substring($B, 5, 2)"/>
                                    <xsl:variable name="SM" select="substring($S, 5, 2)"/>
                                    <xsl:variable name="M" select="$SM - $BM"/>
                                    <xsl:variable name="YM" select="($Y * 12) + $M"/>
                                    <xsl:choose>
                                        <xsl:when test="$YM > 24">
                                            <xsl:value-of select="$Y"/>
                                            <xsl:text> años</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="$YM > 2">
                                            <xsl:value-of select="$YM"/>
                                            <xsl:text> meses</xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>menos de 3 meses</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:text>)</xsl:text>
                                </b>
                            </td>
                            <td>
                                <xsl:text>Sexo: </xsl:text>
                                <b>
                                    <xsl:value-of
                                        select="$cda/cda:recordTarget/cda:patientRole/cda:patient/cda:administrativeGenderCode/@displayName"
                                    />
                                </b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <xsl:text>Departamento: </xsl:text>
                                <b>
                                    <xsl:value-of
                                        select="normalize-space($cda/cda:recordTarget/cda:patientRole/cda:addr/cda:state/text())"
                                    />
                                </b>
                            </td>
                            <td>
                                <xsl:text>Ciudad: </xsl:text>
                                <b>
                                    <xsl:value-of
                                        select="normalize-space($cda/cda:recordTarget/cda:patientRole/cda:addr/cda:city/text())"
                                    />
                                </b>
                                <xsl:if
                                    test="$cda/cda:recordTarget/cda:patientRole/cda:addr/cda:additionalLocator/text() != ''">
                                    <xsl:text> (</xsl:text>
                                    <xsl:value-of
                                        select="normalize-space($cda/cda:recordTarget/cda:patientRole/cda:addr/cda:additionalLocator/text())"/>
                                    <xsl:text>)</xsl:text>
                                </xsl:if>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br/>
                            </td>
                            <td>
                                <br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <xsl:text>Institución solicitante: </xsl:text>
                                <b>
                                    <xsl:value-of select="/dscd/cita/iSolicitante/@nombre"/>
                                </b>
                            </td>
                            <td>
                                <xsl:text>Médico solicitante: </xsl:text>
                                <b>
                                    <xsl:value-of select="/dscd/cita/pSolicitante/@nombre"/>
                                </b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br/>
                            </td>
                            <td>
                                <br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <xsl:text>Fecha estudio: </xsl:text>
                                <b>
                                    <xsl:call-template name="formatDate">
                                        <xsl:with-param name="date"
                                            select="$cda/cda:componentOf/cda:encompassingEncounter/cda:effectiveTime/@value"
                                        />
                                    </xsl:call-template>
                                </b>
                            </td>
                            <td>
                                <xsl:text>Servicio: </xsl:text>
                                <b>
                                    <xsl:value-of
                                        select="substring-after($cda/cda:componentOf/cda:encompassingEncounter/cda:encounterParticipant/cda:assignedEntity/cda:id/@extension,'^')"
                                    />
                                </b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <xsl:text>Estudio: </xsl:text>
                                <b>
                                    <xsl:value-of
                                        select="$cda/cda:documentationOf/cda:serviceEvent/cda:code/@displayName"
                                    />
                                </b>
                            </td>
                            <td>
                                <xsl:text>Número acceso: </xsl:text>
                                <b>
                                    <xsl:value-of
                                        select="$cda/cda:component/cda:structuredBody/cda:component/cda:section/cda:component/cda:section/cda:entry/cda:act/cda:code/cda:qualifier/cda:value/cda:originalText/text()"
                                    />
                                </b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <xsl:text>Prioridad: </xsl:text>
                                <b>
                                    <xsl:value-of select="/dscd/cita/@prioridad"/>
                                </b>
                            </td>
                            <td>
                                <xsl:text>Origen: </xsl:text>
                                <b>
                                    <xsl:value-of select="/dscd/cita/@internacion"/>
                                </b>
                            </td>
                        </tr>
                    </table>
                    <hr/>
                    <xsl:apply-templates
                        select="$cda/cda:component[1]/cda:structuredBody[1]/cda:component/cda:section"/>
                    <p>
                        <br/>
                    </p>
                    <p>
                        <br/>
                    </p>
                    <p>
                        <xsl:call-template name="formatDate">
                            <xsl:with-param name="date" select="$cda/cda:effectiveTime/@value"/>
                        </xsl:call-template>
                        <xsl:call-template name="formatTime">
                            <xsl:with-param name="date" select="$cda/cda:effectiveTime/@value"/>
                        </xsl:call-template>
                        <xsl:text> firmado por Médico</xsl:text>
                        <xsl:variable name="cdaProfesional1"
                            select="$cda/cda:author[1]/cda:assignedAuthor/cda:assignedPerson"/>
                        <xsl:if test="$cdaProfesional1">
                            <xsl:call-template name="getPersonName">
                                <xsl:with-param name="personName" select="$cdaProfesional1"/>
                            </xsl:call-template>
                            <xsl:variable name="cdaProfesional1org"
                                select="$cda/cda:author[1]/cda:assignedAuthor/cda:representedOrganization/cda:name/text()"/>
                            <xsl:if test="$cdaProfesional1org != ''">
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="$cdaProfesional1org"/>
                            </xsl:if>
                            <xsl:variable name="cdaProfesional2"
                                select="$cda/cda:ClinicalDocument/cda:author[2]/cda:assignedAuthor/cda:assignedPerson"/>
                            <xsl:if test="$cdaProfesional2">
                                <xsl:text> | </xsl:text>
                                <xsl:call-template name="getPersonName">
                                    <xsl:with-param name="personName" select="$cdaProfesional2"/>
                                </xsl:call-template>
                                <xsl:variable name="cdaProfesional2org"
                                    select="$cda/cda:author[2]/cda:assignedAuthor/cda:representedOrganization/cda:name/text()"/>
                                <xsl:if test="$cdaProfesional2org != ''">
                                    <xsl:text>, </xsl:text>
                                    <xsl:value-of select="$cdaProfesional2org"/>
                                </xsl:if>
                                <xsl:variable name="cdaProfesional3"
                                    select="$cda/cda:author[3]/cda:assignedAuthor/cda:assignedPerson"/>
                                <xsl:if test="$cdaProfesional3">
                                    <xsl:text> | </xsl:text>
                                    <xsl:call-template name="getPersonName">
                                        <xsl:with-param name="personName" select="$cdaProfesional3"
                                        />
                                    </xsl:call-template>
                                    <xsl:variable name="cdaProfesional3org"
                                        select="$cda/cda:author[3]/cda:assignedAuthor/cda:representedOrganization/cda:name/text()"/>
                                    <xsl:if test="$cdaProfesional3org != ''">
                                        <xsl:text>, </xsl:text>
                                        <xsl:value-of select="$cdaProfesional3org"/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </p>
                    <hr/>
                    <p>
                        <xsl:value-of select="/dscd/sdtc:signatureTEXT/sdtc:thumbnail/text()"/>
                    </p>
                </body>
            </html>
        </xsl:template>
        <xsl:template name="getPersonName">
            <xsl:param name="personName"/>
            <xsl:for-each select="$personName/cda:name/*">
                <xsl:text> </xsl:text>
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:template>
        <xsl:template name="getExtension">
            <xsl:param name="oidPersona"/>
            <xsl:choose>
                <xsl:when test="contains($oidPersona, '.')">
                    <xsl:call-template name="getExtension">
                        <xsl:with-param name="oidPersona" select="substring-after($oidPersona, '.')"
                        />
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$oidPersona"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>
        <xsl:template name="formatDate">
            <xsl:param name="date"/>
            <xsl:if test="$date != ''">
                <xsl:value-of select="substring($date, 1, 4)"/>
                <xsl:text>-</xsl:text>
                <xsl:value-of select="substring($date, 5, 2)"/>
                <xsl:text>-</xsl:text>
                <xsl:value-of select="substring($date, 7, 2)"/>
            </xsl:if>
        </xsl:template>
        <xsl:template name="formatTime">
            <xsl:param name="date"/>
            <xsl:if test="$date != ''">
                <xsl:text>T</xsl:text>
                <xsl:value-of select="substring($date, 9, 2)"/>
                <xsl:text>:</xsl:text>
                <xsl:value-of select="substring($date, 11, 2)"/>
                <xsl:text>:</xsl:text>
                <xsl:value-of select="substring($date, 13, 2)"/>
            </xsl:if>
        </xsl:template>
        <xsl:template match="cda:section">
            <xsl:if test="1=1">
                <h3>
                    <xsl:value-of select="cda:title/text()"/>
                </h3>
                <section>
                    <xsl:apply-templates select="cda:entry" mode="pre"/>
                    <xsl:apply-templates select="cda:text"/>
                    <xsl:apply-templates select="cda:component/cda:section"/>
                    <xsl:apply-templates select="cda:entry" mode="post"/>
                </section>
            </xsl:if>
        </xsl:template>
        <xsl:template match="cda:text">
            <xsl:apply-templates select="*"/>
        </xsl:template>
        <xsl:template match="cda:linkHtml">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="@href"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </xsl:element>
        </xsl:template>
        <xsl:template match="cda:table">
            <table border="1">
                <xsl:apply-templates select="*"/>
            </table>
        </xsl:template>
        <xsl:template match="cda:thead">
            <thead border="1">
                <xsl:apply-templates select="*"/>
            </thead>
        </xsl:template>
        <xsl:template match="cda:tbody">
            <tbody border="1">
                <xsl:apply-templates select="*"/>
            </tbody>
        </xsl:template>
        <xsl:template match="cda:tr">
            <tr border="1">
                <xsl:apply-templates select="*"/>
            </tr>
        </xsl:template>
        <xsl:template match="cda:th">
            <th border="1">
                <xsl:apply-templates select="*"/>
            </th>
        </xsl:template>
        <xsl:template match="cda:td">
            <td border="1">
                <xsl:apply-templates select="*"/>
            </td>
        </xsl:template>
        <xsl:template match="cda:br">
            <br/>
        </xsl:template>
        <xsl:template match="cda:paragraph">
            <p>
                <xsl:apply-templates select="cda:content | text()"/>
            </p>
        </xsl:template>
        <xsl:template match="text()">
            <xsl:value-of select="."/>
        </xsl:template>
        <xsl:template match="cda:content">
            <xsl:choose>
                <xsl:when test="@styleCode = 'Italics'">
                    <i>
                        <xsl:apply-templates select="cda:content | text()"/>
                    </i>
                </xsl:when>
                <xsl:when test="@styleCode = 'Bold'">
                    <b>
                        <xsl:apply-templates select="cda:content | text()"/>
                    </b>
                </xsl:when>
            </xsl:choose>
        </xsl:template>
        <xsl:template match="cda:entry" mode="pre">
            <xsl:if
                test="contains(' 129716005 129717001 129718006 129719003 111351 111352 111353 ', concat(' ', cda:observation/cda:code/@code, '  '))">
                <xsl:value-of select="cda:observation/cda:code/@displayName"/>
                <br/>
            </xsl:if>
        </xsl:template>
        <xsl:template match="cda:entry" mode="post">
            <xsl:if
                test="not(contains(' 129716005 129717001 129718006 129719003 111351 111352 111353 ', concat(' ',cda:observation/cda:code/@code, ' ')))">
                <xsl:choose>
                    <xsl:when test="cda:observation/cda:value/cda:qualifier">
                        <xsl:value-of select="cda:observation/cda:value/cda:qualifier/@displayName"/>
                        <br/>
                    </xsl:when>
                    <xsl:when test="cda:observation/cda:value">
                        <xsl:value-of select="cda:observation/cda:value/@displayName"/>
                        <br/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="cda:observation/cda:code/@displayName"/>
                        <br/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:template>
    </xsl:stylesheet>
