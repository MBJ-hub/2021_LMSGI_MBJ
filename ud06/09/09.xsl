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
    <xsl:include href="../lib/web.xsl"/>
    <xsl:template match="/">
        
        <xsl:call-template name="docTipo"/>
        <html>
            <head>
                <title>09 XSLT Mario Badallo Jimenez</title>
                <link rel="stylesheet" href="09.css" type="text/css"/>
                <xsl:call-template name="web"/>
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
                                <xsl:apply-templates select="//asignaturas/asignatura[@titulacion=(current()/@id)]">
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
        <xsl:if test="count(//alumnos/alumno[estudios/asignaturas/asignatura/@codigo=current()/@id])!=0">
            <li>
                <xsl:value-of select="concat('(',@id,') ',nombre)"/>
                <xsl:if test="count(//alumnos/alumno[estudios/asignaturas/asignatura/@codigo=current()/@id])!=0">
                <ol>
                    <xsl:apply-templates select="//alumnos/alumno[estudios/asignaturas/asignatura/@codigo=(current()/@id)]">
                        <xsl:sort select="apellido1"/>
                    </xsl:apply-templates>
                </ol>
                </xsl:if>
            </li>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="alumno">
        <li>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:value-of select="//carrera[@id=current()//carrera/@codigo/nombre]"/>
                </xsl:attribute>
                <xsl:value-of select="concat(apellido1, ' ', apellido2, ', ',nombre)"/>
            </abbr>
        </li>
    </xsl:template>
</xsl:stylesheet>