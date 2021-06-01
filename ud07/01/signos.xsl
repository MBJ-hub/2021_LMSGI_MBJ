<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : signos.xsl
    Created on : 1 de junio de 2021, 8:48
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:include href="../lib/web.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="docTipo"/>
        <html>
            <head>
                <xsl:call-template name="web">
                    <xsl:with-param name="titulo" select="'Horóscopo'"/>
                    <xsl:with-param name="description" select="'XSLT de un horóscopo'"/>
                    <link rel="stylesheet" href="signos.css" type="text/css"/>
                </xsl:call-template>
            </head>
            <body>
                <h1>HORÓSCOPO - SIGNOS DEL ZODÍACO</h1>
                <xsl:apply-templates select="//signo"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="signo">
        <div class="signo">
            <div class="imagenes">
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('images/bg-', @id, '.jpg')"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="nombre"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('images/', @id, '.svg')"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="nombre"/>
                    </xsl:attribute>
                </xsl:element>
            </div>
            <p><xsl:value-of select="nombre"/></p>
            <div class="fecha">
                <xsl:value-of select="fecha"/>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>