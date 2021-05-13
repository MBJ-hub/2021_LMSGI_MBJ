<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : 03.xsl
    Created on : 13 de abril de 2021, 12:55
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="horario">
        <html>
            <head>
                <title>Horario</title>
                <link rel="stylesheet" href="03.css" type="text/css"/>
            </head>
            <body>
                <nav>
                    <a href="#modulos">Módulos</a>
                    <a href="#profesores">Profesores</a>
                    <a href="#asignaturas">Asignaturas</a>
                    <a href="#horarios">Horarios</a>
                </nav>
                <div>
                    <div class="caja" id="modulos">
                        <h2>Módulos</h2>
                        <table>
                            <tr>
                                <th>Código</th>
                                <th>Nombre</th>
                            </tr>
                            <xsl:for-each select="modulos/modulo">
                                <xsl:sort order="ascending"/>
                                <tr>
                                    <td><xsl:value-of select="@codM"/></td>
                                    <td><xsl:value-of select="."/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                    <div class="caja" id="profesores">
                        <h2>Profesores</h2>
                        <table>
                            <tr>
                                <th>Código</th>
                                <th>Nombre</th>
                            </tr>
                            <xsl:for-each select="profesores/profesor">
                                <xsl:sort/> <!-- Utiliza "ascending" por defecto" -->
                                <tr>
                                    <td><xsl:value-of select="@codP"/></td>
                                    <td><xsl:value-of select="."/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                    <div id="asignaturas">
                        <h2>Asignaturas</h2>
                        <table>
                            <tr>
                                <th>Asignatura</th>
                                <th>Profesor</th>
                            </tr>
                            <xsl:for-each select="imparte/asignatura">
                                <xsl:sort select="@codM" order="descending"/>
                                <tr>
                                    <td><xsl:value-of select="../../modulos/modulo[@codM=(current()/@codM)]/."/></td>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="string-length(@codProfesor)=7">
                                                <xsl:value-of select="../../profesores/profesor[@codP=substring((current()/@codProfesor),1,3)]/."/>
                                                <br/>
                                                <xsl:value-of select="../../profesores/profesor[@codP=substring((current()/@codProfesor),5,3)]/."/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="../../profesores/profesor[@codP=current()/@codProfesor]/."/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                </div>
                <div id="horarios">
                    <h2>Horarios</h2>
                    <xsl:for-each select="grupo">
                        <div>
                            <table>
                                <caption>Horario del curso <xsl:value-of select="@idgrupo"/>
                                <br/>Tutor: <xsl:value-of select="../profesores/profesor[@codP=(current()/@codT)]/."/></caption>
                                <tr>
                                    <th>Hora</th>
                                    <th>Lunes</th>
                                    <th>Martes</th>
                                    <th>Miércoles</th>
                                    <th>Jueves</th>
                                    <th>Viernes</th>
                                </tr>
                                <xsl:apply-templates select="hora"/>
                            </table>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="hora">
        <tr>
            <td><xsl:value-of select="concat(@entrada, '-', @salida)"/></td>
            <xsl:apply-templates select="dia_sem"/>
        </tr>
    </xsl:template>
    
    <xsl:template match="dia_sem">
        <td>
            <xsl:attribute name="rowspan">
                <xsl:value-of select="@num"/>
            </xsl:attribute>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:value-of select="../../../modulos/modulo[@codM=current()]/."/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </abbr>
            <br/>
            <xsl:variable name="profesores" select="//asignatura[@codM=current()]/@codProfesor"/>
            <xsl:apply-templates select="//profesores/profesor[contains($profesores, @codP)]"/>
        </td>
    </xsl:template>
    <xsl:template match="profesor">
        <abbr>
            <xsl:attribute name="title">
                <xsl:value-of select="."/>
            </xsl:attribute>
            <xsl:if test="position()!=1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="@codP"/>
        </abbr>
    </xsl:template>
</xsl:stylesheet>