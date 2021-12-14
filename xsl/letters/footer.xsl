<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="salutation">

</xsl:template>

<xsl:template name="lastFooter">
<!-- BEGIN Wesleyan removed content END -->
</xsl:template>
<!-- BEGIN Wesleyan added institution name END -->
<xsl:template name="wes_signature">
	<table align="left">
	<tr><td align="left">Wesleyan University Library</td></tr>
	</table>
</xsl:template>

<xsl:template name="contactUs">
	<table align="left">
	<tr>
	<td align="left">
<!-- BEGIN Wesleyan removed content END -->
						@@contact_us@@
	</td>
</tr>
	</table>
</xsl:template>
<xsl:template name="myAccount">
	<table align="right">
	<tr>
	<td align="right">
	<a>
                        <xsl:attribute name="href">
                          @@email_my_account@@
                        </xsl:attribute>
						@@my_account@@
					</a>
	</td>
</tr>
	</table>
</xsl:template>

</xsl:stylesheet>