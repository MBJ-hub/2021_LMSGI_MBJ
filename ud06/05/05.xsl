<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : 05.xsl
    Created on : 5 de mayo de 2021, 7:28:56
    Author     : Mario
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="factura">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>05 XSLT Factura F55 Mario Badallo Jimeénez</title>
                <link rel="stylesheet" href="05.css" type="text/css"/>
                <link rel="icon" href="Icono.ico" type="image/png"/>
                <meta name="author" content="Mario"/>
                <meta name="application-name" content="Factura numero F555"/>
                <meta name="description" content="Información sobre una factura"/>
                <meta name="keywords" content="factura, total, xslt, xml"/>
                <meta name="robots" content="index, follow"/>
            </head>
            <body>
                <table>
                    <thead>
                        <tr>
                            <td colspan="3">Factura número <xsl:value-of select="n_factura"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th colspan="3" class="titulo">Datos emisor</th>
                        </tr>
                        <tr>
                            <td>Razón social: <xsl:value-of select="datos_emisor/nombre"/></td>
                            <td colspan="2">NIF/CIF: <xsl:value-of select="datos_emisor/cif"/></td>
                        </tr>
                        <tr>
                            <td>Dirección: </td>
                            <td colspan="2">
                                <xsl:value-of select="datos_emisor/dir"/>
                                <br/>
                                <xsl:value-of select="datos_emisor/cod_postal"/>
                                <xsl:value-of select="datos_emisor/poblacion"/>
                                <br/>
                                <xsl:value-of select="datos_emisor/provincia"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">Datos de contacto</td>
                        </tr>
                        <tr>
                            <td>Teléfono: <xsl:value-of select="datos_emisor/num_tel"/></td>
                            <td colspan="2">Fax: <xsl:value-of select="datos_emisor/num_fax"/></td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <th colspan="3" class="titulo">Datos receptor</th>
                        </tr>
                        <tr>
                            <td colspan="3">Num Cliente: <xsl:value-of select="datos_receptor/n_cli"/></td>
                        </tr>
                        <tr>
                            <td>Dirección: </td>
                            <td colspan="2">
                                <xsl:value-of select="datos_receptor/dir"/>
                                <br/>
                                <xsl:value-of select="datos_receptor/cod_postal"/>
                                <xsl:value-of select="datos_receptor/poblacion"/>
                                <br/>
                                <xsl:value-of select="datos_receptor/provincia"/>
                            </td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <th colspan="3" class="titulo">Resumen factura</th>
                        </tr>
                        <tr>
                            <td>Número pedido: <xsl:value-of select="datos_factura/n_ped"/></td>
                            <td>Iva: <xsl:value-of select="datos_factura/iva"/></td>
                            <td>Forma de Pago: <xsl:value-of select="datos_factura/f_pago"/></td>
                        </tr>
                        <tr>
                            <td>Moneda: <xsl:value-of select="datos_factura/moneda"/></td>
                            <td colspan="2">Fecha: <xsl:value-of select="datos_factura/fecha"/></td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <th colspan="3" class="titulo">Detalle factura</th>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table>
                                    <theader>
                                        <tr>
                                            <th>Ref</th>
                                            <th>Descripción</th>
                                            <th>Cantidad</th>
                                            <th>Precio</th>
                                            <th>Importe</th>
                                        </tr>
                                    </theader>
                                    <tbody>
                                        <xsl:apply-templates select="datos_factura/linea"/>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="3" class="titulo">Importes factura</th>
                        </tr>
                        <tr>
                            <td>Base: <xsl:value-of select="//base"/></td>
                            <td>Cuota IVA: <xsl:value-of select="//cuota_iva"/></td>
                            <td>Total Factura: <xsl:value-of select="//total"/></td>
                        </tr>
                    </tfoot>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="linea">
        <tr>
            <td>
                <xsl:value-of select="ref"/>
            </td>
            <td>
                <xsl:value-of select="desc"/>
            </td>
            <td>
                <xsl:value-of select="cant"/>
            </td>
            <td>
                <xsl:value-of select="precio"/>
            </td>
            <td>
                <xsl:value-of select="importe"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
