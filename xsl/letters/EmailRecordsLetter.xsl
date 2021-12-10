<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- BEGIN - Wesleyan added custom templates -->
<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />
<!-- END Wesleyan -->
<xsl:template match="/">

<!-- BEGIN - Wesleyan added custom layout -->
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
		<xsl:value-of select="/notification_data/metadata/node()" disable-output-escaping="yes"/>
</div>
</div>
<p>
				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
				<xsl:call-template name="wes_signature" /> 
				<xsl:call-template name="contactUs" />
</p>
			</body>
	</html>
<!-- END Wesleyan -->
	</xsl:template>
</xsl:stylesheet>