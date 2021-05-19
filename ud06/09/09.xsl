<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 09.xsl
    Created on : 19 de mayo de 2021, 12:51
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->
<!-- TODO customize transformation rules 
     syntax recommendation http://www.w3.org/TR/xslt 
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:call-template name="DocTipo"/>
        <html>
            <head>
                <title>09 XSLT Mario Badallo Jimenez</title>
                <xsl:call-template name="metaWeb"/>
            </head>
            <body>
                <h1>09 XSLT Universidad</h1>
                <xsl:for-each select="/universidad/carreras/carrera">
                    <xsl:sort select="nombre"/>
                    <div>
                        <h2>
                            <xsl:value-of select="concat(@id, ' - ', nombre, ' (', plan,')')"/>
                        </h2>
                        <div>
                            <xsl:attribute name="class">
                                <xsl:value-of select="concat('interior')"/>
                            </xsl:attribute>
                            <xsl:value-of select="centro"/>
                            <br/>
                            <ul>
                                <xsl:apply-templates select="/asignaturas/asignatura[@titulacion=(current()/@id)]">
                                    <xsl:sort select="nombre"/>
                                </xsl:apply-templates>
                            </ul>
                        </div>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="asignatura">
        <li>
            <xsl:value-of select="concat('(',@id,') ',nombre)"/>
            <ol>
                <xsl:apply-templates select="/alumnos/alumno[estudios/asignaturas/asignatura/@codigo=(current()/@id)]">
                    <xsl:sort select="apellido1"/>
                </xsl:apply-templates>
            </ol>
        </li>
    </xsl:template>
    
    <xsl:template match="alumno">
        <li>
            <xsl:value-of select="concat(apellido1, ' ', apellido2, ', ',nombre)"/>
        </li>
    </xsl:template>
</xsl:stylesheet>