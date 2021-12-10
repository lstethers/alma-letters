<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

		<head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<br />
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
				<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>@@introduction@@<br />
<!-- BEGIN Wesleyan add title of item -->					
							<p>@@title@@: <xsl:value-of select="notification_data/purchase_request/title" /></p>
<!-- END Wesleyan add title of item -->
							<xsl:choose >
								<xsl:when test="/notification_data/purchase_request/request_status='APPROVED'">
<!-- BEGIN Wesleyan removed PO line info -->	
									@@approved@@
								</xsl:when>
								<xsl:otherwise>
<!-- BEGIN Wesleyan won't notify via this letter when rejecting a request 
									@@rejected@@: <xsl:value-of select="notification_data/purchase_request/reject_reason_desc" />.
-->
									<xsl:message terminate="yes">Terminating when rejecting a request</xsl:message>
<!-- END Wesleyan won't notify via this letter when rejecting a request -->
								</xsl:otherwise>
							</xsl:choose>

					</td>
					</tr>

				</table>
				<br />
				<table role='presentation' >
						<tr><td>@@department@@</td></tr>
						<tr><td>@@addressFrom@@</td></tr>
				</table>

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>