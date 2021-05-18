<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 08.xsl
    Created on : 15 de mayo de 2021, 11:36
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>XSLT Predicción Mario Badallo Jimenez</title>
                <link rel="stylesheet" href="08.css" type="text/css"/>
            </head>
            <body>
                <h1>Predicción por municipios</h1>
                <table>
                    <caption>El tiempo. <xsl:value-of select="//nombre"/> (<xsl:value-of select="//provincia"/>)</caption>
                    <tr>
                        <th>Día</th>
                        <th>Prob. precip.</th>
                        <th>Estado del cielo</th>
                        <th>Temperatura (Cº)</th>
                        <th colspan="2">Viento (km/h)</th>
                    </tr>
                    <xsl:apply-templates select="//dia"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="dia">
        <tr>
            <td><xsl:value-of select="substring(@fecha, 9, 2)"/></td>
            <td><xsl:value-of select="prob_precipitacion"/>%</td>
            <td>
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('images/', estado_cielo, '.gif')"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="estado_cielo/@descripcion"/>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="estado_cielo/@descripcion"/>
                    </xsl:attribute>
                </xsl:element>
            </td>
            <td>
                <span class="max">
                    <xsl:value-of select="temperatura/maxima"/>
                </span> / <span class="min">
                    <xsl:value-of select="temperatura/minima"/>
                </span>
            </td>
            <td>
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('images/', viento/direccion, '.gif')"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="viento/direccion"/>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="viento/direccion"/>
                    </xsl:attribute>
                </xsl:element>
            </td>
            <td>
                <xsl:value-of select="viento/velocidad"/>
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>
