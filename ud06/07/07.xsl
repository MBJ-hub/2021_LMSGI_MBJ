<!--
    Document   : 07.xsl
    Created on : 11 de mayo de 2021, 12:26
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="corregido" select="'no'"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>07 XSLT Test <xsl:value-of select="//nombreModulo"/>Mario Badallo Jiménez</title>
                <link rel="stylesheet" href="07.css" type="text/css"/>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="//nombreCiclo"/>
                </h1>
                <h2>
                    <xsl:value-of select="document('1dawModulos.xml')//modulo[@codM=current()//nombreModulo]/text()"/>
                </h2>
                <h3>
                    <xsl:value-of select="concat('Fecha: ',//dia,' de ',document('meses.xml')//mes[@id=current()//mes]/text(),' de ',//anyo)"/>
                </h3>
                <form method="get" action="text.php">
                    <xsl:apply-templates select="//pregunta"/>
                    <xsl:if test="$corregido!='si'">
                        <div class="botones">
                            <input type="submit" value="Enviar"/>
                        </div>
                        <div class="botones">
                            <input type="reset" value="Resetear"/>
                        </div>
                    </xsl:if>
                </form> 
            </body>
        </html>
    </xsl:template>
    <xsl:template match="pregunta">
        <fieldset>
            <div class="pregunta">
            <xsl:value-of select="concat(@id,'.-',enunciado)"/>
            </div>
            <xsl:apply-templates select="respuestas/respuesta"/>
        </fieldset>
    </xsl:template>
    <xsl:template match="respuesta">
        <div class="respuesta">
           
            <input type="radio">
                <xsl:attribute name="name">
                    <xsl:value-of select="concat('p',../../@id)"/>
                </xsl:attribute>
                <xsl:attribute name="value">
                    <xsl:value-of select="position()"/>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('id',../../@id,position())"/>
                </xsl:attribute>
                <xsl:if test="$corregido='si'">
                    <xsl:attribute name="disabled"/>
                    <xsl:if test="@correcta='correcta'">
                        <xsl:attribute name="checked"/>
                    </xsl:if>
                </xsl:if>
            </input>
            <label>
                <xsl:attribute name="for">
                    <xsl:value-of select="concat('id',../../@id,position())"/>
                </xsl:attribute>
                <xsl:value-of select="current()"/>
            </label>
        </div>
    </xsl:template>
</xsl:stylesheet>
