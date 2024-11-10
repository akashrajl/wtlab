<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
        <head>
            <title>Parking Management System</title>
            <style>
                table {
                    width: 100%;
                    border-collapse: collapse;
                }
                table, th, td {
                    border: 1px solid black;
                }
                th, td {
                    padding: 8px;
                    text-align: left;
                }
                th {
                    background-color: #f2f2f2;
                }
            </style>
        </head>
        <body>
            <h2>Parking Management System</h2>
            <table>
                <tr>
                    <th>Lot ID</th>
                    <th>Lot Name</th>
                    <th>Capacity</th>
                    <th>Occupied</th>
                    <th>Available</th>
                    <th>Location</th>
                    <th>Rate/Hour</th>
                    <th>Security Level</th>
                    <th>Type</th>
                    <th>Operational Hours</th>
                    <th>Contact Number</th>
                </tr>
                <xsl:for-each select="parkingSystem/parkingLot">
                    <xsl:if test="normalize-space(securityLevel) = 'Medium' and normalize-space(type) = 'Private'">
                        <tr>
                            <td><xsl:value-of select="lotID"/></td>
                            <td><xsl:value-of select="lotName"/></td>
                            <td><xsl:value-of select="capacity"/></td>
                            <td><xsl:value-of select="occupied"/></td>
                            <td><xsl:value-of select="available"/></td>
                            <td><xsl:value-of select="location"/></td>
                            <td><xsl:value-of select="ratePerHour"/></td>
                            <td><xsl:value-of select="securityLevel"/></td>
                            <td><xsl:value-of select="type"/></td>
                            <td><xsl:value-of select="operationalHours"/></td>
                            <td><xsl:value-of select="contactNumber"/></td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
