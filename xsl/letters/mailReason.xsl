<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="toWhomIsConcerned">
<table cellspacing="0" cellpadding="5" border="0">
<!-- BEGIN Wesleyan added link to library account -->
<tr><td>
<a>
                        <xsl:attribute name="href">
                          @@email_my_account@@
                        </xsl:attribute>
						My Library Account
					</a>

</td></tr>
<!-- END Wesleyan added link to library account -->
	<tr>
		<td>
			<xsl:for-each select="notification_data">
<!-- BEGIN Wesleyan changed formatting of introduction -->			
				<h3>@@dear@@&#160;<xsl:value-of select="receivers/receiver/user/first_name"/>
				&#160;<xsl:value-of select="receivers/receiver/user/last_name"/></h3>
<!-- END Wesleyan changed formatting of introduction -->							
			</xsl:for-each>
		</td>
	</tr>
</table>


</xsl:template>

</xsl:stylesheet>