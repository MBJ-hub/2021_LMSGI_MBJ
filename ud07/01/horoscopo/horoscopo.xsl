<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : horoscopo.xsl
    Created on : 14 de junio de 2019, 11:12
    Author     : Mario
    Description:
        Mostrar horoscopo / los signos del zodiaco
	-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:include href="../lib/web.xsl"/>

    <xsl:template match="/">
        <xsl:variable name="signo" select="'Aries'"/>
        <xsl:call-template name="docTipo"/>
        <html>
            <head>
                <xsl:call-template name="web">
                    <xsl:with-param name="titulo" select="concat('Horóscopo de ',  $signo)"/>
                    <link rel="stylesheet" href="signos.css" type="text/css"/>
                </xsl:call-template>
                <style>
                    img:last-image{
                    }
                    div.prediccion{
                        margin: 2% 10%;
                    }
                    p{
                        font-weight: normal;
                        font-style: italic;
                        text-align: justify;
                        margin: 0;
                        padding: 0.5%;
                        border: 5px solid gainsboro;
                    }
                    h2{
                        margin-bottom: 1%;
                    }
                </style>
            </head>
            <body>
                <div class="imagenes">
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat('../images/bg-', //@id, '.jpg')"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="nombre"/>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat('../images/', //@id, '.svg')"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="//source"/>
                        </xsl:attribute>
                    </xsl:element>
                </div>
                <h1>Horóscopo <xsl:value-of select="$signo"/></h1>
                <div class="prediccion">
                    <h2>Predicción para hoy <xsl:value-of select="//date"/></h2>
                    <p><xsl:value-of select="//message"/></p>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
