<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : 02.xsl
    Created on : 29 de abril de 2021, 8:57
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/listatickets">
       
        <html>
            <head>
                <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>02 XSL Tickets Mario Badallo Jimenez</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-with, initial-scale=1.0"/>
                <meta name="author" content="Mario Badallo"/>
                <meta name="aplication-name" content="AppWeb de LMSGI"/>   
                <meta name="descripcion" content="Informacion de tickets"/>
                <meta name="keywords" content="tickets, total, xslt, xml"/>  
                <meta name="robots" content="index, follow"/>       
                <link href="02.css" rel="stylesheet" type="text/css"></link>
            </head>
            <body>
                <header>
                    Información de tickets
                </header>
                <h1>Listado de tickets</h1>
                <xsl:apply-templates select="ticket"/>      
                <p class="numeros">
                    <xsl:value-of select="concat('Número de tickets: ',count(ticket))"/>
                </p>
                <p class="numeros">
                    <xsl:value-of select="concat('Total de tickets: ',sum(ticket/producto/precio))"/>
                </p>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="comment()">
        <xsl:text xml:space="preserve">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment> 
        </xsl:text>  
    </xsl:template>
    
    <xsl:template match="ticket">
        <div>
            <p class="numTicket">
                <xsl:value-of select="concat('Ticket: ',numero)"/>
            </p>
            <table>
                <tr>
                    <th>Producto</th>
                    <th>Precio</th>
                </tr>
                <xsl:apply-templates select="producto"/> 
                <tr>
                    <th>Total</th>
                    <th>
                        <xsl:value-of select="sum(producto/precio)"/>
                    </th>
                </tr>  
            </table>
            <p class="fecha">
                <xsl:value-of select="concat('Fecha del ticket: ',fecha)"/>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="producto">
        <tr>
            <td>
                <xsl:value-of select="nombre"/>
            </td>
            <td class="price">
                <xsl:value-of select="precio"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>