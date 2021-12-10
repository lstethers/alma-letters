<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

<!-- BEGIN Wesleyan rewrote nearly everything -->
<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />

	<xsl:template match="/">

	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>
			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
							</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

					<div class="messageArea">
				<div class="messageBody">
<table cellspacing="0" cellpadding="5" border="0">
<tr><td>
	<h2>
		<xsl:comment>much of the text labels are defined in the Send Email and Sms Labels table. </xsl:comment>
							<xsl:value-of select="/notification_data/alert_title"/>
						</h2>
	<h3><xsl:value-of select="/notification_data/alert_heading"/>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="/notification_data/link/node()"/>
								</xsl:attribute>
								<xsl:value-of select="/notification_data/search_query"/>
							</a><br />
							
							<xsl:value-of select="/notification_data/alert_subtitle"/>
						</h3>
</td></tr>
<tr><td>
<a><xsl:attribute name="href">
		<xsl:value-of select="/notification_data/alert_unsubscribe_link/node()"/>
	</xsl:attribute>
	<xsl:value-of select="/notification_data/alert_unsubscribe"/>
</a>
</td></tr>
				<tr>
	<td>
						<table style="width: 100%">
							<xsl:for-each select="/notification_data/items/saved_searches_letter_item">
				<tr>
					<td style="background-color: #f3f3f3; padding: 15px 0; box-shadow: inset 0 4px 5px -2px rgba(0,0,0,0.3)">
										<span style="text-transform: uppercase; letter-spacing: .07em; font-weight: 600; font-size: .8em; color: #6d6d6d">
											<xsl:value-of select="type" disable-output-escaping="yes"/>
										</span>
										<br/>
						<strong><a>
											<xsl:attribute name="href">
												<xsl:value-of select="url" disable-output-escaping="yes"/>
											</xsl:attribute>
											<xsl:value-of select="title" disable-output-escaping="yes"/>
										</a>
						</strong>
										<br/>
										<span style="color: #3a3a3a; font-weight: 400; font-size: .65rem;">
											<xsl:value-of select="creator" disable-output-escaping="yes"/>
										</span>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</td>
				</tr>
</table>
</div>
</div>
				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
				<xsl:call-template name="wes_signature" /> 
				<xsl:call-template name="contactUs" />

	<table align="left">
				<tr>
	<td align="left">
<br />
<a><xsl:attribute name="href">
									<xsl:value-of select="/notification_data/alert_unsubscribe_link/node()"/>
								</xsl:attribute>
								<xsl:value-of select="/notification_data/alert_unsubscribe"/>
							</a>
					</td>
				</tr>
			</table>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>