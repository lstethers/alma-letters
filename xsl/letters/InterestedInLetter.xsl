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
<!-- BEGIN Wesleyan rewrite whole letter - add introduction and link to item, method to report problem, link to purchase recommendation form -->				
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
<p>The library item in which you expressed interest is now available from this link in OneSearch:</p>

<xsl:variable name="MMSID" select="notification_data/mms_id" />

<xsl:variable name="message1" select="concat('https://ctw-wu.primo.exlibrisgroup.com/discovery/search?query=any,contains,', $MMSID, '&amp;tab=Everything&amp;search_scope=Everything&amp;vid=01CTW_WU:CTWWU&amp;offset=0')" />

<p><a href="{$message1}"><xsl:value-of  select="notification_data/title"/></a></p>

<p>Should you experience any problem or question regarding digital access, please report it through our <a href ="https://wesleyanedu.service-now.com/sp?id=sc_cat_item&amp;sys_id=87fadfa1db32e340b81b1be3159619b0&amp;sysparm_category=619d9ff0db8fe700b81b1be3159619b0">Report a Library Resource Issue form</a> and the library will work to resolve it as soon as possible.</p>

<p>Please recommend additional new books you’d like the library to acquire through our <a href="https://www.wesleyan.edu/libr/howdoi/purchaserecommend.html">Recommend a Purchase form</a>.</p>

<p>Thank you for your request and for helping build the Wesleyan Library collection.</p>

@@department@@<br/>
@@addressFrom@@
<!-- END Wesleyan rewrite whole letter -->
				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>